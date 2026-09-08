# One of four places the sex recode happens. See README.md in this folder.
#
# NOTE: `sex %in% 1` is FALSE for a missing sex (it never propagates NA the way
# `sex == 1` does), so anyone with no recorded sex silently becomes "F" here.
suppressMessages({ library(readr); library(dplyr) })

load_baseline <- function(path = "data/participants.csv") {
  read_csv(path, show_col_types = FALSE,
           col_types = cols(participant_id = col_character())) |>
    filter(!is.na(participant_id)) |>
    mutate(sex = ifelse(sex %in% 1, "M", "F"))
}
