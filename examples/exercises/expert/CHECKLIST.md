# 🟠 Expert — bring your own problem

## Rules of engagement

1. **Branch first.** `git switch -c cafe-experiment`
2. Nothing sensitive open in the editor. If in doubt, it is sensitive
3. Give yourself **20 minutes**, then stop and judge it
4. Note every place it was wrong — that note is what you report back

## Pick one that is real

- [ ] **The inherited script.** `/explain` on the file nobody understands — then ask
      *"what assumption about the data would make this wrong?"*
- [ ] **The reproducibility debt.** `renv`, `here::here()`, split the monolith, write the README
- [ ] **The translation.** SPSS/Stata/SAS → R, with a comment wherever the semantics differ
- [ ] **The missing tests.** `/tests` on your least-trusted function — then find the assertion that
      certifies a bug
- [ ] **Agent mode**, on the refactor you have been avoiding. Plan first, execute second, read the
      diff line by line

> No repository with you? Use this one. `R/r3_monolith.R` is a genuine four-prompt job, and
> `R/ex07_recode/` is a real agent-mode refactor with a real judgement call buried in it.

## Report back — the four questions

| | |
|---|---|
| Where did it save you **real** time? | |
| Where was it **confidently wrong**? | |
| What would you not let it near? | |
| **Would you have caught the error if you were tired?** | |

The last one is the honest question. The answers to it are the most valuable thing this room
produces today — bring one to the Mentimeter (question B3).
