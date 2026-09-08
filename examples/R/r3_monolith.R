# Part 4 · R Example 3 — the reproducibility asks
#
# This is the script every group has. It works. It has produced numbers that are
# in a paper. It is also unrunnable on anyone else's machine.
#
# HOW TO RUN THIS DEMO — four prompts, ninety seconds each, in this order:
#
#   1. PATHS
#        Replace every setwd() and absolute path with here::here().
#        Change nothing else.
#
#   2. ENVIRONMENT
#        Set this project up with renv. Snapshot the packages this script
#        actually uses, and add a comment at the top saying how to restore it.
#
#   3. SESSION INFO
#        Add a sessionInfo() call at the end of the script, written to logs/
#        with the date in the filename.
#
#   4. STRUCTURE
#        Split this script into R/load.R, R/clean.R, R/model.R and a run.R
#        that sources them in order. Behaviour must be identical.
#
# Do NOT run this file as-is — the setwd() below points at a machine that does
# not exist, which is exactly the problem. Fix it with prompt 1 first.

setwd("/Users/jvermeer/Desktop/BP study/final FINAL v3")

library(readr)
library(dplyr)
library(ggplot2)

participants <- read_csv("/Users/jvermeer/Desktop/BP study/final FINAL v3/data/participants.csv")
visits <- read_csv("~/Desktop/BP study/final FINAL v3/data/visits.csv")

# ---- clean ----------------------------------------------------------------
participants <- participants[!is.na(participants$participant_id), ]
participants$sex <- ifelse(participants$sex == 1, "M", "F")
participants$age <- 2026 - participants$birth_year

visits$visit_date <- as.Date(visits$visit_date)
visits <- visits[!is.na(visits$visit_date), ]

baseline <- visits[visits$visit_type == "baseline", ]
followup <- visits[visits$visit_type == "followup", ]

# ---- derive ---------------------------------------------------------------
b <- aggregate(sbp ~ participant_id, data = baseline, FUN = mean)
names(b)[2] <- "baseline_sbp"

f <- aggregate(sbp ~ participant_id, data = followup, FUN = mean)
names(f)[2] <- "followup_sbp"

d <- merge(participants, b, by = "participant_id")
d <- merge(d, f, by = "participant_id")
d$change <- d$followup_sbp - d$baseline_sbp

# ---- model ----------------------------------------------------------------
m <- lm(change ~ arm + age + sex + site, data = d)
print(summary(m))

# ---- output ---------------------------------------------------------------
write.csv(d, "/Users/jvermeer/Desktop/BP study/final FINAL v3/output/analysis_set.csv")

p <- ggplot(d, aes(x = arm, y = change, fill = arm)) +
  geom_boxplot() +
  labs(y = "Change in systolic BP (mmHg)")

ggsave("/Users/jvermeer/Desktop/BP study/final FINAL v3/figures/change_by_arm.png", p)

# --- FOR THE FACILITATOR ---------------------------------------------------
# Four things worth naming out loud when the room reads this:
#   * setwd() plus absolute paths means nobody else can run it, including the
#     author on a new laptop
#   * base R merge() defaults to an inner join, so anyone without a follow-up
#     visit is dropped silently and never mentioned in the methods
#   * `2026 - birth_year` is age at analysis time, not age at consent. It will
#     change next January
#   * no sessionInfo(), no lockfile: the package versions that produced the
#     numbers are unrecoverable
#
# Copilot fixes the first and last quickly. It will NOT tell you about the
# second and third unless you ask "what assumption about the data would make
# this wrong?" — Example 2's question, which is why that example comes first.
