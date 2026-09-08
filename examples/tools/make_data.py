"""Regenerate every CSV in ../data.

The numbers in the slides are load-bearing — 1,180 participants, 1,204 baseline
rows, 24 duplicates — so the data is generated deterministically rather than
hand-written. Run from anywhere:

    python3 tools/make_data.py

Nothing here is real. Every value is synthetic.
"""

import csv
import random
from datetime import date, timedelta
from pathlib import Path

SEED = 20260908
N_PARTICIPANTS = 1180
N_DUPLICATE_BASELINES = 24      # 1180 + 24 -> 1204 baseline rows, the Example 3 bug
N_BLANK_IDS = 6                 # rows with no participant_id, for the Part 2 demo
N_BLANK_VISIT_DATES = 9         # visits whose date never left the source system
SITES = ["LDN", "AMS", "UTR"]
ARMS = ["A", "B"]
STUDY_START = date(2024, 3, 1)

DATA = Path(__file__).resolve().parent.parent / "data"


def write(name, header, rows):
    path = DATA / name
    with path.open("w", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(header)
        w.writerows(rows)
    print(f"{name:24s} {len(rows):>5d} rows")


def main():
    rng = random.Random(SEED)
    DATA.mkdir(exist_ok=True)

    # ---- participants -----------------------------------------------------
    pids = [f"{i:08d}" for i in range(1, N_PARTICIPANTS + 1)]
    participants = []
    for pid in pids:
        participants.append([
            pid,
            rng.choice([1, 2]),                     # sex, coded 1/2 (Example 7)
            rng.choice(ARMS),
            rng.choice(SITES),
            rng.randint(1945, 2001),
            (STUDY_START + timedelta(days=rng.randint(0, 400))).isoformat(),
        ])
    # a handful of rows that lost their ID somewhere upstream
    for _ in range(N_BLANK_IDS):
        participants.append([
            "",
            rng.choice([1, 2]),
            rng.choice(ARMS),
            rng.choice(SITES),
            rng.randint(1945, 2001),
            (STUDY_START + timedelta(days=rng.randint(0, 400))).isoformat(),
        ])
    rng.shuffle(participants)
    write("participants.csv",
          ["participant_id", "sex", "arm", "site", "birth_year", "consent_date"],
          participants)

    # ---- visits -----------------------------------------------------------
    visits = []

    def visit_row(pid, visit_type, day_offset, blank_date=False):
        sbp = round(rng.gauss(132, 16))
        dbp = round(rng.gauss(80, 10))
        return [
            pid,
            visit_type,
            "" if blank_date else (STUDY_START + timedelta(days=day_offset)).isoformat(),
            max(80, min(210, sbp)),
            max(45, min(130, dbp)),
        ]

    # every participant has exactly one baseline: 1,180 rows
    for pid in pids:
        visits.append(visit_row(pid, "baseline", rng.randint(0, 300)))
        for _ in range(rng.choice([0, 0, 1, 1, 2, 3])):
            visits.append(visit_row(pid, "followup", rng.randint(300, 900)))

    # 24 participants were entered twice at baseline. This is the whole point
    # of Example 3: the join silently produces 1,204 rows instead of 1,180.
    for pid in rng.sample(pids, N_DUPLICATE_BASELINES):
        visits.append(visit_row(pid, "baseline", rng.randint(0, 300)))

    # a few visits whose date never made it out of the source system
    for pid in rng.sample(pids, N_BLANK_VISIT_DATES):
        visits.append(visit_row(pid, "followup", 0, blank_date=True))

    rng.shuffle(visits)
    write("visits.csv",
          ["participant_id", "visit_type", "visit_date", "sbp", "dbp"],
          visits)

    # ---- lab export -------------------------------------------------------
    analytes = [("glucose", "mmol/L", 5.4, 1.1), ("crp", "mg/L", 4.0, 3.2),
                ("hdl", "mmol/L", 1.4, 0.35)]
    lab = []
    for i, pid in enumerate(rng.sample(pids, 600), start=1):
        name, unit, mu, sd = rng.choice(analytes)
        # deliberately spans 2024 and 2025 so "keep only 2025" does something
        d = date(2024, 1, 1) + timedelta(days=rng.randint(0, 730))
        lab.append([f"S{i:06d}", pid, d.isoformat(), name,
                    round(max(0.1, rng.gauss(mu, sd)), 2), unit])
    write("lab_export.csv",
          ["sample_id", "participant_id", "visit_date", "analyte", "value", "unit"],
          lab)

    # ---- exercise starter set (intermediate lane) -------------------------
    ex = []
    for i in range(1, 201):
        age = rng.randint(28, 84)
        base = round(rng.gauss(134, 15))
        follow = "" if rng.random() < 0.06 else round(base - rng.gauss(4, 9))
        ex.append([f"P{i:03d}", rng.choice(SITES), rng.choice(ARMS),
                   "" if rng.random() < 0.03 else age, base, follow])
    ex.append(list(ex[41]))          # exactly one duplicated id -> 201 rows
    rng.shuffle(ex)
    write("example.csv",
          ["id", "site", "arm", "age", "baseline_sbp", "followup_sbp"], ex)


if __name__ == "__main__":
    main()
