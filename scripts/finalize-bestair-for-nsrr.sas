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
  %let version = 0.2.0.beta7;
  libname bestaird "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_datasets"; 
  options  nofmterr;

*******************************************************************************;
* output subject id and site id log into a csv file;
*******************************************************************************;
  proc sql;
    create table bestair_nsrr_subject (elig_studyid num(8));
    insert into bestair_nsrr_subject select elig_studyid from bestaird.bestairbase_nsrr;
    create table bestair_nsrr_site (rand_siteid num(3));
    insert into bestair_nsrr_site select distinct rand_siteid from bestaird.bestairbase_nsrr;
  quit;

  *assign random number(0~1) for subject id and site id;
  data bestair_nsrr_subject;
    set bestair_nsrr_subject;
    call streaminit(20171208);
    nsrrid = rand('UNIFORM');
  run;

  data bestair_nsrr_site;
    set bestair_nsrr_site;
    call streaminit(20171208);
    nsrrsiteid = rand('UNIFORM');
  run;
  
  *rank random number;
  proc rank data = bestair_nsrr_subject out = bestair_nsrr_subject;
    var nsrrid;
    ranks nsrrid;
  run;
  
  data bestair_nsrr_subject;
    set bestair_nsrr_subject;
    nsrrid = 400000 + nsrrid;
  run;

  proc rank data = bestair_nsrr_site out = bestair_nsrr_site;
    var nsrrsiteid;
    ranks nsrrsiteid;
  run;
 
  *export subject and site id reassignment log into a csv file;
  proc export data = bestair_nsrr_subject outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_ids\bestair-nsrr-id-log.xlsx"
    dbms = xlsx replace; 
    sheet = "Subject ID";
  run;
  proc export data = bestair_nsrr_site outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_ids\bestair-nsrr-id-log.xlsx"
    dbms = xlsx replace; 
    sheet = "Site ID";
  run;

*******************************************************************************;
* merge bestair nsrr datasets with new ids;
*******************************************************************************;
  proc sql;
    *baseline dataset;
    create table bestair_baseline_prep(drop=elig_studyid) as  
    select a.*,b.nsrrid from bestaird.bestairbase_nsrr as a inner join bestair_nsrr_subject as b 
    on a.elig_studyid = b.elig_studyid;
    create table bestair_baseline_in(drop=rand_siteid) as 
    select a.*,b.nsrrsiteid from bestair_baseline_prep as a inner join bestair_nsrr_site as b
    on a.rand_siteid = b.rand_siteid;
    *month-6 dataset;
    create table bestair_month6_prep(drop=elig_studyid) as  
    select a.*,b.nsrrid from bestaird.bestairmon6_nsrr as a inner join bestair_nsrr_subject as b 
    on a.elig_studyid = b.elig_studyid;
    create table bestair_month6_in(drop=rand_siteid) as 
    select a.*,b.nsrrsiteid from bestair_month6_prep as a inner join bestair_nsrr_site as b
    on a.rand_siteid = b.rand_siteid;
    *month-12 dataset;
    create table bestair_month12_prep(drop=elig_studyid) as  
    select a.*,b.nsrrid from bestaird.bestairmon12_nsrr as a inner join bestair_nsrr_subject as b 
    on a.elig_studyid = b.elig_studyid;
    create table bestair_month12_in(drop=rand_siteid) as 
    select a.*,b.nsrrsiteid from bestair_month12_prep as a inner join bestair_nsrr_site as b
    on a.rand_siteid = b.rand_siteid;
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
* export csv datasets into release folder;
*******************************************************************************;
  proc export data = bestair_baseline_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-baseline-&version..csv"
    dbms = csv
    replace;
  run;
  proc export data = bestair_month6_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-month6-&version..csv"
    dbms = csv
    replace;
  run;
  proc export data = bestair_month12_nsrr
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_releases\&version.\bestair-month12-&version..csv"
    dbms = csv
    replace;
  run;



