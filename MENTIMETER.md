# Mentimeter — 8 September 2026

Copy each block straight into Mentimeter (or Slido / Wooclap / Microsoft Forms — nothing here
depends on Menti specifically). **One presentation, three groups of slides**, so you never switch
tabs mid-session.

Put the join code on the deck before you present: `sections/00-open.md` and
`sections/08-discussion.md` both have a `CODE · 0000 0000` placeholder.

---

## Group A — opener (minute 1, ~3 min)

Runs while people are still sitting down. Keep it to three.

### A1 · Which editor do you actually work in?
**Type:** Multiple choice · single answer · show results live

- Visual Studio Code
- RStudio
- Jupyter / JupyterLab
- vim, emacs, or similar
- Something else
- I don't write code

> **Why:** decides how much of §4 you spend on RStudio. If a third of the room is in RStudio, slow
> down on the "you are not required to switch editors" slide and mean it.

### A2 · Have you used an AI assistant *inside* your editor?
**Type:** Multiple choice · single answer

- Daily
- Sometimes
- Tried it once
- Never
- I didn't know that was a thing

> **Why:** if "daily" is over half, cut §2 to five minutes and spend the time on §5 (FAIR) and the
> discussion. If "never" dominates, §2 is the session.

### A3 · In one word: what worries you most about using AI to write code?
**Type:** Word cloud · 1 entry per person

> **Why:** this is the agenda for the second half. Screenshot it — it is the only record kept.
> Read it aloud, do **not** respond to it yet. Say plainly: "we come back to this at 30 minutes."

---

## Group B — mid-session pulse (minute ~25 of the discussion half, ~5 min)

Run this once most people have got something working.

### B1 · Did you get it running?
**Type:** Multiple choice · single answer

- Yes, working
- Nearly — stuck on one thing
- No
- Already had it before today

> **Why:** the operational number. Anything above ~15% "no" means the install path needs fixing
> before the October cafe — log it in `coding-cafes/CALENDAR.md`.

### B2 · Where did it help most? (pick up to two)
**Type:** Multiple choice · multiple answers

- Boilerplate I've written a hundred times
- Syntax for a library I rarely use
- Explaining code I inherited
- Plotting / visualisation
- Writing tests
- Documentation and README
- Debugging an error
- It didn't help

> **Why:** feeds directly into which examples survive into the next version of §3.

### B3 · Did it get anything wrong for you today? What?
**Type:** Open ended · multiple submissions allowed

> **Why — the most valuable question in the session.** Concrete, local, undeniable failures beat
> forty slides of caution. Read three aloud and ask each author what tipped them off. Keep the
> export; these become slides.

### B4 · Would you trust it on analysis code that reaches a paper?
**Type:** Scales · 1 = not at all, 5 = fully · optionally segment by A2

> **Why:** this reliably splits the room, and the split *is* the discussion. Do not resolve it.
> Ask a 2 and a 4 to each say one sentence.

---

## Group C — close (last 3 min, optional)

### C1 · This week I will use it for ______
**Type:** Open ended, short · or word cloud

> **Why:** a stated commitment. Also gives you the attendance-to-adoption signal to report.

### C2 · What should the next cafe cover?
**Type:** Ranking or multiple choice

- Showing code to the assistant properly (`@` and `#` context) — *scheduled for 20 Oct*
- Version control from scratch, no assumed knowledge
- Sensitive data: what leaves your machine
- Agent mode on a real repository
- Cost, quotas and context windows
- Teaching this to students

> **Why:** October is already set, so this is genuinely about November onwards. If "version control
> from scratch" wins, that is a real signal — §5 today assumes more git than it admits.

---

## Running notes

- **Keep one presentation open** in a second window or on the phone. Switching browser tabs
  mid-demo is where these sessions lose momentum.
- **Show results live** for A1, A2, B1, B4. Hide results until closed for the word clouds — the
  first three answers anchor everyone else.
- **Two minutes per question, maximum.** If a poll needs explaining, the poll is wrong.
- **Export everything before you close the browser.** Menti's free tier does not keep results
  forever. Save the PDF into `coding-cafes/sessions/` next to the session notes.

## After the session

Add a line to `coding-cafes/CALENDAR.md` under September: attendance, the A1 editor split, the B1
success rate, and the best answer to B3. That record is what makes the October cafe better than
this one.
