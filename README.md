**Boost** — faster agents, faster CI

Sponsored by **[JFrog](https://jfrog.com)**

> **Beta.** This software is in beta under JFrog's [Online Beta Agreement](./TERMS_OF_USE.md).

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

Same `npm ci`, same result. What changes:

- **~15× fewer tokens** in your agent's context — 9.8k → 640 on a typical install.
- **Faster reruns** via content-addressed cache — seconds instead of minutes.
- **Deep OTel trace** of every command — timing, cache hits, exit code — routable to your backend.

```bash
# Without boost — ~9,800 tokens of log noise in your agent's context
$ npm ci
npm warn deprecated inflight@1.0.6 / rimraf@3.0.2 / glob@7.2.3 …
added 1285 packages, audited 1286 in 45s
found 0 vulnerabilities

# With boost — ~640 tokens, same result, cache-backed
$ boost npm ci
[OK] npm ci · 1,285 packages restored from boost cache in 2.4s · 0 vulnerabilities
```

## Supported tools

**Coding agents**


| Tool           | Status    |
| -------------- | --------- |
| Cursor         | Supported |
| Claude Code    | Supported |
| GitHub Copilot | Supported |
| Codex CLI      | Supported |
| Gemini CLI     | Supported |
| OpenCode       | Supported |
| Windsurf       | Supported |
| Cline          | Supported |


**CI platforms**


| Platform        | Status      |
| --------------- | ----------- |
| GitHub Actions  | Supported   |
| GitLab CI       | Coming soon |
| Jenkins         | Coming soon |
| CircleCI        | Coming soon |
| Azure Pipelines | Coming soon |


## Quick Start

**CLI** — prefix any command with `boost`

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

**Coding agent** — auto-wire Cursor, Claude Code, Codex, and more

Run the interactive setup in any project:

```bash
boost init
```

It detects your installed editors and CI providers and registers hooks so every tool call the agent makes gets wrapped by boost. Re-run it any time your editor / agent list changes.

**CI** — one line in your workflow

```yaml
steps:
  - uses: jfrog/boost@v0
  - uses: actions/checkout@v4
  ...
```

The action pins to the rolling `v0` major; see [releases](https://github.com/jfrog/boost/releases) for the latest tag.

## Usage examples

Prefix any command with `boost` — anywhere you'd normally run it.

- `boost docker build ...` — compressed build log, layer-cache summary, Docker metrics in OTel
- `boost npm ci` — dependency summary, local package cache, retry-safe output
- `boost pytest` — per-test pass/fail/duration stored locally, quiet output on green runs
- `boost gh run view --log` — CI log stream condensed to top failures plus summary

## Update

```bash
boost update
```

## Documentation

See the [full documentation](https://jfrog.github.io/boost) for commands, configuration, OpenTelemetry export, and CI recipes.

## Security & Privacy

Boost is designed to be safe to drop into any developer machine or CI runner.

- **Local-first by design.** Command history, test outcomes, token-savings stats and OTel trace files live in a local SQLite DB and JSONL file under your user directory — nothing is uploaded unless you copy it out.
- **Secrets never leave the machine.** Boost scrubs command output and OTel spans through a built-in concealer (Gitleaks regex patterns + exact-match on values of env vars like `*_TOKEN`, `*_SECRET`, `*_KEY`, `*_PASSWORD`, `AWS_`*, `DATABASE_URL`, …) before anything is written or exported. Raw log bodies, file contents, and env-var values are never captured — only summaries.
- **Your data, your backend.** OTel spans (timing, exit code, cache stats — all redacted before export) are sent to the OTLP endpoint you configure. The default is JFrog's managed Coralogix endpoint for convenience; override anytime with `BOOST_OTEL_ENDPOINT` / `BOOST_OTEL_TOKEN` or the `[tracing]` block in `config.toml` to send to Datadog, Grafana, Honeycomb, or your own collector.
- **Open protocol.** OpenTelemetry is vendor-neutral — any OTLP-compatible backend works.
- **Signed releases.** Binaries ship through GitHub Releases; install via the pinned `install.sh` (reproducible checksums).
- **Terms.** Use of the beta is governed by the [JFrog Online Beta Agreement](./TERMS_OF_USE.md); sub-processors are listed at [jfrog.com/trust/privacy/sub-processors](https://jfrog.com/trust/privacy/sub-processors/).

## License

Copyright © 2026 JFrog Ltd. All rights reserved. See [LICENSE](LICENSE) and [TERMS_OF_USE.md](TERMS_OF_USE.md).

---

*Dedicated to the memory of Dima Gershovich — a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)