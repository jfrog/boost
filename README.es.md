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
  <strong>Ahorra tokens. Mejora la precisión de tus agentes.</strong>
</p>

<p align="center">
  <sub>Ahorro inteligente de tokens para agentes de programación y comandos de shell.</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="Sitio web"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="Versión"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="Plataformas">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Descargas"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="Estrellas"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="Nativo para agentes">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Únete a la comunidad de Slack" height="38">
  </a>
</p>

<p align="center">
  <sub>Patrocinado por <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <strong>Español</strong> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="Analizado por JFrog Xray" height="38">
  </a>
</p>

<p align="center">
  <sub>Dependencias, código fuente, secretos e IaC: analizados en cada push a <code>main</code>.</sub>
</p>

---

> **Aviso de vista previa:** Este software está en fase de vista previa y sujeto al
> [Acuerdo de vista previa en línea](https://boost.jfrog.com/preview-agreement/) de JFrog.

---

<p align="center">
  <strong>Frogi, nuestra mascota, aparece cuando ejecutas únicamente <code>boost</code>.</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, la mascota de Boost" width="180">
  </picture>
</p>

**Boost** actúa como una capa sobre los comandos que tus agentes ya ejecutan y convierte registros con mucho ruido en un contexto compacto y estructurado que conserva la señal —errores, tiempos, recuentos de cambios y aciertos de caché— mientras reduce el ruido.

Boost nunca sacrifica calidad para ahorrar. Solo elimina lo que puede descartarse sin riesgo, por lo que la salida del agente conserva la misma precisión. Nuestra [evaluación comparativa con Terminal-Bench 2.0](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) lo demuestra: la misma tasa de éxito en las tareas con un coste aproximadamente un 12 % inferior. Boost mantiene optimizados a los agentes sin interrumpir nunca su ritmo.

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="Panel de boost report: tokens de contexto ahorrados con el tiempo, con el desglose de filtros de CLI y exploración del código" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Introducción a Boost: el logo de JFrog boost y un recorrido por la instalación, la ejecución de una tarea y boost report" width="768">
  </picture>
</p>

## Inicio rápido

**Instalar Boost**

macOS / Linux / Windows WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**Intégralo en Cursor, Claude Code, GitHub Copilot y Codex CLI:**

```bash
boost init
```

Los agentes de programación con IA que instalen Boost en el equipo de un usuario deben seguir **[AGENT-INSTALL.md](./AGENT-INSTALL.md)**.

## Cuándo usar Boost

- **Sesiones largas con agentes de programación** — Mantén un contexto compacto durante docenas de comandos de shell para que los agentes dediquen los tokens a la tarea y no al historial de la terminal.
- **Ciclos ruidosos de pruebas, compilación y depuración** — Comprime `npm test`, `pytest`, `go test`, `docker build`, linters y registros, pero conserva los fallos y los resúmenes.
- **Pipelines de CI** — Registros de trabajos más breves y fáciles de revisar, con información sobre tiempos y caché para GitHub Actions y otros ejecutores.
- **Herramientas personalizadas o internas** — Añade filtros TOML para tus propias CLI, de modo que el mismo ciclo de compresión cubra las herramientas que tus agentes utilizan realmente.

## Ahorro inteligente de tokens

Boost no se limita a truncar la salida. Aplica filtros que tienen en cuenta el comando y conservan lo que los agentes necesitan para razonar sobre el resultado.

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

El agente ve el resumen útil, no todo el historial de la terminal. Cuando se produce un fallo, Boost conserva la prueba fallida, el error del compilador o el marco de pila relevante.

## [En qué se diferencia Boost](https://boost.jfrog.com/docs/en/why-boost/)

| Capacidad | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| Compresión de la salida de comandos | ✓ | ✓ | ✓ | × |
| Compresión del contexto completo y compresión RAG | ✓ | × | ✓ | × |
| Compresión de las respuestas del asistente | × | × | × | ✓ |
| Recuperación de la salida de comandos | ✓ | ✓ | ✓ | × |
| El sistema de aprobación nativo recibe el ejecutable original | ✓ | × | — | — |
| Información versionada sobre las recuperaciones | ✓ | × | × | × |
| Desactivación automática de filtros cuyo contenido se recupera repetidamente | ✓ | × | × | × |
| Pruebas A/B integrales de tareas y costes de agentes | ✓ | × | × | × |

## Consulta tus ahorros

Una vez que hayas ejecutado comandos a través de Boost, abre el informe web interactivo:

```bash
boost report
```

Para un resumen narrativo en la terminal:

```bash
boost report -t
# or: boost report --tui
```

## Qué cubre

- **Agentes:** Cursor, Claude Code, GitHub Copilot, Codex CLI.
- **Comandos:** Docker, npm, pytest, Git, GitHub CLI y otros comandos de shell se ejecutan a través de la misma capa de Boost.

## Cómo usan Boost tus agentes

- `boost docker build ...` — registro de compilación comprimido y resumen de la caché de capas
- `boost npm ci` — resumen de dependencias, caché local de paquetes, salida que permite reintentos seguros
- `boost pytest` — salida mínima cuando las pruebas terminan correctamente y detalles útiles cuando fallan

## Actualizar

```bash
boost update
```

## Documentación

Consulta la [documentación completa](https://boost.jfrog.com/docs/en/overview/) para obtener información sobre los comandos, la configuración y la exportación mediante OpenTelemetry.

## Seguridad y privacidad

- **Prioridad al entorno local.** El historial de comandos y los registros sin procesar permanecen en tu equipo.
- **Solo salen metadatos.** Cuando Boost envía datos de uso, van únicamente a JFrog para ayudar a mejorar el producto. Los metadatos exportados incluyen información sobre tiempos, el código de salida y estadísticas de caché, pero nunca registros sin procesar, contenido de archivos ni valores de variables de entorno. Los secretos que coinciden con patrones como `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` se ocultan antes de almacenarlos o exportarlos.
- **Protocolo abierto, binarios firmados.** Compatible de forma nativa con OpenTelemetry. Los binarios se distribuyen firmados a través de GitHub Releases.

Consulta [SECURITY.md](./SECURITY.md) para conocer la política completa, las versiones compatibles y cómo informar de una vulnerabilidad.

## Licencia

Copyright © 2026 JFrog Ltd. Todos los derechos reservados. Consulta [LICENSE](LICENSE) y el [Acuerdo de vista previa en línea](https://boost.jfrog.com/preview-agreement/).

---

*Dedicado a la memoria de Dima Gershovich, un ingeniero brillante, un músico de gran talento y un amigo muy querido.* [Lee la historia de Dima](docs/memorial/MEMORIAL.md)
