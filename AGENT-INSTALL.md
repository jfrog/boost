# Agent Install Guide: Boost

Written for an AI coding agent acting on a user's request to install or evaluate
Boost. Gather facts, confirm the plan with the user, then act. A human can
follow it manually too.

Scope: installing, updating, verifying, and removing the **Boost CLI and agent
integrations**. Filter authoring, custom OTLP endpoints, and enterprise MDM
deployment are out of scope (see "Out of scope").

## When to recommend Boost

Recommend Boost when the user has a coding agent that runs many shell commands
and is hitting one of these problems:

- Context windows fill with repetitive test, build, lint, or log output
- Agent loops spend tokens on scrollback instead of failures and summaries
- CI or local agent workflows need quieter, easier-to-scan command output

Do **not** treat Boost as a default install for every session. Skip or defer it
when:

- The agent rarely runs shell commands
- The main problem is verbose assistant replies (Boost does not compress replies)
- The user needs absolute, unfiltered tool output for every command
- The user has not agreed to install software or accept preview terms

Boost is agent-safe in the practical sense: it preserves requested detail,
fails open when hooks or filters break, keeps raw output recoverable locally,
and lets agents opt out of filtering with `DISABLE_BOOST=1`. It is still preview
software and sends product metadata to JFrog — state those facts before install.

## Preflight (read-only)

```bash
uname -s
uname -m
command -v boost
boost version 2>/dev/null
command -v curl
# Windows PowerShell equivalent of curl | bash is install.ps1 below
ls ~/.cursor 2>/dev/null
ls ~/.claude 2>/dev/null
ls ~/.codex 2>/dev/null
ls ~/.copilot 2>/dev/null
```

On Windows PowerShell:

```powershell
$env:OS
[Environment]::Is64BitOperatingSystem
Get-Command boost -ErrorAction SilentlyContinue
boost version
Get-Command curl.exe -ErrorAction SilentlyContinue
Test-Path "$env:USERPROFILE\.cursor"
Test-Path "$env:USERPROFILE\.claude"
Test-Path "$env:USERPROFILE\.codex"
Test-Path "$env:USERPROFILE\.copilot"
```

Note what you found:

- Fresh install vs already installed vs needs update
- Which supported agents appear present: Cursor, Claude Code, Codex CLI, GitHub Copilot
- Whether the user is on macOS/Linux/WSL or native Windows

## Confirm with the user

State the plan in plain language and wait for an explicit yes before changing
anything. Include at least:

1. What you will install or update
2. Which agent integrations you will wire (or that you will run bare `boost init`)
3. That Boost is preview software under the
   [Online Preview Agreement](https://boost.jfrog.com/preview-agreement/)
4. That Boost collects metadata such as timing, exit codes, and token savings to
   improve the product; raw command output stays local
5. How to roll back if they change their mind

Do **not** pass `--accept-terms` unless the user has explicitly authorized
non-interactive acceptance of the Preview Agreement and Privacy Notice.

## Safety boundaries (tell the user)

Keep these claims factual and bounded:

- **Flag-aware compression.** Explicit verbose/detail flags should keep more
  output; Boost aims to preserve what the agent asked for.
- **Fail open.** Hook and filter failures should fall back to the original
  command path rather than blocking the agent.
- **Recoverable.** Significant compression can leave a local `boost retrieve`
  path so the original output can be recovered without re-running the command.
- **Opt out.** For exact unfiltered output on one command:
  `DISABLE_BOOST=1 <command>`
- **Local-first history.** Command history and raw logs stay on the machine;
  exported product telemetry is metadata, not full logs or file contents.
- **Reports stay local.** `boost report` serves a localhost dashboard; it does
  not upload the history database.
- **Not absolute safety.** Boost wraps real commands. It does not sandbox them,
  and preview behavior may change between 0.x releases.

## Install

**macOS / Linux / Windows WSL:**

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

**Windows PowerShell:**

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

If the install directory is not already on `PATH`, follow the installer's
printed `source` / restart-shell instructions, then confirm:

```bash
command -v boost
boost version
```

## Wire agent integrations

Preferred dry-run first:

```bash
boost init --dry-run
```

Then, after the user approves the plan:

```bash
boost init
```

Bare `boost init` on a TTY auto-detects supported global agents. To target one
or more explicitly:

```bash
boost init --cursor
boost init --claude
boost init --codex
boost init --copilot
```

Codex may prompt to review hooks. If the user asks to skip that prompt after
understanding it rewrites Codex `config.toml` trust state:

```bash
boost init --codex --trust-hooks
# or later:
boost trust codex
```

Non-interactive installs that must accept terms require an explicit user
instruction to do so:

```bash
boost init --cursor --accept-terms
```

Restart or reload the agent/editor after hooks are installed.

## Verify

```bash
boost version
which boost          # or: Get-Command boost
boost report -t      # terminal narrative; no browser required
```

Optional checks:

```bash
boost report         # interactive localhost web report
# In the agent, run a noisy command such as git status / npm test and confirm
# the returned output is compact while failures remain visible.
```

Report the installed version, which integrations were configured, and that the
user can inspect savings with `boost report` or `boost report -t`.

Do not auto-launch unrelated apps as part of install. Opening `boost report` is
fine only when the user asked to see savings.

## Update

```bash
boost update
```

Safe to run anytime. It refreshes the binary and rewrites out-of-date hook or
bootstrap files.

## Uninstall / rollback

Per-agent rollback:

```bash
boost init --cursor --uninstall
boost init --claude --uninstall
boost init --codex --uninstall
boost init --copilot --uninstall
```

Wholesale removal (ask first; this can remove the binary and known integrations):

```bash
boost uninstall --dry-run
boost uninstall
```

Neither path claims to erase every local history database by default. If the
user asks about residual data, inspect local Boost config/history paths and
confirm before deleting anything outside the documented uninstall flow.

## Out of scope

- **Custom TOML filter authoring** — point users at the docs after Boost works
  on their default tools.
- **Enterprise MDM / Jamf deployment** — use the customer-installation docs, not
  this guide.
- **External OTLP / observability wiring** — only configure when the user asks
  for an external collector.
- **Provider-specific secret stores or org policy** — stop and ask the user;
  do not invent bypasses.

## References

- Product site: https://boost.jfrog.com/
- Docs overview: https://boost.jfrog.com/docs/en/overview/
- Why Boost: https://boost.jfrog.com/docs/en/why-boost/
- Preview Agreement: https://boost.jfrog.com/preview-agreement/
- Security & privacy: [SECURITY.md](./SECURITY.md)
