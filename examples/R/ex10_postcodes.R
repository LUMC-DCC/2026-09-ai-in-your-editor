# Part 3 · Example 10 — regex, and other write-only languages
#
# HOW TO RUN THIS DEMO
#   Rscript R/ex10_postcodes.R
#
#   Then, in chat:
#
#     Explain this, character by character, and give me three test strings
#     it matches and three it doesn't:
#
#     ^(?:NL)?(\d{4})[ -]?([A-Z]{2})$
#
#   Ask for the EXAMPLES, not the explanation. Examples you can verify.
#   Explanations you can only believe.

pattern <- "^(?:NL)?(\\d{4})[ -]?([A-Z]{2})$"

candidates <- c(
  "2333ZA",      # the common form
  "2333 ZA",     # with a space
  "2333-ZA",     # with a hyphen
  "NL2333ZA",    # with the country prefix
  "2333za",      # lower case — does it match? should it?
  "233ZA",       # too few digits
  "2333ZAA",     # too many letters
  " 2333ZA"      # leading space
)

for (x in candidates) {
  cat(sprintf("%-10s %s\n", x, ifelse(grepl(pattern, x), "MATCH", "no")))
}

# --- THE POINT, for the facilitator ----------------------------------------
# "2333za" does not match, and almost nobody predicts that from reading the
# pattern. Whether it SHOULD match is a data-cleaning decision.
#
# Generalise: a dplyr chain twelve verbs long, a data.table one-liner, a shell
# pipeline, a SQL window function. Anything you cannot check by eye, ask for
# worked examples instead of prose.
