# Run this BEFORE the agent demo. It makes the disagreement concrete.
#
#   Rscript R/ex07_recode/show_the_difference.R
suppressMessages({ library(dplyr) })

source("R/ex07_recode/summarise.R")
source("R/ex07_recode/plot_arms.R")

# Participant 00000003's sex never made it out of the source system.
d <- tibble::tibble(participant_id = c("00000001", "00000002", "00000003"),
                    sex = c(1, 2, NA))

show <- function(label, out) {
  cat("\n", label, "\n", sep = "")
  print(out$sex)
}

cat("\nraw sex column: 1, 2, NA\n")
show("load_baseline.R   (ifelse sex %in% 1) ->", mutate(d, sex = ifelse(sex %in% 1, "M", "F")))
show("load_followup.R   (ifelse sex %in% 2) ->", mutate(d, sex = ifelse(sex %in% 2, "F", "M")))
show("summarise.R       (case_when)         ->", add_sex_label(d))
show("plot_arms.R       (recode)            ->", label_sex_for_plot(d))

cat("\nThe SAME participant is female in one script, male in another,\n")
cat("and missing in the other two. Four files, three different answers.\n")
cat("Unifying them is a research decision, not a refactor.\n\n")
