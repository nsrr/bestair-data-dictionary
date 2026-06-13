options obs=100;
options nofmterr;

*******************************************************************************;
* Mock input standing in for the network libname (bestairs) the original
* script reads. Columns match the eligibility-screening shape the recoding
* logic in script.sas consumes: race indicator flags, ethnicity, gender,
* manufacturer, and the six Embletta signal-quality codes. 10 rows exercise
* single-race, multi-race, other-only, and negative/sentinel paths.
*******************************************************************************;
data bestair_nsrr_keep;
  input elig_studyid elig_gender_s1 elig_ethnicity_s1
        elig_racewhite_s1 elig_raceblack_s1 elig_raceasian_s1
        elig_raceamerind_s1 elig_racehawaiian_s1 elig_raceother_s1
        rand_manufacturer_00
        embqs_ekg_qcode_s1 embqs_cannula_flow_qcode_s1 embqs_thoracic_qcode_s1
        embqs_abdomen_qcode_s1 embqs_oximetry_qcode_s1 embqs_flow_qcode_s1;
  datalines;
10001 1 2 1 0 0 0 0 0  1  0 0 0 0 0 0
10002 2 1 0 1 0 0 0 0  2  1 1 1 1 1 1
10003 1 2 0 0 1 0 0 0  1  0 1 0 1 0 1
10004 2 2 0 0 0 1 0 0  2  0 0 0 0 0 0
10005 1 1 0 0 0 0 1 0  1  2 2 2 2 2 2
10006 2 2 0 0 0 0 0 1  2  0 0 0 0 0 0
10007 1 2 1 1 0 0 0 0  1  -1 0 -2 0 0 0
10008 2 -8 0 0 0 0 0 0 -8  0 0 0 0 0 0
10009 1 2 1 0 1 1 0 0  1  0 -3 0 0 0 0
10010 2 1 1 1 1 0 0 0  2  0 0 0 0 0 0
;
run;
