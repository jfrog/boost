# README hero animation

- `frogi-token-diet.gif` — 720px wide, 12 fps, ~3.6 MB. A silent cut of the
  26-second "Watch Frogi go on a token diet" teaser from the website homepage.
  Autoplays and loops inline. The READMEs link it to
  `https://boost.jfrog.com/#token-diet`, where the same clip plays with sound.

The READMEs embed it as a linked image:

```html
<a href="https://boost.jfrog.com/#token-diet">
  <img src=".github/assets/frogi-token-diet.gif" alt="…" width="720">
</a>
```

GIF (not `<video>`) because GitHub autoplays GIFs inline, while it strips `src`
from `<source>` inside `<video>` and never autoplays video. The only playable
video GitHub renders is a `github.com/user-attachments/...` upload made through
the web editor.

**Do not hand-edit the binary.** Rebuild it from the `boost-cli` repo:

```bash
# from boost-cli/, with ffmpeg on PATH
SRC=website/public/videos/frogi-token-diet.mp4
OUT=../boost/.github/assets/frogi-token-diet.gif
ffmpeg -i "$SRC" -vf "fps=12,scale=720:-1:flags=lanczos,palettegen=stats_mode=diff" -y /tmp/pal.png
ffmpeg -i "$SRC" -i /tmp/pal.png -lavfi "fps=12,scale=720:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=4:diff_mode=rectangle" -y "$OUT"
```
