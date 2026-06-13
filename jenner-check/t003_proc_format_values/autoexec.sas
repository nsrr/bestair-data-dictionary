options obs=100;
options nofmterr;

/******************************************************************************
* Mock input standing in for bestair_nsrr (which the original builds from the
* bestairs/bestaird network libnames). Columns match the demographic / clinical
* variables that the PROC FORMAT value statements in script.sas describe:
* race, ethnicity, gender, manufacturer, the iasep code, and a diabetes-meds
* code. 14 rows cover every documented format level at least once.
******************************************************************************/
data bestair_nsrr;
  input race ethnicity gender rand_manufacturer iasep_00 shq_diabetesmed_00;
  datalines;
1 1 1 1 0 0
2 2 2 2 1 1
3 1 1 1 2 2
4 2 2 2 0 3
5 1 1 1 1 4
6 2 2 2 2 0
7 1 1 1 0 1
1 2 2 2 1 2
2 1 1 1 2 3
3 2 2 2 0 4
4 1 1 1 1 0
5 2 2 2 2 1
6 1 1 1 0 2
7 2 2 2 1 3
;
run;
