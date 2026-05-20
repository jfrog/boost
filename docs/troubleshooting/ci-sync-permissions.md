# `boost ci sync` fails with `permission denied` on `/tmp/boost`

## Symptom

```text
ci sync: create output root: mkdir /tmp/boost/ci-sync: permission denied
```

`boost ci sync` exits before downloading workflow artifacts or importing traces.

## Root cause

The default output directory is `/tmp/boost/ci-sync` (see `boost ci sync --help`). On macOS and Linux, creating that path requires write access to `/tmp/boost`.

That fails when `/tmp/boost` already exists but is not writable by the current user, for example:

```text
drwxr-xr-x  root  wheel  /tmp/boost
```

Common ways this happens:

- A prior `sudo` install or CI job created `/tmp/boost` as root.
- Another tool created `/tmp/boost` with restrictive ownership while Boost expects to create children underneath it.

`/tmp` itself is usually world-writable; the problem is the **existing parent directory** `/tmp/boost`, not the system temp root.

## Immediate workaround

Pass a user-writable `--dir`:

```bash
boost ci sync --dir "$TMPDIR/boost-ci-sync"
```

Or any other directory you own:

```bash
boost ci sync --dir "$HOME/.cache/boost/ci-sync"
```

Re-run sync after fixing permissions if you prefer the default location:

```bash
sudo chown -R "$(whoami)" /tmp/boost
# or, if nothing else needs /tmp/boost:
sudo rm -rf /tmp/boost
```

## Relation to the GitHub Action

The Action bundle already avoids placing its bootstrap binary directly under `/tmp/boost` because `ci-setup` uses `/tmp/boost/tools` and needs `/tmp/boost` to remain a directory. See `dist/index.js` (`getTempBinaryPath` uses `os.tmpdir()/boost-action-bootstrap`).

The CLI should follow the same principle: **do not assume `/tmp/boost` is user-writable.**

## Suggested CLI fix (for maintainers)

The Go implementation is not in this repository (releases ship prebuilt binaries). This section describes the recommended change for the `boost/cmd/boost` module.

### Goals

1. Default sync output must work for normal users without sudo.
2. Preserve `--dir` override behavior.
3. Avoid breaking environments that legitimately use `/tmp/boost` as a shared directory when it is writable.

### Recommended default resolution order

Resolve the default output directory in this order:

1. **Explicit flag** — `--dir` when provided (unchanged).
2. **User cache** — `filepath.Join(os.UserCacheDir(), "boost", "ci-sync")` (or `XDG_CACHE_HOME/boost/ci-sync` on Linux).
3. **Process temp** — `filepath.Join(os.TempDir(), "boost", "ci-sync")` where `os.TempDir()` honors `TMPDIR`.
4. **Legacy path** — `/tmp/boost/ci-sync` only if the parent `/tmp/boost` is missing or writable by the current uid.

Pseudocode:

```go
func defaultCISyncDir() (string, error) {
    if dir := flagDir; dir != "" {
        return dir, nil
    }
    if cache, err := os.UserCacheDir(); err == nil {
        return filepath.Join(cache, "boost", "ci-sync"), nil
    }
    return filepath.Join(os.TempDir(), "boost", "ci-sync"), nil
}

func ensureOutputRoot(dir string) error {
    parent := filepath.Dir(dir)
    if err := os.MkdirAll(dir, 0o755); err == nil {
        return nil
    } else if !errors.Is(err, os.ErrPermission) {
        return err
    }
    // Parent exists but is not writable — surface a hint
    return fmt.Errorf("create output root: %w (parent %s is not writable; retry with --dir $TMPDIR/boost-ci-sync)", err, parent)
}
```

### Regression tests

Add table-driven tests around `defaultCISyncDir` / `ensureOutputRoot`:

| Setup | Expected |
| --- | --- |
| `/tmp/boost` owned by root, mode `0755` | Default does **not** require writes under `/tmp/boost`; sync succeeds without `--dir`. |
| Writable `/tmp/boost` | Legacy path still works when chosen as fallback. |
| `--dir ./relative` | Resolved under git root (existing behavior). |

### Error message improvement

When mkdir fails on the default path, append actionable text:

```text
ci sync: create output root: mkdir /tmp/boost/ci-sync: permission denied
hint: boost ci sync --dir "$TMPDIR/boost-ci-sync"
```

## Verification

After applying the workaround or fix:

```bash
boost ci sync --dir "$TMPDIR/boost-ci-sync"
boost query -f table "SELECT CASE WHEN ci_workflow_run_id IS NOT NULL THEN 'ci_imported' ELSE 'local' END AS source, COUNT(*) AS commands FROM commands GROUP BY source;"
```

Expect `ci_imported` rows when workflow artifacts exist for the repository.
