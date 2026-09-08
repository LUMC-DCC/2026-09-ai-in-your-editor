---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 5</div>

# FAIR, and the safety net

<div class="text-lg opacity-70 mt-4 font-light">
Where "it worked on my laptop" stops being acceptable and starts being a research problem.
</div>

---
layout: default
---

# FAIR, in one slide 🔁

<div class="text-sm opacity-70 mb-3">For people who are tired of hearing about it.</div>

| | | The question an AI assistant makes sharper |
|---|---|---|
| **F** | Findable | Where does this analysis live, and does it have an identifier? |
| **A** | Accessible | Can someone else obtain the code and the data description? |
| **I** | Interoperable | Are formats and vocabularies standard, or private to you? |
| **R** | Reusable | **Is there enough provenance for someone to trust and rerun it?** |

<div class="mt-5 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
FAIR was written for <strong>data</strong>. FAIR4RS extended it to <strong>software</strong>, on the argument that software is
research output, not research plumbing. An assistant that writes code faster than you can document it
puts direct pressure on <strong>R</strong> — the principle that was already the weakest.
</div>

<div class="mt-3 text-xs opacity-50">
Sources: Wilkinson et al. 2016 · <em>Sci Data</em> 3:160018 · Chue Hong et al. 2022 · FAIR4RS · DOI 10.15497/RDA00068
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-rose-500 mb-2">THE SPECIFIC TENSION</div>

# Two things that do not speed up together

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="rounded-xl bg-gradient-to-br from-emerald-500 to-emerald-700 text-white p-6 shadow-md">
<div class="text-xs opacity-70 mb-2 tracking-widest">WHAT SPEEDS UP</div>
<div class="text-2xl font-bold">Writing code</div>
<div class="text-sm opacity-90 mt-2">Dramatically.</div>
</div>

<div class="rounded-xl bg-gradient-to-br from-rose-500 to-rose-700 text-white p-6 shadow-md">
<div class="text-xs opacity-70 mb-2 tracking-widest">WHAT DOES NOT</div>
<div class="text-2xl font-bold">Understanding it</div>
<div class="text-sm opacity-90 mt-2">Documenting it. Justifying it to a reviewer in eighteen months.</div>
</div>

</div>

<div class="mt-6 text-sm opacity-80">
The gap between those two is where research software quietly stops being reproducible. It is not a new
failure mode — it is an <strong>existing</strong> one, with the throttle removed.
</div>

<div class="mt-5 text-base border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
🧪 If you generate more code per hour and document at the same rate as before, your provenance per line
of code <strong>has fallen</strong>. That is arithmetic, not pessimism.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EIGHTEEN MONTHS FROM NOW</div>

# "How was Figure 3 produced?"

<div class="grid grid-cols-2 gap-6 mt-5">

<div class="rounded-lg border border-rose-200 bg-rose-50/30 p-5">

<div class="text-xs tracking-widest text-rose-600 mb-2">❌ IF THE ANSWER LIVES IN A CHAT</div>

<div class="text-sm space-y-1.5">

- The session has expired, or was on an account you have left
- Not shareable, not citable, not searchable
- Forty wrong turns and three right ones, undistinguished
- Nobody will ever read it, including you

</div>

</div>

<div class="rounded-lg border border-emerald-200 bg-emerald-50/30 p-5">

<div class="text-xs tracking-widest text-emerald-600 mb-2">✅ IF THE ANSWER LIVES IN GIT</div>

<div class="text-sm space-y-1.5">

- `git log figures/figure3.R` — every change, dated
- `git blame` — which line, which commit, which reason
- Commit messages carry the *why*
- It clones with the repository, and survives you leaving

</div>

</div>

</div>

<div class="mt-6 text-center text-xl font-light">
Chat history is not provenance. <strong>Git history is.</strong>
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">TEN SIMPLE RULES · RULE 8</div>

# Document your process

<div class="mt-4 text-lg border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
Record decisions in code comments and version-controlled files, <strong>independent of chat histories</strong>.
</div>

<div class="grid grid-cols-2 gap-6 mt-6">

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">WHAT IT COSTS TO COMPLY</div>

<div class="text-sm mb-3">One line in a commit message.</div>

```text
Assisted-by: GitHub Copilot
```

<div class="text-sm mt-3">
That is the entire obligation. The diff then tells the truth about how the code was produced,
permanently, to anyone who clones the repository.
</div>

</div>

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WHAT IT BUYS</div>

<div class="text-sm space-y-2">

You never have to answer the question from memory.

And when a journal, a funder or an institution eventually asks for a disclosure statement — several
already do — the answer is already in the repository rather than being reconstructed from
recollection.

</div>

</div>

</div>

<div class="mt-4 text-xs opacity-50">
Source: PLOS Comp Biol · King et al. 2026 · <em>Ten simple rules for using generative AI in research computing</em>
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-emerald-500 mb-2">IF YOU HAVE NEVER USED GIT</div>

# The five commands that make this safe

| Command | What it means |
|---------|---------------|
| `git switch -c fix-merge` | **A room you can walk out of.** Work here; `main` stays untouched |
| `git status` | What has changed since the last checkpoint |
| `git diff` | **Line by line, what actually changed.** The most important one |
| `git commit -am "..."` | **A checkpoint.** You can always come back to exactly this |
| `git restore .` | **Throw away everything since the last checkpoint.** The undo button |

<div class="mt-4 text-center text-base border-l-4 border-emerald-500 pl-4 py-2 bg-emerald-50/40">
checkpoint → let it change things → read the diff → <strong>keep it or bin it</strong>
</div>

<div class="mt-3 text-xs opacity-60">
Commit <em>before</em> you ask for a change. A commit is cheap, private until you push, and it is what makes
<code>git restore</code> safe rather than terrifying.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">NO TERMINAL REQUIRED</div>

# All five, without leaving VS Code

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">THE SOURCE CONTROL VIEW</div>

<div class="text-sm opacity-80 mb-2">The third icon in the sidebar. Everything above has a button.</div>

<div class="text-sm space-y-1.5">

- **Changes list** — `git status`
- **Click a file** — `git diff`, side by side, syntax-highlighted
- **Branch name, bottom-left** — click to switch or create
- **Discard changes** — `git restore`, with a confirmation
- **Sparkle** — writes the commit message from the diff

</div>

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-5">

<div class="text-xs tracking-widest text-emerald-700 mb-2">WHY THE GRAPHICAL DIFF MATTERS</div>

<div class="text-sm space-y-2">

An agent may touch six files. In the terminal that is a wall of text you scroll past.

In the Source Control view it is **six items you click through**, one at a time, red and green,
side by side.

This is the single strongest practical argument for reviewing agent output in an IDE rather than a
terminal.

</div>

</div>

</div>

---
layout: default
---

# The rule worth being fussy about

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="rounded-lg border border-emerald-200 bg-emerald-50/30 p-5">

<div class="text-xs tracking-widest text-emerald-600 mb-3">✅ FINE TO DELEGATE</div>

<div class="font-mono text-sm space-y-1">

<div>git status</div>
<div>git diff</div>
<div>git log</div>

</div>

<div class="text-sm mt-4">
Read-only. Let it run these all day — it is faster than you at reading them.
</div>

</div>

<div class="rounded-lg border border-rose-200 bg-rose-50/30 p-5">

<div class="text-xs tracking-widest text-rose-600 mb-3">❌ YOU TYPE THESE YOURSELF</div>

<div class="font-mono text-sm space-y-1">

<div>git restore</div>
<div>git reset --hard</div>
<div>git clean -fd</div>
<div>force-push</div>

</div>

<div class="text-sm mt-4">
<strong>It cannot undo what it does not know you wanted.</strong>
</div>

</div>

</div>

<div class="mt-6 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
Small commits are not tidiness — they are <strong>resolution</strong>. They decide how precisely you can undo. A
day's work in one commit gives you exactly one place to go back to, and it is this morning.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-emerald-500 mb-2">PROMPTS YOU CAN USE TODAY</div>

# Making the work FAIR, in five minutes

| For | Ask for |
|---|---|
| **F** | `Write a README with a one-paragraph description, the inputs, the outputs, and how to run it` |
| **F** | `Add a CITATION.cff for this repository` — then Zenodo gives it a DOI on release |
| **A** | `Add an open licence file appropriate for research code` — and check with your DCC |
| **I** | `Replace the hard-coded column renames with a data dictionary in data/schema.csv` |
| **R** | `Set up renv and snapshot`, `Replace absolute paths with here::here()` |
| **R** | `Write CONTRIBUTING.md describing how to rerun the analysis from a clean clone` |

<div class="mt-3 text-sm border-l-4 border-emerald-500 pl-4 py-1.5 bg-emerald-50/40">
<strong>The strongest FAIR-per-minute in the session.</strong> Nobody demos this. Everybody needs it.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">DISCLOSURE</div>

# The line, and where it goes

<div class="grid grid-cols-2 gap-6 mt-5">

<div class="space-y-3">

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">IN THE COMMIT</div>

```text
Assisted-by: GitHub Copilot
```

</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">IN THE SCRIPT HEADER</div>

```r
# Portions of this script were drafted with
# GitHub Copilot (VS Code) and reviewed by
# the author. See git log for full history.
```

</div>

<div>
<div class="text-xs tracking-widest opacity-60 mb-1">IN THE README</div>
<div class="text-sm">One sentence under a <em>How this was built</em> heading.</div>
</div>

</div>

<div class="rounded-lg bg-indigo-50 border-l-4 border-indigo-500 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">WHY NOT TO AGONISE OVER THIS</div>

<div class="text-sm space-y-2">

It is not a confession. It is a **method note** — the same category as saying which version of R you
used.

The failure mode is not disclosing too little. It is disclosing nothing, then being asked, and having
to reconstruct it from memory eighteen months later.

</div>

<div class="text-xs mt-3 opacity-70">
Journal and funder policies differ and are changing quickly. Check the one you are submitting to; the repository line costs nothing either way.
</div>

</div>

</div>
