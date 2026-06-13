/******************************************************************************
* Adapted from scripts/finalize-bestair-for-nsrr.sas (NSRR BestAIR), author Na Guo.
* Self-contained extract: the per-visit stamping, labeling, BY-sort and
* NODUPKEY de-duplication that finalize the release datasets (lines 64-107 and
* 305-319). The original reads the per-visit tables from the bestaird network
* libname; here the same steps run against the mock visit datasets supplied by
* the autoexec. The visitnumber assignment, LABEL statements, PROC SORT BY
* keys, and the NODUPKEY de-dup are unchanged from the source.
******************************************************************************/

  data bestair_baseline_nsrr;
    set bestair_baseline_in;
    visitnumber = 0;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

  data bestair_month6_nsrr;
    set bestair_month6_in;
    visitnumber = 6;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

  data bestair_month12_nsrr;
    set bestair_month12_in;
    visitnumber = 12;
    label nsrrid = "Participant ID"
          nsrrsiteid = "Site ID"
          visitnumber = "Visit Number";
  run;

  *stack the visits and order them by participant and visit;
  data bestair_all_visits;
    set bestair_baseline_nsrr
        bestair_month6_nsrr
        bestair_month12_nsrr;
  run;

  proc sort data=bestair_all_visits;
    by nsrrid visitnumber;
  run;

  proc print data=bestair_all_visits;
    var nsrrid visitnumber nsrrsiteid age bmi;
    title "All visits, sorted by participant and visit";
  run;

  *one row per participant, as the release export uses (NODUPKEY by nsrrid);
  proc sort data=bestair_baseline_nsrr nodupkey;
    by nsrrid;
  run;

  proc print data=bestair_baseline_nsrr;
    var nsrrid visitnumber nsrrsiteid age bmi;
    title "Baseline release rows (one per participant)";
  run;
