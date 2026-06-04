

**Make your agents smarter and faster**

Smart token savings for coding agents, shell commands, and CI.

  


Sponsored by **[JFrog](https://jfrog.com)**

---

**Frogi, our mascot, appears when you run just** `boost`**.**

```
  ,    ,      *          ,        *        ,            ,
 \|/  *          *            *         *        ▆     ▆
 \|/    ████    ████       *           ▆         █     █
 \|/    █  █    █  █            *      █    *     █     █
 \|/   ██████████████    *            █          █     █
 \|/   ██████████████▬▬▬▬▬▬▬  *       █     *    █     █
 \|/   ██████████████   *        ▆    █          █     █
 \|/    ███      ███          *  █    █      *   █     █
~~~~<≈≈≈≈≈≈≈≈≈≈≈≈>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~<≈≈≈>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

**Boost** wraps the commands your agents and CI already run, save tokens, turns noisy logs into compact, structured context. Agents keep the signal: errors, timings, changed counts, cache hits, and next useful clues. Repeated package logs, progress bars, and CI noise stay out of the prompt.

your **terminal** — prefix any command with boost
your **coding agent** — boost init wires up Cursor, Claude Code, Codex, Gemini CLI, and more
your **CI** — one line: uses: jfrog/boost@v0

## Quick start

**Install Boost:**

```bash
curl -fsSL https://raw.githubusercontent.com/jfrog/boost/main/install.sh | bash
```

**Wire it into Cursor, Claude Code, Codex, Gemini CLI, OpenCode, and supported CI:**

```bash
boost init
```

**Use it in GitHub Actions:**

```yaml
steps:
  - uses: jfrog/boost@v0
  - uses: actions/checkout@v4
```

## Smart token savings

Boost does not just truncate output. It applies command-aware filters that preserve what agents need to reason about the result.

```bash
# Without Boost: ~9,800 tokens of install noise
$ npm ci
npm warn deprecated inflight@1.0.6 / rimraf@3.0.2 / glob@7.2.3 …
added 1285 packages, audited 1286 in 45s
found 0 vulnerabilities

# With Boost: ~640 tokens, same outcome, cache-backed
$ boost npm ci
[OK] npm ci · 1,285 packages restored from boost cache in 2.4s · 0 vulnerabilities
```

The agent sees the useful summary, not the scrollback. On failures, Boost keeps the failing test, compiler error, stack frame, or CI step that matters.

## What it wraps

- **Agents:** Cursor, Claude Code, GitHub Copilot, Codex CLI, Gemini CLI, OpenCode, Windsurf, Cline.
- **CI:** GitHub Actions now; GitLab CI, Jenkins, CircleCI, and Azure Pipelines are coming soon.
- **Commands:** Docker, npm, pytest, Git, GitHub CLI, and other shell commands pass through the same wrapper.

## Usage examples

- `boost docker build ...` — compressed build log and layer-cache summary
- `boost npm ci` — dependency summary, local package cache, retry-safe output
- `boost pytest` — quiet output on green runs, useful failures when tests break
- `boost gh run view --log` — CI logs condensed to top failures plus summary

## Update

```bash
boost update
```

## Documentation

See the [full documentation](https://jfrog.github.io/boost) for commands, configuration, OpenTelemetry export, and CI recipes.

## Security & Privacy

- **Local-first.** Command history and raw logs stay on your machine.
- **Only metadata leaves.** When Boost sends usage data, it goes only to JFrog to help improve the product. Exported metadata includes timing, exit code, and cache stats, never raw logs, file contents, or env values. Secrets matching patterns like `*_TOKEN`, `*_SECRET`, `AWS_`*, `DATABASE_URL` are redacted before write or export.
- **Open protocol, signed binaries.** OpenTelemetry-native. Binaries ship signed via GitHub Releases.

Full policy, supported versions, and how to report a vulnerability: see [SECURITY.md](./SECURITY.md).

## License

Copyright © 2026 JFrog Ltd. All rights reserved. See [LICENSE](LICENSE) and [BETA_AGREEMENT.md](BETA_AGREEMENT.md).

---

*Dedicated to the memory of Dima Gershovich — a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)