# Coding Cafe — 8 September 2026

**Copilot in the IDE: your editor is the interface.**
45 minutes talk · 45 minutes discussion and hands-on.

GitHub Copilot inside **Visual Studio Code**, with R and RStudio treated as first-class, version
control as the safety net, and FAIR research practice as the reason any of it matters.

## Published

<https://lumc-dcc.github.io/2026-09-ai-in-your-editor/>

Every push to `main` rebuilds and redeploys via
[`.github/workflows/deploy.yml`](.github/workflows/deploy.yml). Pages must be set to
**Settings → Pages → Source: GitHub Actions** (not "Deploy from a branch").

The workflow derives the base path from the repository name, so renaming the repo cannot silently
break asset URLs. To reproduce a Pages build locally:

```bash
npx slidev build --base "/2026-09-ai-in-your-editor/" --out dist
```

Slidev emits a `404.html` that is a copy of `index.html`, which is what makes deep links like
`/33` work on Pages — Pages serves `404.html` for unknown paths and the SPA router takes over.
Do not delete it.

## Run it

Self-contained, like the June café deck:

```bash
cd slides/2026-09-08 && npm install
```

```bash
npm run dev
```

`npm run build` produces a static site in `dist/`. `npm run export` produces a PDF (needs
Playwright: `npx playwright install chromium`).

Press <kbd>o</kbd> for the overview, <kbd>p</kbd> for presenter mode — presenter notes carry the
timings and the facilitator cues.

## Theme

Taken from the **June 2026 café deck**
(`LUMC/LUMC_Coding_Cafe/Sessions/2026-06/2026-06-ai-slides`), so the two decks read as one series:

- **`slide-bottom.vue`** — the LUMC footer: Leiden University Medical Center and Coding Café logos
  on the left, `LUMC DCC Coding Café · 8 September 2026` centred, slide number in LUMC blue
  (`#003c7d`) on the right, over a white bar with a 2 px blue top border. Copied from June with the
  date changed
- **`style.css`** — June's file, unchanged: tighter layout padding so headings sit high and content
  clears the footer
- **`public/img/`** — the two logo files, copied from the June deck
- **`theme: seriph`**, Inter for sans and serif, JetBrains Mono for code — same frontmatter as June

The visual language follows June's conventions:

| Element | Pattern |
|---|---|
| Section divider | `layout: section` + `class: text-center`, eyebrow `PART N`, h1, light subtitle |
| Eyebrow label | `text-xs tracking-widest text-<accent>-500` above the h1 |
| Good / bad pair | `border-emerald-200 bg-emerald-50/30` vs `border-rose-200 bg-rose-50/30` |
| Callout | `border-l-4 border-amber-400 bg-amber-50/50` |
| Hero card | `rounded-xl bg-gradient-to-br from-<c>-500 to-<c>-700 text-white shadow-lg` |
| Title slide | dark gradient background with a cyan→fuchsia→amber gradient headline |

**Attribution.** June's footer carries the café branding rather than a per-slide source, so cited
slides carry their source inline as a small `text-xs opacity-50` line at the foot of the slide, and
the two source slides at the end list everything.

## Running order — 45 minutes

**66 slides**, of which 57 are in the talk. That is fast, and it is deliberate: Part 3 and Part 4 are
worked examples meant to be **demoed live** — present the ones you can actually run in VS Code and
let the slides be the handout for the rest.

| Section | Slides | Min | What it does |
|---|---|---|---|
| `00-open.md` | 4 | 4 | Welcome, Mentimeter opener, the three rules |
| `01-why-the-ide.md` | 5 | 6 | Chat → IDE → agent; the copy-paste tax; the trade |
| `02-vscode-tour.md` | 8 | 8 | Install, four surfaces, the context system, `copilot-instructions.md` |
| `03-examples.md` | 13 | 12 | Twelve worked examples — **demo live where you can** |
| `04-r-and-rstudio.md` | 7 | 6 | RStudio vs VS Code vs Positron; three R examples; R-specific failure modes |
| `05-fair-and-git.md` | 10 | 6 | FAIR, FAIR4RS, provenance, the five git commands, disclosure |
| `06-verify-and-data.md` | 4 | 3 | Loud vs quiet errors; what actually leaves your machine |
| `07-exercises.md` | 5 | 2 | Hand over the three lanes — **do not teach these slides** |
| `08-discussion.md` | 5 | — | Structure for the second 45 minutes, second poll, twelve prompts |
| `99-sources.md` | 4 | — | Attribution, and where the deck is thin |

**The 40-minute cut**, if you are running behind or the room already has Copilot working:

- Part 2 — drop the install slide (poll questions A1/A2 tell you before you get there)
- Part 3 — drop examples 9 (docs), 10 (regex) and 11 (translate); keep 3, 4, 7, 8 and 12
- Part 4 — drop R example 3; fold the reproducibility asks into Part 5
- Part 5 — drop "All five, without leaving VS Code" if the room is comfortable with git

That is nine slides and roughly seven minutes.

**Do not cut Part 5.** It is the section that makes this a research cafe rather than a product demo,
and it is the one the discussion half depends on.

**Every slide has been checked for overflow** at 980×552, measured programmatically against the
40 px footer. To re-check after editing, open `/print` in the dev server and compare each
`.slidev-page` `scrollHeight` with its `clientHeight` — eyeballing the overview misses slides that
clip by ten pixels.

## The exercises

Three lanes in `07-exercises.md`, designed to run in parallel for 45 minutes:

- 🟢 **Beginner** — GitHub account → VS Code → Copilot → first suggestion → first commit
- 🔵 **Intermediate** — synthetic dataset → explore → clean → a publishable figure in three
  rounds → `renv` and a README
- 🟠 **Expert** — bring your own repository; six suggested targets; report back on where it was
  confidently wrong

## Mentimeter

[`MENTIMETER.md`](MENTIMETER.md) — the full question bank in three groups (opener, mid-session
pulse, close), each with the facilitation reason and what to do with the answers.

**Before presenting:** put the real join code into the two `CODE · 0000 0000` placeholders in
`sections/00-open.md` and `sections/08-discussion.md`.

## Before the day

- [ ] Real Mentimeter code into both placeholder slides
- [ ] Check VS Code menu names and keybindings against the current release — Part 2 warns the room
      about drift, but check anyway
- [ ] Have a scratch repository ready for the live demo, already `git init`-ed, with a deliberate
      bug in it for example 6
- [ ] Have `data/example.csv` pre-generated in case the intermediate lane's synthetic-data prompt
      is slow
- [ ] Decide the invite line: *"a laptop, a GitHub account, and whatever editor you already use"*

## After

Export the Menti results into `../../coding-cafes/sessions/`, and add a line under September in
`../../coding-cafes/CALENDAR.md`: attendance, the editor split from A1, the success rate from B1,
and the best answer to B3.

## Conventions

One idea per slide. Section dividers use `layout: section` with `class: text-center` and a
`PART N` eyebrow. Cited slides carry their source inline at the foot of the slide; the two source
slides before the closing slide list everything in full.
