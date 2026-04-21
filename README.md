<p align="center">
  <img src=".github/assets/boost-logo.png" alt="Boost" width="260">
</p>

<p align="center">
  <strong>Boost</strong> — faster agents, faster CI
</p>

<p align="center">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="Release"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="Platforms">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Downloads"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="Stars"></a>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="Agent-native">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-proprietary%20(beta)-blue" alt="License: proprietary (beta)"></a>
</p>

<p align="center">
  <sub>Sponsored by <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

> **Beta.** This software is in beta under JFrog's [Online Beta Agreement](./TERMS_OF_USE.md). APIs and behavior may change between 0.x releases. Use in production at your own risk.

---

Humans and coding agents spend too much time waiting for commands to finish and sifting through noisy output. **Boost** is a single binary that drops into three places at once:

- your **terminal** — prefix any command with `boost`
- your **coding agent** — `boost init` wires up Cursor, Claude Code, Codex, Gemini CLI, and more
- your **CI** — one line: `uses: jfrog/boost@v0`

Same binary, same acceleration, same telemetry — wherever your builds run.

## Why Boost

- **One binary, three surfaces** — CLI, coding agent, and CI all share the same runtime and behave identically.
- **60–90% fewer log tokens** — strips noise from command output before it reaches your agent's context window.
- **Deep OTel context** — every wrapped command emits OpenTelemetry traces and metrics your agents can reason about.

## Before / after

Same `npm ci`, same result — but the log that reaches your agent shrinks roughly 15×:

```bash
# Without boost — ~9,800 tokens of log noise in your agent's context
$ npm ci
npm warn deprecated inflight@1.0.6: This module is not supported
npm warn deprecated rimraf@3.0.2: Rimraf versions prior to v4 are no longer supported
npm warn deprecated glob@7.2.3: Glob versions prior to v9 are no longer supported
added 1285 packages, and audited 1286 packages in 45s
184 packages are looking for funding
  run `npm fund` for details
found 0 vulnerabilities

# With boost — ~640 tokens, same result
$ boost npm ci
[OK] npm ci
     1,285 packages restored from boost cache in 2.4s
     0 vulnerabilities
```

## Supported coding agents and CIs

**Coding agents**

![Cursor](https://img.shields.io/badge/Cursor-supported-000000?logo=cursor&logoColor=white)
![Claude Code](https://img.shields.io/badge/Claude%20Code-supported-D97757?logo=anthropic&logoColor=white)
![GitHub Copilot](https://img.shields.io/badge/GitHub%20Copilot-supported-6e5494?logo=githubcopilot&logoColor=white)
![Codex CLI](https://img.shields.io/badge/Codex%20CLI-supported-000000?logo=openai&logoColor=white)
![Gemini CLI](https://img.shields.io/badge/Gemini%20CLI-supported-4285F4?logo=googlegemini&logoColor=white)
![OpenCode](https://img.shields.io/badge/OpenCode-supported-FF6A00)
![Windsurf](https://img.shields.io/badge/Windsurf-supported-00B4D8)
![Cline](https://img.shields.io/badge/Cline-supported-1f6feb)

**CI**

![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-supported-2088FF?logo=githubactions&logoColor=white)
![GitLab CI](https://img.shields.io/badge/GitLab%20CI-coming%20soon-grey?logo=gitlab&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-coming%20soon-grey?logo=jenkins&logoColor=white)
![CircleCI](https://img.shields.io/badge/CircleCI-coming%20soon-grey?logo=circleci&logoColor=white)
![Azure Pipelines](https://img.shields.io/badge/Azure%20Pipelines-coming%20soon-grey?logo=azurepipelines&logoColor=white)

## Quick Start

<details open>
<summary><strong>CLI</strong> — prefix any command with <code>boost</code></summary>

Install:

```bash
curl -fsSL https://raw.githubusercontent.com/jfrog/boost/main/install.sh | bash
```

Use:

```bash
boost docker build -t myapp .
boost npm ci
boost pytest
```

</details>

<details>
<summary><strong>Coding agent</strong> — auto-wire Cursor, Claude Code, Codex, and more</summary>

Run the interactive setup in any project:

```bash
boost init
```

It detects your installed editors and CI providers and registers hooks so every tool call the agent makes gets wrapped by boost. Re-run it any time your editor / agent list changes.

</details>

<details>
<summary><strong>CI</strong> — one line in your workflow</summary>

```yaml
steps:
  - uses: jfrog/boost@v0
  - uses: actions/checkout@v4
  - run: npm ci      # automatically compressed
  - run: npm test    # automatically compressed
```

The action pins to the rolling `v0` major; see [releases](https://github.com/jfrog/boost/releases) for the latest tag.

</details>

## Usage examples

Prefix any command with `boost`:

```bash
boost cargo build    # ~80% token savings
boost git diff       # ~80% token savings
boost vitest run     # ~99% token savings
boost pytest         # ~90% token savings
```

## Update

```bash
boost update
```

## Documentation

See the [full documentation](https://jfrog.github.io/boost) for commands, configuration, OpenTelemetry export, and CI recipes.

## License

Copyright © 2026 JFrog Ltd. All rights reserved. See [LICENSE](LICENSE) and [TERMS_OF_USE.md](TERMS_OF_USE.md).

---

*Dedicated to the memory of Dima Gershovich — a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)
