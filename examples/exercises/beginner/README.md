# 🟢 Beginner — from nothing to a working editor

**40 minutes. You need nothing installed to start.**

## 1 · Get an account and the tools · 15 min

1. Create a **GitHub account** at [github.com](https://github.com) — use an address you keep
2. Apply for [**GitHub Education**](https://education.github.com) if you are eligible, or start the
   Copilot free tier
3. Install [**Visual Studio Code**](https://code.visualstudio.com)
4. In VS Code: Extensions view → install **GitHub Copilot** → sign in

✅ **Ready when:** the Copilot icon in the status bar, bottom right, is not showing an error.

> Stuck? The two usual causes are signing in with the account that *doesn't* have Copilot, and a
> corporate proxy. Ask — do not sit quietly for ten minutes.

## 2 · Your first suggestion · 5 min

Open [`hello.py`](hello.py) (or [`hello.R`](hello.R)) and follow the comment. **Run it.**

## 3 · Make it explain itself · 5 min

Select the code, <kbd>Ctrl</kbd>/<kbd>⌘</kbd>+<kbd>I</kbd>:

```text
Explain each line to someone who has never programmed.
```

## 4 · Break it on purpose · 5 min

Delete a bracket. Run it. Paste the error into chat and ask what it means.

**This is the loop you will use for the rest of your career.**

## 5 · Save it properly · 10 min

Source Control view (third icon in the sidebar) → **Initialize Repository** → stage your file →
click the **✨ sparkle** for a commit message → **Commit**.

✅ **Done when:** `git log` shows one commit, and you could delete the file and get it back.
