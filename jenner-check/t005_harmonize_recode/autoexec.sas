options obs=100;
options nofmterr;

/******************************************************************************
* Mock input standing in for bestair_baseline_nsrr (which the original builds
* from the bestaird network libname). Columns match the harmonization source
* variables the recoding in script.sas reads: identifiers, age, gender, race,
* ethnicity, bmi, the two seated blood-pressure averages, ever-smoked, and the
* primary AHI. 10 rows cover each demographic level plus the age>89 top-coding
* path and a not-reported (missing) case.
******************************************************************************/
data bestair_baseline_nsrr;
  input nsrrid visitnumber age gender race ethnicity bmi
        avgseatedsystolic avgseateddiastolic shq_eversmoked ahi_primary;
  datalines;
400001 0 54 1 1 1 27.3 128 82 1 12.4
400002 0 61 2 3 2 31.0 142 90 0 28.9
400003 0 47 1 4 1 24.1 118 76 1 5.2
400004 0 92 2 2 2 29.8 150 95 0 41.0
400005 0 66 1 5 1 33.5 135 88 1 18.7
400006 0 39 2 6 2 22.0 110 70 0 3.1
400007 0 71 1 7 1 28.4 138 84 1 22.5
400008 0 58 2 1 . 26.7 125 80 . 9.8
400009 0 90 1 3 1 30.2 145 92 0 35.6
400010 0 49 2 4 2 25.5 122 78 1 7.4
;
run;
