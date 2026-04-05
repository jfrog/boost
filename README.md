<p align="center">
  <strong>Boost</strong> — Token-optimized CLI wrapper for AI coding agents
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
