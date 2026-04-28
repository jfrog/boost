# Security Policy

Boost is built and distributed by JFrog. We take the security of the binary, the telemetry it emits, and the machines it runs on seriously. This document explains how to report vulnerabilities and what to expect in return.

## Reporting a Vulnerability

**Please do not open a public GitHub issue for security problems.** Use either private channel below — we respond on both.

- **Email:** [security@jfrog.com](mailto:security@jfrog.com)
- **GitHub Security Advisory:** [Report a vulnerability](https://github.com/jfrog/boost/security/advisories/new) from the repository's **Security** tab.

Please include, where possible:

- Boost version (`boost --version`)
- OS and architecture
- Reproduction steps or proof-of-concept
- Your assessment of the impact

## What to Expect

- **Acknowledgement** within **3 business days** of your report.
- **Initial assessment** (severity, reproducibility) within **7 business days**.
- **Fix or mitigation timeline** communicated as part of the assessment.
- **Coordinated disclosure.** We follow a 90-day disclosure window by default, adjusted for actively exploited issues or at the reporter's request.

Reporters are credited in the resulting advisory and release notes unless anonymity is requested.

## Supported Versions

Boost is currently in `v0.x` beta. Security fixes target the latest `v0.x` release; upgrade with `boost update`.

| Version              | Status       | Security fixes                   |
| -------------------- | ------------ | -------------------------------- |
| v0.x (latest)        | Active       | Yes                              |
| v0.x (older patches) | Superseded   | Best-effort; upgrade recommended |
| Pre-release builds   | Unsupported  | No                               |

## Security Model

Boost is a thin wrapper around the commands you already run. It is built around three principles:

1. **Local-first.** Command history, test outcomes, token-savings stats, and raw OTel trace files are written to a local SQLite database and JSONL file under your user directory. Nothing is uploaded unless you explicitly copy it out.
2. **Only metadata leaves the machine.** Exported OTel spans carry timing, exit code, and cache statistics — never raw log bodies, file contents, stdin/stdout payloads, or environment variable values. Anything that looks like a secret is redacted from both the stream your agent sees and every exported span before it is written or transmitted (see [Secret Redaction](#secret-redaction) below).
3. **Open protocol.** Boost speaks OpenTelemetry OTLP. Point `BOOST_OTEL_ENDPOINT` / `BOOST_OTEL_TOKEN` — or the `[tracing]` block in `config.toml` — at Datadog, Grafana, Honeycomb, New Relic, or your own OTLP collector to receive the same signals in your existing observability stack.

## Secret Redaction

Secret handling is treated as a core correctness concern, not a convenience. Three complementary mechanisms run in-process before any write to disk, any line reaches your agent, or any span is exported — all part of the `internal/concealer` and `internal/tracing/sanitize.go` packages.

### Detection mechanisms

- **Environment-variable scan.** At process start, Boost walks `os.Environ()` and registers the *values* of every variable whose *name* matches a known pattern. Defaults include:
  - Credential-suffix globs: `*_TOKEN`, `*_SECRET`, `*_KEY`, `*_PASSWORD`, `*_CREDENTIAL`, `*_AUTH`, `*_PRIVATE`, `*_API_KEY`, `*_APIKEY`, `*_ACCESS_KEY*`.
  - Vendor-prefixed: `AWS_*`, `AZURE_*`, `NUGET_*`, `SLACK_*`.
  - Specific names: `GH_TOKEN`, `GITHUB_TOKEN`, `GITHUB_PAT`, `DATABASE_URL`, `CONNECTION_STRING`.
- **Gitleaks regex detection.** A curated rule set catches secrets that never appear in env vars: AWS access keys, GitHub PATs and OAuth/App tokens, JWTs, Slack tokens, Google API keys, Stripe keys, and the rest of the standard cloud-credential formats.
- **Runtime registration.** Secrets surfaced mid-run (for example, a token minted by an earlier subprocess) can be added via the internal `AddSecret()` call and are redacted from all subsequent output within the same invocation.

Exact-match lookups are compiled into an [Aho-Corasick](https://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_algorithm) automaton so the entire registered set is checked in a single linear pass, regardless of how many patterns it contains. Streaming redaction runs with a sliding window, so a secret split across two buffer chunks is still caught.

### Where redaction applies

Redaction runs at every point where data is captured, stored, or emitted:

- **Command `stdout` and `stderr`** before they reach your terminal or coding agent.
- **The local JSONL trace file** (one OTel span per line).
- **The local SQLite tracking database** (command history, test outcomes, token-savings rows).
- **Every attribute on every exported OTel span**, including span names and common fields such as `cmd.line` and `cmd.args` string slices, via a wrapping `sanitizedSpan` exporter. Coverage is pinned by dedicated test cases (`sanitize_test.go`) that exercise env-backed values, AWS access keys, GitHub tokens in clone URLs, secrets inside string slices, and secrets accidentally inlined into span names.

### Guarantees

- **Single, unambiguous placeholder.** Matched values are replaced with the literal string `[REDACTED]` — no partial-reveal modes (no "last 4 characters" leaks).
- **Raw environment is never persisted.** Env values are read into memory only to register them as redaction targets. They are not written to disk, not added as span attributes, and not emitted over the wire.
- **Fail-closed at the export boundary.** The OTel exporter wraps every span in `sanitizedSpan`; an un-sanitized span cannot be reached from a normal export code path.
- **Zero-copy fast path.** When no pattern matches, the input buffer is returned unmodified — performance does not create an incentive to disable redaction.

## Supply Chain

- **Signed releases.** Binaries are published on [GitHub Releases](https://github.com/jfrog/boost/releases) with checksums.
- **Pinned install script.** [`install.sh`](./install.sh) is served from this repository and verifies the archive checksum before extracting.
- **Reproducible CI integration.** The `jfrog/boost@v0` GitHub Action tracks the rolling `v0` major; pin to a specific tag (for example `jfrog/boost@v0.4.2`) for strict reproducibility.

## Out of Scope

The following are outside the scope of this policy:

- Vulnerabilities in third-party tools Boost wraps (for example `npm`, `docker`, `pytest`). Please report those upstream.
- Attacks that require pre-existing privileged access to the developer machine or CI runner.

## Terms & Privacy

- Use of the beta is governed by the [JFrog Online Beta Agreement](./BETA_AGREEMENT.md).
- Sub-processors are listed at [jfrog.com/trust/privacy/sub-processors](https://jfrog.com/trust/privacy/sub-processors/).

## Contact

- Security issues: [security@jfrog.com](mailto:security@jfrog.com) or the [GitHub Security Advisory form](https://github.com/jfrog/boost/security/advisories/new).
- General questions: [jfrog.com](https://jfrog.com).

---

_Last updated: 2026-04-21_
