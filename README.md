<p align="center">
  <a href="https://boost.jfrog.com/">
    <picture>
      <source srcset=".github/assets/boost-logo-dark.png" media="(prefers-color-scheme: dark)">
      <source srcset=".github/assets/boost-logo-light.png" media="(prefers-color-scheme: light)">
      <img src=".github/assets/boost-logo-light.png" alt="Boost" width="260">
    </picture>
  </a>
</p>

<p align="center">
  <strong>Save tokens. Sharpen agents.</strong>
</p>

<p align="center">
  <sub>Smart token savings for coding agents and shell commands.</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="Website"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="Release"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="Platforms">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Downloads"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="Stars"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="Agent-native">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry">
</p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Join Slack Community" height="38">
  </a>
</p>

<p align="center">
  <sub>Sponsored by <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <strong>English</strong> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="Scanned by JFrog Xray" height="38">
  </a>
</p>

<p align="center">
  <sub>Dependencies, source, secrets, and IaC — scanned on every push to <code>main</code>. <a href="#security--privacy">What that covers</a>.</sub>
</p>

---

<p align="center">
  <strong>Frogi, our mascot, appears when you run just <code>boost</code>.</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, the Boost mascot" width="180">
  </picture>
</p>

**Boost** wraps the commands your agents already run, turning noisy logs into compact, structured context that keeps the signal — errors, timings, changed counts, cache hits — while cutting the noise.

Boost never trades quality for savings. It trims only what's safe to drop, so agent output stays just as sharp. Our [Terminal-Bench 2.0 benchmark](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) shows it: identical task pass rate, ~12% lower cost — Boost keeps agents optimized without ever breaking their stride.

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="boost report dashboard: context tokens saved over time, with CLI filter and Code Base Exploration breakdowns" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Boost intro: JFrog boost logo, then a walkthrough of installing, running a task, and boost report" width="768">
  </picture>
</p>

## Quick start

**Install Boost**

macOS / Linux / Windows WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**Wire it into Cursor, Claude Code, GitHub Copilot, and Codex CLI:**

```bash
boost init
```

For AI coding agents installing Boost on a user's machine, follow **[AGENT-INSTALL.md](./AGENT-INSTALL.md)**.

## When to use Boost

- **Long coding-agent sessions** — Keep context lean across dozens of shell commands so agents spend tokens on the task, not scrollback.
- **Noisy test, build, and debug loops** — Compress `npm test`, `pytest`, `go test`, `docker build`, linters, and logs while keeping failures and summaries.
- **CI pipelines** — Shorter, easier-to-scan job logs with timing and cache signal for GitHub Actions and other runners.
- **Custom or internal tools** — Add TOML filters for your own CLIs so the same compression loop covers the tools your agents actually run.

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

The agent sees the useful summary, not the scrollback. On failures, Boost keeps the failing test, compiler error, or stack frame that matters.

## [How Boost is different](https://boost.jfrog.com/docs/en/why-boost/)

| Capability | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| Command output compression | ✓ | ✓ | ✓ | × |
| Full-context and RAG compression | × | × | ✓ | × |
| Assistant reply compression | × | × | × | ✓ |
| Command output recovery | ✓ | ✓ | ✓ | × |
| Native approval sees original executable | ✓ | × | — | — |
| Versioned retrieval feedback | ✓ | × | × | × |
| Auto-disable repeatedly retrieved filters | ✓ | × | × | × |
| End-to-end agent task + cost A/B | ✓ | × | × | × |

## See your savings

After wrapping commands, open the interactive web report:

```bash
boost report
```

For a terminal narrative summary:

```bash
boost report -t
# or: boost report --tui
```

## What it wraps

- **Agents:** Cursor, Claude Code, GitHub Copilot, Codex CLI.
- **Commands:** Docker, npm, pytest, Git, GitHub CLI, and other shell commands pass through the same wrapper.

## How your agents are using Boost

- `boost docker build ...` — compressed build log and layer-cache summary
- `boost npm ci` — dependency summary, local package cache, retry-safe output
- `boost pytest` — quiet output on green runs, useful failures when tests break

## Update

```bash
boost update
```

## Documentation

See the [full documentation](https://boost.jfrog.com/docs/en/overview/) for commands, configuration, and OpenTelemetry export.

## Security & Privacy

Boost's source repository is scanned on every push to `main` — the same commits every release is built from — by [Frogbot](https://github.com/jfrog/frogbot), running JFrog Xray with JFrog Advanced Security.

| | What gets scanned |
| :---: | --- |
| ✓ | **Dependencies (SCA)** — Go modules and npm trees across every module in the repo, matched against JFrog's vulnerability database |
| ✓ | **Contextual Analysis** — checks whether a reported CVE is actually reachable from Boost's code, so real risk is not buried in noise |
| ✓ | **Malicious packages** — dependencies flagged as malicious are caught before they reach a build |
| ✓ | **Secrets** — every tracked file is scanned for leaked credentials and tokens |
| ✓ | **Source code (SAST)** — Boost's own Go and TypeScript sources |
| ✓ | **Infrastructure as Code** — CI workflows and deployment definitions |
| ✓ | **SBOM** — a component inventory is generated per build target on every scan |

Findings land as code-scanning alerts and automated fix pull requests on the source repository. See [SECURITY.md](./SECURITY.md#security-scanning) for the full scanning and disclosure policy.

- **Local-first.** Command history and raw logs stay on your machine.
- **Only metadata leaves.** When Boost sends usage data, it goes only to JFrog to help improve the product. Exported metadata includes timing, exit code, and cache stats, never raw logs, file contents, or env values. Secrets matching patterns like `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` are redacted before write or export.
- **Open protocol, signed binaries.** OpenTelemetry-native. Binaries ship signed via GitHub Releases.

Full policy, supported versions, and how to report a vulnerability: see [SECURITY.md](./SECURITY.md).

## License

Copyright © 2026 JFrog Ltd. All rights reserved. See [LICENSE](LICENSE) and [BETA_AGREEMENT.md](BETA_AGREEMENT.md).

---

*Dedicated to the memory of Dima Gershovich — a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)
