# 🔵 INTERMEDIATE — a figure you would actually publish
#
# The data is already generated for you: ../../data/example.csv
#   201 rows · 200 participants · one duplicated id · some missing ages and
#   follow-up readings. Columns: id, site, arm, age, baseline_sbp, followup_sbp
#
# If you would rather generate your own, ask for it:
#
#   Generate a CSV of 200 fake participants: id, site (3 levels), arm (A/B),
#   age, baseline_sbp, followup_sbp. Realistic ranges, some missing values,
#   one duplicate id. Save to data/example.csv.
#
# ---------------------------------------------------------------------------
# 1 · EXPLORE
#     #file:data/example.csv
#     Summarise: rows, columns, types, missing per column, and anything that
#     looks wrong.
#
# 2 · CLEAN, WITH A BOUNDARY
#     Handle the duplicate id. Show me the rows first and tell me the options —
#     don't choose for me.
#
# 3 · PLOT, IN THREE ROUNDS  (look at the result between each one)
#     a. Change in SBP by arm, faceted by site
#     b. Colourblind-safe palette, legend at the bottom, proper axis labels
#     c. Save at 300 dpi, 180 mm wide
#
# 4 · COLLAPSE IT
#     Rewrite the three rounds as one clean ggplot call with comments.
#
# 5 · MAKE IT RERUNNABLE
#     Add a README with how to run this from a clean clone. Add renv and snapshot.
#
# ✅ Done when: the figure is in figures/, the commit message says what you did,
#    and someone else could reproduce it from the repository alone.
#
# STRETCH: ask for /tests on your cleaning function, then find one assertion
#          that is wrong.

suppressMessages({
  library(readr)
  library(dplyr)
  library(ggplot2)
})

d <- read_csv("data/example.csv", show_col_types = FALSE)

cat(nrow(d), "rows,", n_distinct(d$id), "distinct ids\n")

# <- your work starts here
