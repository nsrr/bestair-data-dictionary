options obs=100;
options nofmterr;

/******************************************************************************
* Mock inputs standing in for the per-visit datasets the original assembles
* from the bestaird network libname. Each visit dataset carries the NSRR id,
* the site id, and a couple of measurements; the visitnumber-stamping,
* visit-stacking, BY-sort and nodupkey de-duplication in script.sas run
* unchanged against them. The duplicate nsrrid rows (one per visit dataset)
* exercise the NODUPKEY de-dup directly.
******************************************************************************/
data bestair_baseline_in;
  input nsrrid nsrrsiteid age bmi;
  datalines;
400003 1 47 24.1
400001 2 54 27.3
400002 1 61 31.0
400005 2 66 33.5
400004 1 92 29.8
;
run;

data bestair_month6_in;
  input nsrrid nsrrsiteid age bmi;
  datalines;
400002 1 62 31.4
400001 2 55 27.0
400003 1 47 24.3
;
run;

data bestair_month12_in;
  input nsrrid nsrrsiteid age bmi;
  datalines;
400001 2 56 26.8
400004 1 93 30.1
;
run;
