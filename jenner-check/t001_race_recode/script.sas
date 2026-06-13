/******************************************************************************
* Adapted from scripts/prepare-bestair-for-nsrr.sas (NSRR BestAIR), author Na Guo.
* Self-contained extract: the race-derivation and array-based missing-value
* recoding logic from the bestair_nsrr_in DATA step. The original reads from a
* network libname (bestairs); the same recoding here runs against a small mock
* input that matches the eligibility-screening column shape. The recoding logic,
* array handling, and label statements are unchanged from the source.
******************************************************************************/

  *recode demographic variables and missing values;
  data bestair_nsrr_in;
    set bestair_nsrr_keep;

    if elig_ethnicity_s1 = 1 and elig_raceother_s1 = 1 then elig_raceother_s1 = 0;
    race_count = 0;
    array elig_race(5) elig_racewhite_s1 elig_raceblack_s1 elig_raceasian_s1 elig_raceamerind_s1 elig_racehawaiian_s1;
    do i = 1 to 5;
      if elig_race(i) in (0,1) then race_count = race_count + elig_race(i);
    end;
    drop i;

    if elig_racewhite_s1 = 1 and race_count = 1 then race = 1; *White;
    if elig_raceamerind_s1 = 1 and race_count = 1 then race = 2; *American indian or Alaskan native;
    if elig_raceblack_s1 = 1 and race_count = 1 then race = 3; *Black or african american;
    if elig_raceasian_s1 = 1 and race_count = 1 then race = 4; *Asian;
    if elig_racehawaiian_s1 = 1 and race_count = 1 then race =5; *native hawaiian or other pacific islander;
    if elig_raceother_s1 = 1 and race_count = 0 then race = 6; *Other;
    if race_count > 1 then race = 7;  *Multiple;
    label race = "Race";

    if rand_manufacturer_00 = -8 then rand_manufacturer_00 = .;
    if elig_ethnicity_s1 < 0 then elig_ethnicity_s1 = .;

    rename elig_gender_s1 = gender
           elig_ethnicity_s1 = ethnicity;

    array embletta{*} embqs_ekg_qcode_s1 embqs_cannula_flow_qcode_s1 embqs_thoracic_qcode_s1
                      embqs_abdomen_qcode_s1 embqs_oximetry_qcode_s1 embqs_flow_qcode_s1;
    do i = 1 to dim(embletta);
      if embletta(i) < 0 then embletta(i) = .;
    end;
    drop i;
  run;

  proc print data = bestair_nsrr_in;
    var elig_studyid gender ethnicity race race_count rand_manufacturer_00;
  run;

  proc freq data = bestair_nsrr_in;
    tables race / missing;
  run;
