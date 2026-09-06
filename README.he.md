<p align="center">
  <a href="https://boost.jfrog.com/">
    <picture>
      <source srcset=".github/assets/boost-logo-dark.png" media="(prefers-color-scheme: dark)">
      <source srcset=".github/assets/boost-logo-light.png" media="(prefers-color-scheme: light)">
      <img src=".github/assets/boost-logo-light.png" alt="Boost" width="260">
    </picture>
  </a>
</p>

<p align="center" dir="rtl">
  <strong>חסכו בטוקנים. שפרו את דיוק הסוכנים.</strong>
</p>

<p align="center" dir="rtl">
  <sub>חיסכון חכם בטוקנים לסוכני קוד ולפקודות shell.</sub>
</p>

<p align="center">
  <a href="https://boost.jfrog.com/"><img src="https://img.shields.io/badge/website-boost.jfrog.com-36a13b?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI%2BPHBhdGggZmlsbD0iIzlCRTE1RCIgZD0iTTkuMiAxLjUgMy4xIDkuMmgzLjlsLTEuMSA1LjMgNy4xLTguMkg5LjV6Ii8%2BPC9zdmc%2B" alt="אתר"></a>
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/v/release/jfrog/boost?color=36a13b" alt="גרסה"></a>
  <a href="https://go.dev/"><img src="https://img.shields.io/badge/go-1.25-00ADD8?logo=go&logoColor=white" alt="Go 1.25"></a>
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-lightgrey" alt="פלטפורמות">
  <a href="https://github.com/jfrog/boost/releases"><img src="https://img.shields.io/github/downloads/jfrog/boost/total?color=6f42c1" alt="הורדות"></a>
  <a href="https://github.com/jfrog/boost/stargazers"><img src="https://img.shields.io/github/stars/jfrog/boost?style=flat&color=yellow" alt="כוכבים ב-GitHub"></a><br>
  <img src="https://img.shields.io/badge/agent--native-brightgreen" alt="מותאם לסוכנים">
  <img src="https://img.shields.io/badge/OpenTelemetry-enabled-blueviolet?logo=opentelemetry&logoColor=white" alt="OpenTelemetry"></p>

<p align="center">
  <a href="https://join.slack.com/t/boost-0wl2605/shared_invite/zt-47e3gh6vo-aw15OzLVAmxpCZ5tkX8OGw">
    <img src="https://img.shields.io/badge/Slack-Join%20the%20Community-4A154B?style=for-the-badge&logo=slack&logoColor=white" alt="הצטרפו לקהילת ה-Slack" height="38">
  </a>
</p>

<p align="center" dir="rtl">
  <sub>בחסות <a href="https://jfrog.com"><strong>JFrog</strong></a></sub>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.hi.md">हिन्दी</a> ·
  <strong>עברית</strong>
</p>

<p align="center">
  <a href="./SECURITY.md#security-scanning">
    <img src="https://img.shields.io/badge/Scanned%20by-JFrog%20Xray-40BE46?style=for-the-badge&logo=jfrog&logoColor=white&labelColor=1F2328" alt="נסרק על ידי JFrog Xray" height="38">
  </a>
</p>

<p align="center" dir="rtl">
  <sub>תלויות, קוד מקור, סודות ותשתית כקוד (IaC) — נסרקים בכל push ל-<code>main</code>.</sub>
</p>

---

> **הודעת תצוגה מקדימה:** תוכנה זו נמצאת בתצוגה מקדימה וכפופה ל[הסכם התצוגה המקדימה המקוון](https://boost.jfrog.com/preview-agreement/) של JFrog.

---

<p align="center" dir="rtl">
  <strong>הקמע שלנו, Frogi, מופיע כשמריצים את <code>boost</code> ללא ארגומנטים.</strong>
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-mascot-dark.png" media="(prefers-color-scheme: dark)">
    <source srcset=".github/assets/boost-mascot-light.png" media="(prefers-color-scheme: light)">
    <img src=".github/assets/boost-mascot-light.png" alt="Frogi, הקמע של Boost" width="180">
  </picture>
</p>

הכלי **Boost** עוטף את הפקודות שהסוכנים שלכם כבר מריצים והופך לוגים רועשים להקשר קומפקטי ומובנה, תוך שמירה על המידע החשוב — שגיאות, נתוני תזמון, מספר הפריטים שהשתנו ופגיעות במטמון — וצמצום הרעש.

עם Boost לעולם לא מקריבים איכות לטובת חיסכון. הכלי מסיר רק את מה שניתן להשמיט בבטחה, כך שפלט הסוכן נשאר איכותי באותה המידה. [הבנצ'מרק Terminal-Bench 2.0 שלנו](https://boost.jfrog.com/blog/benchmarks-terminal-bench/) ממחיש זאת: שיעור הצלחה זהה במשימות ועלות נמוכה בכ־12% — Boost שומר על יעילות הסוכנים בלי לפגוע ברצף עבודתם.

<p align="center">
  <img src=".github/assets/boost-ui-dashboard.png" alt="לוח הבקרה של boost report: טוקנים של הקשר שנחסכו לאורך זמן, בפילוח מסנני CLI וחקר בסיס הקוד" width="768">
</p>

<p align="center">
  <picture>
    <source srcset=".github/assets/boost-intro-mobile.gif" media="(max-width: 600px)">
    <img src=".github/assets/boost-intro.gif" alt="הכרות עם Boost: הלוגו של JFrog boost, ואחריו הדגמה של התקנה, הרצת משימה ו-boost report" width="768">
  </picture>
</p>

## התחלה מהירה

**התקנת Boost**

macOS / Linux / Windows WSL:

```bash
curl -fsSL https://boost.jfrog.com/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://boost.jfrog.com/install.ps1 | iex
```

**שלבו את Boost עם Cursor, Claude Code, GitHub Copilot ו-Codex CLI:**

```bash
boost init
```

סוכני קוד מבוססי AI שמתקינים את Boost במחשב של משתמש צריכים לפעול לפי **[AGENT-INSTALL.md](./AGENT-INSTALL.md)**.

## מתי להשתמש ב-Boost

- **סשנים ארוכים של סוכני קוד** — שמרו על הקשר תמציתי לאורך עשרות פקודות shell כדי שהסוכנים ישתמשו בטוקנים למשימה ולא לעיבוד הפלט הקודם במסוף.
- **מחזורי בדיקה, בנייה ודיבוג עתירי פלט** — דחסו `npm test`, `pytest`, `go test`, `docker build`, כלי lint ולוגים, תוך שמירה על פרטי הכשלים ועל הסיכומים.
- **תהליכי CI** — לוגי הרצה קצרים יותר, שקל יותר לסרוק, עם נתוני תזמון ומטמון עבור GitHub Actions ומערכות הרצה אחרות.
- **כלים מותאמים אישית או פנימיים** — הוסיפו מסנני TOML לכלי שורת הפקודה שלכם, כך שאותו מנגנון דחיסה יחול גם על הכלים שהסוכנים שלכם מריצים בפועל.

## חיסכון חכם בטוקנים

הסינון של Boost אינו מסתכם בקטיעת הפלט. Boost מחיל מסננים המותאמים לפקודה ומשמרים את המידע שהסוכנים זקוקים לו כדי לנתח את התוצאה.

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

הסוכן רואה את הסיכום השימושי במקום את כל הפלט הקודם. במקרה של כשל, Boost משאיר את הבדיקה שנכשלה, את שגיאת המהדר או את מסגרת המחסנית הרלוונטית.

## [במה Boost שונה](https://boost.jfrog.com/docs/en/why-boost/)

| יכולת | Boost | RTK | Headroom | Caveman |
| --- | :---: | :---: | :---: | :---: |
| דחיסת פלט פקודות | ✓ | ✓ | ✓ | × |
| דחיסת הקשר מלא ודחיסת RAG | ✓ | × | ✓ | × |
| דחיסת תשובות העוזר | × | × | × | ✓ |
| שחזור פלט פקודות | ✓ | ✓ | ✓ | × |
| מנגנון האישור המובנה רואה את קובץ ההפעלה המקורי | ✓ | × | — | — |
| משוב אחזור לפי גרסה | ✓ | × | × | × |
| השבתה אוטומטית של מסננים שהפלט שלהם מאוחזר שוב ושוב | ✓ | × | × | × |
| בדיקת A/B מקצה לקצה של משימת סוכן ועלותה | ✓ | × | × | × |

## ראו את החיסכון שלכם

לאחר הרצת פקודות דרך Boost, פתחו את הדוח האינטראקטיבי בדפדפן:

```bash
boost report
```

לקבלת סיכום מילולי במסוף:

```bash
boost report -t
# or: boost report --tui
```

## מה Boost עוטף

- **סוכנים:** Cursor, Claude Code, GitHub Copilot, Codex CLI.
- **פקודות:** אותה מעטפת משמשת לפקודות של Docker, npm, pytest, Git ו-GitHub CLI ולפקודות shell אחרות.

## איך הסוכנים שלכם משתמשים ב-Boost

- `boost docker build ...` — לוג בנייה דחוס וסיכום השימוש במטמון השכבות
- `boost npm ci` — סיכום תלויות, מטמון חבילות מקומי, פלט בטוח גם בניסיונות חוזרים
- `boost pytest` — פלט מצומצם בהרצות מוצלחות ופרטי כשל שימושיים כשהבדיקות נכשלות

## עדכון

```bash
boost update
```

## תיעוד

[התיעוד המלא](https://boost.jfrog.com/docs/en/overview/) כולל מידע על פקודות, תצורה וייצוא נתונים באמצעות OpenTelemetry.

## אבטחה ופרטיות

- **מקומי כברירת מחדל.** היסטוריית הפקודות והלוגים הגולמיים נשארים במחשב שלכם.
- **רק מטא-נתונים יוצאים מהמחשב.** כאשר Boost שולח נתוני שימוש, הם נשלחים אך ורק ל-JFrog לצורך שיפור המוצר. המטא-נתונים המיוצאים כוללים נתוני תזמון, קוד יציאה וסטטיסטיקות מטמון — ולעולם לא לוגים גולמיים, תוכן קבצים או ערכים של משתני סביבה. ערכים סודיים התואמים לתבניות כמו `*_TOKEN`, `*_SECRET`, `AWS_*`, `DATABASE_URL` מושחרים לפני כתיבה או ייצוא.
- **פרוטוקול פתוח וקבצים בינאריים חתומים.** תמיכה מובנית ב־OpenTelemetry. הקבצים הבינאריים החתומים מופצים דרך GitHub Releases.

לפרטים על המדיניות המלאה, הגרסאות הנתמכות ואופן הדיווח על חולשת אבטחה, ראו [SECURITY.md](./SECURITY.md).

## רישיון

זכויות יוצרים © 2026 JFrog Ltd. כל הזכויות שמורות. ראו [LICENSE](LICENSE) ואת [הסכם התצוגה המקדימה המקוון](https://boost.jfrog.com/preview-agreement/).

---

*מוקדש לזכרו של דימה גרשוביץ' — מהנדס מבריק, מוזיקאי מוכשר וחבר יקר.* [קראו את סיפורו של דימה](docs/memorial/MEMORIAL.md)
