# Project conventions

These are read automatically by GitHub Copilot on every request in this repository.
This file is the Part 2 example — six lines is genuinely enough to start.

- R code uses tidyverse style; the pipe is `|>`, never `%>%`
- Never use `setwd()`. Paths are relative to the repository root
- Data files live in `data/` and are **read-only**. Nothing writes there
- Plots are built with ggplot2 and saved via `ggsave()` at 300 dpi
- Always `TRUE`/`FALSE`, never `T`/`F`
- Do not invent column names. If a column is not in `data/schema.csv`, ask
- Python code targets 3.10+ and uses pandas; no notebook-only syntax in `.py` files
