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
  <strong>Tokens sparen. Agents präziser machen.</strong>
</p>

<p align="center">
  <sub>Intelligente Token-Einsparungen für Coding-Agents und Shell-Befehle.</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="Website"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="Release"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="Plattformen">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Downloads"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="GitHub-Sterne"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="Agent-nativ">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Der Slack-Community beitreten" height="38">
  </a>
</p>

<p align="center">
  <sub>Gesponsert von <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.fr.md">Français</a> ·
  <strong>Deutsch</strong> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="Geprüft von JFrog Xray" height="38">
  </a>
</p>

<p align="center">
  <sub>Abhängigkeiten, Quellcode, Secrets und IaC — bei jedem Push auf <code>main</code> geprüft.</sub>
</p>

---

<p align="center">
  <strong>Frogi, unser Maskottchen, erscheint, wenn du nur <code>boost</code> ausführst.</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, das Boost-Maskottchen" width="180">
  </picture>
</p>

**Boost** versieht die Befehle, die deine Agents bereits ausführen, mit einem Wrapper und verwandelt unübersichtliche Logs in kompakten, strukturierten Kontext. Dabei bleiben die relevanten Informationen — Fehler, Laufzeiten, die Anzahl der Änderungen und Cache-Treffer — erhalten, während das Rauschen reduziert wird.

Boost spart nie auf Kosten der Qualität. Es kürzt nur Inhalte, die bedenkenlos entfallen können, sodass die Agent-Ausgabe genauso präzise bleibt. Unser [Terminal-Bench-2.0-Benchmark](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) belegt das: identische Erfolgsquote bei der Aufgabenbearbeitung, ~12 % niedrigere Kosten — Boost sorgt dafür, dass Agents effizient arbeiten, ohne ihren Arbeitsfluss zu unterbrechen.

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="boost report Dashboard: gesparte Kontext-Tokens im Zeitverlauf, aufgeschlüsselt nach CLI-Filtern und Code-Exploration" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Boost-Intro: das JFrog-boost-Logo und ein Rundgang durch Installation, Task-Ausführung und boost report" width="768">
  </picture>
</p>

## Schnellstart

**Boost installieren**

macOS / Linux / Windows mit WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**In Cursor, Claude Code, GitHub Copilot und Codex CLI einbinden:**

```bash
boost init
```

KI-Coding-Agents, die Boost auf dem Rechner eines Nutzers installieren, sollten die Anweisungen in **[AGENT-INSTALL.md](./AGENT-INSTALL.md)** befolgen.

## Wann du Boost nutzen solltest

- **Lange Coding-Agent-Sitzungen** — Halte den Kontext über Dutzende von Shell-Befehlen hinweg schlank, damit Agents ihre Tokens für die Aufgabe statt für den Scrollback aufwenden.
- **Test-, Build- und Debug-Schleifen mit umfangreicher Ausgabe** — Komprimiere `npm test`, `pytest`, `go test`, `docker build`, Linter und Logs, wobei Fehler und Zusammenfassungen erhalten bleiben.
- **CI-Pipelines** — Kürzere, leichter zu überblickende Job-Logs mit Laufzeit- und Cache-Informationen für GitHub Actions und andere Runner.
- **Eigene oder interne Tools** — Füge TOML-Filter für deine eigenen CLIs hinzu, damit dieselbe Komprimierungslogik auch die Tools abdeckt, die deine Agents tatsächlich ausführen.

## Intelligente Token-Einsparungen

Boost kürzt die Ausgabe nicht einfach ab. Es wendet befehlsspezifische Filter an, die alles bewahren, was Agents benötigen, um das Ergebnis auszuwerten.

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

Der Agent sieht die nützliche Zusammenfassung statt des Scrollbacks. Im Fehlerfall lässt Boost den entscheidenden fehlgeschlagenen Test, Compilerfehler oder Stack-Frame in der Ausgabe stehen.

## [Was Boost von anderen unterscheidet](https://boost.jfrog.com/docs/en/why-boost/)

| Fähigkeit | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| Kompression der Befehlsausgabe | ✓ | ✓ | ✓ | × |
| Kompression des vollständigen Kontexts und RAG-Kompression | × | × | ✓ | × |
| Kompression der Assistentenantworten | × | × | × | ✓ |
| Wiederherstellung der Befehlsausgabe | ✓ | ✓ | ✓ | × |
| Ursprüngliche ausführbare Datei für native Freigabe sichtbar | ✓ | × | — | — |
| Versioniertes Retrieval-Feedback | ✓ | × | × | × |
| Automatische Deaktivierung von Filtern nach wiederholtem Abruf der Originalausgabe | ✓ | × | × | × |
| Durchgängiger A/B-Test von Agent-Aufgaben und Kosten | ✓ | × | × | × |

## Sieh dir deine Einsparungen an

Sobald deine Befehle über Boost laufen, öffne den interaktiven Webbericht:

```bash
boost report
```

Für eine ausformulierte Zusammenfassung im Terminal:

```bash
boost report -t
# or: boost report --tui
```

## Welche Agents und Befehle Boost abdeckt

- **Agents:** Cursor, Claude Code, GitHub Copilot, Codex CLI.
- **Befehle:** Docker, npm, pytest, Git, GitHub CLI und andere Shell-Befehle laufen durch denselben Wrapper.

## Wie deine Agents Boost nutzen

- `boost docker build ...` — komprimiertes Build-Log und Zusammenfassung des Layer-Caches
- `boost npm ci` — Abhängigkeitszusammenfassung, lokaler Paket-Cache, zuverlässige Ausgabe auch bei Wiederholungsversuchen
- `boost pytest` — knappe Ausgabe bei erfolgreichen Testläufen, aussagekräftige Fehlerinformationen, wenn Tests scheitern

## Aktualisieren

```bash
boost update
```

## Dokumentation

Siehe die [vollständige Dokumentation](https://boost.jfrog.com/docs/en/overview/) zu Befehlen, Konfiguration und OpenTelemetry-Export.

## Sicherheit & Datenschutz

- **Local-first.** Befehlsverlauf und Rohprotokolle bleiben auf deinem Rechner.
- **Nur Metadaten werden übertragen.** Wenn Boost Nutzungsdaten sendet, gehen sie ausschließlich an JFrog, um das Produkt zu verbessern. Exportierte Metadaten umfassen Laufzeitinformationen, Exit-Code und Cache-Statistiken, niemals jedoch Rohprotokolle, Dateiinhalte oder Werte von Umgebungsvariablen. Secrets, die Mustern wie `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` entsprechen, werden vor dem Speichern oder Exportieren unkenntlich gemacht.
- **Offenes Protokoll, signierte Binärdateien.** OpenTelemetry-nativ. Signierte Binärdateien werden über GitHub Releases ausgeliefert.

Die vollständige Richtlinie, Angaben zu unterstützten Versionen und eine Anleitung zum Melden einer Schwachstelle findest du in [SECURITY.md](./SECURITY.md).

## Lizenz

Copyright © 2026 JFrog Ltd. Alle Rechte vorbehalten. Siehe [LICENSE](LICENSE) und [BETA_AGREEMENT.md](BETA_AGREEMENT.md).

---

*In Erinnerung an Dima Gershovich — einen brillanten Ingenieur, talentierten Musiker und lieben Freund.* [Lies Dimas Geschichte](docs/memorial/MEMORIAL.md)
