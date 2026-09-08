---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 3</div>

# Examples

<div class="text-lg opacity-70 mt-4 font-light">
Twelve of them. Demo the ones you can; the slides are the handout for the rest.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 1 · GHOST TEXT · PYTHON</div>

# Comment-first completion

```python
# Load the lab export, parse the visit date column as dates,
# and keep only visits in 2025.
```

<div class="text-sm mt-2 mb-4">
<strong>Press Enter and wait.</strong> Ghost text writes the three lines. You accept with <kbd>Tab</kbd>.
</div>

<div class="grid grid-cols-2 gap-5">

<div class="rounded-lg border border-rose-300 overflow-hidden">
<div class="bg-rose-100 px-3 py-1.5 text-xs font-semibold text-rose-800 tracking-wide">❌ WITHOUT THE COMMENT</div>
<div class="p-3">

```python
df = pd.read_csv("lab.csv")
```

<div class="text-xs mt-2 opacity-70">It guessed the filename and stopped. It had nothing to continue.</div>

</div>
</div>

<div class="rounded-lg border border-emerald-300 overflow-hidden">
<div class="bg-emerald-100 px-3 py-1.5 text-xs font-semibold text-emerald-800 tracking-wide">✅ WITH THE COMMENT</div>
<div class="p-3">

```python
df = pd.read_csv("lab_export.csv",
                 parse_dates=["visit_date"])
df = df[df["visit_date"].dt.year == 2025]
```

</div>
</div>

</div>

<div class="mt-4 text-xs opacity-60">
The comment stays in the file afterwards. You did not write a prompt — you wrote documentation that happened to also be a prompt.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 2 · CHAT, ASK MODE</div>

# Explain code you inherited

<div class="text-sm opacity-70 mb-3">The single most useful thing this tool does for researchers. Select the block, then:</div>

```text
/explain

What is this doing, and what assumption about the data would make it wrong?
```

<div class="grid grid-cols-2 gap-6 mt-4">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WHY THE SECOND SENTENCE MATTERS</div>

<div class="text-sm space-y-2">

`/explain` on its own gives you a narration of the syntax. You can read syntax.

The **assumption** question is the one that finds the bug: the script that assumes one row per
participant, in a table that has one row per visit.

</div>

</div>

<div class="rounded-lg border-l-4 border-amber-500 bg-amber-50/50 p-4">

<div class="text-xs tracking-widest text-amber-700 mb-2">VARIANTS WORTH STEALING</div>

<div class="text-xs font-mono space-y-2 opacity-80">

<div>/explain in terms someone who knows statistics but not R would follow</div>
<div>What would break if the input file had an extra column?</div>
<div>Which line here is the one doing the actual analysis?</div>

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 3 · PROMPTING</div>

# The bad prompt and the good prompt

<div class="grid grid-cols-2 gap-5 mt-5">

<div class="rounded-lg border border-rose-300 overflow-hidden">
<div class="bg-rose-100 px-3 py-1.5 text-xs font-semibold text-rose-800 tracking-wide">❌ WHAT PEOPLE TYPE</div>
<div class="p-4">

<div class="font-mono text-xs bg-white p-2 rounded border mb-1.5">fix my code</div>
<div class="font-mono text-xs bg-white p-2 rounded border mb-1.5">make a plot</div>
<div class="font-mono text-xs bg-white p-2 rounded border mb-3">this doesn't work</div>

<div class="text-sm"><strong>Result:</strong> a plausible answer to a question you did not ask, about data it invented.</div>

</div>
</div>

<div class="rounded-lg border border-emerald-300 overflow-hidden">
<div class="bg-emerald-100 px-3 py-1.5 text-xs font-semibold text-emerald-800 tracking-wide">✅ WHAT WORKS</div>
<div class="p-4">

<div class="font-mono text-xs bg-white p-2 rounded border mb-3">
#file:clean_data.R<br/><br/>
The merge produces 1,204 rows and I expect 1,180 — one per participant. Find the duplicate key and show me the rows, don't fix anything yet.
</div>

<div class="text-sm"><strong>Result:</strong> it looks, it reports, you decide.</div>

</div>
</div>

</div>

<div class="mt-5 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
Four ingredients, every time: <strong>context</strong> (<code>#file</code>) · <strong>the observation</strong> (1,204 vs 1,180) ·
<strong>the expectation</strong> (one per participant) · <strong>the boundary</strong> (don't fix anything yet).
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 4 · INLINE CHAT OR EDIT MODE</div>

# "Change nothing else"

```text
Add a --dry-run flag that prints what would be written and exits
before writing. Change nothing else.
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">WITHOUT THAT LAST SENTENCE</div>

<div class="text-sm space-y-2">

It adds the flag. It also renames three variables it considers unclear, reorders your imports,
adds type hints, and "fixes" a `for` loop into a comprehension.

Your two-line change is now a **ninety-line diff**.

</div>

</div>

<div class="rounded-lg bg-rose-50 border-l-4 border-rose-500 p-5">

<div class="text-xs tracking-widest text-rose-700 mb-2">AND HERE IS THE REAL COST</div>

<div class="text-sm space-y-2">

You will not read ninety lines carefully. You will skim, see nothing alarming, and accept.

**An unreviewable diff is an unreviewed diff.**

</div>

</div>

</div>

<div class="mt-5 text-center text-base border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
<code>Change nothing else</code> is the <strong>highest-value phrase</strong> in this session.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 5 · CHAT, EDIT MODE · /TESTS</div>

# Tests you were never going to write

```text
/tests

Cover the edge cases, not the happy path: empty input, one row,
a participant with two baseline visits, and a date before the study start.
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">HIGHEST-RETURN PROMPT IN RESEARCH CODE</div>

<div class="text-sm space-y-2">

Nobody writes tests for an analysis script. Everyone has been burned by an analysis script.

The assistant does not get bored, and edge cases are exactly the boring part.

</div>

</div>

<div class="rounded-lg bg-amber-50 border-l-4 border-amber-500 p-5">

<div class="text-xs tracking-widest text-amber-700 mb-2">⚠️ THE CATCH, STATED PLAINLY</div>

<div class="text-sm space-y-2">

A generated test encodes **what the code currently does**, not what it *should* do.

If the function is wrong, you now have a passing test that certifies the bug.

**Read the assertions.** They are the specification you are agreeing to.

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 6 · CHAT · #TERMINALLASTCOMMAND</div>

# The error message, without leaving the editor

```text
#terminalLastCommand #file:merge.R

Explain this error in plain language, then tell me the two most
likely causes given the code. Don't change anything.
```

<div class="text-sm mt-5 opacity-80">
The stack trace, the command that produced it, and the file it came from — three pieces of context
you would otherwise have copied by hand into a browser, with a good chance of copying two of the three.
</div>

<div class="mt-6 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
🧠 <strong>"Don't change anything"</strong> turns the assistant into a colleague you are thinking out loud with,
rather than one who reaches over and edits your file mid-sentence. Use it far more than you expect to.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-fuchsia-500 mb-2">EXAMPLE 7 · CHAT, AGENT MODE</div>

# On a real task

```text
The column `sex` is coded 1/2 in the raw files and "M"/"F" everywhere
downstream. Find every place this conversion happens, replace them with
a single function in R/recode.R, and run the tests.
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WHAT IT ACTUALLY DOES</div>

<div class="text-sm space-y-2">

Searches the project · finds four conversions, two of them subtly different · writes the function ·
edits four files · runs `testthat` · reads the failure · fixes its own mistake · re-runs.

That is a genuine hour of work, in about ninety seconds.

</div>

</div>

<div class="rounded-lg bg-rose-50 border-l-4 border-rose-500 p-5">

<div class="text-xs tracking-widest text-rose-700 mb-2">WHAT YOU DO</div>

<div class="text-sm space-y-2">

`git switch -c recode-sex` **before** you start.

Then read the diff. All of it. The interesting part is not the new function — it is the two
conversions that were *subtly different*, and whether it was right to unify them.

**That question is yours. It was always yours.**

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-fuchsia-500 mb-2">EXAMPLE 8 · ASK MODE, THEN AGENT</div>

# Ask it to plan before it acts

```text
Before you change anything: list the files you would touch and what
you would do to each. Number them. I'll tell you which to do.
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WHY</div>

<div class="text-sm space-y-2">

A plan is **cheap to read and cheap to reject**. A diff is neither.

Half the time the plan reveals it has misunderstood the task, and you have spent fifteen seconds
finding that out instead of five minutes reviewing the wrong change.

</div>

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-5">

<div class="text-xs tracking-widest text-emerald-700 mb-2">THE FOLLOW-UP</div>

<div class="font-mono text-xs bg-white p-3 rounded border mb-3">
Do 1 and 3. Skip 2 — that file is generated. Change nothing else.
</div>

<div class="text-sm">
You have just done code review <strong>before</strong> the code existed. This is the single habit that separates
people who enjoy agent mode from people who quietly stop using it.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 9 · INLINE CHAT · /DOC</div>

# Documentation, which you also were not going to write

<div class="grid grid-cols-2 gap-6 mt-4">

<div>

```r
#' Standardise participant identifiers
#'
#' @param df A data frame with a `pid` column.
#' @param prefix Character prefix to strip.
#' @return `df` with `pid` as zero-padded
#'   8-character strings.
#' @examples
#' standardise_pid(visits, prefix = "LUMC-")
standardise_pid <- function(df, prefix) {
```

</div>

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">THE MOVE</div>

<div class="text-sm space-y-3">

Write the function. Get it working. **Then** select it and ask for roxygen — the assistant is
documenting something real rather than guessing at intent.

Same in Python: `/doc` produces a NumPy- or Google-style docstring from a working function.

</div>

<div class="mt-4 text-xs opacity-70 border-l-4 border-amber-400 pl-3 py-1 bg-amber-50/50">
Then check the <code>@return</code> line against what the function actually returns. That is where these are wrong, and it is the line people skip.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 10 · WRITE-ONLY LANGUAGES</div>

# Regex, and things you cannot read at a glance

```text
Explain this, character by character, and give me three test strings
it matches and three it doesn't:

^(?:NL)?(\d{4})[ -]?([A-Z]{2})$
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">WHY THIS EXAMPLE IS HERE</div>

<div class="text-sm space-y-2">

Regex is the purest case of the trade: **fast to generate, impossible to review by eye,
catastrophic when subtly wrong.**

Asking for the strings it matches *and* the strings it doesn't turns an unreviewable artefact into
something you can actually check.

</div>

</div>

<div class="rounded-lg bg-indigo-50 border-l-4 border-indigo-500 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">GENERALISE IT</div>

<div class="text-sm space-y-2">

A `dplyr` chain twelve verbs long, a `data.table` one-liner, a shell pipeline, a SQL window function.

**Ask for the examples, not the explanation.** Examples you can verify. Explanations you can only
believe.

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">EXAMPLE 11 · MIGRATION</div>

# Translate, don't rewrite

<div class="text-sm opacity-70 mb-2">The most common real request in a research group.</div>

```text
#file:analysis.sps

Translate this SPSS syntax to R using tidyverse. Keep the variable
names exactly as they are. Where SPSS and R differ in how they handle
missing values, add a comment saying so instead of choosing for me.
```

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WORKS THE SAME FOR</div>

<div class="text-sm">
Stata → R · SAS → R · MATLAB → Python · Excel formulas → R · base R → tidyverse · <code>%>%</code> → <code>|></code>
</div>

</div>

<div class="rounded-lg bg-amber-50 border-l-4 border-amber-500 p-5">

<div class="text-xs tracking-widest text-amber-700 mb-2">THE SENTENCE THAT SAVES YOU</div>

<div class="text-sm">
<strong>"Where the two differ, add a comment instead of choosing for me."</strong>

<div class="mt-2">
Silent behaviour differences in missing-value handling are exactly how a translated analysis
produces a different number and nobody notices for eight months.
</div>
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-rose-500 mb-2">EXAMPLE 12 · THE ONE PEOPLE GET WRONG</div>

# When to stop

<div class="grid grid-cols-2 gap-6 mt-5">

<div class="rounded-lg border border-rose-200 bg-rose-50/30 p-5">

<div class="text-xs tracking-widest text-rose-600 mb-2">❌ THE DOOM LOOP</div>

<div class="text-sm space-y-2">

It suggests a fix. Doesn't work. You paste the new error. It suggests another. Doesn't work. Third
error, third fix, and you notice the third fix is the first fix again.

**Two failed attempts is the limit.** After that it is guessing, confidently, and you are paying
attention to its guesses instead of the problem.

</div>

</div>

<div class="rounded-lg border border-emerald-200 bg-emerald-50/30 p-5">

<div class="text-xs tracking-widest text-emerald-600 mb-2">✅ WHAT TO DO INSTEAD</div>

<div class="text-sm space-y-2">

`git restore .` — back to your last checkpoint, cleanly.

Then either read the code yourself for five minutes, or start a **new chat** and describe the
problem from scratch.

A long chat is not accumulated understanding. It is accumulated wrong turns, all still in context.

</div>

</div>

</div>

<div class="mt-5 text-center text-base border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
<strong>Fresh chat, fresh problem statement.</strong> It is free, and it works far more often than the fourth fix.
</div>
