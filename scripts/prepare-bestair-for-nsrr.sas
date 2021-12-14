*******************************************************************************;
* Program          : prepare-bestair-for-nsrr.sas
* Project          : National Sleep Research Resource (sleepdata.org)
* Author           : Na Guo (NG)
* Date Created     : 20171201
* Purpose          : Prepare BestAIR data for deposition on sleepdata.org
* Revision History :
*    Date       Author      Revision
*
*******************************************************************************;

*******************************************************************************;
* set options and libnames;
*******************************************************************************;
  libname bestairs "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_source";
  libname bestaird "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_datasets";
  options nofmterr;

*******************************************************************************;
* copy source datasets;
*******************************************************************************;
  data bestair_nsrr_screening;
    set bestairs.bestair_allscreeningdata;

    *remove extraneous subjects with nonsensical ids;
    if elig_studyid < 100000;
  run;

  data bestair_nsrr_prep;
    set bestairs.Bestair_alldata_randomizedpts;
  run;

*******************************************************************************;
* create nsrrid for all screened subjects;
*******************************************************************************;
  data bestair_nsrr_ids_in;
    merge bestair_nsrr_screening
      bestair_nsrr_prep (keep=elig_studyid);
    by elig_studyid;

    call streaminit(20180612);
    nsrrid = rand('UNIFORM');

    keep elig_studyid nsrrid randomized;
  run;

  proc rank data = bestair_nsrr_ids_in out = bestair_nsrr_ids;
    var nsrrid;
    ranks nsrrid;
  run;

  data bestair_nsrr_ids_out;
    set bestair_nsrr_ids;
    nsrrid = 400000 + nsrrid;
  run;

  /*

  proc export data=bestair_nsrr_ids_out
    outfile="\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_ids\bestair_nsrr_ids.csv"
    dbms=csv
    replace;
  run;

  */

  proc import datafile="\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_ids\bestair_nsrr_ids.csv"
    out=bestair_nsrr_ids_withsite
    dbms=csv
    replace;
  run;


*******************************************************************************;
* import source dataset contents spreadsheet;
*******************************************************************************;
  proc import out = bestair_source_contents
    datafile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_source\bestair_nsrr_source_contents.xlsx"
    dbms = xlsx replace;
    sheet = "bestair_nsrr_source_contents";
    getnames = yes;
  run;

*******************************************************************************;
* extract variables to keep;
*******************************************************************************;
  proc sql noprint;
    select name into:varlist separated by " " from bestair_source_contents
    where keep = 1;
    select cats(name," = ","'",tranwrd(label,"'","''"),"'") into:labelvar separated by " "
    from bestair_source_contents
    where keep = 1;
  quit;

  data bestair_nsrr_keep;
    set bestair_nsrr_prep;
    label &labelvar;
    keep &varlist;
  run;

  /*
  *check race-ethnicity variables;
  proc freq data = bestair_nsrr_keep;
    tables elig_raceamerind_s1 -- elig_raceotherspecify_s1;
    tables elig_racewhite_s1*(elig_raceasian_s1 elig_raceblack_s1 elig_raceother_s1)
           elig_raceasian_s1*(elig_raceblack_s1 elig_raceother_s1)
           elig_raceblack_s1*elig_raceother_s1;
  run;

  proc freq data=bestair_nsrr_keep;
  table elig_raceamerind_s1 -- elig_raceotherspecify_s1;
  run;

  proc print data=bestair_nsrr_keep;
  var elig_raceamerind_s1 -- elig_raceotherspecify_s1;
  run;
  */

  *recode demographic variables and missing values;
  data bestair_nsrr_in;
    set bestair_nsrr_keep;

    *if elig_ethnicity_s1 = 1 and elig_raceother_s1 = 1 then elig_raceother_s1 = 0;
    race_count = 0;
    array elig_race(6) elig_racewhite_s1 elig_raceblack_s1 elig_raceasian_s1 elig_raceother_s1 elig_raceamerind_s1 elig_racehawaiian_s1;
    do i = 1 to 6;
      if elig_race(i) in (0,1) then race_count = race_count + elig_race(i);
    end;
    drop i;

    if elig_racewhite_s1 = 1 and race_count = 1 then race = 1; *White;
	if elig_raceamerind_s1 = 1 and race_count = 1 then race = 2; *American indian or Alaskan native;
    if elig_raceblack_s1 = 1 and race_count = 1 then race = 3; *Black or african american;
    if elig_raceasian_s1 = 1 and race_count = 1 then race = 4; *Asian;
	if elig_racehawaiian_s1 = 1 and race_count = 1 then race =5; *natie hawaiian or other pacific islander;
    if elig_raceother_s1 = 1 and race_count = 1 then race = 6; *Other;
	if race_count > 1 then race = 7;  *Multiple;
    label race = "Race";

    if rand_manufacturer_00 = -8 then rand_manufacturer_00 = .;
    if elig_ethnicity_s1 < 0 then elig_ethnicity_s1 = .;

    age_00 = intck("year",elig_incl01dob_s1,anth_date_00);
    age_06 = intck("year",elig_incl01dob_s1,anth_date_06);
    age_12 = intck("year",elig_incl01dob_s1,anth_date_12);

    if age_06 = . and sf36_visitdate_06 ne . then age_06 = intck("year",elig_incl01dob_s1,sf36_visitdate_06);
    if age_12 = . and sf36_visitdate_12 ne . then age_06 = intck("year",elig_incl01dob_s1,sf36_visitdate_12);

    if age_06 = . then age_06 = age_00;
    if age_12 = . and final_visit = 12 then age_12 = age_00 + 1;

    rename elig_gender_s1 = gender
           elig_ethnicity_s1 = ethnicity;

    if PFO_00 = 2 then PFO_00 = 0;
    if PFO_00 = 99 then PFO_00 = .;
    if PFO_12 = 2 then PFO_12 = 0;
    if PFO_12 = 99 then PFO_12 = .;

    array embletta{*} embqs_ekg_qcode_s1 embqs_cannula_flow_qcode_s1 embqs_thoracic_qcode_s1
                      embqs_abdomen_qcode_s1 embqs_oximetry_qcode_s1 embqs_flow_qcode_s1;
    do i = 1 to dim(embletta);
      if embletta(i) < 0 then embletta(i) = .;
    end;

    array shq{*} shq_eversnored_00 -- shq_diabetes_00 shq_emphysema_00 -- shq_eversmoked_00;
    do i = 1 to dim(shq);
      if shq(i) = -2 then shq(i) = 2;
      if shq(i) < 0 then shq(i) = .;
    end;

    if shq_diabetesmed_00 = -2 then shq_diabetesmed_00 = 4;
    if shq_diabetesmed_00 = 3 then shq_diabetesmed_00 = 1;
    if shq_diabetesmed_00 = 1 then shq_diabetesmed_00 = 2;
    if shq_diabetesmed_00 = 2 then shq_diabetesmed_00 = 3;
    if shq_diabetesmed_00 = 4 then shq_diabetesmed_00 = 0;
    if shq_diabetesmed_00 < 0 then shq_diabetesmed_00 = .;

    if phq8_difficulty_00 in (-8,-9) then phq8_difficulty_00 = .;
    if phq8_difficulty_06 in (-8,-9) then phq8_difficulty_06 = .;
    if phq8_difficulty_12 in (-8,-9) then phq8_difficulty_12 = .;

    drop i elig_incl01dob_s1 anth_date_00 anth_date_06 anth_date_12 sf36_visitdate_00 race_count
         sf36_visitdate_06 sf36_visitdate_12 elig_raceamerind_s1 -- elig_raceotherspecify_s1;
  run;

/*

    proc print data=bestair_nsrr_in;
  var elig_raceamerind_s1 -- elig_raceotherspecify_s1 race race_count;
  run;
  proc freq data=bestair_nsrr_in;
  table race;
  run;
*/

  /*take out variables that are missing for everyone*/
  proc sql noprint;
    select name into:varlist separated by " "
    from dictionary.columns where libname = "WORK" and memname = "BESTAIR_NSRR_IN";
  quit;

  %macro nmiss_count;
    %let n = %sysfunc(countw(&varlist));
    proc sql;
      create table nmisstbl (varname char(30), nmiss num(8));
    quit;
    ods exclude all;
    ods noresults;
    %do i = 1 %to &n;
      ods output summary = nmiss;
      proc means data = bestair_nsrr_in nmiss;
        var %scan(&varlist,&i);
      run;
      data nmiss;
        retain varname;
        set nmiss;
        varname = "%scan(&varlist,&i)";
        rename %scan(&varlist,&i)_Nmiss = nmiss;
        keep varname %scan(&varlist,&i)_Nmiss;
      run;
      proc sql;
        insert into nmisstbl select * from nmiss;
      quit;
    %end;
    ods exclude none;
    ods results on;
    proc sql;
      select * from nmisstbl
      order by nmiss;
    quit;
  %mend;
  %nmiss_count;

  proc sql noprint;
    select varname into:droplist separated by " "
    from nmisstbl
    where nmiss = 169 or varname like '%99' or varname like '%^_s2' escape '^'; *remove variables with suffix "_s2" or "_99";
  quit;

  data bestair_nsrr;
    set bestair_nsrr_in;
    label age_00 = "Age at visit"
          age_06 = "Age at visit"
          age_12 = "Age at visit";
    rename rand_manufacturer_00 = rand_manufacturer
           rand_treatmentarm_00 = rand_treatmentarm;
    drop &droplist;
  run;

*******************************************************************************;
* split dataset into baseline, 6-month, and 12-month dataset;
*******************************************************************************;
  * make all variable names lowercase ;
  options mprint;
  %macro lowcase(dsn);
    %let dsid=%sysfunc(open(&dsn));
    %let num=%sysfunc(attrn(&dsid,nvars));
    data &dsn;
      set &dsn(rename=(%do i = 1 %to &num;
                       %let var&i=%sysfunc(varname(&dsid,&i));    /*function of varname returns the name of a SAS data set variable*/
                       &&var&i=%sysfunc(lowcase(&&var&i))%end;)); /*rename all variables*/
    %let close=%sysfunc(close(&dsid));
    run;
  %mend lowcase;
  %lowcase(bestair_nsrr);

  * keep relavent variable formats;
  proc contents data = bestair_nsrr out = content (keep = name format) varnum noprint;
  run;

  proc sql;
    select distinct a.format into:formatlist separated by " " from bestair_source_contents as a right join content as b
    on a.name = b.name where a.format not in ("BEST","F","TIME","","YYMMDD");
  quit;

  proc format library = bestairs cntlout = old_format;
    select &formatlist;
  run;

  data new_format;
    set old_format;
    if fmtname = "AHISOURCEF" then fmtname = "ahisource";
    if fmtname = "CONTROLORPAPF" then fmtname = "pooledtreatmentarm";
    if fmtname = "EMBQS_ABDOMEN_QCODE_" then fmtname = "embqs_abdomen_qcode";
    if fmtname = "EMBQS_CANNULA_FLOW_QCODE_" then fmtname = "embqs_cannula_flow_qcode";
    if fmtname = "EMBQS_EKG_QCODE_" then fmtname = "embqs_ekg_qcode";
    if fmtname = "EMBQS_FLOW_QCODE_" then fmtname = "embqs_flow_qcode";
    if fmtname = "EMBQS_OVERALL_QUALITY_" then fmtname = "embqs_overall_quality";
    if fmtname = "EMBQS_OXIMETRY_QCODE_" then fmtname = "embqs_oximetry_qcode";
    if fmtname = "EMBQS_THORACIC_QCODE_" then fmtname = "embqs_thoracic_qcode";
    if fmtname = "RAND_TREATMENTARM_" then fmtname = "treatmentarm";
    if start < 0 then delete;
  run;

  proc format library = work cntlin = new_format;
  run;

  *create new formats and modify existing formats;
  proc format library = work;
    value manufacturer 1 = "1: Respironics"
                       2 = "2: ResMed";
    value race 1 = "1: White"
			   2 = "2: American Indian or Alaskan Native"
			   3 = "3: Black or African American"
			   4 = "4: Asian"
			   5 = "5: Native Hawaiian or other Pacific islander"
			   6 = "6: Other"
			   7 = "7: Multiple";
    value ethnicity 1 = "1: Hispanic or Latino"
                    2 = "2: Not Hispanic or Latino";
    value gender 1 = "1: Male"
                 2 = "2: Female";
    value iasep  0 = "0: Normal"
                  1 = "1: Hypermobile"
                  2 = "2: Aneurysmal";
    value yesno  0 = "0: No"
                 1 = "1: Yes";
    value yesnodontknow 0 = "0: No"
                        1 = "1: Yes"
                        2 = "2: Don't Know";
    value diabmeds 0 = "0: No-Nothing"
                   1 = "1: No-Diet Controlled"
                   2 = "2: Yes-Insulin"
                   3 = "3: Yes-Pills"
                   4 = "4: Don't Know";
  run;

  proc catalog catalog = work.formats;
    copy out = bestaird.formats;
  run;

  options fmtsearch = (bestaird.formats);

* strip suffix from variables;
  proc sql noprint;
    select name into:baseline_var separated by " " from content where name like '%^_00' escape '^';
    select cats(name,"=",tranwrd(name,"_00","")) into:rename_baseline_var separated by " " from content where name like '%^_00' escape '^';
    select name into:month6_var separated by " " from content where name like '%^_06' escape '^';
    select cats(name,"=",tranwrd(name,"_06","")) into:rename_month6_var separated by " " from content where name like '%^_06' escape '^';
    select name into:month12_var separated by " " from content where name like '%^_12' escape '^';
    select cats(name,"=",tranwrd(name,"_12","")) into:rename_month12_var separated by " " from content where name like '%^_12' escape '^';
    select name into:s1_var separated by " " from content where name like '%^_s1' escape '^';
    select cats(name, "=", tranwrd(name,"_s1","")) into:s1var_rename separated by " " from content where name like '%^_s1' escape '^';
  quit;

* subset dataset;
* baseline;
  data bestaird.bestairbase_nsrr;
    set bestair_nsrr;
    rename &s1var_rename &rename_baseline_var;
    format pooled_treatmentarm pooledtreatmentarm. rand_treatmentarm treatmentarm. rand_manufacturer manufacturer.
           embqs_ekg_qcode_s1 embqs_ekg_qcode. embqs_cannula_flow_qcode_s1 embqs_cannula_flow_qcode.
           embqs_thoracic_qcode_s1 embqs_thoracic_qcode. embqs_abdomen_qcode_s1 embqs_abdomen_qcode.
           embqs_oximetry_qcode_s1 embqs_oximetry_qcode. embqs_flow_qcode_s1 embqs_flow_qcode.
           embqs_overall_quality_s1 embqs_overall_quality.
           race race. ethnicity ethnicity. gender gender. iasep_00 iasep.
           pfo_00 heartnondipping_00 mapnondipping_00 sysnondipping_00 dianondipping_00
           shq_eversmoked_00 shq_highbpmed_00 shq_highcholesmed_00 yesno. shq_diabetesmed_00 diabmeds.
           shq_eversnored_00 shq_anxietydisorder_00 -- shq_diabetes_00 shq_emphysema_00 -- shq_highbp_00 shq_highcholes_00
           shq_ibm_00 -- shq_famchiapnea_00 yesnodontknow.;
    drop &month6_var &month12_var;
  run;

* month6;
  data bestaird.bestairmon6_nsrr;
    set bestair_nsrr;
    rename &rename_month6_var;
    format pooled_treatmentarm pooledtreatmentarm. rand_treatmentarm treatmentarm. rand_manufacturer manufacturer.
           race race_. ethnicity elig_ethnicity_. gender elig_gender_.
           heartnondipping_06 mapnondipping_06 sysnondipping_06 dianondipping_06 Yesno_.;
    drop &baseline_var &month12_var &s1_var;
  run;

* month12;
  data bestaird.bestairmon12_nsrr;
    set bestair_nsrr;
    where final_visit = 12;
    rename &rename_month12_var;
    format pooled_treatmentarm pooledtreatmentarm. rand_treatmentarm treatmentarm. rand_manufacturer manufacturer.
           race race_. ethnicity elig_ethnicity_. gender elig_gender_. iasep_12 Iasep_.
           pfo_12 heartnondipping_12 mapnondipping_12 sysnondipping_12 dianondipping_12  Yesno_.;
    drop &baseline_var &month6_var &s1_var;
  run;

*******************************************************************************;
* export format into a csv file;
*******************************************************************************;
  proc format library = bestaird cntlout = bestair_nsrr_format;
  run;

  data bestair_nsrr_format;
    set bestair_nsrr_format;
    fmtname = lowcase(fmtname);
    keep fmtname start label;
  run;

  proc export data = bestair_nsrr_format
    outfile = "\\rfawin\BWH-SLEEPEPI-BESTAIR\nsrr-prep\_datasets\bestair_nsrr_format.csv"
    dbms = csv
    replace;
  run;
