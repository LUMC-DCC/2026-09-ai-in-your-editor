* Part 3 · Example 11 — translate, don't rewrite.
*
* HOW TO RUN THIS DEMO
*   In chat:
*
*     #file:spss/analysis.sps
*
*     Translate this SPSS syntax to R using tidyverse. Keep the variable
*     names exactly as they are. Where SPSS and R differ in how they handle
*     missing values, add a comment saying so instead of choosing for me.
*
*   That last sentence is the one that saves you. Silent behaviour differences
*   in missing-value handling are exactly how a translated analysis produces a
*   different number and nobody notices for eight months.
*
* Works the same for Stata, SAS, MATLAB and Excel formulas.

GET DATA /TYPE=TXT
  /FILE="data/participants.csv"
  /DELIMITERS=","
  /FIRSTCASE=2
  /VARIABLES=participant_id A8 sex F1.0 arm A1 site A3 birth_year F4.0 consent_date A10.

COMPUTE age = 2026 - birth_year.
VARIABLE LABELS age 'Age at analysis'.

RECODE sex (1='M') (2='F') INTO sex_label.
VARIABLE LABELS sex_label 'Sex'.

* NOTE: SPSS treats system-missing differently from R's NA in MEANS.
* This is the line to ask about during translation.
MEANS TABLES=age BY arm BY site
  /CELLS=MEAN COUNT STDDEV.

SELECT IF (age >= 18).

FREQUENCIES VARIABLES=sex_label arm site
  /ORDER=ANALYSIS.

T-TEST GROUPS=arm('A' 'B')
  /VARIABLES=age
  /CRITERIA=CI(.95).
