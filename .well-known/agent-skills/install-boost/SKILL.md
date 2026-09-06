---
name: install-boost
description: Install and initialize Boost CLI for a coding agent, then verify measured token savings.
---

# Install Boost CLI

Use this skill when a user asks to install, configure, or start using Boost with
Cursor, Claude Code, Codex CLI, or GitHub Copilot.

## Detect OS, then install

Detect the OS from the environment (`uname -s`, `$OSTYPE`, `$IsWindows`, or
`$PSVersionTable`). Do not replace these URLs with GitHub raw URLs.

For macOS, Linux, or WSL:

```sh
curl -fsSL https://boost.jfrog.com/install.sh | bash
export PATH="$HOME/.local/bin:$PATH"
boost init --accept-terms
```

For Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
boost init --accept-terms
```

`--accept-terms` records the Online Preview Agreement without an interactive
prompt: https://boost.jfrog.com/preview-agreement/

Restart the editor or coding agent so its hooks and Boost awareness rule load.

## Verify

Confirm the installed binary and inspect measured savings:

```sh
boost version
boost report
```

Boost is free and requires no signup, account, or API key. For troubleshooting,
use the official quickstart:
https://boost.jfrog.com/docs/en/quickstart/
