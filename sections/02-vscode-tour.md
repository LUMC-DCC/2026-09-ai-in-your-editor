---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 2</div>

# The tour

<div class="text-lg opacity-70 mt-4 font-light">
Four surfaces · one context system · one settings file.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SETUP · 2 MIN</div>

# Getting it running

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-3">THREE THINGS, IN THIS ORDER</div>

<div class="space-y-3">

<div class="flex gap-3 items-start">
<div class="text-xl font-bold text-indigo-400 w-6 leading-none">1</div>
<div class="text-sm"><strong>A GitHub account.</strong> Use the one you will still have next year</div>
</div>

<div class="flex gap-3 items-start">
<div class="text-xl font-bold text-indigo-400 w-6 leading-none">2</div>
<div class="text-sm"><strong>Copilot enabled</strong> on it. Free tier exists; academic verification gives Pro</div>
</div>

<div class="flex gap-3 items-start">
<div class="text-xl font-bold text-indigo-400 w-6 leading-none">3</div>
<div class="text-sm"><strong>VS Code</strong>, then the <strong>GitHub Copilot</strong> extension</div>
</div>

</div>

<div class="text-sm mt-4 opacity-70">
Sign in when prompted. The status bar bottom-right tells you the truth about whether it worked.
</div>

</div>

<div class="rounded-lg border border-rose-200 bg-rose-50/30 p-5">

<div class="text-xs tracking-widest text-rose-600 mb-3">⚠️ THE TWO THINGS THAT GO WRONG</div>

<div class="text-sm space-y-3">

<div>
<strong>Signed into the wrong account.</strong> The account with Copilot and the account VS Code
remembered are not the same one. Accounts icon, bottom-left → sign out → sign in again.
</div>

<div>
<strong>Proxy or firewall.</strong> On a managed LUMC machine the extension may need the corporate
proxy configured first. Symptom: the icon sits there doing nothing.
</div>

</div>

</div>

</div>

<div class="mt-5 text-xs opacity-60 border-l-4 border-amber-400 pl-4 py-1">
Menus and icons move between releases. If what is on screen does not match this slide, <strong>the slide is out of date</strong> — trust the editor.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SURFACE 1 OF 4</div>

# Ghost text

<div class="text-sm opacity-70 mb-3">Grey text that appears as you type. You accept it with <kbd>Tab</kbd>.</div>

```python
# read the participant file and drop rows with no ID
df = pd.read_csv("participants.csv")
df = df[df["participant_id"].notna()]        # ← this line was ghost text
```

<div class="grid grid-cols-2 gap-6 mt-4">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">DRIVING IT</div>

| Key | Does |
|---|---|
| <kbd>Tab</kbd> | accept the whole suggestion |
| <kbd>Esc</kbd> | dismiss it |
| <kbd>Alt</kbd>/<kbd>⌥</kbd> + <kbd>]</kbd> | next alternative |
| <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>→</kbd> | accept **one word** only |

</div>

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-4">

<div class="text-xs tracking-widest text-emerald-700 mb-2">💡 THE TRICK NOBODY TELLS YOU</div>

<div class="text-sm space-y-2">

**Write the comment first.** Ghost text is a completion engine: it continues what is there. A
one-line comment stating the intent is the cheapest prompt in the whole product.

Accepting one word at a time is how you stay in charge on lines you half-agree with.

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SURFACE 2 OF 4</div>

# Inline chat

<div class="text-sm opacity-70 mb-4">
Select code → <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>I</kbd> → ask in place. The answer arrives as a
<strong>diff over your selection</strong>, which you accept or discard.
</div>

<div class="grid grid-cols-2 gap-6 mt-2">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">WHAT IT IS FOR</div>

<div class="text-sm space-y-1.5">

- "make this handle missing values"
- "vectorise this loop"
- "why does this fail on the last group?"
- "add type hints"
- "rename `x` to `dose_mg` throughout this function"

</div>

<div class="text-xs mt-4 opacity-70">
Small, local, surgical. You can see the whole change without scrolling.
</div>

</div>

<div class="rounded-lg bg-indigo-50 border-l-4 border-indigo-500 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">WHY BUILD THE HABIT HERE</div>

<div class="text-sm space-y-2">

The change is **scoped to what you selected**. The diff is small enough to read honestly in five
seconds.

Every other surface is this one with a bigger blast radius. Learn to read the diff here, where it
is easy, and the habit survives contact with agent mode.

</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SURFACE 3 OF 4</div>

# The chat view

<div class="text-sm opacity-70 mb-3">
A panel beside your code. It has <strong>modes</strong>, and the mode is the most important setting in the product.
</div>

| Mode | What it does | When |
|---|---|---|
| **Ask** | answers, explains, shows code. **Changes nothing** | you are learning, or deciding |
| **Edit** | proposes changes to the files *you* put in context | you know what you want changed |
| **Agent** | decides which files to touch, runs commands, iterates | a task, not an edit |

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-4 text-sm">
<strong>Start every task in Ask.</strong> It costs you one question and it is the only mode where being wrong is free.
</div>

<div class="rounded-lg border-l-4 border-amber-500 bg-amber-50/50 p-4 text-sm">
<strong>Agent mode runs terminal commands.</strong> It asks first. Read what it is about to run — that prompt is not a formality.
</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-indigo-500 mb-2">SURFACE 4 OF 4</div>

# The little sparkle in Source Control ✨

<div class="grid grid-cols-2 gap-6 mt-5">

<div>

<div class="text-xs tracking-widest text-indigo-500 mb-2">COMMIT MESSAGES, FROM THE DIFF</div>

<div class="text-sm space-y-3">

The sparkle icon next to the commit box reads your staged diff and writes the message.

It is a small feature and it is the one that quietly improves your repository the most, because the
alternative most people ship is `update`.

</div>

</div>

<div class="rounded-lg bg-indigo-50 border-l-4 border-indigo-500 p-5">

<div class="text-xs tracking-widest text-indigo-700 mb-2">USE IT, THEN EDIT IT</div>

<div class="text-sm mb-3">
The generated message describes <strong>what changed</strong>. It cannot know <strong>why</strong>.
</div>

```text
Filter participants missing an ID before merge

Rows with no participant_id were silently
dropped by the join, undercounting arm B.

Assisted-by: GitHub Copilot
```

<div class="text-xs mt-3 opacity-70">
First line generated. Second paragraph is yours. Third line is Part 5.
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-fuchsia-500 mb-2">THE ACTUAL SKILL</div>

# The context system

<div class="text-sm opacity-70 mb-2">
Everything above is a delivery mechanism. <strong>What you attach is what determines the answer.</strong>
</div>

<div class="text-sm">

| You type | It attaches |
|---|---|
| `#file:analysis.R` | that file, whether or not it is open |
| `#selection` | exactly what you highlighted |
| `#codebase` | a search across the project for what is relevant |
| `#terminalLastCommand` | the command you just ran and what it printed |
| `@workspace` · `@terminal` | the project · the shell, as chat participants |
| `/explain` `/fix` `/tests` `/doc` | ready-made prompts for the four commonest asks |

</div>

<div class="mt-3 text-sm border-l-4 border-indigo-500 pl-4 py-1.5 bg-indigo-50/50">
🧠 <strong>Vague prompt + right context beats perfect prompt + no context.</strong> Nearly every disappointing
answer is a context problem wearing a prompting costume.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-emerald-500 mb-2">MAKE IT YOURS</div>

# One file, committed to the repo

<div class="text-sm opacity-70 mb-2">
<code>.github/copilot-instructions.md</code> — read automatically on every request.
</div>

```markdown
# Project conventions

- R code uses tidyverse style; pipe is `|>`, not `%>%`
- Never use `setwd()`. Paths come from the `here` package
- Data files live in `data/raw/` and are read-only. Nothing writes there
- Every analysis script starts with `renv::load()`
- Plots are built with ggplot2 and saved via `ggsave()` at 300 dpi
- Do not invent column names. If a column is not in `data/schema.csv`, ask
```

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="rounded-lg border-l-4 border-emerald-500 bg-emerald-50/40 p-4 text-sm">
<strong>It is version-controlled.</strong> Your conventions arrive with the repository, so a new colleague and the assistant get the same briefing on day one.
</div>

<div class="rounded-lg border-l-4 border-indigo-500 bg-indigo-50/50 p-4 text-sm">
<strong>Six lines is enough to start.</strong> Add a line every time you correct the assistant for the same reason twice. That is the whole maintenance policy.
</div>

</div>
