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
  <strong>टोकन बचाएँ। एजेंट्स को ज़्यादा सटीक बनाएँ।</strong>
</p>

<p align="center">
  <sub>कोडिंग एजेंट्स और शेल कमांड के लिए स्मार्ट टोकन बचत।</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="वेबसाइट"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="रिलीज़"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="प्लैटफ़ॉर्म्स">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="डाउनलोड्स"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="स्टार्स"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="एजेंट-नेटिव">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="Slack समुदाय से जुड़ें" height="38">
  </a>
</p>

<p align="center">
  <sub><a href="https://jfrog.com"><strong>JFrog</strong></a> द्वारा प्रायोजित</sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.ja.md">日本語</a> ·
  <strong>हिन्दी</strong> ·
  <a href="README.he.md">עברית</a>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="JFrog Xray द्वारा स्कैन किया गया" height="38">
  </a>
</p>

<p align="center">
  <sub>डिपेंडेंसी, सोर्स कोड, सीक्रेट्स और IaC — <code>main</code> पर हर push पर स्कैन किए जाते हैं।</sub>
</p>

---

<p align="center">
  <strong>सिर्फ़ <code>boost</code> चलाने पर हमारा मैस्कॉट Frogi दिखाई देता है।</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, Boost का मैस्कॉट" width="180">
  </picture>
</p>

**Boost** उन कमांड्स को रैप करता है जिन्हें आपके एजेंट पहले से चलाते हैं। यह शोरगुल वाले लॉग्स को कॉम्पैक्ट, स्ट्रक्चर्ड कॉन्टेक्स्ट में बदलता है, जिसमें ज़रूरी सिग्नल — एरर्स, टाइमिंग, बदलावों की संख्या और कैश हिट्स — बने रहते हैं, जबकि अनावश्यक जानकारी हट जाती है।

Boost टोकन बचाने के लिए कभी क्वालिटी से समझौता नहीं करता। यह सिर्फ़ वही हटाता है जिसे सुरक्षित रूप से हटाया जा सकता है, इसलिए एजेंट्स का आउटपुट उतना ही सटीक और उपयोगी रहता है। हमारा [Terminal-Bench 2.0 बेंचमार्क](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) यही दिखाता है: एक जैसी टास्क पास रेट और ~12% कम लागत — Boost एजेंट्स के काम में रुकावट डाले बिना उन्हें ऑप्टिमाइज़ रखता है।

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="boost report डैशबोर्ड: समय के साथ बचाए गए कॉन्टेक्स्ट टोकन, CLI फ़िल्टर और कोडबेस एक्सप्लोरेशन के ब्रेकडाउन के साथ" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="Boost परिचय: JFrog boost लोगो, फिर इंस्टॉल करने, टास्क चलाने और boost report का वॉकथ्रू" width="768">
  </picture>
</p>

## क्विक स्टार्ट

**Boost इंस्टॉल करें**

macOS / Linux / Windows WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**इसे Cursor, Claude Code, GitHub Copilot और Codex CLI के साथ सेट अप करें:**

```bash
boost init
```

अगर कोई AI कोडिंग एजेंट यूज़र की मशीन पर Boost इंस्टॉल कर रहा है, तो **[AGENT-INSTALL.md](./AGENT-INSTALL.md)** का पालन करें।

## Boost का इस्तेमाल कब करें

- **लंबे कोडिंग-एजेंट सेशन्स** — दर्जनों शेल कमांड्स के दौरान कॉन्टेक्स्ट को हल्का रखें, ताकि एजेंट्स स्क्रॉलबैक पर नहीं बल्कि टास्क पर टोकन्स खर्च करें।
- **शोरगुल वाले टेस्ट, बिल्ड और डिबग लूप्स** — विफलताओं और सारांशों को बनाए रखते हुए `npm test`, `pytest`, `go test`, `docker build`, लिंटर्स और लॉग्स के आउटपुट को कम्प्रेस करें।
- **CI पाइपलाइन्स** — GitHub Actions और दूसरे रनर्स के लिए छोटे, आसानी से स्कैन किए जा सकने वाले जॉब लॉग्स, जिनमें टाइमिंग और कैश की ज़रूरी जानकारी बनी रहती है।
- **कस्टम या इन-हाउस टूल्स** — अपने CLIs के लिए TOML फ़िल्टर्स जोड़ें, ताकि यही कम्प्रेशन प्रक्रिया उन टूल्स पर भी लागू हो जिन्हें आपके एजेंट वास्तव में चलाते हैं।

## स्मार्ट टोकन बचत

Boost आउटपुट को सिर्फ़ ट्रंकेट नहीं करता। यह कमांड के हिसाब से फ़िल्टर्स लागू करता है, जो नतीजे का विश्लेषण करने के लिए एजेंट्स को ज़रूरी जानकारी सुरक्षित रखते हैं।

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

एजेंट को स्क्रॉलबैक के बजाय उपयोगी सारांश दिखता है। कमांड फेल होने पर Boost वही फेल हुआ टेस्ट, कम्पाइलर एरर या स्टैक फ़्रेम बनाए रखता है जो मायने रखता है।

## [Boost कैसे अलग है](https://boost.jfrog.com/docs/en/why-boost/)

| क्षमता | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| कमांड आउटपुट कम्प्रेशन | ✓ | ✓ | ✓ | × |
| फ़ुल-कॉन्टेक्स्ट और RAG कम्प्रेशन | × | × | ✓ | × |
| असिस्टेंट के जवाब का कम्प्रेशन | × | × | × | ✓ |
| कमांड आउटपुट रिकवरी | ✓ | ✓ | ✓ | × |
| नेटिव अप्रूवल में मूल एक्ज़ीक्यूटेबल दिखाई देता है | ✓ | × | — | — |
| वर्ज़न्ड रिट्रीवल फ़ीडबैक | ✓ | × | × | × |
| बार-बार रिट्रीव किए गए फ़िल्टर्स को अपने-आप डिसेबल करना | ✓ | × | × | × |
| एंड-टू-एंड एजेंट टास्क + लागत का A/B टेस्ट | ✓ | × | × | × |

## अपनी बचत देखें

कमांड रैप करने के बाद, इंटरैक्टिव वेब रिपोर्ट खोलें:

```bash
boost report
```

टर्मिनल में नैरेटिव समरी के लिए:

```bash
boost report -t
# or: boost report --tui
```

## Boost क्या रैप करता है

- **एजेंट्स:** Cursor, Claude Code, GitHub Copilot, Codex CLI।
- **कमांड्स:** Docker, npm, pytest, Git, GitHub CLI और दूसरे शेल कमांड्स इसी रैपर से गुज़रते हैं।

## आपके एजेंट Boost का इस्तेमाल कैसे कर रहे हैं

- `boost docker build ...` — कम्प्रेस्ड बिल्ड लॉग और लेयर-कैश समरी
- `boost npm ci` — डिपेंडेंसी समरी, लोकल पैकेज कैश और रीट्राई-सेफ़ आउटपुट
- `boost pytest` — सफल रन में कम आउटपुट और टेस्ट फेल होने पर उपयोगी विफलता विवरण

## अपडेट

```bash
boost update
```

## डॉक्यूमेंटेशन

कमांड, कॉन्फ़िगरेशन और OpenTelemetry एक्सपोर्ट के लिए [पूरी डॉक्यूमेंटेशन](https://boost.jfrog.com/docs/en/overview/) देखें।

## सुरक्षा और गोपनीयता

- **लोकल-फर्स्ट।** कमांड हिस्ट्री और रॉ लॉग्स आपकी मशीन पर ही रहते हैं।
- **सिर्फ़ मेटाडेटा बाहर भेजा जाता है।** जब Boost उपयोग से जुड़ा डेटा भेजता है, तो वह प्रोडक्ट को बेहतर बनाने के लिए सिर्फ़ JFrog को भेजा जाता है। एक्सपोर्ट किए गए मेटाडेटा में टाइमिंग, एग्ज़िट कोड और कैश आँकड़े शामिल होते हैं; रॉ लॉग्स, फ़ाइलों की सामग्री या एनवायरनमेंट वैरिएबल्स की वैल्यूज़ कभी शामिल नहीं होतीं। `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` जैसे पैटर्न से मेल खाने वाले सीक्रेट्स को सहेजने या एक्सपोर्ट करने से पहले रीडैक्ट कर दिया जाता है।
- **ओपन प्रोटोकॉल, हस्ताक्षरित बाइनरी।** OpenTelemetry-नेटिव। साइन की गई बाइनरीज़ GitHub Releases के ज़रिए उपलब्ध कराई जाती हैं।

पूरी पॉलिसी, सपोर्टेड वर्ज़न्स और किसी वल्नरेबिलिटी को रिपोर्ट करने के तरीके के लिए [SECURITY.md](./SECURITY.md) देखें।

## लाइसेंस

Copyright © 2026 JFrog Ltd. सर्वाधिकार सुरक्षित। [LICENSE](LICENSE) और [BETA_AGREEMENT.md](BETA_AGREEMENT.md) देखें।

---

*Dima Gershovich की याद में — एक बेहतरीन इंजीनियर, प्रतिभाशाली संगीतकार और प्रिय मित्र।* [Dima की कहानी पढ़ें](docs/memorial/MEMORIAL.md)
