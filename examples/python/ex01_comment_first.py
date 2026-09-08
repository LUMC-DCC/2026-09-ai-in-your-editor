# Part 3 · Example 1 — comment-first completion
#
# HOW TO RUN THIS DEMO
#   1. Put your cursor on the blank line under the comment below.
#   2. Press Enter and wait for the grey ghost text.
#   3. Tab to accept. Then run:  python3 python/ex01_comment_first.py
#
# The point: the comment IS the prompt. Delete it, retype `df = ` on its own,
# and watch the suggestion get noticeably worse. That contrast is the slide.

import pandas as pd

# Load the lab export, parse the visit date column as dates,
# and keep only visits in 2025.






# ---------------------------------------------------------------------------
# Once you have something, check it. The export has 600 rows spanning 2024-2025;
# roughly half should survive the filter. If your answer keeps all 600, the date
# parsing silently failed and the comparison compared strings.
