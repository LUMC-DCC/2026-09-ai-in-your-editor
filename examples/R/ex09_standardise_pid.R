# Part 3 · Example 9 — documentation you were never going to write
#
# HOW TO RUN THIS DEMO
#   1. Run it so the room sees it works:
#        Rscript R/ex09_standardise_pid.R
#   2. Select the function. Inline chat:  /doc
#   3. Accept the roxygen block.
#   4. NOW CHECK THE @return LINE against what the function actually returns.
#      That is where generated docs are wrong, and it is the line people skip.
#
# The move: write the function, get it working, THEN document it. The assistant
# is describing something real instead of guessing at your intent.

suppressMessages({ library(dplyr) })

standardise_pid <- function(df, prefix = "LUMC-") {
  df |>
    mutate(
      pid = toupper(trimws(pid)),
      pid = sub(paste0("^", prefix), "", pid),
      pid = gsub("[^0-9]", "", pid),
      pid = ifelse(pid == "", NA_character_, formatC(pid, width = 8, flag = "0"))
    )
}

messy <- tibble::tibble(pid = c("LUMC-1234", " lumc-000045 ", "LUMC-7", "", "n/a"))
print(standardise_pid(messy))

# --- WHAT TO CHECK, for the facilitator ------------------------------------
# Run it. The output is "    1234", not "00001234".
#
# `formatC(flag = "0")` only zero-pads NUMBERS. Given a character vector it pads
# with spaces, silently. The function does not do what its name says.
#
# This is deliberate, and it is the whole example: ask for /doc and Copilot will
# write a confident `@return ... zero-padded 8-character strings` — describing
# the INTENT it infers from the function name, not the behaviour it can see.
#
# Two questions for the room:
#   * Would you have caught that if the roxygen looked plausible and the script ran?
#   * An ID longer than 8 digits is not truncated either. Should it be?
#
# The fix, once someone spots it, is `formatC(as.numeric(pid), width = 8,
# flag = "0")` — or better, `sprintf("%08s", pid)` after deciding what a
# 9-digit ID means.
