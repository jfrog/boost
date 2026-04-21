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
2. **Only metadata leaves the machine.** Exported OTel spans carry timing, exit code, and cache statistics — never raw log bodies, file contents, stdin/stdout payloads, or environment variable values. Secrets are redacted from both command output and exported spans before they are written or transmitted, via two complementary mechanisms:
   - Exact-match on values of environment variables whose names match patterns like `*_TOKEN`, `*_SECRET`, `*_KEY`, `*_PASSWORD`, `*_CREDENTIAL`, `AWS_*`, `AZURE_*`, `GH_TOKEN`, `GITHUB_TOKEN`, `DATABASE_URL`, `CONNECTION_STRING`, …
   - Gitleaks regex patterns for common secret formats (AWS keys, JWTs, Slack tokens, cloud provider credentials, …) that do not live in env vars.
3. **Open protocol.** Boost speaks OpenTelemetry OTLP. Point `BOOST_OTEL_ENDPOINT` / `BOOST_OTEL_TOKEN` — or the `[tracing]` block in `config.toml` — at Datadog, Grafana, Honeycomb, New Relic, or your own OTLP collector to receive the same signals in your existing observability stack.

## Supply Chain

- **Signed releases.** Binaries are published on [GitHub Releases](https://github.com/jfrog/boost/releases) with checksums.
- **Pinned install script.** [`install.sh`](./install.sh) is served from this repository and verifies the archive checksum before extracting.
- **Reproducible CI integration.** The `jfrog/boost@v0` GitHub Action tracks the rolling `v0` major; pin to a specific tag (for example `jfrog/boost@v0.4.2`) for strict reproducibility.

## Out of Scope

The following are outside the scope of this policy:

- Vulnerabilities in third-party tools Boost wraps (for example `npm`, `docker`, `pytest`). Please report those upstream.
- Attacks that require pre-existing privileged access to the developer machine or CI runner.

## Terms & Privacy

- Use of the beta is governed by the [JFrog Online Beta Agreement](./TERMS_OF_USE.md).
- Sub-processors are listed at [jfrog.com/trust/privacy/sub-processors](https://jfrog.com/trust/privacy/sub-processors/).

## Contact

- Security issues: [security@jfrog.com](mailto:security@jfrog.com) or the [GitHub Security Advisory form](https://github.com/jfrog/boost/security/advisories/new).
- General questions: [jfrog.com](https://jfrog.com).

---

_Last updated: 2026-04-21_
