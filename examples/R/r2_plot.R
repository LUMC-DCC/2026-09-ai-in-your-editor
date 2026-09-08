# Part 4 · R Example 2 — visualisation, and the iteration loop
#
# HOW TO RUN THIS DEMO
#   Rscript R/r2_plot.R      # gives you the starting frame
#
#   Then ask for the plot in THREE ROUNDS, looking at the result each time.
#   The loop is the point: prompt -> plot -> look -> prompt. It does not exist
#   in a browser.
#
#     Round 1:  Plot mean_sbp against first_visit, coloured by study arm,
#               with a loess smoother per arm.
#
#     Round 2:  Colourblind-safe palette. Move the legend to the bottom.
#               Axis label "Systolic BP (mmHg)".
#
#     Round 3:  Facet by site. Free y scales. Save as
#               figures/sbp_by_arm.png at 300 dpi, 180 mm wide.
#
#   Then, before committing:
#
#     Rewrite the three rounds as one clean ggplot call with comments.
#
#   Chat history is not a figure caption. Round 3 is what goes in the script.

suppressMessages({
  library(readr)
  library(dplyr)
  library(ggplot2)
})

if (!dir.exists("figures")) dir.create("figures")

participants <- read_csv("data/participants.csv", show_col_types = FALSE,
                         col_types = cols(participant_id = col_character())) |>
  filter(!is.na(participant_id)) |>
  select(participant_id, arm, site)

plot_data <- read_csv("data/visits.csv", show_col_types = FALSE,
                      col_types = cols(participant_id = col_character())) |>
  filter(!is.na(visit_date)) |>
  group_by(participant_id) |>
  summarise(
    first_visit = min(visit_date),
    n_visits    = n(),
    mean_sbp    = mean(sbp, na.rm = TRUE),
    .groups     = "drop"
  ) |>
  inner_join(participants, by = "participant_id")

cat(nrow(plot_data), "participants ready to plot\n")
print(head(plot_data, 3))

# <- your ggplot goes here
