---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 4</div>

# R and RStudio

<div class="text-lg opacity-70 mt-4 font-light">
Because half this room does not use VS Code — and does not need to.
</div>

---
layout: default
---

# You are not required to switch editors

<div class="grid grid-cols-3 gap-5 mt-6">

<div class="rounded-lg border-l-4 border-blue-500 bg-blue-50/50 p-5">

<div class="text-xs tracking-widest text-blue-700 mb-2">📊 RSTUDIO</div>

### Copilot is supported

<div class="text-sm mt-3 space-y-2">

Since 2023.09. Tools → Global Options → **Assistant** → *Use code assistant* → **GitHub Copilot**.

**Completions only.** No chat pane, no edit mode, no agent.

<div class="text-xs mt-2 opacity-80 border-l-2 border-rose-400 pl-2">
⚠️ Off by default on <strong>Server / Workbench</strong>: an admin must set <code>copilot-enabled=1</code>. If the option is missing, that is why.
</div>

</div>

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/50 p-5">

<div class="text-xs tracking-widest text-emerald-700 mb-2">💻 VS CODE + R EXTENSION</div>

### The full set

<div class="text-sm mt-3 space-y-2">

Everything in Part 2, for `.R`, `.Rmd` and `.qmd`.

Needs the **R** extension, the `languageserver` package, and — for plots that behave — `httpgd`.

</div>

</div>

<div class="rounded-lg border-l-4 border-fuchsia-500 bg-fuchsia-50/50 p-5">

<div class="text-xs tracking-widest text-fuchsia-700 mb-2">🔀 POSITRON</div>

### The middle path

<div class="text-sm mt-3 space-y-2">

Posit's own editor, on the VS Code codebase. RStudio's layout, VS Code's extensions.

Its Assistant **does** have a chat pane — Copilot chat is in preview.

</div>

</div>

</div>

<div class="mt-6 text-sm border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
<strong>The honest recommendation.</strong> Productive in RStudio? Check the Assistant pane. No option there means Server or Workbench — a ticket, not a setting.
</div>

<div class="mt-2 text-xs opacity-50">
Sources: Carpentries Incubator · <em>Coding with LLMs (novice)</em> · CC-BY-4.0 · Posit RStudio User Guide (checked 8 Sep 2026)
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SETUP</div>

# Getting R working in VS Code

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">IN R, ONCE</div>

```r
install.packages(c("languageserver", "httpgd"))
```

<div class="text-xs tracking-widest text-emerald-600 mt-4 mb-2">IN VS CODE, ONCE</div>

<div class="text-sm space-y-2">

Extensions view → install **R** (REditorSupport) → install **GitHub Copilot**.

Then in Settings, search `r.plot.useHttpgd` and turn it on. Plots appear in a pane instead of a
window that fights your window manager.

</div>

</div>

<div class="rounded-lg bg-indigo-50 border-l-4 border-indigo-500 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">THE TWO COMFORTS PEOPLE MISS</div>

<div class="text-sm space-y-3">

<div><strong>Send line to console:</strong> <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>Enter</kbd>. Same as RStudio.</div>

<div><strong>A nicer console:</strong> install <code>radian</code> (a Python package, confusingly) and point
<code>r.rterm</code> at it. Syntax highlighting and multiline editing in the REPL.</div>

</div>

<div class="text-xs mt-4 opacity-70">
Quarto and R Markdown work with the Quarto extension; chunks get ghost text like any other R code.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">R EXAMPLE 1 · CHAT, EDIT MODE</div>

# A pipeline from a sentence

```text
#file:visits.csv

Write a tidyverse pipeline: one row per participant, their first visit
date, their number of visits, and mean systolic BP across visits.
Use `|>`. Drop participants with no visits rather than giving them NA.
```

<div class="grid grid-cols-2 gap-5 mt-4">

<div>

```r
summary_df <- visits |>
  filter(!is.na(visit_date)) |>
  group_by(participant_id) |>
  summarise(
    first_visit = min(visit_date),
    n_visits    = n(),
    mean_sbp    = mean(sbp, na.rm = TRUE),
    .groups     = "drop"
  )
```

</div>

<div class="rounded-lg bg-amber-50 border-l-4 border-amber-500 p-4">

<div class="text-xs tracking-widest text-amber-700 mb-2">THE THREE THINGS TO CHECK</div>

<div class="text-sm space-y-1.5">

1. `na.rm = TRUE` — **it chose that.** Is a mean over the visits that happen to have a reading the number you want?
2. `.groups = "drop"` — right, but check; forgetting it is how a later `mutate` surprises you
3. Did it use the **real column names**, or plausible-looking ones?

</div>

<div class="text-xs mt-3 opacity-70">
Attaching the CSV is what makes item 3 pass.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-fuchsia-500 mb-2">R EXAMPLE 2 · WHERE THE IDE EARNS ITS PLACE</div>

# Visualisation, and the iteration loop

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="space-y-3">

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">ROUND 1</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Plot mean_sbp against first_visit, coloured by study arm, with a loess smoother per arm.</div>
</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">ROUND 2</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Colourblind-safe palette. Move the legend to the bottom. Axis label "Systolic BP (mmHg)".</div>
</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">ROUND 3</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Facet by site. Free y scales. Save as figures/sbp_by_arm.png at 300 dpi, 180 mm wide.</div>
</div>

</div>

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">WHY ITERATE INSTEAD OF ONE BIG PROMPT</div>

<div class="text-sm space-y-2">

You **see** each version. The plot is the feedback, and it is far faster than describing what you
want in advance.

</div>

<div class="mt-4 rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-3 text-sm">
This is the loop that does not exist in a browser: prompt → plot → look → prompt. Three rounds take
under a minute and you end with a figure you could put in a paper.
</div>

<div class="mt-3 text-xs opacity-70">
Round 3 is the one to keep in the script. Ask it to <strong>collapse the three rounds into one clean <code>ggplot</code> call</strong> before you commit — chat history is not a figure caption.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-emerald-500 mb-2">R EXAMPLE 3 · THE UNDERRATED USE</div>

# The reproducibility asks

<div class="grid grid-cols-2 gap-5 mt-5">

<div class="space-y-3">

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">ENVIRONMENT</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Set this project up with renv. Snapshot the packages this script actually uses, and add a comment at the top saying how to restore it.</div>
</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">PATHS</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Replace every setwd() and absolute path with here::here(). Change nothing else.</div>
</div>

</div>

<div class="space-y-3">

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">SESSION INFO</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Add a sessionInfo() call at the end of the script, written to logs/ with the date in the filename.</div>
</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">STRUCTURE</div>
<div class="font-mono text-xs bg-gray-50 p-2.5 rounded border">Split this 400-line script into R/load.R, R/clean.R, R/model.R and a run.R that sources them in order. Behaviour must be identical.</div>
</div>

</div>

</div>

<div class="mt-5 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
Every one of these is a job you have been meaning to do for a year, that takes ninety seconds and that
you will actually do now. <strong>This is the underrated use of the tool</strong> — not writing new analysis, but
paying down the reproducibility debt in the analysis you already wrote.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-rose-500 mb-2">FAILURE MODES</div>

# Where R specifically trips it up

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">⚠️ WATCH FOR</div>

<div class="text-sm space-y-1.5">

- **`%>%` vs `|>`** — it will mix them in one file unless told
- **`data.table` written as `dplyr`** — it defaults to what is common online, not what your project uses
- **`stringsAsFactors`** — advice from 2018 still circulates; R 4.x changed the default
- **Invented tidyverse verbs** that sound completely plausible and do not exist
- **`T` instead of `TRUE`** — assignable, and a genuine source of bugs

</div>

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-5">

<div class="text-xs tracking-widest text-emerald-700 mb-2">✅ THE FIX IS ONE FILE</div>

<div class="text-sm mb-2">Put your dialect in <code>.github/copilot-instructions.md</code> <strong>once</strong>:</div>

```markdown
- Base pipe `|>` only, never `%>%`
- dplyr, not data.table
- Always TRUE/FALSE, never T/F
- Every script ends with sessionInfo()
```

<div class="text-sm mt-3">Then stop correcting it by hand every time. Two minutes, permanently.</div>

</div>

</div>

<div class="mt-4 text-xs opacity-60 border-l-4 border-amber-400 pl-3 py-1 bg-amber-50/50">
Invented function names are the most common R failure and the easiest to catch — <strong>run the code</strong>. Silent wrongness is the kind to fear.
</div>
