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
  <strong>トークンを節約。エージェントの精度を高める。</strong>
</p>

<p align="center">
  <sub>コーディングエージェントとシェルコマンドのトークン使用量を賢く削減。</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="Web サイト"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="リリース"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="対応プラットフォーム">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="ダウンロード数"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="GitHub スター数"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="エージェントネイティブ">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Slack コミュニティに参加" height="38">
  </a>
</p>

<p align="center">
  <sub>スポンサー: <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <strong>日本語</strong> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="JFrog Xray でスキャン済み" height="38">
  </a>
</p>

<p align="center">
  <sub>依存関係・ソースコード・シークレット・IaC を <code>main</code> への push ごとにスキャンしています。</sub>
</p>

---

<p align="center">
  <strong>マスコットの Frogi は、<code>boost</code> コマンドを単独で実行すると現れます。</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Boost のマスコット Frogi" width="180">
  </picture>
</p>

**Boost** は、エージェントがすでに実行しているコマンドをラップし、ノイズの多いログから不要な情報を削りつつ、エラー、所要時間、変更件数、キャッシュヒットといった重要な情報を残して、コンパクトで構造化されたコンテキストに変換します。

Boost はトークン節約のために品質を犠牲にしません。安全に省ける情報だけを削るため、エージェントの出力品質は変わりません。[Terminal-Bench 2.0 ベンチマーク](https://boost.jfrog.com/blog/benchmarks-terminal-bench/)がそれを実証しています。タスク成功率は同一で、コストは約 12% 低下しています。Boost はエージェントの動作を妨げることなく、その効率を高く保ちます。

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="boost report ダッシュボード: 節約されたコンテキストトークンの推移と、CLI フィルター / コードベース探索の内訳" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Boost の紹介: JFrog boost のロゴに続き、インストール、タスク実行、boost report のウォークスルー" width="768">
  </picture>
</p>

## クイックスタート

**Boost をインストール**

macOS / Linux / Windows WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**Cursor、Claude Code、GitHub Copilot、Codex CLI で Boost を使えるように設定:**

```bash
boost init
```

AI コーディングエージェントがユーザーのマシンに Boost をインストールする場合は、**[AGENT-INSTALL.md](./AGENT-INSTALL.md)** に従ってください。

## Boost を使うタイミング

- **長時間のコーディングエージェントセッション** — 数十回に及ぶシェルコマンドの実行中もコンテキストを簡潔に保ち、エージェントがスクロールバックではなくタスクにトークンを使えるようにします。
- **ノイズの多いテスト・ビルド・デバッグのループ** — `npm test`、`pytest`、`go test`、`docker build`、リンター、ログを圧縮しつつ、エラー情報とサマリーは保持します。
- **CI パイプライン** — GitHub Actions やその他のランナー向けに、実行時間とキャッシュ状況を残した、短く確認しやすいジョブログにします。
- **カスタムまたは社内ツール** — 独自 CLI 向けの TOML フィルタを追加し、エージェントが実際に使うツールも同じ圧縮処理の対象にします。

## トークンを賢く節約

Boost は出力を単に切り詰めるだけではありません。コマンドを認識するフィルタを適用し、エージェントが結果を判断するために必要な情報を保持します。

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

エージェントに届くのは、端末の過去出力ではなく有用なサマリーです。失敗時には、Boost は失敗したテスト、コンパイラエラー、または重要なスタックフレームを保持します。

## [Boost が他と異なる点](https://boost.jfrog.com/docs/en/why-boost/)

| 機能 | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| コマンド出力の圧縮 | ✓ | ✓ | ✓ | × |
| フルコンテキストと RAG の圧縮 | × | × | ✓ | × |
| アシスタント応答の圧縮 | × | × | × | ✓ |
| コマンド出力の復元 | ✓ | ✓ | ✓ | × |
| ネイティブ承認で元の実行コマンドを確認可能 | ✓ | × | — | — |
| バージョン情報付きの復元フィードバック | ✓ | × | × | × |
| 繰り返し復元されたフィルタの自動無効化 | ✓ | × | × | × |
| エージェントのタスクとコストを対象としたエンドツーエンド A/B 比較 | ✓ | × | × | × |

## 削減効果を確認する

コマンドをラップした後、対話型 Web レポートを開くには:

```bash
boost report
```

ターミナルで文章形式の要約を表示するには:

```bash
boost report -t
# or: boost report --tui
```

## ラップ対象

- **エージェント:** Cursor、Claude Code、GitHub Copilot、Codex CLI。
- **コマンド:** Docker、npm、pytest、Git、GitHub CLI、およびその他のシェルコマンドが同じラッパーを通ります。

## エージェントによる Boost の使用例

- `boost docker build ...` — 圧縮されたビルドログとレイヤーキャッシュの要約
- `boost npm ci` — 依存関係の要約、ローカルパッケージキャッシュ、再試行しても問題のない出力
- `boost pytest` — 成功時は簡潔な出力、テスト失敗時は有用なエラー情報

## 更新

```bash
boost update
```

## ドキュメント

コマンド、設定、OpenTelemetry エクスポートについては、[詳しいドキュメント](https://boost.jfrog.com/docs/en/overview/)を参照してください。

## セキュリティとプライバシー

- **ローカルファースト。** コマンド履歴と生のログはマシン上に残ります。
- **外部に送信されるのはメタデータのみ。** Boost が使用状況データを送信する場合、製品改善を目的として JFrog にのみ送信されます。エクスポートされるメタデータにはタイミング情報、終了コード、キャッシュ統計が含まれますが、生のログ、ファイルの内容、環境変数の値は含まれません。`*_TOKEN`、`*_SECRET`、`AWS_*`、`DATABASE_URL` などのパターンに一致するシークレットは、保存またはエクスポートの前に秘匿化されます。
- **オープンプロトコル、署名付きバイナリ。** OpenTelemetry ネイティブ。署名済みバイナリは GitHub Releases から配布されます。

ポリシー全文、サポート対象バージョン、脆弱性の報告方法については、[SECURITY.md](./SECURITY.md) を参照してください。

## ライセンス

Copyright © 2026 JFrog Ltd. All rights reserved. [LICENSE](LICENSE) および [BETA_AGREEMENT.md](BETA_AGREEMENT.md) を参照してください。

---

*卓越したエンジニア、才能あふれる音楽家、そして大切な友人であった Dima Gershovich を偲んで。* [Dima の物語を読む](docs/memorial/MEMORIAL.md)
