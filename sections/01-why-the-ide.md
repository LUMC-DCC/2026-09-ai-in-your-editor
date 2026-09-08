---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 1</div>

# Why the IDE

<div class="text-lg opacity-70 mt-4 font-light">
Three places you can meet an AI assistant — and why the middle one changes your day.
</div>

---
layout: default
---

# The three scenarios

<div class="grid grid-cols-3 gap-5 mt-6">

<div class="rounded-lg border border-gray-300 bg-gray-50/50 p-5">

<div class="text-xs tracking-widest text-gray-600 mb-2">🌐 I · FULL CONTROL</div>

### Chat in a browser

<div class="text-sm mt-3 space-y-2 opacity-80">

You describe, it answers, you copy and paste.

Sees nothing but what you typed. You carry every byte across by hand.

</div>

</div>

<div class="rounded-lg border-l-4 border-indigo-500 bg-indigo-50/60 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">🧑‍💻 II · IDE INTEGRATION</div>

### The assistant is in the editor

<div class="text-sm mt-3 space-y-2 opacity-80">

Completions, inline chat, edits across files.

Sees your file, your selection, your project. **Today's session.**

</div>

</div>

<div class="rounded-lg border border-gray-300 bg-gray-50/50 p-5">

<div class="text-xs tracking-widest text-gray-600 mb-2">🤖 III · FULL AGENTIC</div>

### It runs the loop

<div class="text-sm mt-3 space-y-2 opacity-80">

Plans, edits many files, runs the tests, reads the errors, tries again.

Sees — and changes — everything you let it.

</div>

</div>

</div>

<div class="mt-6 text-sm border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
CodeRefinery teaches exactly this axis, independently of any vendor. So does our own June café.
<strong>Scenario II is where most research code actually gets written</strong>, and it is the least taught.
</div>

<div class="mt-3 text-xs opacity-50">
Source: CodeRefinery · <em>Responsible Use of GenAI in Assisted Coding</em> · CC-BY-4.0 · DOI 10.5281/zenodo.19335927
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">THE ARGUMENT</div>

# The copy-paste tax

<div class="grid grid-cols-2 gap-6 mt-5">

<div class="rounded-lg border border-rose-200 bg-rose-50/30 p-5">

<div class="text-xs tracking-widest text-rose-600 mb-3">❌ BROWSER CHAT</div>

<div class="text-sm space-y-1.5">

1. Read the error in the terminal
2. Select it, copy
3. Switch window
4. Paste, add "I'm using R 4.4 and dplyr"
5. Read answer, copy the code
6. Switch back, paste
7. Fix the indentation it guessed wrong
8. Realise it didn't know your column names

</div>

<div class="text-xs mt-4 opacity-70">Every step is a place to lose context.</div>

</div>

<div class="rounded-lg border border-emerald-200 bg-emerald-50/30 p-5">

<div class="text-xs tracking-widest text-emerald-600 mb-3">✅ IN THE EDITOR</div>

<div class="text-sm space-y-1.5">

1. Select the failing lines
2. <kbd>Ctrl</kbd>/<kbd>Cmd</kbd> + <kbd>I</kbd>
3. "why does this fail on the last group?"

</div>

<div class="text-sm mt-4 opacity-80">
It already has the file, the language, the versions in your lockfile, and the error in your terminal.
</div>

<div class="text-xs mt-4 opacity-70">The context is free because it is already there.</div>

</div>

</div>

<div class="mt-6 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
🧠 This is the whole argument for the IDE. Not that the model is better — it is the <em>same</em> model.
The <strong>context</strong> is better, and context is what determines whether the answer fits your project.
</div>

---
layout: default
---

# The trade you are making

<div class="text-sm opacity-70 mt-2">
More context means better answers <strong>and</strong> a wider blast radius. Both go up together.
</div>

<div class="mt-5">

| | Browser chat | IDE completions | IDE chat / edits | Agent mode |
|---|---|---|---|---|
| **Sees** | your paste | the open file | files you name | the project |
| **Changes** | nothing | one line | files you approve | many files |
| **You review** | before pasting | as you type | the diff | the diff |
| **Speed** | slow | instant | fast | fast |
| **Risk if unread** | low | low | medium | **high** |

</div>

<div class="mt-6 text-sm border-l-4 border-amber-400 pl-4 py-2 bg-amber-50/50">
The review burden does not disappear as you move right — it <strong>concentrates</strong>. One diff, read properly,
replaces eight paste decisions made carelessly. That only works if you actually read the diff, which is Part 5.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">FOR THIS ROOM</div>

# Why researchers, specifically

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">✅ GENUINELY GOOD AT</div>

<div class="text-sm space-y-1.5">

- Boilerplate you have written forty times
- The syntax of a library you use twice a year
- Explaining code you inherited from someone who left
- Turning a plot you can describe into a plot that exists
- Writing the tests you were never going to write
- Documenting what you already wrote

</div>

</div>

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">❌ WHAT IT IS NOT</div>

<div class="text-sm space-y-1.5">

- A statistician
- A domain expert on your assay
- A guarantee that the method is right
- A reason to skip the review
- Something that knows your data are 1-indexed, in millimetres, and missing 2019

</div>

</div>

</div>

<div class="mt-6 text-sm border-l-4 border-indigo-500 pl-4 py-2 bg-indigo-50/50">
<strong>The honest framing:</strong> it removes the friction of <em>writing</em> code, and none of the responsibility
for <em>the code being right</em> — and only one of those was ever the bottleneck.
</div>

<div class="mt-3 text-xs opacity-50">
Source: Southampton RSG · <em>Coding with AI</em> · CC-BY-4.0
</div>
