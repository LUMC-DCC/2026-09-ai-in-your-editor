# One of four places the sex recode happens. See README.md in this folder.
suppressMessages({ library(dplyr) })

add_sex_label <- function(d) {
  d |>
    mutate(sex = case_when(
      sex == 1 ~ "M",
      sex == 2 ~ "F",
      TRUE     ~ NA_character_
    ))
}
