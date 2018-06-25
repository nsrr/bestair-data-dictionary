*******************************************************************************;
* Program          : finalize-bestair-for-nsrr.sas
* Project          : National Sleep Research Resource (sleepdata.org)
* Author           : Na Guo (NG)
* Date Created     : 20171208
* Purpose          : replace subject and site ids with random number and finalize datasets
* Revision History :
*    Date       Author      Revision
*
*******************************************************************************;

*******************************************************************************;
* set options and libnames;
*******************************************************************************;
  %let version = 0.2.0.rc2;
  libname bestaird "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_datasets";
  options  nofmterr;

*******************************************************************************;
* merge bestair nsrr datasets with new ids;
*******************************************************************************;
  proc sql;
    *baseline dataset;
    create table bestair_baseline_in (drop=elig_studyid) as
    select a.*,b.nsrrid, b.siteid from bestaird.bestairbase_nsrr as a inner join bestair_nsrr_ids_withsite as b
    on a.elig_studyid = b.elig_studyid;

    *month-6 dataset;
    create table bestair_month6_in (drop=elig_studyid) as
    select a.*,b.nsrrid, b.siteid from bestaird.bestairmon6_nsrr as a inner join bestair_nsrr_ids_withsite as b
    on a.elig_studyid = b.elig_studyid;

    *month-12 dataset;
    create table bestair_month12_in (drop=elig_studyid) as
    select a.*,b.nsrrid, b.siteid from bestaird.bestairmon12_nsrr as a inner join bestair_nsrr_ids_withsite as b
    on a.elig_studyid = b.elig_studyid;
  quit;

*******************************************************************************;
* match variable position based with data dictionary variable sequence;
*******************************************************************************;
  data bestair_nsrr_var_position;
    infile "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_datasets\bestair_nsrr_data_dictionary_spout.csv" delimiter = "," firstobs = 2;
    length id $32.;
    input id $;
    informat id $32.;
    format id $32.;
  run;

  proc contents data = bestair_baseline_in out = content (keep = name format) noprint;
  run;

  proc sql noprint;
    select id into:retain separated by " " from bestair_nsrr_var_position;
    select quote(strip(name)) into:mon6 separated by "," from dictionary.columns where libname = "WORK" and memname = "BESTAIR_MONTH6_IN";
    select quote(strip(name)) into:mon12 separated by "," from dictionary.columns where libname = "WORK" and memname = "BESTAIR_MONTH12_IN";
    select id into:retain_mon6 separated by " " from bestair_nsrr_var_position where id in ("visitnumber",&mon6);
    select id into:retain_mon12 separated by " " from bestair_nsrr_var_position where id in ("visitnumber",&mon12);
    select name into:timelistbase separated by " " from content where format = "TIME";
    select name into:timelistmon6 separated by " " from content where format = "TIME" and name in (&mon6);
    select name into:timelistmon12 separated by " " from content where format = "TIME" and name in (&mon12);
  quit;

  data bestair_baseline_nsrr;
    retain &retain;
    set bestair_baseline_in;
    visitnumber = 0;
    format _all_;
    format &timelistbase time8.;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

  data bestair_month6_nsrr;
    retain &retain_mon6;
    set bestair_month6_in;
    visitnumber = 6;
    format _all_;
    format &timelistmon6 time8.;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

  data bestair_month12_nsrr;
    retain &retain_mon12;
    set bestair_month12_in;
    visitnumber = 12;
    format _all_;
    format &timelistmon12 time8.;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

*******************************************************************************;
* sort datasets before output;
*******************************************************************************;
  proc sort data=bestair_baseline_nsrr nodupkey;
    by nsrrid;
  run;

  proc sort data=bestair_month6_nsrr nodupkey;
    by nsrrid;
  run;

  proc sort data=bestair_month12_nsrr nodupkey;
    by nsrrid;
  run;

*******************************************************************************;
* export csv datasets into release folder;
*******************************************************************************;
  proc export data = bestair_baseline_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-baseline-dataset-&version..csv"
    dbms = csv
    replace;
  run;
  proc export data = bestair_month6_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-month6-dataset-&version..csv"
    dbms = csv
    replace;
  run;
  proc export data = bestair_month12_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-month12-dataset-&version..csv"
    dbms = csv
    replace;
  run;



