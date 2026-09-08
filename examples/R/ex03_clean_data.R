# Part 3 · Example 3 — the bad prompt and the good prompt
#
# HOW TO RUN THIS DEMO
#   Rscript R/ex03_clean_data.R
#   -> "merged rows: 1204" and a warning that we expected 1180.
#
#   Now try the two prompts side by side.
#
#   ❌ What people type:
#        fix my code
#
#   ✅ What works:
#        #file:R/ex03_clean_data.R
#
#        The merge produces 1,204 rows and I expect 1,180 — one per participant.
#        Find the duplicate key and show me the rows, don't fix anything yet.
#
#   Four ingredients: context, the observation, the expectation, the boundary.

suppressMessages({
  library(readr)
  library(dplyr)
})

participants <- read_csv("data/participants.csv", show_col_types = FALSE,
                         col_types = cols(participant_id = col_character())) |>
  filter(!is.na(participant_id))

visits <- read_csv("data/visits.csv", show_col_types = FALSE,
                   col_types = cols(participant_id = col_character()))

baseline <- visits |>
  filter(visit_type == "baseline")

analysis_set <- participants |>
  inner_join(baseline, by = "participant_id")

cat("participants :", nrow(participants), "\n")
cat("merged rows  :", nrow(analysis_set), "\n")

if (nrow(analysis_set) != nrow(participants)) {
  warning("expected one row per participant, got ", nrow(analysis_set))
}

# --- THE BUG, for the facilitator ------------------------------------------
# 24 participants have two baseline rows in visits.csv, so the inner join fans
# them out. 1180 + 24 = 1204.
#
# The interesting part is NOT that Copilot can find it — it can, in seconds.
# It is that the fix is a research decision: keep the earlier reading, keep the
# later one, average them, or go back to the source system and ask. The model
# will happily pick one. Do not let it.
