<p align="center">
  <a href="https://boost.jfrog.com/">
    <picture>
      <source srcset=".github/assets/boost-logo-dark.png" media="(prefers-color-scheme: dark)">
      <source srcset=".github/assets/boost-logo-light.png" media="(prefers-color-scheme: light)">
      <img src=".github/assets/boost-logo-light.png" alt="Boost" width="260">
    </picture>
  </a>
</p>

<h3 align="center">Save tokens. Sharpen agents.</h3>

<p align="center">
  Boost trims the noisy output your coding agents read (test runs, builds, logs, diffs, MCP responses)<br>
  so they spend context on the signal. Free, local-first, no signup.
</p>

<p align="center">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b&label=release" alt="Latest release"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Downloads"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="Stars"></a>
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Windows%20%7C%20Linux-lightgrey" alt="macOS | Windows | Linux">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw"><img src="https://img.shields.io/badge/Slack-join%20the%20community-4A154B?logo=slack&logoColor=white" alt="Join the Slack community"></a>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><strong>Website</strong></a> ·
  <a href="https://boost.jfrog.com/docs/en/quickstart/"><strong>Quickstart</strong></a> ·
  <a href="https://boost.jfrog.com/docs/en/overview/"><strong>Docs</strong></a> ·
  <a href="https://boost.jfrog.com/features/"><strong>Features</strong></a> ·
  <a href="https://boost.jfrog.com/benchmarks/terminal-bench-2/"><strong>Benchmarks</strong></a> ·
  <a href="https://boost.jfrog.com/docs/en/changelog/"><strong>Changelog</strong></a>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/#token-diet">
    <img src=".github/assets/frogi-token-diet.gif" alt="Animated teaser: Frogi the frog eats tokens, climbs a staircase of re-sent context, weighs in at 1.2M tokens, then measures, mines and trims its way to a lighter scale." width="720">
  </a>
  <br>
  <sub>▶ <a href="https://boost.jfrog.com/#token-diet">Watch Frogi go on a token diet, with sound</a></sub>
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

> [!NOTE]
> Boost is in preview and subject to JFrog's [Online Preview Agreement](https://boost.jfrog.com/preview-agreement/).

## Get started

Two ways to install. Both run the same Boost engine and connect the coding agents they find on your machine.

### 🖥️ Option 1: Boost app

A desktop companion for **macOS and Windows**. It bundles the CLI, connects the agents it detects, keeps itself up to date, and shows your savings in a dashboard and the system tray.

<p>
  <a href="https://github.com/jfrog/boost/releases/latest/download/Boost.dmg"><img src="https://img.shields.io/badge/Download-macOS-36a13b?style=for-the-badge" alt="Download for macOS" height="32"></a>
  <a href="https://github.com/jfrog/boost/releases/latest/download/Boost-Windows-x64-Setup.exe"><img src="https://img.shields.io/badge/Download-Windows%20x64-36a13b?style=for-the-badge" alt="Download for Windows x64" height="32"></a>
  <a href="https://github.com/jfrog/boost/releases/latest/download/Boost-Windows-arm64-Setup.exe"><img src="https://img.shields.io/badge/Download-Windows%20ARM64-36a13b?style=for-the-badge" alt="Download for Windows ARM64" height="32"></a>
</p>

Open the app. That's it.

### ⌨️ Option 2: Boost CLI

Just the binary, for **macOS, Linux, WSL, Windows, and CI**.

```bash
# macOS / Linux / WSL
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

```powershell
# Windows PowerShell
irm https://boost.jfrog.com/install.ps1 | iex
```

Then connect your agents:

```bash
boost init
```

Installing with a coding agent? Point it at **[AGENT-INSTALL.md](./AGENT-INSTALL.md)**.

## Works with your agents

`boost init` detects each agent below and installs its integration globally under your home directory. Nothing is committed to your repos. To pick agents explicitly, pass their flags. Add `--dry-run` to preview every file before it changes.

| Agent | Flag | What gets installed |
| --- | --- | --- |
| Claude Code | `--claude` | Hook and awareness rule in `~/.claude` |
| Cursor | `--cursor` | Hook and awareness rule in `~/.cursor` |
| Codex CLI | `--codex` | Hooks and a `BOOST.md` note in `~/.codex` |
| GitHub Copilot | `--copilot` | Hooks in `~/.copilot/hooks` |
| OpenCode | `--opencode` | Plugin and the Boost skill in `~/.config/opencode` |

## How it works

Your agent works exactly as before. Boost sits between the agent and everything it reads, and it runs entirely on your machine.

```text
                          your coding agent
                                  |
       runs a command | calls an MCP tool | reads a file | explores code
                                  |
                                  v
  +-------------------- Boost, on your machine --------------------+
  |                                                                |
  |   terminal filters     custom filters     MCP filters          |
  |   file optimization    BoostGraph                              |
  |                                                                |
  |    keep the signal  -  drop the noise  -  save the original    |
  +----------------------------------------------------------------+
             |                                       |
             v                                       v
    compact context for                     local history for
    the agent                               boost retrieve, the dashboard,
                                            and OpenTelemetry export
```

## Capabilities

Click any capability for its documentation.

**Save tokens:** [Terminal filters](#terminal-filters) · [Custom filters](#custom-filters) · [MCP filters](#mcp-filters) · [File optimization](#file-optimization) · [BoostGraph](#boostgraph)<br>
**Stay safe:** [Reversible output](#reversible-output)<br>
**See the impact:** [Savings dashboard](#savings-dashboard) · [PR usage comments](#pr-usage-comments) · [OpenTelemetry export](#opentelemetry-export) · [Agents in CI](#agents-in-ci)

### [Terminal filters](https://boost.jfrog.com/docs/en/features/token-reduction/)

Built-in, flag-aware filters for 100+ tools, including npm, pytest, go, cargo, docker, git, gh, and kubectl. They cut banners, progress bars, repeated warnings, and ANSI noise, and keep failures, errors, summaries, and timings.

```text
pytest --> 25 lines --> [ built-in pytest filter ] --> 11 lines
                           drops: banner, plugins, progress dots
                           keeps: failure, traceback, summary
```

<details>
<summary>See the real <code>pytest</code> output, before and after</summary>

**Without Boost** (25 lines):

```text
============================= test session starts ==============================
platform darwin -- Python 3.12.4, pytest-8.3.2, pluggy-1.5.0
rootdir: /Users/dev/shop-api
configfile: pyproject.toml
plugins: anyio-4.4.0, cov-5.0.0, asyncio-0.23.8, mock-3.14.0
collected 214 items

tests/test_auth.py ..............................                         [ 14%]
tests/test_cart.py ..........................................             [ 33%]
tests/test_catalog.py ....................................                [ 50%]
tests/test_checkout.py ...................F..........                     [ 64%]
tests/test_inventory.py ..............................                    [ 78%]
tests/test_orders.py ..............................................       [100%]

=================================== FAILURES ===================================
__________________________ test_applies_discount_code __________________________

    def test_applies_discount_code():
        cart = Cart(items=[Item(price=100)])
>       assert cart.total(code="SAVE10") == 90
E       assert 100 == 90
tests/test_checkout.py:42: AssertionError
=========================== short test summary info ============================
FAILED tests/test_checkout.py::test_applies_discount_code - assert 100 == 90
======================== 1 failed, 213 passed in 4.81s =========================
```

**With Boost** (11 lines, same failure, same traceback, same summary):

```text
FAILURES
test_applies_discount_code

    def test_applies_discount_code():
        cart = Cart(items=[Item(price=100)])
>       assert cart.total(code="SAVE10") == 90
E       assert 100 == 90
tests/test_checkout.py:42: AssertionError
short test summary info
FAILED tests/test_checkout.py::test_applies_discount_code - assert 100 == 90
1 failed, 213 passed in 4.81s
```

</details>

### [Custom filters](https://boost.jfrog.com/docs/en/toml-filters/)

Teach Boost about your internal CLIs and scripts with small TOML files. Boost can point you at the best candidates, and your agent can draft the filter from your local history.

```text
boost filters gaps  -->  ranks the noisiest commands that still pass through
        |
        v
.boost/filters/deploy.toml  -->  written by you, or drafted by your agent
        |
        v
./deploy.sh  -->  [ your filter ]  -->  only the lines that matter
```

### [MCP filters](https://boost.jfrog.com/docs/en/configuration/#all-settings)

Large MCP JSON responses are compacted before they enter the agent's context, and Boost keeps a local record of each compressed call. *Staged rollout.*

```text
MCP tool --> large JSON response --> [ MCP filter ] --> compact JSON --> agent
                                           |
                                           +--> original kept on your machine
```

### [File optimization](https://boost.jfrog.com/#boost-features)

When the agent reads a file, Boost hands it a lighter version, typically for 2–3× fewer tokens.

```text
spec.pdf         --> [ Boost ] -->  spec.md       text instead of a binary blob
analysis.ipynb   --> [ Boost ] -->  analysis.md   cells and trimmed outputs
screenshot.png   --> [ Boost ] -->  resized to what the model actually sees
```

### [BoostGraph](https://boost.jfrog.com/docs/en/features/boostgraph/)

A code graph of your repo that agents query instead of looping through grep and file reads. One call returns the relevant source, who calls it, and what it affects. In early benchmarks, exploration finished 3× faster and cost up to 50% less. *Early access.*

```text
without:  grep -> read -> grep -> read -> read -> grep -> ...    many calls
with:     "how does checkout apply discount codes?"
             --> relevant symbols + verbatim source + call path   one call
```

### [Reversible output](https://boost.jfrog.com/docs/en/features/token-reduction/#what-boost-keeps)

Nothing is thrown away. Every compressed output is saved on your machine, and the agent can always ask for the original. Boost also learns from those requests: a filter that keeps hiding detail the agent needs is switched off for you.

```text
compact output ...
[Boost compressed ~55%. Get the full original output simply with: boost retrieve 4821]
        |
        v  the agent needs more
boost retrieve 4821  -->  the full original, straight from your machine
        |
        v  the same filter is retrieved 3 times (configurable)
that filter is disabled locally
```

### [Savings dashboard](https://boost.jfrog.com/docs/en/features/token-reduction/#measure-savings)

See every token Boost saved, per filter and per session, with before/after diffs of exactly what was trimmed. *Find opportunities* scans your history for noisy commands that still pass through unfiltered. Open it from the Boost app, or from a terminal:

```bash
boost ui          # interactive dashboard in your browser
boost report -t   # summary right in the terminal
```

Savings are context-weighted. An agent re-sends the whole conversation on every turn, so a trimmed output keeps saving tokens until the session ends or the context is compacted:

```text
turn          1      2      3      4      5
              |------|------|------|------|
saved        2K  +  2K  +  2K  +  2K  +  2K   =  10K context tokens saved
             ^
             output trimmed once, here
```

### [PR usage comments](https://boost.jfrog.com/docs/en/features/pr-usage-comments/)

See what each agent spent on a pull request without leaving GitHub. *Staged rollout.*

```text
agent sessions on a branch  -->  Boost  -->  one live comment on the PR
                                             tokens + estimated cost,
                                             per agent harness and model
```

### [OpenTelemetry export](https://boost.jfrog.com/docs/en/observability-platforms/)

Send the same sanitized spans to your own observability backend, such as Datadog, Grafana Cloud, Honeycomb, New Relic, Elastic, Coralogix, or any OTLP collector.

```text
Boost spans --+--> Boost endpoint            (sanitized, by default)
              |
              +--> EXTERNAL_OTEL_ENDPOINT    (your collector, when set)
```

### [Agents in CI](https://boost.jfrog.com/docs/en/github-actions/)

Running Claude Code or another agent in GitHub Actions? Install Boost in the job before the agent starts, and the agent reads compact output there too.

```yaml
- name: Install Boost
  run: |
    curl -fsSL https://boost.jfrog.com/install.sh | bash
    echo "$HOME/.local/bin" >> "$GITHUB_PATH"
    export PATH="$HOME/.local/bin:$PATH"
    boost init --claude --accept-terms
```

Rolling Boost out to a whole team? See the [company-wide install guide](https://boost.jfrog.com/docs/en/customer-installation/) (Jamf Pro and Workspace ONE MDM).

## Benchmark

On Terminal-Bench 2.0, Boost ran the same 89 tasks with the same success rate, for less.

| | Cost per task | Full-suite run time |
| --- | ---: | ---: |
| Without Boost | $0.319 | — |
| **With Boost** | **$0.276 (−13.5%)** | **−28.9%** |

Measured with Claude Code and Haiku 4.5. [Read the full report →](https://boost.jfrog.com/benchmarks/terminal-bench-2/)

## Stay up to date

- **Boost app:** updates itself.
- **Boost CLI:** re-run the install command. It always fetches the latest release.

## Security & privacy

- **Local-first.** Your code, logs, and terminal output stay on your machine. All filtering happens locally.
- **Only metadata leaves.** Usage data goes only to JFrog, to improve the product. It includes timing, exit codes, and token-savings stats, never raw logs, file contents, or environment values. Secrets matching patterns like `*_TOKEN`, `*_SECRET`, `AWS_*`, and `DATABASE_URL` are redacted before anything is stored or exported.
- **Open protocol, signed binaries.** OpenTelemetry-native. Binaries ship signed via GitHub Releases.

<a href="./SECURITY.md#security-scanning"><img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="Scanned by JFrog Xray" height="28"></a>

<details>
<summary>What gets scanned on every push to <code>main</code></summary>

<br>

Boost's source repository is scanned on every push to `main`, the same commits every release is built from, by [Frogbot](https://github.com/jfrog/frogbot) running JFrog Xray with JFrog Advanced Security.

| | What gets scanned |
| :---: | --- |
| ✓ | **Dependencies (SCA):** Go modules and npm trees across every module in the repo, matched against JFrog's vulnerability database |
| ✓ | **Contextual Analysis:** checks whether a reported CVE is actually reachable from Boost's code, so real risk is not buried in noise |
| ✓ | **Malicious packages:** dependencies flagged as malicious are caught before they reach a build |
| ✓ | **Secrets:** every tracked file is scanned for leaked credentials and tokens |
| ✓ | **Source code (SAST):** Boost's own Go and TypeScript sources |
| ✓ | **Infrastructure as Code:** CI workflows and deployment definitions |
| ✓ | **SBOM:** a component inventory is generated per build target on every scan |

Findings land as code-scanning alerts and automated fix pull requests on the source repository.

</details>

Full policy, supported versions, and how to report a vulnerability: [SECURITY.md](./SECURITY.md).

## Community

Questions, ideas, or a filter you want to share? Come say hi.

<a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw"><img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Join the Slack community" height="32"></a>

Found a bug? [Open an issue](https://github.com/jfrog/boost/issues). If Boost saves you tokens, a ⭐ helps others find it.

## License

Copyright © 2026 JFrog Ltd. All rights reserved. See [LICENSE](LICENSE) and the [Online Preview Agreement](https://boost.jfrog.com/preview-agreement/). Sponsored by [JFrog](https://jfrog.com).

---

*Dedicated to the memory of Dima Gershovich — a brilliant engineer, a talented musician, and a dear friend.* [Read Dima's story](docs/memorial/MEMORIAL.md)

<sub>See [Acknowledgements](docs/ACKNOWLEDGEMENTS.md) for maintainers and community contributions.</sub>
