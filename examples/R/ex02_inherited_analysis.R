# Part 3 · Example 2 — the script you inherited from someone who left
#
# HOW TO RUN THIS DEMO
#   Select the whole body of `site_summary()` below, then in chat (Ask mode):
#
#     /explain
#
#     What is this doing, and what assumption about the data would make it wrong?
#
#   The second sentence is the one that earns its keep. `/explain` alone
#   narrates the syntax. The assumption question finds the bug.
#
# Run it first so the room sees it "work":
#   Rscript R/ex02_inherited_analysis.R

suppressMessages({
  library(readr)
  library(dplyr)
})

site_summary <- function(participants, visits) {
  # NOTE(2024-11): quick fix before the steering group meeting. -- JV
  d <- participants |>
    filter(!is.na(participant_id)) |>
    inner_join(visits, by = "participant_id")

  d |>
    group_by(site, arm) |>
    summarise(
      n          = n(),
      mean_sbp   = mean(sbp, na.rm = TRUE),
      pct_female = mean(sex == 2) * 100,
      .groups    = "drop"
    )
}

participants <- read_csv("data/participants.csv", show_col_types = FALSE,
                         col_types = cols(participant_id = col_character()))
visits <- read_csv("data/visits.csv", show_col_types = FALSE,
                   col_types = cols(participant_id = col_character()))

print(site_summary(participants, visits))

# --- THE ASSUMPTION, for the facilitator -----------------------------------
# `n` is presented as a participant count in every table this script has ever
# produced. It is a VISIT count: the join is one row per visit, so anyone with
# three follow-ups is counted three times, and `pct_female` is weighted by how
# often people turned up rather than by how many of them there are.
#
# The script runs, has always run, and has been in two grant reports.
# This is the quiet kind of error from Part 6.
