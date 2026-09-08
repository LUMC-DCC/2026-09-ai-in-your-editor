# One of four places the sex recode happens. See README.md in this folder.
#
# NOTE: recode() leaves anything unmatched — including NA — untouched, so this
# behaves differently again from the other three.
suppressMessages({ library(dplyr) })

label_sex_for_plot <- function(d) {
  d |>
    mutate(sex = recode(as.character(sex), `1` = "M", `2` = "F"))
}
