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
  %let version = 0.6.0.pre;
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

/*
  proc freq data=bestair_baseline_nsrr;
  table race;
  run;
*/

*******************************************************************************;
* create harmonized datasets ;
*******************************************************************************;
data bestair_baseline_harmonized;
	set bestair_baseline_nsrr ;
*demographics
*age;
*use age;
	format nsrr_age 8.2;
 	nsrr_age = age;

*age_gt89;
*use age;
	format nsrr_age_gt89 $100.; 
	if age gt 89 then nsrr_age_gt89='yes';
	else if age le 89 then nsrr_age_gt89='no';

*sex;
*use gender;
	format nsrr_sex $100.;
    if gender = 1 then nsrr_sex='male';
	else if gender = 2 then nsrr_sex='female';
	else nsrr_sex = 'not reported';

*race;
*race created in prepare-bestair sas script;
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
*use ethnicity;
	format nsrr_ethnicity $100.;
    if ethnicity = 1 then nsrr_ethnicity = 'hispanic or latino';
    else if ethnicity = 2 then nsrr_ethnicity = 'not hispanic or latino';
	else if ethnicity = . then nsrr_ethnicity = 'not reported';

*anthropometry
*bmi;
*use bmi;
	format nsrr_bmi 10.9;
 	nsrr_bmi = bmi;

*clinical data/vital signs
*bp_systolic;
*use avgseatedsystolic;
	format nsrr_bp_systolic 8.2;
	nsrr_bp_systolic = avgseatedsystolic;

*bp_diastolic;
*use avgseateddiastolic;
	format nsrr_bp_diastolic 8.2;
 	nsrr_bp_diastolic = avgseateddiastolic;

*lifestyle and behavioral health
*current_smoker;
		*not available;
*ever_smoker;
*use shq_eversmoked;
	format nsrr_ever_smoker $100.;
	if shq_eversmoked = 1 then nsrr_ever_smoker = 'yes';
	else if shq_eversmoked = 0 then nsrr_ever_smoker = 'no';
	else nsrr_ever_smoker = 'not reported';

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
		;
run;

*******************************************************************************;
* checking harmonized datasets ;
*******************************************************************************;

/* Checking for extreme values for continuous variables */

proc means data=bestair_baseline_harmonized;
VAR 	nsrr_age
		nsrr_bmi
		nsrr_bp_systolic
		nsrr_bp_diastolic;
run;

/* Checking categorical variables */

proc freq data=bestair_baseline_harmonized;
table 	nsrr_age_gt89
		nsrr_sex
		nsrr_race
		nsrr_ethnicity
		nsrr_ever_smoker;
run;


*******************************************************************************;
* make all variable names lowercase ;
*******************************************************************************;
  options mprint;
  %macro lowcase(dsn);
       %let dsid=%sysfunc(open(&dsn));
       %let num=%sysfunc(attrn(&dsid,nvars));
       %put &num;
       data &dsn;
             set &dsn(rename=(
          %do i = 1 %to &num;
          %let var&i=%sysfunc(varname(&dsid,&i));    /*function of varname returns the name of a SAS data set variable*/
          &&var&i=%sysfunc(lowcase(&&var&i))         /*rename all variables*/
          %end;));
          %let close=%sysfunc(close(&dsid));
    run;
  %mend lowcase;

  %lowcase(bestair_baseline_nsrr);
  %lowcase(bestair_month6_nsrr);
  %lowcase(bestair_month12_nsrr);
  %lowcase(bestair_baseline_harmonized);




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

  proc sort data=bestair_baseline_harmonized nodupkey;
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
  proc export data = bestair_baseline_harmonized
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-baseline-harmonized-&version..csv"
    dbms = csv
    replace;
  run;
