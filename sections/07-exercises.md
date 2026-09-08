---
layout: section
class: text-center
---

<div class="text-xs tracking-[0.3em] opacity-50 mb-4">PART 7</div>

# Your turn

<div class="text-lg opacity-70 mt-4 font-light">
Pick your lane. Nobody checks your work — but everybody reports back.
</div>

---
layout: default
---

<div class="text-xs tracking-widest text-fuchsia-500 mb-2">45 MINUTES · MOVE BETWEEN LANES FREELY</div>

# Three lanes

<div class="grid grid-cols-3 gap-5 mt-8">

<div class="rounded-xl bg-gradient-to-br from-emerald-500 to-emerald-700 text-white p-6 shadow-lg">
<div class="text-3xl mb-2">🟢</div>
<div class="font-bold text-lg mb-2">Beginner</div>
<div class="text-sm opacity-90 mb-3">"I don't have this installed."</div>
<div class="text-xs opacity-80">You leave with a working setup and one accepted suggestion you understand.</div>
<div class="text-xs opacity-60 mt-3 italic">Nothing to know in advance.</div>
</div>

<div class="rounded-xl bg-gradient-to-br from-blue-500 to-blue-700 text-white p-6 shadow-lg">
<div class="text-3xl mb-2">🔵</div>
<div class="font-bold text-lg mb-2">Intermediate</div>
<div class="text-sm opacity-90 mb-3">"Show me why I'd bother."</div>
<div class="text-xs opacity-80">You leave with a figure you would put in a paper, and the script that made it.</div>
<div class="text-xs opacity-60 mt-3 italic">You can already run R or Python.</div>
</div>

<div class="rounded-xl bg-gradient-to-br from-amber-500 to-amber-700 text-white p-6 shadow-lg">
<div class="text-3xl mb-2">🟠</div>
<div class="font-bold text-lg mb-2">Expert</div>
<div class="text-sm opacity-90 mb-3">"I brought my own problem."</div>
<div class="text-xs opacity-80">You leave having done real work, plus a verdict worth telling the room.</div>
<div class="text-xs opacity-60 mt-3 italic">Bring a repo. Not one with patient data.</div>
</div>

</div>

<div class="mt-8 text-center text-base">
<strong>Ask out loud</strong> — the questions are the session.
</div>

<!--
Do not teach these slides. Read the three headings, say "pick one", and start walking the room.
Expect the beginner lane to take 25 of the 45 minutes for people starting from zero — that is fine
and expected, it is the promise of the café.
-->

---
layout: default
---

<div class="text-xs tracking-widest text-emerald-600 mb-2">🟢 BEGINNER</div>

# From nothing to a working editor

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="space-y-3">

<div>
<div class="text-sm font-semibold">1 · Get an account and the tools <span class="text-xs opacity-60 font-normal">· 15 min</span></div>
<div class="text-sm opacity-80 mt-1">

Create a **GitHub account** at github.com · apply for **GitHub Education** or start the Copilot free
tier · install **Visual Studio Code** · Extensions view → **GitHub Copilot** → sign in

</div>
<div class="text-xs mt-1 text-emerald-700">✅ Ready when: the Copilot icon in the status bar is not showing an error.</div>
</div>

<div>
<div class="text-sm font-semibold">2 · Your first suggestion <span class="text-xs opacity-60 font-normal">· 5 min</span></div>
<div class="text-sm opacity-80 mt-1">New file <code>hello.py</code> (or <code>hello.R</code>). Type only this, press Enter, <kbd>Tab</kbd> to accept, then <strong>run it</strong>.</div>

<div class="font-mono text-xs bg-gray-50 p-2 rounded border mt-1"># print the numbers 1 to 10, one per line</div>
</div>

</div>

<div class="space-y-3">

<div>
<div class="text-sm font-semibold">3 · Make it explain itself <span class="text-xs opacity-60 font-normal">· 5 min</span></div>
<div class="text-sm opacity-80 mt-1">Select the code, <kbd>Ctrl</kbd>/<kbd>⌘</kbd>+<kbd>I</kbd>, and ask:</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border mt-1">Explain each line to someone who has never programmed.</div>
</div>

<div>
<div class="text-sm font-semibold">4 · Break it on purpose <span class="text-xs opacity-60 font-normal">· 5 min</span></div>
<div class="text-sm opacity-80 mt-1">Delete a bracket. Run it. Paste the error into chat and ask what it means.
<strong>This is the loop you will use for the rest of your career.</strong></div>
</div>

<div>
<div class="text-sm font-semibold">5 · Save it properly <span class="text-xs opacity-60 font-normal">· 10 min</span></div>
<div class="text-sm opacity-80 mt-1">Source Control view → <strong>Initialize Repository</strong> → stage → sparkle for a message → <strong>Commit</strong>.</div>
<div class="text-xs mt-1 text-emerald-700">✅ Done when: <code>git log</code> shows one commit, and you could delete the file and get it back.</div>
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-blue-600 mb-2">🔵 INTERMEDIATE</div>

# A figure you would actually publish

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="space-y-3">

<div>
<div class="text-sm font-semibold mb-1">The data</div>
<div class="text-sm opacity-80">Use your own, <strong>or</strong> ask for a synthetic set:</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border mt-1">Generate a CSV of 200 fake participants: id, site (3 levels), arm (A/B), age, baseline_sbp, followup_sbp. Realistic ranges, some missing values, one duplicate id. Save to data/example.csv.</div>
</div>

<div>
<div class="text-sm font-semibold mb-1">1 · Explore</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border">#file:data/example.csv — Summarise: rows, columns, types, missing per column, and anything that looks wrong.</div>
</div>

<div>
<div class="text-sm font-semibold mb-1">2 · Clean, with a boundary</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border">Handle the duplicate id. Show me the rows first and tell me the options — don't choose for me.</div>
</div>

</div>

<div class="space-y-3">

<div>
<div class="text-sm font-semibold mb-1">3 · Plot, in three rounds</div>
<div class="text-sm opacity-80">Change in SBP by arm, faceted by site → colourblind-safe palette, legend at the bottom, proper axis labels → save at 300 dpi, 180 mm wide.</div>
</div>

<div>
<div class="text-sm font-semibold mb-1">4 · Collapse it</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border">Rewrite the three rounds as one clean ggplot call with comments.</div>
</div>

<div>
<div class="text-sm font-semibold mb-1">5 · Make it rerunnable</div>
<div class="font-mono text-xs bg-gray-50 p-2 rounded border">Add a README with how to run this from a clean clone. Add renv and snapshot.</div>
</div>

<div class="rounded-lg border-l-4 border-blue-500 bg-blue-50/50 p-3">
<div class="text-xs text-blue-700">✅ <strong>Done when:</strong> the figure is in <code>figures/</code>, the commit message says what you did, and someone else could reproduce it from the repository alone.</div>
</div>

</div>

</div>

---
layout: default
---

<div class="text-xs tracking-widest text-amber-600 mb-2">🟠 EXPERT</div>

# Bring your own problem

<div class="grid grid-cols-2 gap-6 mt-4">

<div>

<div class="text-xs tracking-widest text-rose-600 mb-2">RULES OF ENGAGEMENT</div>

<div class="text-sm space-y-1">

1. **Branch first.** `git switch -c cafe-experiment`
2. Nothing sensitive open in the editor
3. Give yourself **20 minutes**, then stop and judge it
4. Note every place it was wrong

</div>

<div class="text-xs tracking-widest text-indigo-600 mt-4 mb-2">REPORT BACK — FOUR QUESTIONS</div>

<div class="text-sm space-y-1">

- Where did it save you **real** time?
- Where was it **confidently wrong**?
- What would you not let it near?
- **Would you have caught it if you were tired?**

</div>

</div>

<div>

<div class="text-xs tracking-widest text-emerald-600 mb-2">PICK ONE THAT IS REAL</div>

<div class="text-sm space-y-2">

- **The inherited script.** `/explain` on the file nobody understands — then ask what assumption
  would make it wrong
- **The reproducibility debt.** `renv`, `here::here()`, split the monolith, write the README
- **The translation.** SPSS/Stata/SAS → R, with a comment wherever the semantics differ
- **The missing tests.** `/tests` on your least-trusted function — then find the assertion that
  certifies a bug
- **Agent mode**, on the refactor you have been avoiding. Plan first, execute second, read the diff

</div>

</div>

</div>
