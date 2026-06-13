/******************************************************************************
* Adapted from scripts/prepare-bestair-for-nsrr.sas (NSRR BestAIR), author Na Guo.
* Self-contained extract: the PROC FORMAT value catalog that labels the
* demographic and clinical codes (lines 301-329), applied to a small mock of
* the bestair_nsrr dataset through FORMAT statements as the source datasets do
* (lines 351-365), then surfaced with PROC PRINT and PROC FREQ. The VALUE
* statements are reproduced exactly from the source; only the input data is
* mocked to the relevant column shape.
******************************************************************************/

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
    value diabmeds 0 = "0: No-Nothing"
                   1 = "1: No-Diet Controlled"
                   2 = "2: Yes-Insulin"
                   3 = "3: Yes-Pills"
                   4 = "4: Don't Know";
  run;

  *attach the formats to the analysis variables, as the source datasets do;
  data bestair_nsrr_labeled;
    set bestair_nsrr;
    format race race. ethnicity ethnicity. gender gender.
           rand_manufacturer manufacturer. iasep_00 iasep. shq_diabetesmed_00 diabmeds.;
  run;

  proc print data = bestair_nsrr_labeled;
    var race ethnicity gender rand_manufacturer iasep_00 shq_diabetesmed_00;
  run;

  proc means data = bestair_nsrr_labeled n nmiss;
    var race ethnicity gender rand_manufacturer iasep_00 shq_diabetesmed_00;
  run;
