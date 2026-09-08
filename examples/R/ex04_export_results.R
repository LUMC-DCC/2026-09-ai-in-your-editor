# Part 3 · Example 4 — "change nothing else"
#
# HOW TO RUN THIS DEMO
#   Rscript R/ex04_export_results.R      # writes output/site_summary.csv
#
#   Then, in inline chat or Edit mode:
#
#     Add a --dry-run flag that prints what would be written and exits
#     before writing. Change nothing else.
#
#   Run it once WITHOUT the last sentence first. Copilot will also rename
#   `d` to something clearer, reorder the library calls, add roxygen, and
#   convert the `for` loop. Show the room the diff. Then undo, add the
#   sentence, and show that diff. Two lines versus ninety.
#
#   An unreviewable diff is an unreviewed diff.

suppressMessages({
  library(readr)
  library(dplyr)
})

args <- commandArgs(trailingOnly = TRUE)

out_dir <- "output"
if (!dir.exists(out_dir)) dir.create(out_dir)

participants <- read_csv("data/participants.csv", show_col_types = FALSE,
                         col_types = cols(participant_id = col_character())) |>
  filter(!is.na(participant_id))

visits <- read_csv("data/visits.csv", show_col_types = FALSE,
                   col_types = cols(participant_id = col_character()))

d <- participants |>
  inner_join(filter(visits, visit_type == "baseline"), by = "participant_id")

summary_tbl <- d |>
  group_by(site, arm) |>
  summarise(n = n(), mean_sbp = mean(sbp, na.rm = TRUE), .groups = "drop")

targets <- c(file.path(out_dir, "site_summary.csv"),
             file.path(out_dir, "site_summary_backup.csv"))

for (target in targets) {
  write_csv(summary_tbl, target)
  cat("wrote", target, "\n")
}
