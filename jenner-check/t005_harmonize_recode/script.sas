/******************************************************************************
* Adapted from scripts/finalize-bestair-for-nsrr.sas (NSRR BestAIR), author Na Guo.
* Self-contained extract: the harmonized-term derivation that produces the
* NSRR core variables (nsrr_age, nsrr_sex, nsrr_race, nsrr_ethnicity, bmi,
* blood pressure, ever-smoker, primary AHI) introduced in the 0.6.0 release
* (lines 161-251). The original builds bestair_baseline_nsrr from the bestaird
* network libname; here the same DATA step runs against the mock supplied by
* the autoexec. All recoding logic, FORMAT statements, and the KEEP list are
* unchanged from the source.
******************************************************************************/

  data bestair_baseline_harmonized;
    set bestair_baseline_nsrr ;

    *age;
    format nsrr_age 8.2;
    if age gt 89 then nsrr_age = 90;
    else if age le 89 then nsrr_age = age;

    *age_gt89;
    format nsrr_age_gt89 $100.;
    if age gt 89 then nsrr_age_gt89='yes';
    else if age le 89 then nsrr_age_gt89='no';

    *sex;
    format nsrr_sex $100.;
    if gender = 1 then nsrr_sex='male';
    else if gender = 2 then nsrr_sex='female';
    else nsrr_sex = 'not reported';

    *race;
    format nsrr_race $100.;
    if race = '1' then nsrr_race = 'white';
    else if race = '2' then nsrr_race = 'american indian or alaska native';
    else if race = '3' then nsrr_race = 'black or african american';
    else if race = '4' then nsrr_race = 'asian';
    else if race = '5' then nsrr_race = 'native hawaiian or other pacific islander';
    else if race = '6' then nsrr_race = 'other';
    else if race = '7' then nsrr_race = 'multiple';
    else nsrr_race  = 'not reported';

    *ethnicity;
    format nsrr_ethnicity $100.;
    if ethnicity = 1 then nsrr_ethnicity = 'hispanic or latino';
    else if ethnicity = 2 then nsrr_ethnicity = 'not hispanic or latino';
    else if ethnicity = . then nsrr_ethnicity = 'not reported';

    *bmi;
    format nsrr_bmi 10.9;
    nsrr_bmi = bmi;

    *bp_systolic;
    format nsrr_bp_systolic 8.2;
    nsrr_bp_systolic = avgseatedsystolic;

    *bp_diastolic;
    format nsrr_bp_diastolic 8.2;
    nsrr_bp_diastolic = avgseateddiastolic;

    *ever_smoker;
    format nsrr_ever_smoker $100.;
    if shq_eversmoked = 1 then nsrr_ever_smoker = 'yes';
    else if shq_eversmoked = 0 then nsrr_ever_smoker = 'no';
    else nsrr_ever_smoker = 'not reported';

    *nsrr_ahi_hp4u_aasm15;
    format nsrr_ahi_hp4u_aasm15 8.2;
    nsrr_ahi_hp4u_aasm15 = ahi_primary;

    keep
      nsrrid
      visitnumber
      nsrr_age
      nsrr_age_gt89
      nsrr_sex
      nsrr_race
      nsrr_ethnicity
      nsrr_bp_systolic
      nsrr_bp_diastolic
      nsrr_bmi
      nsrr_ever_smoker
      nsrr_ahi_hp4u_aasm15
    ;
  run;

*******************************************************************************;
* checking harmonized datasets ;
*******************************************************************************;

  /* Checking for extreme values for continuous variables */
  proc means data=bestair_baseline_harmonized;
    var
      nsrr_age
      nsrr_bmi
      nsrr_bp_systolic
      nsrr_bp_diastolic
      nsrr_ahi_hp4u_aasm15;
  run;

  /* Checking categorical variables */
  proc freq data=bestair_baseline_harmonized;
    table
      nsrr_age_gt89
      nsrr_sex
      nsrr_race
      nsrr_ethnicity
      nsrr_ever_smoker;
  run;
