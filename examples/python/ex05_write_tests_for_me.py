"""Part 3 · Example 5 — the function to point /tests at.

HOW TO RUN THIS DEMO
    1. Select `summarise_baseline` below.
    2. Chat, Edit mode:

        /tests

        Cover the edge cases, not the happy path: empty input, one row,
        a participant with two baseline visits, and a date before the
        study start.

    3. Read the assertions BEFORE you run them.

There is a real bug in here, and a generated test will happily certify it.
Finding it is the exercise — see the note at the bottom of the file.
"""

from __future__ import annotations

import pandas as pd

STUDY_START = pd.Timestamp("2024-03-01")


def summarise_baseline(visits: pd.DataFrame) -> pd.DataFrame:
    """One row per participant, with their baseline blood pressure.

    Args:
        visits: rows from data/visits.csv.

    Returns:
        A frame indexed by participant_id with baseline sbp and dbp.
    """
    baseline = visits[visits["visit_type"] == "baseline"].copy()
    baseline["visit_date"] = pd.to_datetime(baseline["visit_date"])
    baseline = baseline[baseline["visit_date"] >= STUDY_START]

    return (
        baseline
        .groupby("participant_id")
        .agg(baseline_sbp=("sbp", "mean"), baseline_dbp=("dbp", "mean"))
        .reset_index()
    )


if __name__ == "__main__":
    visits = pd.read_csv("data/visits.csv", dtype={"participant_id": str})
    out = summarise_baseline(visits)
    print(f"{len(out)} participants summarised")


# --- THE BUG, for the facilitator ------------------------------------------
# 24 participants were entered twice at baseline. `.agg("mean")` silently
# averages their two readings instead of raising, so the output has the right
# SHAPE (one row per participant) and quietly wrong VALUES for 24 of them.
#
# A generated test will assert the current averaging behaviour and pass.
# That is the whole point of the slide: the test encodes what the code does,
# not what it should do. Ask the room which of the two readings is correct —
# they cannot know, and neither can the model. That decision is a human one.
