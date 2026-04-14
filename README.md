<img width="1345" height="297" alt="cover" src="https://github.com/user-attachments/assets/366dc500-cdcd-43c2-b34e-aa62b2602380" />

<p align="center">
  <strong>Boost</strong> — faster agents, faster CI
</p>

<p align="center">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost" alt="Release"></a>
  <a href="https://github.com/jfrog/boost/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Proprietary-blue.svg" alt="License"></a>
</p>

---

Boost intercepts CLI commands and compresses their output by 60-90%, saving tokens and cost when used with AI coding agents (Claude Code, Cursor, Codex, Gemini CLI, and more).

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/jfrog/boost/main/install.sh | bash
```

Then set up your editors:

```bash
boost init
```

## GitHub Action

Add Boost to your CI workflows for automatic output compression:

```yaml
steps:
  - uses: jfrog/boost@v1
  - uses: actions/checkout@v4
  - run: npm test  # output automatically compressed
```

## Usage

Prefix any command with `boost`:

```bash
boost cargo build    # 80% token savings
boost git diff       # 80% token savings
boost vitest run     # 99% token savings
boost pytest         # 90% token savings
```

## Update

```bash
boost update
```

## Documentation

See the [full documentation](https://boost.jfrog.com) for detailed usage, supported commands, and configuration options.

## License

Copyright (c) 2026 JFrog Ltd. All Rights Reserved. See [LICENSE](LICENSE) and [TERMS_OF_USE.md](TERMS_OF_USE.md).

---

*Dedicated to the memory of Dima Gershovich – a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)
