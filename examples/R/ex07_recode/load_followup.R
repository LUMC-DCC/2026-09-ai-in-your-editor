# One of four places the sex recode happens. See README.md in this folder.
#
# NOTE: the mirror image of load_baseline.R. `sex %in% 2` is FALSE for a missing
# sex, so here the same participant silently becomes "M".
suppressMessages({ library(readr); library(dplyr) })

load_followup <- function(path = "data/participants.csv") {
  read_csv(path, show_col_types = FALSE,
           col_types = cols(participant_id = col_character())) |>
    filter(!is.na(participant_id)) |>
    mutate(sex = ifelse(sex %in% 2, "F", "M"))
}
