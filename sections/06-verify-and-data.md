---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 6</div>

# The hard questions

<div class="text-lg opacity-70 mt-4 font-light">
Verification · sensitive data · what actually leaves your machine.
</div>

---
layout: default
---

# "It runs" is not "it is right" ✅

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">ERRORS COME IN TWO KINDS</div>

<div class="text-sm space-y-3">

<div><strong>Loud.</strong> It calls a function that does not exist, the script stops, you fix it in ten
seconds. These are fine.</div>

<div><strong>Quiet.</strong> It uses `mean()` where you needed `median()`, drops rows with a filter that
looks reasonable, or handles missing values in a way that changes your effect size by 4%.</div>

<div class="font-semibold">Only the second kind reaches a paper.</div>

</div>

</div>

<div class="rounded-lg bg-amber-50 border-l-4 border-amber-500 p-5">

<div class="text-xs tracking-widest text-amber-700 mb-2">THE FOUR CHECKS, EVERY TIME</div>

<div class="text-sm space-y-1.5">

1. **Row counts.** Before and after every join and filter
2. **A known answer.** Run it on data where you already know the result
3. **The extremes.** Empty input, one row, all-missing column
4. **Read the code.** Not the output — the code

</div>

<div class="text-xs mt-3 opacity-70">
You did all four before this tool existed. It only removes the time you used to spend typing, which is the part that never caught the bug anyway.
</div>

</div>

</div>

<div class="mt-4 text-xs opacity-50">
Source: Southampton RSG · <em>Coding with AI</em> · ethics, reliability and security · CC-BY-4.0
</div>

---
layout: default
---

# What actually leaves your machine 🔒

<div class="text-sm opacity-70 mb-3">
In the IDE the assistant sends <strong>more</strong> than you typed. That is the point of it, and it is the thing to be clear-eyed about.
</div>

| Surface | Typically sent |
|---|---|
| Ghost text | the code around your cursor, plus nearby open files |
| Inline chat | your selection and its surroundings |
| Chat with `#file` | the whole file you named |
| `#codebase` / agent | whatever it decides is relevant across the project |

<div class="grid grid-cols-2 gap-5 mt-4">

<div class="rounded-lg border-l-4 border-rose-500 bg-rose-50/40 p-4 text-sm">
<strong>If a data file is open in a tab, treat it as sent.</strong> The safest habit is simply not to open identifiable data in an editor with an assistant enabled.
</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-4 text-sm">
<strong>Work on a schema, not on rows.</strong> Ten fake rows with the real column names give the assistant everything it needs and give you nothing to worry about.
</div>

</div>

<div class="mt-3 text-xs opacity-60">
Institutional plans differ from personal ones on retention and training. Unsure which you are on? That is a DCC question — bring it to the discussion.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">CONTROLS</div>

# What you can actually turn off

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">IN THE EDITOR</div>

<div class="text-sm space-y-1.5">

- **Disable for a workspace.** Copilot status icon → disable for this workspace. Use it on any
  repository containing real data
- **`.copilotignore` / exclusions.** Configurable at repository or organisation level
- **Toggle completions per language.** Ghost text off for `.csv`, `.env`, `.Rdata`
- **Close the tab.** Blunt, free, effective

</div>

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-5">

<div class="text-xs tracking-widest text-emerald-700 mb-2">THE HABIT THAT REPLACES ALL OF THEM</div>

<div class="text-sm font-semibold mb-2">Synthetic data by default.</div>

<div class="font-mono text-xs bg-white p-3 rounded border mb-3">
Generate 20 rows of fake data matching data/schema.csv. Realistic ranges, no real values. Save to data/example.csv.
</div>

<div class="text-sm">
Develop against that. Run against the real thing. Nothing sensitive is ever in the editor, and the
example file makes the repository more reusable — which is **R** in FAIR, arriving free.
</div>

</div>

</div>

<div class="mt-3 text-xs opacity-50">
Source: CodeRefinery · <em>Responsible Use of GenAI in Assisted Coding</em> · security · CC-BY-4.0
</div>
