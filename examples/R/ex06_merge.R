# Part 3 · Example 6 — the error message, without leaving the editor
#
# HOW TO RUN THIS DEMO
#   1. In the VS Code terminal:  Rscript R/ex06_merge.R
#      It fails. Leave the error on screen.
#   2. In chat:
#
#        #terminalLastCommand #file:R/ex06_merge.R
#
#        Explain this error in plain language, then tell me the two most
#        likely causes given the code. Don't change anything.
#
#   The stack trace, the command that produced it and the file all reach the
#   model without you copying anything. "Don't change anything" keeps it a
#   conversation rather than an edit.

suppressMessages({
  library(readr)
  library(dplyr)
})

participants <- read_csv("data/participants.csv", show_col_types = FALSE,
                         col_types = cols(participant_id = col_character()))

# The lab export is read with the default guesser, which turns the zero-padded
# IDs into numbers. This is the actual bug, and it is extremely common.
lab <- read_csv("data/lab_export.csv", show_col_types = FALSE,
                col_types = cols(participant_id = col_double()))

joined <- participants |>
  inner_join(lab, by = "participant_id")

cat("joined rows:", nrow(joined), "\n")
