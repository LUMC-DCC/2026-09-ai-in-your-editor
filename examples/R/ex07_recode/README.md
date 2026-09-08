# Part 3 · Example 7 — agent mode, on a real task

Four scripts, four places the same 1/2 → M/F conversion happens. **Two of them are
subtly different from the other two.**

## The demo

```bash
git switch -c recode-sex     # BEFORE you start. This is the whole safety net.
```

Then, in chat, **Agent mode**:

```text
The column `sex` is coded 1/2 in the raw files and "M"/"F" everywhere
downstream. Find every place this conversion happens, replace them with
a single function in R/recode.R, and run the tests.
```

It will search the project, find all four, write the function, edit four files
and re-run. Roughly ninety seconds for an hour of work.

## What you actually do

Read the diff. All of it. The new function is not the interesting part.

**The interesting part is that `load_followup.R` and `plot_arms.R` treat missing
values differently from the other two** — one turns `NA` into `"M"`, the other
keeps it as `NA`. Unifying them changes numbers in a published table.

Whether it is *right* to unify them is a research question. The model will pick
one silently. That question is yours. It was always yours.

Run `Rscript R/ex07_recode/show_the_difference.R` to see the disagreement before
you start — it is more convincing than describing it.
