# Part 4 · R Example 1 — a pipeline from a sentence
#
# HOW TO RUN THIS DEMO
#   Open this file, then in chat (Edit mode):
#
#     #file:data/visits.csv
#
#     Write a tidyverse pipeline: one row per participant, their first visit
#     date, their number of visits, and mean systolic BP across visits.
#     Use `|>`. Drop participants with no visits rather than giving them NA.
#
#   Attaching the CSV is what makes it use the REAL column names
#   (participant_id, visit_type, visit_date, sbp, dbp) instead of plausible
#   invented ones. Try it once without the attachment to show the difference.
#
#   Then check the three things on the slide:
#     1. It will choose `na.rm = TRUE`. Is a mean over only the visits that
#        happen to have a reading the number you want?
#     2. `.groups = "drop"` — right, but check.
#     3. Did it use the real column names?
#
#   Note: 9 rows in visits.csv have a blank visit_date. That is what makes
#   "drop rather than NA" a real instruction and not a decoration.

suppressMessages({
  library(readr)
  library(dplyr)
})

visits <- read_csv("data/visits.csv", show_col_types = FALSE,
                   col_types = cols(participant_id = col_character()))

# <- your pipeline goes here


# ---------------------------------------------------------------------------
# One reference answer, for after the room has tried it themselves:
#
# summary_df <- visits |>
#   filter(!is.na(visit_date)) |>
#   group_by(participant_id) |>
#   summarise(
#     first_visit = min(visit_date),
#     n_visits    = n(),
#     mean_sbp    = mean(sbp, na.rm = TRUE),
#     .groups     = "drop"
#   )
