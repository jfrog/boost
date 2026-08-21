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
  <strong>Économisez des tokens. Rendez vos agents plus précis.</strong>
</p>

<p align="center">
  <sub>Économies intelligentes de tokens pour les agents de programmation et les commandes shell.</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="Site web"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="Version publiée"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="Plateformes">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="Téléchargements"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="Étoiles GitHub"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="Conçu pour les agents">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Rejoindre la communauté Slack" height="38">
  </a>
</p>

<p align="center">
  <sub>Soutenu par <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.es.md">Español</a> ·
  <strong>Français</strong> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="Analysé par JFrog Xray" height="38">
  </a>
</p>

<p align="center">
  <sub>Dépendances, code source, secrets et IaC : analysés à chaque push sur <code>main</code>.</sub>
</p>

---

<p align="center">
  <strong>Frogi, notre mascotte, apparaît lorsque vous exécutez la commande <code>boost</code> sans argument.</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, la mascotte de Boost" width="180">
  </picture>
</p>

**Boost** encapsule les commandes que vos agents exécutent déjà, transformant des journaux bruyants en un contexte compact et structuré qui conserve le signal — erreurs, durées, nombre de modifications, éléments trouvés dans le cache — tout en réduisant le bruit.

Boost ne sacrifie jamais la qualité au nom des économies. Il ne supprime que ce qui peut l'être sans risque, afin que la sortie transmise à l'agent reste tout aussi précise. Notre [benchmark Terminal-Bench 2.0](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) le confirme : même taux de réussite des tâches, avec un coût inférieur de ~12 % — Boost maintient les agents à leur niveau optimal sans jamais les ralentir.

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="Tableau de bord boost report : tokens de contexte économisés au fil du temps, avec la répartition filtres CLI et exploration du code" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Présentation de Boost : le logo JFrog boost, puis une démonstration de l'installation, de l'exécution d'une tâche et de boost report" width="768">
  </picture>
</p>

## Démarrage rapide

**Installer Boost**

macOS / Linux / WSL sous Windows :

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell :

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**Intégrez Boost à Cursor, Claude Code, GitHub Copilot et Codex CLI :**

```bash
boost init
```

Pour les agents IA de programmation qui installent Boost sur la machine d'un utilisateur, suivez les instructions du fichier **[AGENT-INSTALL.md](./AGENT-INSTALL.md)**.

## Quand utiliser Boost

- **Longues sessions avec des agents de programmation** — Maintenez un contexte léger au fil de dizaines de commandes shell afin que les agents consacrent leurs tokens à la tâche plutôt qu'à l'historique du terminal.
- **Boucles verbeuses de test, de build et de débogage** — Compressez les sorties de `npm test`, `pytest`, `go test`, `docker build` et des linters, ainsi que les journaux, tout en conservant les détails des échecs et les résumés.
- **Pipelines CI** — Journaux de tâches plus courts et plus faciles à parcourir, avec des indications sur les durées et l'utilisation du cache pour GitHub Actions et les autres runners.
- **Outils personnalisés ou internes** — Ajoutez des filtres TOML pour vos propres CLI afin que le même mécanisme de compression s'applique aux outils que vos agents utilisent réellement.

## Économies intelligentes de tokens

Boost ne se contente pas de tronquer la sortie. Il applique des filtres qui tiennent compte de la commande et préservent les éléments dont les agents ont besoin pour raisonner à partir du résultat.

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

L'agent voit le résumé utile, pas l'historique du terminal. En cas d'échec, Boost conserve les informations qui comptent : le test en échec, l'erreur de compilation ou l'entrée pertinente de la trace de pile.

## [Ce qui distingue Boost](https://boost.jfrog.com/docs/en/why-boost/)

| Fonctionnalité | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| Compression de la sortie des commandes | ✓ | ✓ | ✓ | × |
| Compression du contexte complet et du RAG | × | × | ✓ | × |
| Compression des réponses de l'assistant | × | × | × | ✓ |
| Récupération de la sortie des commandes | ✓ | ✓ | ✓ | × |
| L'interface d'approbation native affiche l'exécutable d'origine | ✓ | × | — | — |
| Retour d'information versionné sur les récupérations | ✓ | × | × | × |
| Désactivation automatique des filtres dont la sortie est récupérée à plusieurs reprises | ✓ | × | × | × |
| Test A/B de bout en bout sur la tâche de l'agent et le coût | ✓ | × | × | × |

## Visualisez vos économies

Une fois les commandes encapsulées, ouvrez le rapport web interactif :

```bash
boost report
```

Pour obtenir un résumé en prose dans le terminal :

```bash
boost report -t
# or: boost report --tui
```

## Ce que Boost encapsule

- **Agents :** Cursor, Claude Code, GitHub Copilot, Codex CLI.
- **Commandes :** Docker, npm, pytest, Git, GitHub CLI et d'autres commandes shell passent par le même mécanisme d'encapsulation.

## Comment vos agents utilisent Boost

- `boost docker build ...` — journal de build compressé et résumé de l'utilisation du cache des couches
- `boost npm ci` — résumé des dépendances, cache local de paquets, sortie fiable en cas de nouvelle tentative
- `boost pytest` — sortie minimale lorsque les tests réussissent, informations utiles en cas d'échec

## Mettre à jour

```bash
boost update
```

## Documentation

Consultez la [documentation complète](https://boost.jfrog.com/docs/en/overview/) pour les commandes, la configuration et l'exportation OpenTelemetry.

## Sécurité et confidentialité

- **Priorité au stockage local.** L'historique des commandes et les journaux bruts restent sur votre machine.
- **Seules les métadonnées quittent votre machine.** Lorsque Boost envoie des données d'utilisation, elles sont uniquement transmises à JFrog afin d'améliorer le produit. Les métadonnées exportées comprennent la durée d'exécution, le code de sortie et les statistiques de cache, mais jamais les journaux bruts, le contenu des fichiers ni les valeurs des variables d'environnement. Les secrets correspondant à des motifs comme `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` sont expurgés avant leur écriture ou leur exportation.
- **Protocole ouvert, binaires signés.** Intégration native d'OpenTelemetry. Les binaires signés sont distribués via GitHub Releases.

Pour consulter la politique complète, connaître les versions prises en charge et savoir comment signaler une vulnérabilité, voir [SECURITY.md](./SECURITY.md).

## Licence

Copyright © 2026 JFrog Ltd. Tous droits réservés. Voir [LICENSE](LICENSE) et [BETA_AGREEMENT.md](BETA_AGREEMENT.md).

---

*Dédié à la mémoire de Dima Gershovich — un ingénieur brillant, un musicien talentueux et un cher ami.* [Lire l'histoire de Dima](docs/memorial/MEMORIAL.md)
