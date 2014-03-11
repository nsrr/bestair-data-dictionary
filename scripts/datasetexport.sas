data bestairbp24hr;
  set bestair.bestairbp24hr;

  elig_studyid = studyid;
  study_visit = timepoint;

  drop studyid timepoint;
run;

data babprp;
  set bestair.babprp;

  study_visit = bprp_studyvisit;

  drop bprp_studyvisit;
run;

data baanthro;
  set bestair.baanthro;

  study_visit = anth_studyvisit;

  drop anth_studyvisit;
run;

data bapromis;
  set bestair.bapromis;

  study_visit = prom_studyvisit;

  drop prom_studyvisit;
run;

data basarp;
  set bestair.basarp;

  study_visit = sarp_studyvisit;

  drop sarp_studyvisit;
run;

data basemsa;
  set bestair.basemsa;

  study_visit = semsa_studyvisit;

  drop semsa_studyvisit;
run;

data batwpas;
  set bestair.batwpas;


  study_visit = twpas_studyvisit;

  drop twpas_studyvisit;
run;

data bestairbloods;
  set bestair.bestairbloods;

  study_visit = bloods_studyvisit;

  drop bloods_studyvisit;
run;

data bestaircalgary;
  set bestair.bestaircalgary;

  study_visit = cal_studyvisit;

  drop cal_studyvisit;
run;

data bestairecho;
  set bestair.bestairecho;

  study_visit = visit;

  drop visit;
run;

data bestairess;
  set bestair.bestairess;

  study_visit = ess_visit;

  drop ess_visit;
run;

data bestairphq8;
  set bestair.bestairphq8;

  study_visit = phq8_studyvisit;

  drop phq8_studyvisit;
run;

data bestairsf36;
  set bestair.bestairsf36;

  study_visit = sf36_studyvisit;

  drop sf36_studyvisit;
run;

data bestairtonometry;
  set bestair.bestairtonometry;

  study_visit = qctonom_studyvisit;

  drop qctonom_studyvisit;
run;

data baredcap;
  set bestair.baredcap;

  study_visit = anth_studyvisit;

  drop anth_studyvisit;
run;

proc sort data=baredcap;
  by elig_studyid study_visit;
run;

proc sort data=bapromis;
  by elig_studyid study_visit;
run;

proc sort data=basarp;
  by elig_studyid study_visit;
run;

proc sort data=batwpas;
  by elig_studyid study_visit;
run;

proc sort data=basemsa;
  by elig_studyid study_visit;
run;

proc sort data=bestairbloods;
  by elig_studyid study_visit;
run;

proc sort data=bestairbp24hr;
  by elig_studyid study_visit;
run;

proc sort data=bestairecho;
  by elig_studyid study_visit;
run;

proc sort data=bestairess;
  by elig_studyid study_visit;
run;

proc sort data=bestairphq8;
  by elig_studyid study_visit;
run;

proc sort data=bestairsf36;
  by elig_studyid study_visit;
run;

proc sort data=bestairtonometry;
  by elig_studyid study_visit;
run;

data ba_master;
  merge bapromis basarp babprp baanthro basemsa batwpas bestairbloods bestairbp24hr bestairecho bestairess bestairphq8 bestairsf36 bestairtonometry baredcap;
  by elig_studyid study_visit;

  attrib _all_ label = "";
  format _all_;
run;

data bestair_master;
  set ba_master;

  if essdo_you_snore < -3 then essdo_you_snore = .;
  if essyour_snoring_is < -3 then essyour_snoring_is = .;
  if esshow_often_do_you_snore < -3 then esshow_often_do_you_snore = .;
  if esshas_your_snoring_ever < -3 then esshas_your_snoring_ever = .;
  if ess_quit_breathing_sleep < -3 then ess_quit_breathing_sleep = .;
  if ess_fatigued_tired < -3 then ess_fatigued_tired = .;
  if ess_waking_time_tired < -3 then ess_waking_time_tired = .;
  if ess_sleeping_driving < -3 then ess_sleeping_driving = .;
  if ess_how_often < -3 then ess_how_often = .;
  if ess_blood_pressure < -3 then ess_blood_pressure = .;
  if esssitting_and_reading < -3 then esssitting_and_reading = .;
  if esswatching_tv < -3 then esswatching_tv = .;
  if esssitting_inactive_public < -3 then esssitting_inactive_public = .;
  if ess_passenger < -3 then ess_passenger = .;
  if esslying_down_to_rest < -3 then esslying_down_to_rest = .;
  if esssitting_and_talking < -3 then esssitting_and_talking = .;
  if esssitting_quietly < -3 then esssitting_quietly = .;
  if essin_a_car_while_stopped < -3 then essin_a_car_while_stopped = .;
  if esswhile_driving < -3 then esswhile_driving = .;
  if ess_eligibility < -3 then ess_eligibility = .;
  if cardiology_berlin_ess_complete < -3 then cardiology_berlin_ess_complete = .;
  if embqs_study_passed < -3 then embqs_study_passed = .;
  if embqs_first_pass_ahi < 0 then embqs_first_pass_ahi = '';
  if embqs_ekg_qcode < -3 then embqs_ekg_qcode = .;
  if embqs_cannula_flow_qcode < -3 then embqs_cannula_flow_qcode = .;
  if embqs_thoracic_qcode < -3 then embqs_thoracic_qcode = .;
  if embqs_abdomen_qcode < -3 then embqs_abdomen_qcode = .;
  if embqs_oximetry_qcode < -3 then embqs_oximetry_qcode = .;
  if embqs_flow_qcode < -3 then embqs_flow_qcode = .;
  if embqs_overall_quality < -3 then embqs_overall_quality = .;
  if embqs_alert < -3 then embqs_alert = .;
  if embqs_reason___1 < -3 then embqs_reason___1 = .;
  if embqs_heart_ecg___1 < -3 then embqs_heart_ecg___1 = .;
  if embqs_heart_ecg___2 < -3 then embqs_heart_ecg___2 = .;
  if embqs_heart_ecg___3 < -3 then embqs_heart_ecg___3 = .;
  if embqs_heart_ecg___4 < -3 then embqs_heart_ecg___4 = .;
  if embqs_heart_ecg___5 < -3 then embqs_heart_ecg___5 = .;
  if embqs_heart_ecg___6 < -3 then embqs_heart_ecg___6 = .;
  if embletta_qs_complete < -3 then embletta_qs_complete = .;
  if elig_source < -3 then elig_source = .;
  if elig_incl01agerange < -3 then elig_incl01agerange = .;
  if elig_incl02infconsent < -3 then elig_incl02infconsent = .;
  if elig_incl03osa < -3 then elig_incl03osa = .;
  if elig_incl03osadiag < -3 then elig_incl03osadiag = .;
  if elig_incl03osa3 < -3 then elig_incl03osa3 = .;
  if elig_incl03osa4 < -3 then elig_incl03osa4 = .;
  if elig_incl04cvd < -3 then elig_incl04cvd = .;
  if elig_incl04ami < -3 then elig_incl04ami = .;
  if elig_incl04bsten < -3 then elig_incl04bsten = .;
  if elig_incl04cstroke < -3 then elig_incl04cstroke = .;
  if elig_incl04ddiabetes < -3 then elig_incl04ddiabetes = .;
  if elig_incl04dhyper < -3 then elig_incl04dhyper = .;
  if elig_incl04malesex < -3 then elig_incl04malesex = .;
  if elig_incl04fbmi < -3 then elig_incl04fbmi = .;
  if elig_incl04gcholes < -3 then elig_incl04gcholes = .;
  if elig_incl04hsmoking < -3 then elig_incl04hsmoking = .;
  if elig_incl04ediabetes < -3 then elig_incl04ediabetes = .;
  if elig_excl01ejec < -3 then elig_excl01ejec = .;
  if elig_excl02miproc < -3 then elig_excl02miproc = .;
  if elig_excl03poorhyper < -3 then elig_excl03poorhyper = .;
  if elig_excl04strokeimp < -3 then elig_excl04strokeimp = .;
  if elig_excl05medprob < -3 then elig_excl05medprob = .;
  if elig_excl06oxsat < -3 then elig_excl06oxsat = .;
  if elig_excl07pap < -3 then elig_excl07pap = .;
  if elig_excl07papstatus < -3 then elig_excl07papstatus = .;
  if elig_excl08sixhrsbed < -3 then elig_excl08sixhrsbed = .;
  if elig_excl09epworth < -3 then elig_excl09epworth = .;
  if elig_berlin < -3 then elig_berlin = .;
  if elig_excl10driver < -3 then elig_excl10driver = .;
  if elig_excl11csa < -3 then elig_excl11csa = .;
  if elig_excl12refusal < -3 then elig_excl12refusal = .;
  if elig_excl14 < -3 then elig_excl14 = .;
  if elig_meetstatus < -3 then elig_meetstatus = .;
  if elig_partstatus < -3 then elig_partstatus = .;
  if elig_notinterested < -3 then elig_notinterested = .;
  if elig_toobusy < -3 then elig_toobusy = .;
  if elig_misswork < -3 then elig_misswork = .;
  if elig_transportation < -3 then elig_transportation = .;
  if elig_distance < -3 then elig_distance = .;
  if elig_extratests < -3 then elig_extratests = .;
  if elig_passive < -3 then elig_passive = .;
  if elig_onlycpap < -3 then elig_onlycpap = .;
  if elig_otherreason < -3 then elig_otherreason = .;
  if elig_physiciandoesnotgrant < -3 then elig_physiciandoesnotgrant = .;
  if elig_gender < -3 then elig_gender = .;
  if elig_raceamerind < -3 then elig_raceamerind = .;
  if elig_raceasian < -3 then elig_raceasian = .;
  if elig_racehawaiian < -3 then elig_racehawaiian = .;
  if elig_raceblack < -3 then elig_raceblack = .;
  if elig_racewhite < -3 then elig_racewhite = .;
  if elig_raceother < -3 then elig_raceother = .;
  if elig_ethnicity < -3 then elig_ethnicity = .;
  if elig_education < -3 then elig_education = .;
  if eligibility_complete < -3 then eligibility_complete = .;
  if sleep_journal_runin_complete < -3 then sleep_journal_runin_complete = .;
  if rand_siteid < -3 then rand_siteid = .;
  if rand_cvdstatus < -3 then rand_cvdstatus = .;
  if rand_diagtype < -3 then rand_diagtype = .;
  if rand_treatmentarm < -3 then rand_treatmentarm = .;
  if rand_manufacturer < -3 then rand_manufacturer = .;
  if randomization_complete < -3 then randomization_complete = .;
  if anthropometry_complete < -3 then anthropometry_complete = .;
  if bprp_bpsite < -3 then bprp_bpsite = .;
  if bprp_cuffsize < -3 then bprp_cuffsize = .;
  if blood_pressure_and_r_v_0 < -3 then blood_pressure_and_r_v_0 = .;
  if blood_results_labcor_v_1 < -3 then blood_results_labcor_v_1 = .;
  if bp_journal_complete < -3 then bp_journal_complete = .;
  if bplog_cuffsize < -3 then bplog_cuffsize = .;
  if bp_log_complete < -3 then bp_log_complete = .;
  if cal_a01 < -3 then cal_a01 = .;
  if cal_a02 < -3 then cal_a02 = .;
  if cal_a03 < -3 then cal_a03 = .;
  if cal_a04 < -3 then cal_a04 = .;
  if cal_a05 < -3 then cal_a05 = .;
  if cal_a06 < -3 then cal_a06 = .;
  if cal_a07 < -3 then cal_a07 = .;
  if cal_a08 < -3 then cal_a08 = .;
  if cal_a09 < -3 then cal_a09 = .;
  if cal_a10 < -3 then cal_a10 = .;
  if cal_a11 < -3 then cal_a11 = .;
  if cal_b01 < -3 then cal_b01 = .;
  if cal_b02 < -3 then cal_b02 = .;
  if cal_b03 < -3 then cal_b03 = .;
  if cal_b04 < -3 then cal_b04 = .;
  if cal_b05 < -3 then cal_b05 = .;
  if cal_b06 < -3 then cal_b06 = .;
  if cal_b07 < -3 then cal_b07 = .;
  if cal_b08 < -3 then cal_b08 = .;
  if cal_b09 < -3 then cal_b09 = .;
  if cal_b10 < -3 then cal_b10 = .;
  if cal_b11 < -3 then cal_b11 = .;
  if cal_b12 < -3 then cal_b12 = .;
  if cal_b13 < -3 then cal_b13 = .;
  if cal_c01 < -3 then cal_c01 = .;
  if cal_c02 < -3 then cal_c02 = .;
  if cal_c03 < -3 then cal_c03 = .;
  if cal_c04 < -3 then cal_c04 = .;
  if cal_c05 < -3 then cal_c05 = .;
  if cal_c06 < -3 then cal_c06 = .;
  if cal_c07 < -3 then cal_c07 = .;
  if cal_c08 < -3 then cal_c08 = .;
  if cal_c09 < -3 then cal_c09 = .;
  if cal_c10 < -3 then cal_c10 = .;
  if cal_c11 < -3 then cal_c11 = .;
  if cal_d01 < -3 then cal_d01 = .;
  if cal_d02 < -3 then cal_d02 = .;
  if cal_d03 < -3 then cal_d03 = .;
  if cal_d04 < -3 then cal_d04 = .;
  if cal_d05 < -3 then cal_d05 = .;
  if cal_d06 < -3 then cal_d06 = .;
  if cal_d07 < -3 then cal_d07 = .;
  if cal_d08 < -3 then cal_d08 = .;
  if cal_d09 < -3 then cal_d09 = .;
  if cal_d10 < -3 then cal_d10 = .;
  if cal_d11 < -3 then cal_d11 = .;
  if cal_d12 < -3 then cal_d12 = .;
  if cal_d13 < -3 then cal_d13 = .;
  if cal_d14 < -3 then cal_d14 = .;
  if cal_d15 < -3 then cal_d15 = .;
  if cal_d16 < -3 then cal_d16 = .;
  if cal_d17 < -3 then cal_d17 = .;
  if cal_d18 < -3 then cal_d18 = .;
  if cal_d19 < -3 then cal_d19 = .;
  if cal_d20 < -3 then cal_d20 = .;
  if cal_d21 < -3 then cal_d21 = .;
  if cal_d22s < -3 then cal_d22s = .;
  if cal_d23s < -3 then cal_d23s = .;
  if cal_ds01p < -3 then cal_ds01p = .;
  if cal_ds02p < -3 then cal_ds02p = .;
  if cal_ds03p < -3 then cal_ds03p = .;
  if cal_ds04p < -3 then cal_ds04p = .;
  if cal_ds05p < -3 then cal_ds05p = .;
  if cal_e01 < -3 then cal_e01 = .;
  if cal_e02 < -3 then cal_e02 = .;
  if cal_e03 < -3 then cal_e03 = .;
  if cal_e04 < -3 then cal_e04 = .;
  if cal_e05 < -3 then cal_e05 = .;
  if cal_e06 < -3 then cal_e06 = .;
  if cal_e07 < -3 then cal_e07 = .;
  if cal_e08 < -3 then cal_e08 = .;
  if cal_e09 < -3 then cal_e09 = .;
  if cal_e10 < -3 then cal_e10 = .;
  if cal_e11 < -3 then cal_e11 = .;
  if cal_e12 < -3 then cal_e12 = .;
  if cal_e13 < -3 then cal_e13 = .;
  if cal_e14 < -3 then cal_e14 = .;
  if cal_e15 < -3 then cal_e15 = .;
  if cal_e16 < -3 then cal_e16 = .;
  if cal_e17 < -3 then cal_e17 = .;
  if cal_e18 < -3 then cal_e18 = .;
  if cal_e19 < -3 then cal_e19 = .;
  if cal_e20 < -3 then cal_e20 = .;
  if cal_e21 < -3 then cal_e21 = .;
  if cal_e22 < -3 then cal_e22 = .;
  if cal_e23 < -3 then cal_e23 = .;
  if cal_e24 < -3 then cal_e24 = .;
  if cal_e25 < -3 then cal_e25 = .;
  if cal_e26 < -3 then cal_e26 = .;
  if cal_e27s < -3 then cal_e27s = .;
  if cal_e28s < -3 then cal_e28s = .;
  if cal_es01p < -3 then cal_es01p = .;
  if cal_es02p < -3 then cal_es02p = .;
  if cal_es03p < -3 then cal_es03p = .;
  if cal_es04p < -3 then cal_es04p = .;
  if cal_es05p < -3 then cal_es05p = .;
  if cal_f01 < -3 then cal_f01 = .;
  if cal_f02 < -3 then cal_f02 = .;
  if calgary_complete < -3 then calgary_complete = .;
  if cpappres_arm < -3 then cpappres_arm = .;
  if cpappres_originaltx < -3 then cpappres_originaltx = .;
  if cpappres_randtx < -3 then cpappres_randtx = .;
  if cpappres_titration < -3 then cpappres_titration = .;
  if cpappres_studytype < -3 then cpappres_studytype = .;
  if cpappres_masktype < -3 then cpappres_masktype = .;
  if cpappres_chinstrap < -3 then cpappres_chinstrap = .;
  if cpappres_ramp < -3 then cpappres_ramp = .;
  if cpappres_c_flex < -3 then cpappres_c_flex = .;
  if cpap_prescription_complete < -3 then cpap_prescription_complete = .;
  if medalert_bp < -3 then medalert_bp = .;
  if medalert_bpimmsys < -3 then medalert_bpimmsys = .;
  if medalert_bpimmdia < -3 then medalert_bpimmdia = .;
  if medalert_bpurgsys < -3 then medalert_bpurgsys = .;
  if medalert_bpurgdia < -3 then medalert_bpurgdia = .;
  if medalert_physnot < -3 then medalert_physnot = .;
  if medalert_physnotby < -3 then medalert_physnotby = .;
  if medalert_pptnot < -3 then medalert_pptnot = .;
  if medalert_pptnotby < -3 then medalert_pptnotby = .;
  if medalert_pptphysnot < -3 then medalert_pptphysnot = .;
  if medalert_pptphysnotby < -3 then medalert_pptphysnotby = .;
  if medalert_ecg < -3 then medalert_ecg = .;
  if medalert_ecgimmfibduration < -3 then medalert_ecgimmfibduration = .;
  if medalert_ecgimmfib < -3 then medalert_ecgimmfib = .;
  if medalert_ecgimmnofib < -3 then medalert_ecgimmnofib = .;
  if medalert_ecgimmvenfib < -3 then medalert_ecgimmvenfib = .;
  if medalert_ecgimmsymparr < -3 then medalert_ecgimmsymparr = .;
  if medalert_ecgurgafib < -3 then medalert_ecgurgafib = .;
  if medalert_ecgurgmobitz < -3 then medalert_ecgurgmobitz = .;
  if medalert_ecgurgventach < -3 then medalert_ecgurgventach = .;
  if medalert_physnot2 < -3 then medalert_physnot2 = .;
  if medalert_physnotby2 < -3 then medalert_physnotby2 = .;
  if medalert_pptnot2 < -3 then medalert_pptnot2 = .;
  if medalert_pptnotby2 < -3 then medalert_pptnotby2 = .;
  if medalert_pptphysnot2 < -3 then medalert_pptphysnot2 = .;
  if medalert_pptphysnotby2 < -3 then medalert_pptphysnotby2 = .;
  if medalert_hr < -3 then medalert_hr = .;
  if medalert_hrimm140 < -3 then medalert_hrimm140 = .;
  if medalert_hrimm40 < -3 then medalert_hrimm40 = .;
  if medalert_physnot4 < -3 then medalert_physnot4 = .;
  if medalert_physnotby4 < -3 then medalert_physnotby4 = .;
  if medalert_pptnot4 < -3 then medalert_pptnot4 = .;
  if medalert_pptnotby4 < -3 then medalert_pptnotby4 = .;
  if medalert_pptphysnot4 < -3 then medalert_pptphysnot4 = .;
  if medalert_pptphysnotby4 < -3 then medalert_pptphysnotby4 = .;
  if medalert_phq < -3 then medalert_phq = .;
  if medalert_phqimm15 < -3 then medalert_phqimm15 = .;
  if medalert_phqurg15 < -3 then medalert_phqurg15 = .;
  if medalert_physnot5 < -3 then medalert_physnot5 = .;
  if medalert_physnotby5 < -3 then medalert_physnotby5 = .;
  if medalert_pptnot5 < -3 then medalert_pptnot5 = .;
  if medalert_pptnotby5 < -3 then medalert_pptnotby5 = .;
  if medalert_pptphysnot5 < -3 then medalert_pptphysnot5 = .;
  if medalert_pptphysnotby5 < -3 then medalert_pptphysnotby5 = .;
  if medalert_24hrbp < -3 then medalert_24hrbp = .;
  if medalert_24hrbpimmsys < -3 then medalert_24hrbpimmsys = .;
  if medalert_24hrimmdia < -3 then medalert_24hrimmdia = .;
  if medalert_24hrbpurgsys < -3 then medalert_24hrbpurgsys = .;
  if medalert_24hrurgdia < -3 then medalert_24hrurgdia = .;
  if medalert_physnot6 < -3 then medalert_physnot6 = .;
  if medalert_physnotby6 < -3 then medalert_physnotby6 = .;
  if medalert_pptnot6 < -3 then medalert_pptnot6 = .;
  if medalert_pptnotby6 < -3 then medalert_pptnotby6 = .;
  if medalert_pptphysnot6 < -3 then medalert_pptphysnot6 = .;
  if medalert_pptphysnotby6 < -3 then medalert_pptphysnotby6 = .;
  if medalert_glu < -3 then medalert_glu = .;
  if medalert_gluimm < -3 then medalert_gluimm = .;
  if medalert_gluurg < -3 then medalert_gluurg = .;
  if medalert_physnot7 < -3 then medalert_physnot7 = .;
  if medalert_physnotby7 < -3 then medalert_physnotby7 = .;
  if medalert_pptnot7 < -3 then medalert_pptnot7 = .;
  if medalert_pptnotby7 < -3 then medalert_pptnotby7 = .;
  if medalert_pptphysnot7 < -3 then medalert_pptphysnot7 = .;
  if medalert_pptphysnotby7 < -3 then medalert_pptphysnotby7 = .;
  if medalert_tri < -3 then medalert_tri = .;
  if medalert_triimm < -3 then medalert_triimm = .;
  if medalert_triurg < -3 then medalert_triurg = .;
  if medalert_physnot8 < -3 then medalert_physnot8 = .;
  if medalert_physnotby8 < -3 then medalert_physnotby8 = .;
  if medalert_pptnot8 < -3 then medalert_pptnot8 = .;
  if medalert_pptnotby8 < -3 then medalert_pptnotby8 = .;
  if medalert_pptphysnot8 < -3 then medalert_pptphysnot8 = .;
  if medalert_pptphysnotby8 < -3 then medalert_pptphysnotby8 = .;
  if medical_alerts_complete < -3 then medical_alerts_complete = .;
  if phq8_interest < -3 then phq8_interest = .;
  if phq8_down_hopeless < -3 then phq8_down_hopeless = .;
  if phq8_sleep < -3 then phq8_sleep = .;
  if phq8_tired < -3 then phq8_tired = .;
  if phq8_appetite < -3 then phq8_appetite = .;
  if phq8_bad_failure < -3 then phq8_bad_failure = .;
  if phq8_troubleconcentrating < -3 then phq8_troubleconcentrating = .;
  if phq8_movingslowly < -3 then phq8_movingslowly = .;
  if phq8_difficulty < -3 then phq8_difficulty = .;
  if phq8_complete < -3 then phq8_complete = .;
  if prom_restless < -3 then prom_restless = .;
  if prom_satisfied < -3 then prom_satisfied = .;
  if prom_refreshing < -3 then prom_refreshing = .;
  if prom_difficulty < -3 then prom_difficulty = .;
  if prom_staying < -3 then prom_staying = .;
  if prom_sleeping < -3 then prom_sleeping = .;
  if prom_enough < -3 then prom_enough = .;
  if prom_quality < -3 then prom_quality = .;
  if prom_thingsdone < -3 then prom_thingsdone = .;
  if prom_alert < -3 then prom_alert = .;
  if prom_tired < -3 then prom_tired = .;
  if prom_problems < -3 then prom_problems = .;
  if prom_concentrating < -3 then prom_concentrating = .;
  if prom_irritable < -3 then prom_irritable = .;
  if prom_daytime < -3 then prom_daytime = .;
  if prom_stayawake < -3 then prom_stayawake = .;
  if promis_dcfc_complete < -3 then promis_dcfc_complete = .;
  if sarp_fallasleepdriving < -3 then sarp_fallasleepdriving = .;
  if sarp_accident < -3 then sarp_accident = .;
  if sarp_heartattack < -3 then sarp_heartattack = .;
  if sarp_fallasleepday < -3 then sarp_fallasleepday = .;
  if sarp_highbp < -3 then sarp_highbp = .;
  if sarp_diffconc < -3 then sarp_diffconc = .;
  if sarp_depressed < -3 then sarp_depressed = .;
  if sarp_sexperformance < -3 then sarp_sexperformance = .;
  if sarp_complete < -3 then sarp_complete = .;
  if semsa_highbp < -3 then semsa_highbp = .;
  if semsa_fallasleepdriving < -3 then semsa_fallasleepdriving = .;
  if semsa_heartattack < -3 then semsa_heartattack = .;
  if semsa_diffconcent < -3 then semsa_diffconcent = .;
  if semsa_fallasleepday < -3 then semsa_fallasleepday = .;
  if semsa_fallasleepaccident < -3 then semsa_fallasleepaccident = .;
  if semsa_depressed < -3 then semsa_depressed = .;
  if semsa_sexdesire < -3 then semsa_sexdesire = .;
  if semsa_decaccdriving < -3 then semsa_decaccdriving = .;
  if semsa_snore < -3 then semsa_snore = .;
  if semsa_lessalert < -3 then semsa_lessalert = .;
  if semsa_jobperformance < -3 then semsa_jobperformance = .;
  if semsa_relationshipsigfrien < -3 then semsa_relationshipsigfrien = .;
  if semsa_incheartattack < -3 then semsa_incheartattack = .;
  if semsa_partsleep < -3 then semsa_partsleep = .;
  if semsa_feelbetter < -3 then semsa_feelbetter = .;
  if semsa_active < -3 then semsa_active = .;
  if semsa_desire < -3 then semsa_desire = .;
  if semsa_claustro < -3 then semsa_claustro = .;
  if semsa_readybed < -3 then semsa_readybed = .;
  if semsa_nightlytravel < -3 then semsa_nightlytravel = .;
  if semsa_tightmask < -3 then semsa_tightmask = .;
  if semsa_nosestuffy < -3 then semsa_nosestuffy = .;
  if semsa_bother < -3 then semsa_bother = .;
  if semsa_disturbpartner < -3 then semsa_disturbpartner = .;
  if semsa_embarrassed < -3 then semsa_embarrassed = .;
  if semsa_paysomecost < -3 then semsa_paysomecost = .;
  if semsa_complete < -3 then semsa_complete = .;
  if sf36_gh01 < -3 then sf36_gh01 = .;
  if sf36_sfht < -3 then sf36_sfht = .;
  if sf36_pf01 < -3 then sf36_pf01 = .;
  if sf36_pf02 < -3 then sf36_pf02 = .;
  if sf36_pf03 < -3 then sf36_pf03 = .;
  if sf36_pf04 < -3 then sf36_pf04 = .;
  if sf36_pf05 < -3 then sf36_pf05 = .;
  if sf36_pf06 < -3 then sf36_pf06 = .;
  if sf36_pf07 < -3 then sf36_pf07 = .;
  if sf36_pf08 < -3 then sf36_pf08 = .;
  if sf36_pf09 < -3 then sf36_pf09 = .;
  if sf36_pf10 < -3 then sf36_pf10 = .;
  if sf36_rp01 < -3 then sf36_rp01 = .;
  if sf36_rp02 < -3 then sf36_rp02 = .;
  if sf36_rp03 < -3 then sf36_rp03 = .;
  if sf36_rp04 < -3 then sf36_rp04 = .;
  if sf36_re01 < -3 then sf36_re01 = .;
  if sf36_re02 < -3 then sf36_re02 = .;
  if sf36_re03 < -3 then sf36_re03 = .;
  if sf36_sf01 < -3 then sf36_sf01 = .;
  if sf36_bp01 < -3 then sf36_bp01 = .;
  if sf36_bp02 < -3 then sf36_bp02 = .;
  if sf36_vt01 < -3 then sf36_vt01 = .;
  if sf36_mh01 < -3 then sf36_mh01 = .;
  if sf36_mh02 < -3 then sf36_mh02 = .;
  if sf36_mh03 < -3 then sf36_mh03 = .;
  if sf36_vt02 < -3 then sf36_vt02 = .;
  if sf36_mh04 < -3 then sf36_mh04 = .;
  if sf36_vt03 < -3 then sf36_vt03 = .;
  if sf36_mh05 < -3 then sf36_mh05 = .;
  if sf36_vt04 < -3 then sf36_vt04 = .;
  if sf36_sf02 < -3 then sf36_sf02 = .;
  if sf36_gh02 < -3 then sf36_gh02 = .;
  if sf36_gh03 < -3 then sf36_gh03 = .;
  if sf36_gh04 < -3 then sf36_gh04 = .;
  if sf36_gh05 < -3 then sf36_gh05 = .;
  if sf36_bdfa_complete < -3 then sf36_bdfa_complete = .;
  if shq_study_visit < -3 then shq_study_visit = .;
  if shq_trasleep < -3 then shq_trasleep = .;
  if shq_wokeupsev < -3 then shq_wokeupsev = .;
  if shq_wokeupearly < -3 then shq_wokeupearly = .;
  if shq_trbacktosleep < -3 then shq_trbacktosleep = .;
  if shq_trpills < -3 then shq_trpills = .;
  if shq_typnightsleep < -3 then shq_typnightsleep = .;
  if shq_unrestedday < -3 then shq_unrestedday = .;
  if shq_sleepyday < -3 then shq_sleepyday = .;
  if shq_notenoughsleep < -3 then shq_notenoughsleep = .;
  if shq_feelingbestgetup < -3 then shq_feelingbestgetup = .;
  if shq_wokentired < -3 then shq_wokentired = .;
  if shq_timefeeltired < -3 then shq_timefeeltired = .;
  if shq_timefeelingbest < -3 then shq_timefeelingbest = .;
  if shq_morevetypes < -3 then shq_morevetypes = .;
  if shq_worksched < -3 then shq_worksched = .;
  if shq_sitread < -3 then shq_sitread = .;
  if shq_watchingtv < -3 then shq_watchingtv = .;
  if shq_sitinactive < -3 then shq_sitinactive = .;
  if shq_ridingforhour < -3 then shq_ridingforhour = .;
  if shq_lyingdown < -3 then shq_lyingdown = .;
  if shq_sittalk < -3 then shq_sittalk = .;
  if shq_afterlunch < -3 then shq_afterlunch = .;
  if shq_stoppedcar < -3 then shq_stoppedcar = .;
  if shq_driving < -3 then shq_driving = .;
  if shq_eversnored < -3 then shq_eversnored = .;
  if shq_snorenow < -3 then shq_snorenow = .;
  if shq_stopbreath < -3 then shq_stopbreath = .;
  if shq_stopbreathfrq < -3 then shq_stopbreathfrq = .;
  if shq_snorted < -3 then shq_snorted = .;
  if shq_snortingfrq < -3 then shq_snortingfrq = .;
  if shq_coughing < -3 then shq_coughing = .;
  if shq_chestpain < -3 then shq_chestpain = .;
  if shq_shortnessbreath < -3 then shq_shortnessbreath = .;
  if shq_sweats < -3 then shq_sweats = .;
  if shq_noise < -3 then shq_noise = .;
  if shq_pain < -3 then shq_pain = .;
  if shq_heartburn < -3 then shq_heartburn = .;
  if shq_cramps < -3 then shq_cramps = .;
  if shq_needbathroom < -3 then shq_needbathroom = .;
  if shq_legsdiscomfort < -3 then shq_legsdiscomfort = .;
  if shq_legsdiscomfortfrq < -3 then shq_legsdiscomfortfrq = .;
  if shq_legsdiscomfortrest < -3 then shq_legsdiscomfortrest = .;
  if shq_legsdiscomfortday < -3 then shq_legsdiscomfortday = .;
  if shq_allergies < -3 then shq_allergies = .;
  if shq_allergiesskintest < -3 then shq_allergiesskintest = .;
  if shq_anxietydisorder < -3 then shq_anxietydisorder = .;
  if shq_asthma < -3 then shq_asthma = .;
  if shq_add_adhd < -3 then shq_add_adhd = .;
  if shq_cancer < -3 then shq_cancer = .;
  if shq_prostatecancer < -3 then shq_prostatecancer = .;
  if shq_breastcancer < -3 then shq_breastcancer = .;
  if shq_lungcancer < -3 then shq_lungcancer = .;
  if shq_coloncancer < -3 then shq_coloncancer = .;
  if shq_bloodcancer < -3 then shq_bloodcancer = .;
  if shq_chronicbronchitis < -3 then shq_chronicbronchitis = .;
  if shq_depression < -3 then shq_depression = .;
  if shq_diabetes < -3 then shq_diabetes = .;
  if shq_diabetesmed < -3 then shq_diabetesmed = .;
  if shq_diabetesinsulin < -3 then shq_diabetesinsulin = .;
  if shq_emphysema < -3 then shq_emphysema = .;
  if shq_epilepsy < -3 then shq_epilepsy = .;
  if shq_gerd < -3 then shq_gerd = .;
  if shq_highbp < -3 then shq_highbp = .;
  if shq_highbpmed < -3 then shq_highbpmed = .;
  if shq_highcholes < -3 then shq_highcholes = .;
  if shq_highcholesmed < -3 then shq_highcholesmed = .;
  if shq_ibm < -3 then shq_ibm = .;
  if shq_insomnia < -3 then shq_insomnia = .;
  if shq_migraine < -3 then shq_migraine = .;
  if shq_ms < -3 then shq_ms = .;
  if shq_restlesslegs < -3 then shq_restlesslegs = .;
  if shq_ra < -3 then shq_ra = .;
  if shq_sinus < -3 then shq_sinus = .;
  if shq_famparheart < -3 then shq_famparheart = .;
  if shq_famparstroke < -3 then shq_famparstroke = .;
  if shq_famparapnea < -3 then shq_famparapnea = .;
  if shq_nosib < -3 then shq_nosib = .;
  if shq_famsibheart < -3 then shq_famsibheart = .;
  if shq_famsibstroke < -3 then shq_famsibstroke = .;
  if shq_famsibapnea < -3 then shq_famsibapnea = .;
  if shq_nochi < -3 then shq_nochi = .;
  if shq_famchiheart < -3 then shq_famchiheart = .;
  if shq_famchistroke < -3 then shq_famchistroke = .;
  if shq_famchiapnea < -3 then shq_famchiapnea = .;
  if shq_eversmoked < -3 then shq_eversmoked = .;
  if shq_smokedlast4weeks < -3 then shq_smokedlast4weeks = .;
  if shq_drinkcaffeine < -3 then shq_drinkcaffeine = .;
  if shq_consumealcohol < -3 then shq_consumealcohol = .;
  if shq_numberdrinks < -3 then shq_numberdrinks = .;
  if shq_drinkbeforebedtime < -3 then shq_drinkbeforebedtime = .;
  if shq_painlegswalk < -3 then shq_painlegswalk = .;
  if shq_painlegswalkstill < -3 then shq_painlegswalkstill = .;
  if shq_painlegswalkuphill < -3 then shq_painlegswalkuphill = .;
  if shq_painlegswalkpace < -3 then shq_painlegswalkpace = .;
  if shq_painlegswalkstandstill < -3 then shq_painlegswalkstandstill = .;
  if shq_painlegswalklocbuttock < -3 then shq_painlegswalklocbuttock = .;
  if shq_painlegswalkloccalf < -3 then shq_painlegswalkloccalf = .;
  if shq_painlegswalklocfeet < -3 then shq_painlegswalklocfeet = .;
  if shq_painlegswalklocham < -3 then shq_painlegswalklocham = .;
  if shq_painlegswalklocjoints < -3 then shq_painlegswalklocjoints = .;
  if shq_painlegswalklocrad < -3 then shq_painlegswalklocrad = .;
  if shq_painlegswalklocshins < -3 then shq_painlegswalklocshins = .;
  if shq_painlegswalklocthigh < -3 then shq_painlegswalklocthigh = .;
  if shq_swelling < -3 then shq_swelling = .;
  if shq_swellingdaynight < -3 then shq_swellingdaynight = .;
  if shq_awktrbbreathing < -3 then shq_awktrbbreathing = .;
  if shq_pillowsbreathe < -3 then shq_pillowsbreathe = .;
  if shq_painchest < -3 then shq_painchest = .;
  if shq_pressurechest < -3 then shq_pressurechest = .;
  if shq_pressurechestuphill < -3 then shq_pressurechestuphill = .;
  if shq_pressurechestordinary < -3 then shq_pressurechestordinary = .;
  if shq_pressurechestwalking < -3 then shq_pressurechestwalking = .;
  if shq_pressurecheststill < -3 then shq_pressurecheststill = .;
  if shq_pressurechesthowsoon < -3 then shq_pressurechesthowsoon = .;
  if shq_pressurechestdoctor < -3 then shq_pressurechestdoctor = .;
  if shq_menopause < -3 then shq_menopause = .;
  if shq_ovaries < -3 then shq_ovaries = .;
  if shq_hysterectomy < -3 then shq_hysterectomy = .;
  if shq_menstrual < -3 then shq_menstrual = .;
  if shq_hormonert < -3 then shq_hormonert = .;
  if shq_typeofhormonert < -3 then shq_typeofhormonert = .;
  if sleephealth_question_v_2 < -3 then sleephealth_question_v_2 = .;
  if shq_studyvisit6 < -3 then shq_studyvisit6 = .;
  if shq_trasleep6 < -3 then shq_trasleep6 = .;
  if shq_wokeupsev6 < -3 then shq_wokeupsev6 = .;
  if shq_wokeupearly6 < -3 then shq_wokeupearly6 = .;
  if shq_trbacktosleep6 < -3 then shq_trbacktosleep6 = .;
  if shq_trpills6 < -3 then shq_trpills6 = .;
  if shq_typnightsleep6 < -3 then shq_typnightsleep6 = .;
  if shq_unrestedday6 < -3 then shq_unrestedday6 = .;
  if shq_sleepyday6 < -3 then shq_sleepyday6 = .;
  if shq_notenoughsleep6 < -3 then shq_notenoughsleep6 = .;
  if shq_feelingbestgetup6 < -3 then shq_feelingbestgetup6 = .;
  if shq_wokentired6 < -3 then shq_wokentired6 = .;
  if shq_timefeeltired6 < -3 then shq_timefeeltired6 = .;
  if shq_timefeelingbest6 < -3 then shq_timefeelingbest6 = .;
  if shq_morevetypes6 < -3 then shq_morevetypes6 = .;
  if shq_worksched6 < -3 then shq_worksched6 = .;
  if shq_sitread6 < -3 then shq_sitread6 = .;
  if shq_watchingtv6 < -3 then shq_watchingtv6 = .;
  if shq_sitinactive6 < -3 then shq_sitinactive6 = .;
  if shq_ridingforhour6 < -3 then shq_ridingforhour6 = .;
  if shq_lyingdown6 < -3 then shq_lyingdown6 = .;
  if shq_sittalk6 < -3 then shq_sittalk6 = .;
  if shq_afterlunch6 < -3 then shq_afterlunch6 = .;
  if shq_stoppedcar6 < -3 then shq_stoppedcar6 = .;
  if shq_driving6 < -3 then shq_driving6 = .;
  if shq_haveyousnored6 < -3 then shq_haveyousnored6 = .;
  if shq_snorenow6 < -3 then shq_snorenow6 = .;
  if shq_stopbreath6 < -3 then shq_stopbreath6 = .;
  if shq_stopbreathfrq6 < -3 then shq_stopbreathfrq6 = .;
  if shq_snorted6 < -3 then shq_snorted6 = .;
  if shq_snortingfrq6 < -3 then shq_snortingfrq6 = .;
  if shq_coughing6 < -3 then shq_coughing6 = .;
  if shq_chestpain6 < -3 then shq_chestpain6 = .;
  if shq_shortnessbreath6 < -3 then shq_shortnessbreath6 = .;
  if shq_sweats6 < -3 then shq_sweats6 = .;
  if shq_noise6 < -3 then shq_noise6 = .;
  if shq_pain6 < -3 then shq_pain6 = .;
  if shq_heartburn6 < -3 then shq_heartburn6 = .;
  if shq_cramps6 < -3 then shq_cramps6 = .;
  if shq_needbathroom6 < -3 then shq_needbathroom6 = .;
  if shq_legsdiscomfort6 < -3 then shq_legsdiscomfort6 = .;
  if shq_legsdiscomfortfrq6 < -3 then shq_legsdiscomfortfrq6 = .;
  if shq_legsdiscomfortrest6 < -3 then shq_legsdiscomfortrest6 = .;
  if shq_legsdiscomfortday6 < -3 then shq_legsdiscomfortday6 = .;
  if shq_drinkcaffeine6 < -3 then shq_drinkcaffeine6 = .;
  if shq_numberdrinks6 < -3 then shq_numberdrinks6 = .;
  if shq_drinkbeforebedtime6 < -3 then shq_drinkbeforebedtime6 = .;
  if shq_painlegswalk6 < -3 then shq_painlegswalk6 = .;
  if shq_painlegswalkstill6 < -3 then shq_painlegswalkstill6 = .;
  if shq_painlegswalkuphill6 < -3 then shq_painlegswalkuphill6 = .;
  if shq_painlegswalkpace6 < -3 then shq_painlegswalkpace6 = .;
  if shq_painlegswalkstandstill6 < -3 then shq_painlegswalkstandstill6 = .;
  if shq_painlegswalklocbuttock6 < -3 then shq_painlegswalklocbuttock6 = .;
  if shq_painlegswalkloccalf6 < -3 then shq_painlegswalkloccalf6 = .;
  if shq_painlegswalklocfeet6 < -3 then shq_painlegswalklocfeet6 = .;
  if shq_painlegswalklocham6 < -3 then shq_painlegswalklocham6 = .;
  if shq_painlegswalklocjoints6 < -3 then shq_painlegswalklocjoints6 = .;
  if shq_painlegswalklocrad6 < -3 then shq_painlegswalklocrad6 = .;
  if shq_painlegswalklocshins6 < -3 then shq_painlegswalklocshins6 = .;
  if shq_painlegswalklocthigh6 < -3 then shq_painlegswalklocthigh6 = .;
  if shq_swelling6 < -3 then shq_swelling6 = .;
  if shq_swellingdaynight6 < -3 then shq_swellingdaynight6 = .;
  if shq_awktrbbreathing6 < -3 then shq_awktrbbreathing6 = .;
  if shq_pillowsbreathe6 < -3 then shq_pillowsbreathe6 = .;
  if shq_painchest6 < -3 then shq_painchest6 = .;
  if shq_pressurechest6 < -3 then shq_pressurechest6 = .;
  if shq_pressurechestuphill6 < -3 then shq_pressurechestuphill6 = .;
  if shq_pressurechestordinary6 < -3 then shq_pressurechestordinary6 = .;
  if shq_pressurechestwalking6 < -3 then shq_pressurechestwalking6 = .;
  if shq_pressurecheststill6 < -3 then shq_pressurecheststill6 = .;
  if shq_pressurechesthowsoon6 < -3 then shq_pressurechesthowsoon6 = .;
  if shq_pressurechestdoctor6 < -3 then shq_pressurechestdoctor6 = .;
  if sleephealth_question_v_3 < -3 then sleephealth_question_v_3 = .;
  if qctonom_qcnumbersred1 < -3 then qctonom_qcnumbersred1 = .;
  if qctonom_standdev1 < -3 then qctonom_standdev1 = .;
  if qctonom_qcnumbersred2 < -3 then qctonom_qcnumbersred2 = .;
  if qctonom_standdev2 < -3 then qctonom_standdev2 = .;
  if qctonom_pwv1pwv2 < -3 then qctonom_pwv1pwv2 = .;
  if qctonom_qcnumbersred3 < -3 then qctonom_qcnumbersred3 = .;
  if qctonom_standdev3 < -3 then qctonom_standdev3 = .;
  if qctonom_qcnumbersred32_d69 < -3 then qctonom_qcnumbersred32_d69 = .;
  if qctonom_standdev4 < -3 then qctonom_standdev4 = .;
  if qctonom_operatorindex1 < -3 then qctonom_operatorindex1 = .;
  if qctonom_qcnumbersredpwa1 < -3 then qctonom_qcnumbersredpwa1 = .;
  if qctonom_notes1 < -3 then qctonom_notes1 = .;
  if qctonom_operatorindex2 < -3 then qctonom_operatorindex2 = .;
  if qctonom_qcnumbersredpwa2 < -3 then qctonom_qcnumbersredpwa2 = .;
  if qctonom_notes2 < -3 then qctonom_notes2 = .;
  if qctonom_aorticaug < -3 then qctonom_aorticaug = .;
  if qctonom_operatorindex3 < -3 then qctonom_operatorindex3 = .;
  if qctonom_qcnumbersredpwa3 < -3 then qctonom_qcnumbersredpwa3 = .;
  if qctonom_notes3 < -3 then qctonom_notes3 = .;
  if qctonom_operatorindex4 < -3 then qctonom_operatorindex4 = .;
  if qctonom_qcnumbersredpwa4 < -3 then qctonom_qcnumbersredpwa4 = .;
  if qctonom_notes4 < -3 then qctonom_notes4 = .;
  if tonometry_qc_complete < -3 then tonometry_qc_complete = .;
  if monitorqc_wearandcollect < -3 then monitorqc_wearandcollect = .;
  if monitorqc_dataupload < -3 then monitorqc_dataupload = .;
  if monitorqc_20hrs < -3 then monitorqc_20hrs = .;
  if monitorqc_10readingsday < -3 then monitorqc_10readingsday = .;
  if monitorqc_4readingsnight < -3 then monitorqc_4readingsnight = .;
  if monitorqc_percentsuccess < -3 then monitorqc_percentsuccess = .;
  if monitor_24_hr_qc_complete < -3 then monitor_24_hr_qc_complete = .;
  if twpas_light_yn < -3 then twpas_light_yn = .;
  if twpas_light_days < -3 then twpas_light_days = .;
  if twpas_light_hrs < -3 then twpas_light_hrs = .;
  if twpas_light_min < -3 then twpas_light_min = .;
  if twpas_moderate_yn < -3 then twpas_moderate_yn = .;
  if twpas_moderate_days < -3 then twpas_moderate_days = .;
  if twpas_moderate_hrs < -3 then twpas_moderate_hrs = .;
  if twpas_moderate_min < -3 then twpas_moderate_min = .;
  if twpas_lawnmod_yn < -3 then twpas_lawnmod_yn = .;
  if twpas_lawnmod_days < -3 then twpas_lawnmod_days = .;
  if twpas_lawnmod_hrs < -3 then twpas_lawnmod_hrs = .;
  if twpas_lawnmod_min < -3 then twpas_lawnmod_min = .;
  if twpas_lawnheavy_yn < -3 then twpas_lawnheavy_yn = .;
  if twpas_lawnheavy_days < -3 then twpas_lawnheavy_days = .;
  if twpas_lawnheavy_hrs < -3 then twpas_lawnheavy_hrs = .;
  if twpas_lawnheavy_min < -3 then twpas_lawnheavy_min = .;
  if twpas_carelight_yn < -3 then twpas_carelight_yn = .;
  if twpas_carelight_days < -3 then twpas_carelight_days = .;
  if twpas_carelight_hrs < -3 then twpas_carelight_hrs = .;
  if twpas_carelight_min < -3 then twpas_carelight_min = .;
  if twpas_caremod_yn < -3 then twpas_caremod_yn = .;
  if twpas_caremod_days < -3 then twpas_caremod_days = .;
  if twpas_caremod_hrs < -3 then twpas_caremod_hrs = .;
  if twpas_caremod_min < -3 then twpas_caremod_min = .;
  if twpas_walkget_yn < -3 then twpas_walkget_yn = .;
  if twpas_walkget_days < -3 then twpas_walkget_days = .;
  if twpas_walkget_hrs < -3 then twpas_walkget_hrs = .;
  if twpas_walkget_min < -3 then twpas_walkget_min = .;
  if twpas_walkex_yn < -3 then twpas_walkex_yn = .;
  if twpas_walkex_days < -3 then twpas_walkex_days = .;
  if twpas_walkex_hrs < -3 then twpas_walkex_hrs = .;
  if twpas_walkex_min < -3 then twpas_walkex_min = .;
  if twpas_dancing_yn < -3 then twpas_dancing_yn = .;
  if twpas_dancing_days < -3 then twpas_dancing_days = .;
  if twpas_dancing_hrs < -3 then twpas_dancing_hrs = .;
  if twpas_dancing_min < -3 then twpas_dancing_min = .;
  if twpas_teamsports_yn < -3 then twpas_teamsports_yn = .;
  if twpas_teamsports_days < -3 then twpas_teamsports_days = .;
  if twpas_teamsports_hrs < -3 then twpas_teamsports_hrs = .;
  if twpas_teamsports_min < -3 then twpas_teamsports_min = .;
  if twpas_dualsports_yn < -3 then twpas_dualsports_yn = .;
  if twpas_dualsports_days < -3 then twpas_dualsports_days = .;
  if twpas_dualsports_hrs < -3 then twpas_dualsports_hrs = .;
  if twpas_dualsports_min < -3 then twpas_dualsports_min = .;
  if twpas_indivact_yn < -3 then twpas_indivact_yn = .;
  if twpas_indivact_days < -3 then twpas_indivact_days = .;
  if twpas_indivact_hrs < -3 then twpas_indivact_hrs = .;
  if twpas_indivact_min < -3 then twpas_indivact_min = .;
  if twpas_condmod_yn < -3 then twpas_condmod_yn = .;
  if twpas_condmod_days < -3 then twpas_condmod_days = .;
  if twpas_condmod_hrs < -3 then twpas_condmod_hrs = .;
  if twpas_condmod_min < -3 then twpas_condmod_min = .;
  if twpas_condheavy_yn < -3 then twpas_condheavy_yn = .;
  if twpas_condheavy_days < -3 then twpas_condheavy_days = .;
  if twpas_condheavy_hrs < -3 then twpas_condheavy_hrs = .;
  if twpas_condheavy_min < -3 then twpas_condheavy_min = .;
  if twpas_sitrecline_yn < -3 then twpas_sitrecline_yn = .;
  if twpas_sitrecline_days < -3 then twpas_sitrecline_days = .;
  if twpas_sitrecline_hrs < -3 then twpas_sitrecline_hrs = .;
  if twpas_sitrecline_min < -3 then twpas_sitrecline_min = .;
  if twpas_worklightsit_yn < -3 then twpas_worklightsit_yn = .;
  if twpas_worklightsit_days < -3 then twpas_worklightsit_days = .;
  if twpas_worklightsit_hrs < -3 then twpas_worklightsit_hrs = .;
  if twpas_worklightstand_yn < -3 then twpas_worklightstand_yn = .;
  if twpas_worklightstand_days < -3 then twpas_worklightstand_days = .;
  if twpas_worklightstand_hrs < -3 then twpas_worklightstand_hrs = .;
  if twpas_workmod_yn < -3 then twpas_workmod_yn = .;
  if twpas_workmod_days < -3 then twpas_workmod_days = .;
  if twpas_workmod_hrs < -3 then twpas_workmod_hrs = .;
  if twpas_workheavy_yn < -3 then twpas_workheavy_yn = .;
  if twpas_workheavy_days < -3 then twpas_workheavy_days = .;
  if twpas_workheavy_hrs < -3 then twpas_workheavy_hrs = .;
  if twpas_usualpace < -3 then twpas_usualpace = .;
  if twpas_fabc_complete < -3 then twpas_fabc_complete = .;
  if twomonth_month < -3 then twomonth_month = .;
  if twomonth_chestpain < -3 then twomonth_chestpain = .;
  if twomonth_shortnessofbreath < -3 then twomonth_shortnessofbreath = .;
  if twomonth_sleepiness < -3 then twomonth_sleepiness = .;
  if twomonth_healthprofess < -3 then twomonth_healthprofess = .;
  if twomonth_overnightstay < -3 then twomonth_overnightstay = .;
  if twomonth_docrec < -3 then twomonth_docrec = .;
  if twomonth_conditions < -3 then twomonth_conditions = .;
  if twomonth_missednights < -3 then twomonth_missednights = .;
  if twomonth_maskfit < -3 then twomonth_maskfit = .;
  if twomonth_headgear < -3 then twomonth_headgear = .;
  if twomonth_maskleaks < -3 then twomonth_maskleaks = .;
  if twomonth_pressure < -3 then twomonth_pressure = .;
  if twomonth_nasalcongestion < -3 then twomonth_nasalcongestion = .;
  if twomonth_throatdryness < -3 then twomonth_throatdryness = .;
  if twomonth_sinus < -3 then twomonth_sinus = .;
  if twomonth_noise < -3 then twomonth_noise = .;
  if twomonth_eyeirrit < -3 then twomonth_eyeirrit = .;
  if twomonth_skinirrit < -3 then twomonth_skinirrit = .;
  if twomonth_other < -3 then twomonth_other = .;
  if twomonth_nasalstrips < -3 then twomonth_nasalstrips = .;
  if twomonth_sleepreg < -3 then twomonth_sleepreg = .;
  if twomonth_positionchange < -3 then twomonth_positionchange = .;
  if twomonth_changestime < -3 then twomonth_changestime = .;
  if twomonth_recipes < -3 then twomonth_recipes = .;
  if two_month_phone_cont_v_4 < -3 then two_month_phone_cont_v_4 = .;
  if compmon_encounter < -3 then compmon_encounter = .;
  if compmon_timing < -3 then compmon_timing = .;
  if compmon_mskcomf < -3 then compmon_mskcomf = .;
  if compmon_airleak < -3 then compmon_airleak = .;
  if compmon_redface < -3 then compmon_redface = .;
  if compmon_dryness < -3 then compmon_dryness = .;
  if compmon_instruct < -3 then compmon_instruct = .;
  if compmon_energy < -3 then compmon_energy = .;
  if compmon_snoring < -3 then compmon_snoring = .;
  if compmon_htn < -3 then compmon_htn = .;
  if compmon_weight < -3 then compmon_weight = .;
  if compmon_headaches < -3 then compmon_headaches = .;
  if compmon_sleepiness < -3 then compmon_sleepiness = .;
  if compmon_supplies < -3 then compmon_supplies = .;
  if compliance_monitor_complete < -3 then compliance_monitor_complete = .;
  if phonechanges_initiated_by < -3 then phonechanges_initiated_by = .;
  if phonechanges_call_reason___1 < -3 then phonechanges_call_reason___1 = .;
  if phonechanges_call_reason___2 < -3 then phonechanges_call_reason___2 = .;
  if phonechanges_call_reason___3 < -3 then phonechanges_call_reason___3 = .;
  if phonechanges_call_reason___4 < -3 then phonechanges_call_reason___4 = .;
  if phonechanges_call_reason___5 < -3 then phonechanges_call_reason___5 = .;
  if phonechanges_call_reason___6 < -3 then phonechanges_call_reason___6 = .;
  if phonechanges_call_reason___7 < -3 then phonechanges_call_reason___7 = .;
  if phonechange_resolved___1 < -3 then phonechange_resolved___1 = .;
  if phonechange_resolved___2 < -3 then phonechange_resolved___2 = .;
  if phonechange_resolved___3 < -3 then phonechange_resolved___3 = .;
  if phonechange_resolved___4 < -3 then phonechange_resolved___4 = .;
  if phonechanges_changed___1 < -3 then phonechanges_changed___1 = .;
  if phonechanges_changed___2 < -3 then phonechanges_changed___2 = .;
  if phonechanges_changed___3 < -3 then phonechanges_changed___3 = .;
  if phonechanges_changed___4 < -3 then phonechanges_changed___4 = .;
  if incoming_phone_call__v_5 < -3 then incoming_phone_call__v_5 = .;
  if ae_severity < -3 then ae_severity = .;
  if ae_intervrelationship < -3 then ae_intervrelationship = .;
  if ae_actiontaken < -3 then ae_actiontaken = .;
  if ae_outcome < -3 then ae_outcome = .;
  if ae_expected < -3 then ae_expected = .;
  if adverse_event_complete < -3 then adverse_event_complete = .;
  if sae_timepoint < -3 then sae_timepoint = .;
  if sae_type < -3 then sae_type = .;
  if sae_unexpected < -3 then sae_unexpected = .;
  if sae_descripsex < -3 then sae_descripsex = .;
  if sae_catsae < -3 then sae_catsae = .;
  if sae_intervtype < -3 then sae_intervtype = .;
  if sae_reltoint < -3 then sae_reltoint = .;
  if sae_discontinued < -3 then sae_discontinued = .;
  if sae_saeptf < -3 then sae_saeptf = .;
  if serious_adverse_even_v_6 < -3 then serious_adverse_even_v_6 = .;
  if dev_code < -3 then dev_code = .;
  if protocol_deviation_complete < -3 then protocol_deviation_complete = .;
  if treatdisc_reason < -3 then treatdisc_reason = .;
  if treatdisc_crossover < -3 then treatdisc_crossover = .;
  if treatdisc_crossreason < -3 then treatdisc_crossreason = .;
  if treatment_discontinu_v_7 < -3 then treatment_discontinu_v_7 = .;
  if sc_timepoint < -3 then sc_timepoint = .;
  if sc_primaryreason < -3 then sc_primaryreason = .;
  if sc_guesstreat < -3 then sc_guesstreat = .;
  if sc_guesstreatarm < -3 then sc_guesstreatarm = .;
  if sc_initiatepap < -3 then sc_initiatepap = .;
  if study_completion_complete < -3 then study_completion_complete = .;
  if cbt1_sleepy < -3 then cbt1_sleepy = .;
  if cbt1_sideeffects < -3 then cbt1_sideeffects = .;
  if cbt1_healthier < -3 then cbt1_healthier = .;
  if cbt1_sleepbetter < -3 then cbt1_sleepbetter = .;
  if cbt1_discomfort < -3 then cbt1_discomfort = .;
  if cbt1_concentration < -3 then cbt1_concentration = .;
  if cbt1_sleeping < -3 then cbt1_sleeping = .;
  if cbt1_nightly < -3 then cbt1_nightly = .;
  if cbt1_worthwhile < -3 then cbt1_worthwhile = .;
  if cbt1_getinway < -3 then cbt1_getinway = .;
  if cbt1_assistance < -3 then cbt1_assistance = .;
  if cbt1_regularly1 < -3 then cbt1_regularly1 = .;
  if cbt1_regularly2 < -3 then cbt1_regularly2 = .;
  if cbt1_regularly3 < -3 then cbt1_regularly3 = .;
  if cbt1_regularly4 < -3 then cbt1_regularly4 = .;
  if cbt1_comfortable < -3 then cbt1_comfortable = .;
  if cbt_session_1_complete < -3 then cbt_session_1_complete = .;
  if cbt_session_2_complete < -3 then cbt_session_2_complete = .;
  if cbtp1_occur < -3 then cbtp1_occur = .;
  if cbtp1_situations1 < -3 then cbtp1_situations1 = .;
  if cbtp1_siuations2 < -3 then cbtp1_siuations2 = .;
  if cbtp1_situations3 < -3 then cbtp1_situations3 = .;
  if cbtp1_situations4 < -3 then cbtp1_situations4 = .;
  if cbtp1_situations5 < -3 then cbtp1_situations5 = .;
  if cbtp1_situations6 < -3 then cbtp1_situations6 = .;
  if cbtp1_situations7 < -3 then cbtp1_situations7 = .;
  if cbtp1_situations8 < -3 then cbtp1_situations8 = .;
  if cbt_initial_phone_ca_v_8 < -3 then cbt_initial_phone_ca_v_8 = .;
  if cbtp2_occur < -3 then cbtp2_occur = .;
  if cbt_followup_phone_c_v_9 < -3 then cbt_followup_phone_c_v_9 = .;
  if bloods_totalchol < 0 then bloods_totalchol = .;
  if bloods_vldlcholcal < 0 then bloods_vldlcholcal = .;
  if bloods_urinecreatin < 0 then bloods_urinecreatin = .;
  if bloods_hemoa1c < 0 then bloods_hemoa1c = .;
  if bloods_ldlcholcalc < 0 then bloods_ldlcholcalc = .;
  if bloods_hdlchol < 0 then bloods_hdlchol = .;
  if anth_hipcm1 < 0 then anth_hipcm1 = .;
  if anth_hipcm2 < 0 then anth_hipcm2 = .;
  if anth_hipcm3 < 0 then anth_hipcm3 = .;
  if anth_heightcm1 < 0 then anth_heightcm1 = .;
  if anth_heightcm2 < 0 then anth_heightcm2 = .;
  if anth_heightcm3 < 0 then anth_heightcm3 = .;
  if anth_neckcm1 < 0 then anth_neckcm1 = .;
  if anth_neckcm2 < 0 then anth_neckcm2 = .;
  if anth_neckcm3 < 0 then anth_neckcm3 = .;
  if ess_height1 < 0 then ess_height1 = '';
  if ess_height2 < 0 then ess_height2 = '';
  if ess_weight < 0 then ess_weight = '';
  if shq_hrspnightweek < 0 then shq_hrspnightweek = .;
  if bprp_rp1 < 0 then bprp_rp1 = .;
  if bprp_rp2 < 0 then bprp_rp2 = .;
  if bprp_rp3 < 0 then bprp_rp3 = .;
  if bprp_bpsys1 < 0 then bprp_bpsys1 = .;
  if bprp_bpsys2 < 0 then bprp_bpsys2 = .;
  if bprp_bpsys3 < 0 then bprp_bpsys3 = .;
  if bprp_bpdia1 < 0 then bprp_bpdia1 = .;
  if bprp_bpdia2 < 0 then bprp_bpdia2 = .;
  if bprp_bpdia3 < 0 then bprp_bpdia3 = .;
  if bplog_armcirc < 0 then bplog_armcirc = '';
  if qctonom_standarddeviation1 < 0 then qctonom_standarddeviation1 = .;
  if qctonom_standarddeviation2 < 0 then qctonom_standarddeviation2 = .;
  if qctonom_standarddeviation3 < 0 then qctonom_standarddeviation3 = .;
  if qctonom_standarddeviation4 < 0 then qctonom_standarddeviation4 = .;
  if qctonom_pwv1 < 0 then qctonom_pwv1 = .;
  if qctonom_pwv2 < 0 then qctonom_pwv2 = .;
  if qctonom_pwv3 < 0 then qctonom_pwv3 = .;
  if qctonom_pwv4 < 0 then qctonom_pwv4 = .;
  if bloods_triglyc < 0 then bloods_triglyc = .;
  if bloods_serumgluc < 0 then bloods_serumgluc = .;
  if bloods_fibrinactivity < 0 then bloods_fibrinactivity = .;
  if bloods_urinemicro < 0 then bloods_urinemicro = .;
  if shq_waketimenightsleep < 0 then shq_waketimenightsleep = .;
  if elig_incl03osaahi < 0 then elig_incl03osaahi = .;
  if shq_minbedtime < 0 then shq_minbedtime = .;
  if shq_minbedtime6 < 0 then shq_minbedtime6 = .;
  if bloods_creactivepro < 0 then bloods_creactivepro = .;
  if qctonom_augix1 < 0 then qctonom_augix1 = .;
  if qctonom_augix2 < 0 then qctonom_augix2 = .;
  if qctonom_aix3 < 0 then qctonom_aix3 = .;
  if qctonom_aix4 < 0 then qctonom_aix4 = .;
  if elig_berlinscore < 0 then elig_berlinscore = .;
  if elig_excl09epworthscore < 0 then elig_excl09epworthscore = .;
  if anth_waistcm1 < 0 then anth_waistcm1 = .;
  if anth_waistcm2 < 0 then anth_waistcm2 = .;
  if anth_waistcm3 < 0 then anth_waistcm3 = .;
  if bplog_pulse< 0 then bplog_pulse = '';
  if shq_nap5min < 0 then shq_nap5min = '';
  if shq_diabetesage < 0 then shq_diabetesage = '';
  if shq_highbpage < 0 then shq_highbpage = '';
  if shq_highcholesage < 0 then shq_highcholesage = '';
  if shq_eversmokeagestart < 0 then shq_eversmokeagestart = '';
  if shq_eversmokeeachday < 1 then shq_eversmokeeachday = '';
  if shq_eversmokeoldstop < 0 then shq_eversmokeoldstop = '';
  if shq_smokenow < 1 then shq_smokenow = '';
  if shq_ovariesremov < 1 then shq_ovariesremov = '';
  if shq_hysterectomyage < 0 then shq_hysterectomyage = '';
  if shq_menstrualnumber < 0 then shq_menstrualnumber = '';
  if shq_hormonertagestart < 0 then shq_hormonertagestart = '';
  if shq_hormonertagestop < 0 then shq_hormonertagestop = '';
  if shq_nap5min6 < 0 then shq_nap5min6 = '';
  if shq_cigperday6 < 0 then shq_cigperday6 = '';
  if qctonom_map_pwv < 0 then qctonom_map_pwv = '';
  if qctonom_proximaldistance1 < 0 then qctonom_proximaldistance1 = '';
  if qctonom_proximaldistance2 < 0 then qctonom_proximaldistance2 = '';
  if qctonom_proximaldistance3 < 0 then qctonom_proximaldistance3 = '';
  if qctonom_proximaldista2_50e < 0 then qctonom_proximaldista2_50e = '';
  if qctonom_distaldistance1 < 0 then qctonom_distaldistance1 = '';
  if qctonom_distaldistance2 < 0 then qctonom_distaldistance2 = '';
  if qctonom_distaldistance3 < 0 then qctonom_distaldistance3 = '';
  if qctonom_distaldistanc2_f1a < 0 then qctonom_distaldistanc2_f1a = '';
  if qctonom_map1 < 0 then qctonom_map1 = '';
  if qctonom_augpress1 < 0 then qctonom_augpress1 = '';
  if qctonom_augpress2 < 0 then qctonom_augpress2 = '';
  if qctonom_augpress3 < 0 then qctonom_augpress3 = '';
  if qctonom_augpress4 < 0 then qctonom_augpress4 = '';

run;

data bamaster2;
  set bestair_master(in=export keep=elig_studyid
  prom_restless
  prom_satisfied
  prom_refreshing
  prom_difficulty
  prom_staying
  prom_sleeping
  prom_enough
  prom_quality
  prom_thingsdone
  prom_alert
  prom_tired
  prom_problems
  prom_concentrating
  prom_irritable
  prom_daytime
  prom_stayawake
  prom_sdscale
  prom_sriscale
  study_visit
  sarp_fallasleepdriving
  sarp_accident
  sarp_heartattack
  sarp_fallasleepday
  sarp_highbp
  sarp_diffconc
  sarp_depressed
  sarp_sexperformance
  semsa_highbp
  semsa_fallasleepdriving
  semsa_heartattack
  semsa_diffconcent
  semsa_fallasleepday
  semsa_fallasleepaccident
  semsa_depressed
  semsa_sexdesire
  semsa_decaccdriving
  semsa_snore
  semsa_lessalert
  semsa_jobperformance
  semsa_relationshipsigfrien
  semsa_incheartattack
  semsa_partsleep
  semsa_feelbetter
  semsa_active
  semsa_desire
  semsa_claustro
  semsa_readybed
  semsa_nightlytravel
  semsa_tightmask
  semsa_nosestuffy
  semsa_bother
  semsa_disturbpartner
  semsa_embarrassed
  semsa_paysomecost
  semsa_pr
  semsa_oe
  semsa_tse
  House_Light_METS
  House_Moderate_METS
  Household_Total_Minutes
  Household_Total_METS
  Lawn_Moderate_METS
  Lawn_Heavy_METS
  Lawn_Total_Minutes
  Lawn_Total_METS
  Care_Light_METS
  Care_Moderate_METS
  Care_Total_Minutes
  Care_Total_METS
  Walk_Travel_METS
  Walk_Exercise_METS
  Walk_Total_Minutes
  Walk_Total_METS
  Dancing_METS
  Team_Sports_METS
  Dual_Sports_METS
  Individual_Activities_METS
  Total_Sport_Minutes
  Total_Sport_METS
  Moderate_Conditioning_METS
  Heavy_Conditioning_METS
  Conditioning_Total_Minutes
  Conditioning_Total_METS
  Leisure_METS
  Leisure_Minutes
  Work_Light_Sitting_METS
  Work_Light_Standing_METS
  Work_Moderate_METS
  Work_Heavy_METS
  Work_Total_Minutes
  Work_Total_METS
  Moderate_Total_METS
  Vigorous_Total_METS
  Total_METS
  Daily_Mod_METS
  Daily_Vig_METS
  Daily_METS
  Total_Activity_Minutes
  Average_Hours_Activity
  bloods_totalchol
  bloods_triglyc
  bloods_hdlchol
  bloods_vldlcholcal
  bloods_ldlcholcalc
  bloods_hemoa1c
  bloods_creactivepro
  bloods_urinemicro
  bloods_serumgluc
  bloods_fibrinactivity
  bloods_urinecreatin
  nreadings
  nvalid
  pctvalid
  nsleep
  nwake
  sysallmean
  sysallsd
  sysallmin
  sysallmax
  diaallmean
  diaallsd
  diaallmin
  diaallmax
  mapallmean
  mapallsd
  mapallmin
  mapallmax
  map2allmean
  map2allsd
  map2allmin
  map2allmax
  ppallmean
  ppallsd
  ppallmin
  ppallmax
  heartallmean
  heartallsd
  heartallmin
  heartallmax
  syssleepmean
  syssleepsd
  syssleepmin
  syssleepmax
  diasleepmean
  diasleepsd
  diasleepmin
  diasleepmax
  mapsleepmean
  mapsleepsd
  mapsleepmin
  mapsleepmax
  map2sleepmean
  map2sleepsd
  map2sleepmin
  map2sleepmax
  ppsleepmean
  ppsleepsd
  ppsleepmin
  ppsleepmax
  heartsleepmean
  heartsleepsd
  heartsleepmin
  heartsleepmax
  syswakemean
  syswakesd
  syswakemin
  syswakemax
  diawakemean
  diawakesd
  diawakemin
  diawakemax
  mapwakemean
  mapwakesd
  mapwakemin
  mapwakemax
  map2wakemean
  map2wakesd
  map2wakemin
  map2wakemax
  ppwakemean
  ppwakesd
  ppwakemin
  ppwakemax
  heartwakemean
  heartwakesd
  heartwakemin
  heartwakemax
  timetotal
  sleeptotal
  totalmin
  sleepmin
  validsleep
  validwake
  validall
  mapsleepvalid
  syssleepvalid
  diasleepvalid
  mapwakevalid
  syswakevalid
  diawakevalid
  mapratiovalid
  sysratiovalid
  diaratiovalid
  mapnondip
  sysnondip
  dianondip
  sysswratio
  diaswratio
  mapswratio
  heartswratio
  sysnondipping
  dianondipping
  mapnondipping
  heartnondipping
  bp24mapweight
  bp24sbpweight
  bp24dbpweight
  sysdip
  diadip
  mapdip
  monitorqc_serialnumber
  monitorqc_wearandcollect
  monitorqc_wearandcollreas
  monitorqc_dataupload
  monitorqc_datauploadreas
  monitorqc_20hrs
  monitorqc_10readingsday
  monitorqc_4readingsnight
  monitorqc_percentsuccess
  LVEDD
  LVESD
  IVS
  PW
  LVEDV
  LVESV
  LVEF
  LVM
  LVMI
  LAV
  LAVI
  EWAVE
  EEPRIMELAT
  A4CRVEDA
  A4CRVESA
  RVFAC
  TVSA
  TRVEL
  PVR
  RVOTVTI
  PFO
  IASEP
  ess1
  ess2
  ess3
  ess4
  ess5
  ess6
  ess7
  ess8
  phq8_interest
  phq8_down_hopeless
  phq8_sleep
  phq8_tired
  phq8_appetite
  phq8_bad_failure
  phq8_troubleconcentrating
  phq8_movingslowly
  phq8_total
  sf36_gh01
  sf36_sfht
  sf36_pf01
  sf36_pf02
  sf36_pf03
  sf36_pf04
  sf36_pf05
  sf36_pf06
  sf36_pf07
  sf36_pf08
  sf36_pf09
  sf36_pf10
  sf36_rp01
  sf36_rp02
  sf36_rp03
  sf36_rp04
  sf36_re01
  sf36_re02
  sf36_re03
  sf36_sf01
  sf36_bp01
  sf36_bp02
  sf36_vt01
  sf36_mh01
  sf36_mh02
  sf36_mh03
  sf36_vt02
  sf36_mh04
  sf36_vt03
  sf36_mh05
  sf36_vt04
  sf36_sf02
  sf36_gh02
  sf36_gh03
  sf36_gh04
  sf36_gh05
  sf36_rawpf
  sf36_pf
  sf36_rawrp
  sf36_rp
  sf36_rawre
  sf36_re
  vitnum
  vitmean
  sf36_rawvt
  sf36_vt
  mhnum
  mhmean
  sf36_rawmh
  sf36_mh
  ghnum
  ghmean
  sf36_rawgh
  sf36_gh
  bpnum
  sf36_rawbp
  sf36_bp
  sfnum
  sfmean
  sf36_rawsf
  sf36_sf
  PF_Z
  RP_Z
  BP_Z
  GH_Z
  VT_Z
  SF_Z
  RE_Z
  MH_Z
  PF_norm
  RP_norm
  BP_norm
  GH_norm
  VT_norm
  SF_norm
  RE_norm
  MH_norm
  agg_phys
  agg_ment
  sf36_PCS
  sf36_MCS
  rand_siteid
  rand_treatmentarm
  qctonom_pwv1
  qctonom_pwv2
  qctonom_pwv3
  qctonom_pwv4
  qctonom_augix1
  qctonom_augix2
  qctonom_aix3
  qctonom_aix4
  avgpwv
  avgaugix
  essdo_you_snore
  essyour_snoring_is
  esshow_often_do_you_snore
  esshas_your_snoring_ever
  ess_quit_breathing_sleep
  ess_fatigued_tired
  ess_waking_time_tired
  ess_sleeping_driving
  ess_how_often
  ess_blood_pressure
  ess_height1
  ess_height2
  ess_weight
  ess_bmi
  ess_redcap_calc_berscore
  ess_eligibility
  embqs_study_passed
  embqs_first_pass_ahi
  embqs_ekg_signal
  embqs_cannula_flow_signal
  embqs_thoracic_signal
  embqs_abdomen_signal
  embqs_oximetry_signal
  embqs_flow_signal
  embqs_ekg_qcode
  embqs_cannula_flow_qcode
  embqs_thoracic_qcode
  embqs_abdomen_qcode
  embqs_oximetry_qcode
  embqs_flow_qcode
  embqs_overall_quality
  embqs_alert
  embqs_reason___1
  embqs_heart_ecg___1
  embqs_heart_ecg___2
  embqs_heart_ecg___3
  embqs_heart_ecg___4
  embqs_heart_ecg___5
  embqs_heart_ecg___6
  elig_source
  elig_sourceother
  elig_incl01agerange
  elig_incl02infconsent
  elig_incl03osa
  elig_incl03osaahi
  elig_incl03osadiag
  elig_incl03osa3
  elig_incl03osa4
  elig_incl04cvd
  elig_incl04ami
  elig_incl04bsten
  elig_incl04cstroke
  elig_incl04ddiabetes
  elig_incl04dhyper
  elig_incl04malesex
  elig_incl04fbmi
  elig_incl04gcholes
  elig_incl04hsmoking
  elig_incl04ediabetes
  elig_excl01ejec
  elig_excl02miproc
  elig_excl03poorhyper
  elig_excl04strokeimp
  elig_excl05medprob
  elig_excl06oxsat
  elig_excl07pap
  elig_excl07papstatus
  elig_excl08sixhrsbed
  elig_excl09epworth
  elig_excl09epworthscore
  elig_berlin
  elig_berlinscore
  elig_excl10driver
  elig_excl11csa
  elig_excl12refusal
  elig_excl14
  elig_meetstatus
  elig_partstatus
  elig_notinterested
  elig_toobusy
  elig_misswork
  elig_transportation
  elig_distance
  elig_extratests
  elig_passive
  elig_onlycpap
  elig_otherreason
  elig_otherreasonspecify
  elig_physiciandoesnotgrant
  elig_gender
  elig_raceamerind
  elig_raceasian
  elig_racehawaiian
  elig_raceblack
  elig_racewhite
  elig_raceother
  elig_raceotherspecify
  elig_ethnicity
  elig_education
  journal_averagebedtime
  journal_averagewaketime
  journal_dayscompleted
  journal_daysmaskused
  journal_daysstripsused
  rand_cvdstatus
  rand_diagtype
  rand_manufacturer
  anth_heightcm1
  anth_heightcm2
  anth_heightcm3
  avgheightcm_atbaseline
  avgheightcm
  anth_weightkg
  anth_neckcm1
  anth_neckcm2
  anth_neckcm3
  avgneckcm
  anth_waistcm1
  anth_waistcm2
  anth_waistcm3
  anth_hipcm1
  anth_hipcm2
  anth_hipcm3
  bprp_bpsys1
  bprp_bpdia1
  bprp_bpsys2
  bprp_bpdia2
  bprp_bpsys3
  bprp_bpdia3
  avgseatedsystolic
  avgseateddiastolic
  bprp_bpsite
  bprp_cuffsize
  bprp_rp1
  bprp_rp2
  bprp_rp3
  avgseatedpulse
  bpj_78am
  bpj_89am
  bpj_910am
  bpj_1011am
  bpj_1112pm
  bpj_121pm
  bpj_12pm
  bpj_23pm
  bpj_34pm
  bpj_45pm
  bpj_56pm
  bpj_67pm
  bpj_78pm
  bpj_89pm
  bpj_910pm
  bpj_1011pm
  bpj_1112am
  bpj_121am
  bpj_12am
  bpj_23am
  bpj_34am
  bpj_45am
  bpj_56am
  bpj_67am
  bpj_timebed
  bpj_timewake
  bplog_attachtime
  bplog_removaltime
  bplog_manualbpr
  bplog_manualbpl
  bplog_armcirc
  bplog_cuffsize
  bplog_monitorbpr
  bplog_monitorbpl
  bplog_pulse
  cal_a01
  cal_a02
  cal_a03
  cal_a04
  cal_a05
  cal_a06
  cal_a07
  cal_a08
  cal_a09
  cal_a10
  cal_a11
  cal_b01
  cal_b02
  cal_b03
  cal_b04
  cal_b05
  cal_b06
  cal_b07
  cal_b08
  cal_b09
  cal_b10
  cal_b11
  cal_b12
  cal_b13
  cal_c01
  cal_c02
  cal_c03
  cal_c04
  cal_c05
  cal_c06
  cal_c07
  cal_c08
  cal_c09
  cal_c10
  cal_c11
  cal_d01
  cal_d02
  cal_d03
  cal_d04
  cal_d05
  cal_d06
  cal_d07
  cal_d08
  cal_d09
  cal_d10
  cal_d11
  cal_d12
  cal_d13
  cal_d14
  cal_d15
  cal_d16
  cal_d17
  cal_d18
  cal_d19
  cal_d20
  cal_d21
  cal_d22
  cal_d22s
  cal_d23
  cal_d23s
  cal_ds01
  cal_ds01p
  cal_ds02
  cal_ds02p
  cal_ds03
  cal_ds03p
  cal_ds04
  cal_ds04p
  cal_ds05
  cal_ds05p
  cal_e01
  cal_e02
  cal_e03
  cal_e04
  cal_e05
  cal_e06
  cal_e07
  cal_e08
  cal_e09
  cal_e10
  cal_e11
  cal_e12
  cal_e13
  cal_e14
  cal_e15
  cal_e16
  cal_e17
  cal_e18
  cal_e19
  cal_e20
  cal_e21
  cal_e22
  cal_e23
  cal_e24
  cal_e25
  cal_e26
  cal_e27
  cal_e27s
  cal_e28
  cal_e28s
  cal_es01
  cal_es01p
  cal_es02
  cal_es02p
  cal_es03
  cal_es03p
  cal_es04
  cal_es04p
  cal_es05
  cal_es05p
  cal_f01
  cal_f02
  cpappres_arm
  cpappres_originaltx
  cpappres_randtx
  cpappres_titration
  cpappres_studytype
  cpappres_masktype
  cpappres_maskbrand
  cpappres_masksize
  cpappres_chinstrap
  cpappres_ramp
  cpappres_c_flex
  phq8_difficulty
  shq_hrspnightweek
  shq_hrspnightweekends
  shq_minbedtime
  shq_waketimenightsleep
  shq_gotobedweek
  shq_gotobedweekends
  shq_wakeweekdays
  shq_wakeweekends
  shq_nap5min
  shq_trasleep
  shq_wokeupsev
  shq_wokeupearly
  shq_trbacktosleep
  shq_trpills
  shq_typnightsleep
  shq_unrestedday
  shq_sleepyday
  shq_notenoughsleep
  shq_feelingbestgetup
  shq_wokentired
  shq_timefeeltired
  shq_timefeelingbest
  shq_morevetypes
  shq_worksched
  shq_sitread
  shq_watchingtv
  shq_sitinactive
  shq_ridingforhour
  shq_lyingdown
  shq_sittalk
  shq_afterlunch
  shq_stoppedcar
  shq_driving
  shq_eversnored
  shq_snorenow
  shq_stopbreath
  shq_stopbreathfrq
  shq_snorted
  shq_snortingfrq
  shq_coughing
  shq_chestpain
  shq_shortnessbreath
  shq_sweats
  shq_noise
  shq_pain
  shq_heartburn
  shq_cramps
  shq_needbathroom
  shq_legsdiscomfort
  shq_legsdiscomfortfrq
  shq_legsdiscomfortrest
  shq_legsdiscomfortday
  shq_allergies
  shq_allergiesskintest
  shq_anxietydisorder
  shq_asthma
  shq_add_adhd
  shq_cancer
  shq_prostatecancer
  shq_breastcancer
  shq_lungcancer
  shq_coloncancer
  shq_bloodcancer
  shq_othercancer
  shq_chronicbronchitis
  shq_depression
  shq_diabetes
  shq_diabetesmed
  shq_diabetesage
  shq_diabetesinsulin
  shq_emphysema
  shq_epilepsy
  shq_gerd
  shq_highbp
  shq_highbpmed
  shq_highbpage
  shq_highcholes
  shq_highcholesmed
  shq_highcholesage
  shq_ibm
  shq_insomnia
  shq_migraine
  shq_ms
  shq_restlesslegs
  shq_ra
  shq_sinus
  shq_other1
  shq_other2
  shq_famparheart
  shq_famparstroke
  shq_famparapnea
  shq_nosib
  shq_famsibheart
  shq_famsibstroke
  shq_famsibapnea
  shq_nochi
  shq_famchiheart
  shq_famchistroke
  shq_famchiapnea
  shq_eversmoked
  shq_eversmokeagestart
  shq_eversmokeeachday
  shq_eversmokeoldstop
  shq_smokedlast4weeks
  shq_smokenow
  shq_drinkcaffeine
  shq_consumealcohol
  shq_numberdrinks
  shq_drinkbeforebedtime
  shq_painlegswalk
  shq_painlegswalkstill
  shq_painlegswalkuphill
  shq_painlegswalkpace
  shq_painlegswalkstandstill
  shq_painlegswalklocbuttock
  shq_painlegswalkloccalf
  shq_painlegswalklocfeet
  shq_painlegswalklocham
  shq_painlegswalklocjoints
  shq_painlegswalklocrad
  shq_painlegswalklocshins
  shq_painlegswalklocthigh
  shq_swelling
  shq_swellingdaynight
  shq_awktrbbreathing
  shq_pillowsbreathe
  shq_painchest
  shq_pressurechest
  shq_pressurechestuphill
  shq_pressurechestordinary
  shq_pressurechestwalking
  shq_pressurecheststill
  shq_pressurechesthowsoon
  shq_pressurechestdoctor
  shq_pressurechestdoctsay
  shq_menopause
  shq_ovaries
  shq_ovariesage
  shq_ovariesremov
  shq_hysterectomy
  shq_hysterectomyage
  shq_menstrual
  shq_menstrualnumber
  shq_hormonert
  shq_hormonertage
  shq_hormonertagestart
  shq_hormonertagestop
  shq_typeofhormonert
  shq_typeofhormonertspecify
  shq_hrspnightweek6
  shq_hrspnightweekends6
  shq_minbedtime6
  shq_waketimenightsleep6
  shq_gotobedweek6
  shq_gotobedweekends6
  shq_wakeweekdays6
  shq_wakeweekends6
  shq_nap5min6
  shq_trasleep6
  shq_wokeupsev6
  shq_wokeupearly6
  shq_trbacktosleep6
  shq_trpills6
  shq_typnightsleep6
  shq_unrestedday6
  shq_sleepyday6
  shq_notenoughsleep6
  shq_feelingbestgetup6
  shq_wokentired6
  shq_timefeeltired6
  shq_timefeelingbest6
  shq_morevetypes6
  shq_worksched6
  shq_sitread6
  shq_watchingtv6
  shq_sitinactive6
  shq_ridingforhour6
  shq_lyingdown6
  shq_sittalk6
  shq_afterlunch6
  shq_stoppedcar6
  shq_driving6
  shq_haveyousnored6
  shq_snorenow6
  shq_stopbreath6
  shq_stopbreathfrq6
  shq_snorted6
  shq_snortingfrq6
  shq_coughing6
  shq_chestpain6
  shq_shortnessbreath6
  shq_sweats6
  shq_noise6
  shq_pain6
  shq_heartburn6
  shq_cramps6
  shq_needbathroom6
  shq_legsdiscomfort6
  shq_legsdiscomfortfrq6
  shq_legsdiscomfortrest6
  shq_legsdiscomfortday6
  shq_cigperday6
  shq_drinkcaffeine6
  shq_numberdrinks6
  shq_drinkbeforebedtime6
  shq_painlegswalk6
  shq_painlegswalkstill6
  shq_painlegswalkuphill6
  shq_painlegswalkpace6
  shq_painlegswalkstandstill6
  shq_painlegswalklocbuttock6
  shq_painlegswalkloccalf6
  shq_painlegswalklocfeet6
  shq_painlegswalklocham6
  shq_painlegswalklocjoints6
  shq_painlegswalklocrad6
  shq_painlegswalklocshins6
  shq_painlegswalklocthigh6
  shq_swelling6
  shq_swellingdaynight6
  shq_awktrbbreathing6
  shq_pillowsbreathe6
  shq_painchest6
  shq_pressurechest6
  shq_pressurechestuphill6
  shq_pressurechestordinary6
  shq_pressurechestwalking6
  shq_pressurecheststill6
  shq_pressurechesthowsoon6
  shq_pressurechestdoctor6
  shq_pressurechestdoctsay6
  qctonom_bp_pwv
  qctonom_map_pwv
  qctonom_proximaldistance1
  qctonom_distaldistance1
  qctonom_qcnumbersred1
  qctonom_standdev1
  qctonom_standarddeviation1
  qctonom_proximaldistance2
  qctonom_distaldistance2
  qctonom_qcnumbersred2
  qctonom_standdev2
  qctonom_standarddeviation2
  qctonom_pwv1pwv2
  qctonom_proximaldistance3
  qctonom_distaldistance3
  qctonom_qcnumbersred3
  qctonom_standdev3
  qctonom_standarddeviation3
  qctonom_proximaldista2_50e
  qctonom_distaldistanc2_f1a
  qctonom_qcnumbersred32_d69
  qctonom_standdev4
  qctonom_standarddeviation4
  qctonom_bp
  qctonom_map1
  qctonom_operatorindex1
  qctonom_specifyoi1
  qctonom_qcnumbersredpwa1
  qctonom_notes1
  qctonom_specifynotes1
  qctonom_augpress1
  qctonom_operatorindex2
  qctonom_specifyoi2
  qctonom_qcnumbersredpwa2
  qctonom_notes2
  qctonom_specifynotes2
  qctonom_augpress2
  qctonom_aorticaug
  qctonom_operatorindex3
  qctonom_specifyoi3
  qctonom_qcnumbersredpwa3
  qctonom_notes3
  qctonom_specifynotes3
  qctonom_augpress3
  qctonom_operatorindex4
  qctonom_specifyoi4
  qctonom_qcnumbersredpwa4
  qctonom_notes4
  qctonom_specifynotes4
  qctonom_augpress4
  twpas_light_yn
  twpas_light_days
  twpas_light_hrs
  twpas_light_min
  twpas_moderate_yn
  twpas_moderate_days
  twpas_moderate_hrs
  twpas_moderate_min
  twpas_lawnmod_yn
  twpas_lawnmod_days
  twpas_lawnmod_hrs
  twpas_lawnmod_min
  twpas_lawnheavy_yn
  twpas_lawnheavy_days
  twpas_lawnheavy_hrs
  twpas_lawnheavy_min
  twpas_carelight_yn
  twpas_carelight_days
  twpas_carelight_hrs
  twpas_carelight_min
  twpas_caremod_yn
  twpas_caremod_days
  twpas_caremod_hrs
  twpas_caremod_min
  twpas_walkget_yn
  twpas_walkget_days
  twpas_walkget_hrs
  twpas_walkget_min
  twpas_walkex_yn
  twpas_walkex_days
  twpas_walkex_hrs
  twpas_walkex_min
  twpas_dancing_yn
  twpas_dancing_days
  twpas_dancing_hrs
  twpas_dancing_min
  twpas_teamsports_yn
  twpas_teamsports_days
  twpas_teamsports_hrs
  twpas_teamsports_min
  twpas_dualsports_yn
  twpas_dualsports_days
  twpas_dualsports_hrs
  twpas_dualsports_min
  twpas_indivact_yn
  twpas_indivact_days
  twpas_indivact_hrs
  twpas_indivact_min
  twpas_condmod_yn
  twpas_condmod_days
  twpas_condmod_hrs
  twpas_condmod_min
  twpas_condheavy_yn
  twpas_condheavy_days
  twpas_condheavy_hrs
  twpas_condheavy_min
  twpas_sitrecline_yn
  twpas_sitrecline_days
  twpas_sitrecline_hrs
  twpas_sitrecline_min
  twpas_worklightsit_yn
  twpas_worklightsit_days
  twpas_worklightsit_hrs
  twpas_worklightstand_yn
  twpas_worklightstand_days
  twpas_worklightstand_hrs
  twpas_workmod_yn
  twpas_workmod_days
  twpas_workmod_hrs
  twpas_workheavy_yn
  twpas_workheavy_days
  twpas_workheavy_hrs
  twpas_usualpace
  twomonth_chestpain
  twomonth_shortnessofbreath
  twomonth_sleepiness
  twomonth_healthprofess
  twomonth_overnightstay
  twomonth_docrec
  twomonth_conditions
  twomonth_missednights
  twomonth_maskfit
  twomonth_headgear
  twomonth_maskleaks
  twomonth_pressure
  twomonth_nasalcongestion
  twomonth_throatdryness
  twomonth_sinus
  twomonth_noise
  twomonth_eyeirrit
  twomonth_skinirrit
  twomonth_other
  twomonth_nasalstrips
  twomonth_sleepreg
  twomonth_positionchange
  twomonth_changestime
  twomonth_recipes
  twomonth_exercise
  phonechanges_initiated_by
  phonechanges_call_reason___1
  phonechanges_call_reason___2
  phonechanges_call_reason___3
  phonechanges_call_reason___4
  phonechanges_call_reason___5
  phonechanges_call_reason___6
  phonechanges_call_reason___7
  phonechanges_reasonother
  phonechange_resolved___1
  phonechange_resolved___2
  phonechange_resolved___3
  phonechange_resolved___4
  phonechanges_resolother
  phonechanges_changed___1
  phonechanges_changed___2
  phonechanges_changed___3
  phonechanges_changed___4
  phonechanges_changesvp
  phonechanges_changesvc
  phonechanges_amounttime
  treatdisc_reason
  treatdisc_crossover
  treatdisc_crossreason
  sc_primaryreason
  sc_primaryreason_other
  cbt1_rate1
  cbt1_video1
  cbt1_video2
  cbt1_consequence
  cbt1_holdbreath
  cbt1_oxygen1
  cbt1_oxygen2
  cbt1_oxygen3
  cbt1_concerns
  cbt1_plan
  cbt1_motivation2
  cbt1_sleepy
  cbt1_sideeffects
  cbt1_healthier
  cbt1_sleepbetter
  cbt1_discomfort
  cbt1_concentration
  cbt1_sleeping
  cbt1_nightly
  cbt1_worthwhile
  cbt1_getinway
  cbt1_assistance
  cbt1_regularly1
  cbt1_regularly2
  cbt1_regularly3
  cbt1_regularly4
  cbt1_comfortable
  cbt2_thoughts
  cbt2_initial
  cbt2_use
  cbt2_difficult
  cbt2_benefits
  cbt2_threemos
  cbt2_sixmos
  cbt2_sixmosinfreq
  cbt2_video
  cbt2_spendtime
  cbt2_cpaphelp
  cbt2_cpaphinder
  cbt2_chancesnocpap
  cbt2_chancescpap
  cbt2_motivated1
  cbt2_motivated2
  cbt2_motivated3
  cbt2_difficultregularly
  cbt2_easier
  cbtp1_callnum
  cbtp1_week
  cbtp1_occur
  cbtp1_nooccur
  cbtp1_lastcall
  cbtp1_sleeplast
  cbtp1_paplast
  cbtp1_usedpastweek
  cbtp1_highestnumofhours
  cbtp1_lowestnumofhours
  cbtp1_papdifference
  cbtp1_usepapfeel
  cbtp1_keepuse
  cbtp1_gotinway
  cbtp1_notusepapfeel
  cbtp1_handlechallenges
  cbtp1_monitorpap
  cbtp1_thoughtspap
  cbtp1_motivated
  cbtp1_easiertougher
  cbtp1_confidence
  cbtp1_notlower
  cbtp1_what8910
  cbtp1_situations1
  cbtp1_siuations2
  cbtp1_situations3
  cbtp1_situations4
  cbtp1_situations5
  cbtp1_situations6
  cbtp1_situations7
  cbtp1_situations8
  cbtp1_helpconfidence
  cbtp1_dealwithconcern
  cbtp1_developplan
  cbtp1_overcome1
  cbtp1_overcome2
  cbtp1_overcome3
  cbtp1_managesituation
  cbtp1_helppapreg
  cbtp2_callnum
  cbtp2_week
  cbtp2_occur
  cbtp2_nooccur
  cbtp2_lastcall
  cbtp2_sleeplast
  cbtp2_paplast
  cbtp2_usedpastweek
  cbtp2_highestnumofhours
  cbtp2_lowestnumofhours
  cbtp2_papdifference
  cbtp2_usepapfeel
  cbtp2_keepuse
  cbtp2_gotinway
  cbtp2_notusepapfeel
  cbtp2_handlechallenges
  cbtp2_monitorpap
  cbtp2_thoughtspap
  cbtp2_motivated
  rename=(elig_studyid=studyid)
  rename=(prom_restless=promrestless)
  rename=(prom_satisfied=promsatisfied)
  rename=(prom_refreshing=promrefreshing)
  rename=(prom_difficulty=promdifficulty)
  rename=(prom_staying=promstaying)
  rename=(prom_sleeping=promsleeping)
  rename=(prom_enough=promenough)
  rename=(prom_quality=promquality)
  rename=(prom_thingsdone=promthingsdone)
  rename=(prom_alert=promalert)
  rename=(prom_tired=promtired)
  rename=(prom_problems=promproblems)
  rename=(prom_concentrating=promconcentrating)
  rename=(prom_irritable=promirritable)
  rename=(prom_daytime=promdaytime)
  rename=(prom_stayawake=promstayawake)
  rename=(prom_sdscale=promsdscale)
  rename=(prom_sriscale=promsriscale)
  rename=(study_visit=studyvisit)
  rename=(sarp_fallasleepdriving=sarpdriving)
  rename=(sarp_accident=sarpaccident)
  rename=(sarp_heartattack=sarpheartattack)
  rename=(sarp_fallasleepday=sarpasleepday)
  rename=(sarp_highbp=sarphighbp)
  rename=(sarp_diffconc=sarpdiffconc)
  rename=(sarp_depressed=sarpdepressed)
  rename=(sarp_sexperformance=sarpsexperformance)
  rename=(semsa_highbp=semsahighbp)
  rename=(semsa_fallasleepdriving=semsadriving)
  rename=(semsa_heartattack=semsaheartattack)
  rename=(semsa_diffconcent=semsadiffconcen)
  rename=(semsa_fallasleepday=semsaasleepday)
  rename=(semsa_fallasleepaccident=semsaaccident)
  rename=(semsa_depressed=semsadepressed)
  rename=(semsa_sexdesire=semsasexdesire)
  rename=(semsa_decaccdriving=semsadecaccident)
  rename=(semsa_snore=semsasnore)
  rename=(semsa_lessalert=semsalessalert)
  rename=(semsa_jobperformance=semsajob)
  rename=(semsa_relationshipsigfrien=semsarelationship)
  rename=(semsa_incheartattack=semsaincheartattack)
  rename=(semsa_partsleep=semsapartsleep)
  rename=(semsa_feelbetter=semsafeelbetter)
  rename=(semsa_active=semsaactive)
  rename=(semsa_desire=semsadesire)
  rename=(semsa_claustro=semsaclaustro)
  rename=(semsa_readybed=semsareadybed)
  rename=(semsa_nightlytravel=semsatravel)
  rename=(semsa_tightmask=semsatight)
  rename=(semsa_nosestuffy=semsanose)
  rename=(semsa_bother=semsabother)
  rename=(semsa_disturbpartner=semsadisturb)
  rename=(semsa_embarrassed=semsaembarrassed)
  rename=(semsa_paysomecost=semsacost)
  rename=(semsa_pr=semsapr)
  rename=(semsa_oe=semsaoe)
  rename=(semsa_tse=semsatse)
  rename=(House_Light_METS=houselightmet)
  rename=(House_Moderate_METS=housemodmet)
  rename=(Household_Total_Minutes=housetotalmin)
  rename=(Household_Total_METS=housetotalmet)
  rename=(Lawn_Moderate_METS=lawnmodmet)
  rename=(Lawn_Heavy_METS=lawnheavymet)
  rename=(Lawn_Total_Minutes=lawntotalmin)
  rename=(Lawn_Total_METS=lawntotalmet)
  rename=(Care_Light_METS=carelightmet)
  rename=(Care_Moderate_METS=caremodmet)
  rename=(Care_Total_Minutes=caretotalmin)
  rename=(Care_Total_METS=caretotalmet)
  rename=(Walk_Travel_METS=walktravelmet)
  rename=(Walk_Exercise_METS=walkexercisemet)
  rename=(Walk_Total_Minutes=walktotaltime)
  rename=(Walk_Total_METS=walktotalmet)
  rename=(Dancing_METS=dancingmet)
  rename=(Team_Sports_METS=teamsportmet)
  rename=(Dual_Sports_METS=dualsportmet)
  rename=(Individual_Activities_METS=indivactmet)
  rename=(Total_Sport_Minutes=sporttotalmin)
  rename=(Total_Sport_METS=sporttotalmet)
  rename=(Moderate_Conditioning_METS=condmodmet)
  rename=(Heavy_Conditioning_METS=condheavymet)
  rename=(Conditioning_Total_Minutes=condtotaltime)
  rename=(Conditioning_Total_METS=condtotalmet)
  rename=(Leisure_METS=leisuremet)
  rename=(Leisure_Minutes=leisuretotalmin)
  rename=(Work_Light_Sitting_METS=worksittingmet)
  rename=(Work_Light_Standing_METS=workstandingmet)
  rename=(Work_Moderate_METS=workmodmet)
  rename=(Work_Heavy_METS=workheavymet)
  rename=(Work_Total_Minutes=worktotaltime)
  rename=(Work_Total_METS=worktotalmet)
  rename=(Moderate_Total_METS=totalmodmet)
  rename=(Vigorous_Total_METS=totalvigmet)
  rename=(Total_METS=totalmet)
  rename=(Daily_Mod_METS=dailymodmet)
  rename=(Daily_Vig_METS=dailyvigmet)
  rename=(Daily_METS=dailymet)
  rename=(Total_Activity_Minutes=totalactivitymin)
  rename=(Average_Hours_Activity=averagehoursactivity)
  rename=(bloods_totalchol=totalchol)
  rename=(bloods_triglyc=triglyc)
  rename=(bloods_hdlchol=hdlchol)
  rename=(bloods_vldlcholcal=vldlchol)
  rename=(bloods_ldlcholcalc=ldlcholcalc)
  rename=(bloods_hemoa1c=hemoa1c)
  rename=(bloods_creactivepro=creactivepro)
  rename=(bloods_urinemicro=urinemicro)
  rename=(bloods_serumgluc=serumgluc)
  rename=(bloods_fibrinactivity=fibrinactivity)
  rename=(bloods_urinecreatin=urinecreatin)
  rename=(nreadings=nreadings)
  rename=(nvalid=nvalid)
  rename=(pctvalid=pctvalid)
  rename=(nsleep=nsleep)
  rename=(nwake=nwake)
  rename=(sysallmean=sysallmean)
  rename=(sysallsd=sysallsd)
  rename=(sysallmin=sysallmin)
  rename=(sysallmax=sysallmax)
  rename=(diaallmean=diaallmean)
  rename=(diaallsd=diaallsd)
  rename=(diaallmin=diaallmin)
  rename=(diaallmax=diaallmax)
  rename=(mapallmean=mapallmean)
  rename=(mapallsd=mapallsd)
  rename=(mapallmin=mapallmin)
  rename=(mapallmax=mapallmax)
  rename=(map2allmean=map2allmean)
  rename=(map2allsd=map2allsd)
  rename=(map2allmin=map2allmin)
  rename=(map2allmax=map2allmax)
  rename=(ppallmean=ppallmean)
  rename=(ppallsd=ppallsd)
  rename=(ppallmin=ppallmin)
  rename=(ppallmax=ppallmax)
  rename=(heartallmean=heartallmean)
  rename=(heartallsd=heartallsd)
  rename=(heartallmin=heartallmin)
  rename=(heartallmax=heartallmax)
  rename=(syssleepmean=syssleepmean)
  rename=(syssleepsd=syssleepsd)
  rename=(syssleepmin=syssleepmin)
  rename=(syssleepmax=syssleepmax)
  rename=(diasleepmean=diasleepmean)
  rename=(diasleepsd=diasleepsd)
  rename=(diasleepmin=diasleepmin)
  rename=(diasleepmax=diasleepmax)
  rename=(mapsleepmean=mapsleepmean)
  rename=(mapsleepsd=mapsleepsd)
  rename=(mapsleepmin=mapsleepmin)
  rename=(mapsleepmax=mapsleepmax)
  rename=(map2sleepmean=map2sleepmean)
  rename=(map2sleepsd=map2sleepsd)
  rename=(map2sleepmin=map2sleepmin)
  rename=(map2sleepmax=map2sleepmax)
  rename=(ppsleepmean=ppsleepmean)
  rename=(ppsleepsd=ppsleepsd)
  rename=(ppsleepmin=ppsleepmin)
  rename=(ppsleepmax=ppsleepmax)
  rename=(heartsleepmean=heartsleepmean)
  rename=(heartsleepsd=heartsleepsd)
  rename=(heartsleepmin=heartsleepmin)
  rename=(heartsleepmax=heartsleepmax)
  rename=(syswakemean=syswakemean)
  rename=(syswakesd=syswakesd)
  rename=(syswakemin=syswakemin)
  rename=(syswakemax=syswakemax)
  rename=(diawakemean=diawakemean)
  rename=(diawakesd=diawakesd)
  rename=(diawakemin=diawakemin)
  rename=(diawakemax=diawakemax)
  rename=(mapwakemean=mapwakemean)
  rename=(mapwakesd=mapwakesd)
  rename=(mapwakemin=mapwakemin)
  rename=(mapwakemax=mapwakemax)
  rename=(map2wakemean=map2wakemean)
  rename=(map2wakesd=map2wakesd)
  rename=(map2wakemin=map2wakemin)
  rename=(map2wakemax=map2wakemax)
  rename=(ppwakemean=ppwakemean)
  rename=(ppwakesd=ppwakesd)
  rename=(ppwakemin=ppwakemin)
  rename=(ppwakemax=ppwakemax)
  rename=(heartwakemean=heartwakemean)
  rename=(heartwakesd=heartwakesd)
  rename=(heartwakemin=heartwakemin)
  rename=(heartwakemax=heartwakemax)
  rename=(timetotal=timetotal)
  rename=(sleeptotal=sleeptotal)
  rename=(totalmin=totalmin)
  rename=(sleepmin=sleepmin)
  rename=(validsleep=validsleep)
  rename=(validwake=validwake)
  rename=(validall=validall)
  rename=(mapsleepvalid=mapsleepvalid)
  rename=(syssleepvalid=syssleepvalid)
  rename=(diasleepvalid=diasleepvalid)
  rename=(mapwakevalid=mapwakevalid)
  rename=(syswakevalid=syswakevalid)
  rename=(diawakevalid=diawakevalid)
  rename=(mapratiovalid=mapratiovalid)
  rename=(sysratiovalid=sysratiovalid)
  rename=(diaratiovalid=diaratiovalid)
  rename=(mapnondip=mapnondip)
  rename=(sysnondip=sysnondip)
  rename=(dianondip=dianondip)
  rename=(sysswratio=sysswratio)
  rename=(diaswratio=diaswratio)
  rename=(mapswratio=mapswratio)
  rename=(heartswratio=heartswratio)
  rename=(sysnondipping=sysnondipping)
  rename=(dianondipping=dianondipping)
  rename=(mapnondipping=mapnondipping)
  rename=(heartnondipping=heartnondipping)
  rename=(bp24mapweight=bp24mapweight)
  rename=(bp24sbpweight=bp24sbpweight)
  rename=(bp24dbpweight=bp24dbpweight)
  rename=(sysdip=sysdip)
  rename=(diadip=diadip)
  rename=(mapdip=mapdip)
  rename=(monitorqc_serialnumber=serialnumber)
  rename=(monitorqc_wearandcollect=wearandcollect)
  rename=(monitorqc_wearandcollreas=wearandcollreas)
  rename=(monitorqc_dataupload=dataupload)
  rename=(monitorqc_datauploadreas=datauploadreas)
  rename=(monitorqc_20hrs=twentyhrs)
  rename=(monitorqc_10readingsday=tenreadingsday)
  rename=(monitorqc_4readingsnight=fourreadingsnight)
  rename=(monitorqc_percentsuccess=percentsuccess)
  rename=(LVEDD=lvedd)
  rename=(LVESD=lvesd)
  rename=(IVS=ivs)
  rename=(PW=pw)
  rename=(LVEDV=lvedv)
  rename=(LVESV=lvesv)
  rename=(LVEF=lvef)
  rename=(LVM=lvm)
  rename=(LVMI=lvmi)
  rename=(LAV=lav)
  rename=(LAVI=lavi)
  rename=(EWAVE=ewave)
  rename=(EEPRIMELAT=eeprimelat)
  rename=(A4CRVEDA=a4crveda)
  rename=(A4CRVESA=a4crvesa)
  rename=(RVFAC=rvfac)
  rename=(TVSA=tvsa)
  rename=(TRVEL=trvel)
  rename=(PVR=pvr)
  rename=(RVOTVTI=rvotvti)
  rename=(PFO=pfo)
  rename=(IASEP=iasep)
  rename=(ess1=esssitread)
  rename=(ess2=esstv)
  rename=(ess3=esspublic)
  rename=(ess4=esspassenger)
  rename=(ess5=esslying)
  rename=(ess6=esssittalk)
  rename=(ess7=esslunch)
  rename=(ess8=esstraffic)
  rename=(phq8_interest=phqinterest)
  rename=(phq8_down_hopeless=phqhopeless)
  rename=(phq8_sleep=phqsleep)
  rename=(phq8_tired=phqtired)
  rename=(phq8_appetite=phqappetite)
  rename=(phq8_bad_failure=phqfailure)
  rename=(phq8_troubleconcentrating=phqtroubleconc)
  rename=(phq8_movingslowly=phqmovingslow)
  rename=(phq8_total=phqtotal)
  rename=(sf36_gh01=gh01)
  rename=(sf36_sfht=sfht)
  rename=(sf36_pf01=pf01)
  rename=(sf36_pf02=pf02)
  rename=(sf36_pf03=pf03)
  rename=(sf36_pf04=pf04)
  rename=(sf36_pf05=pf05)
  rename=(sf36_pf06=pf06)
  rename=(sf36_pf07=pf07)
  rename=(sf36_pf08=pf08)
  rename=(sf36_pf09=pf09)
  rename=(sf36_pf10=pf10)
  rename=(sf36_rp01=rp01)
  rename=(sf36_rp02=rp02)
  rename=(sf36_rp03=rp03)
  rename=(sf36_rp04=rp04)
  rename=(sf36_re01=re01)
  rename=(sf36_re02=re02)
  rename=(sf36_re03=re03)
  rename=(sf36_sf01=sf01)
  rename=(sf36_bp01=bp01)
  rename=(sf36_bp02=bp02)
  rename=(sf36_vt01=vt01)
  rename=(sf36_mh01=mh01)
  rename=(sf36_mh02=mh02)
  rename=(sf36_mh03=mh03)
  rename=(sf36_vt02=vt02)
  rename=(sf36_mh04=mh04)
  rename=(sf36_vt03=vt03)
  rename=(sf36_mh05=mh05)
  rename=(sf36_vt04=vt04)
  rename=(sf36_sf02=sf02)
  rename=(sf36_gh02=gh02)
  rename=(sf36_gh03=gh03)
  rename=(sf36_gh04=gh04)
  rename=(sf36_gh05=gh05)
  rename=(sf36_rawpf=pfraw)
  rename=(sf36_pf=pf)
  rename=(sf36_rawrp=rpraw)
  rename=(sf36_rp=rp)
  rename=(sf36_rawre=reraw)
  rename=(sf36_re=re)
  rename=(vitnum=vitnum)
  rename=(vitmean=vitmean)
  rename=(sf36_rawvt=vitraw)
  rename=(sf36_vt=vit)
  rename=(mhnum=mhnum)
  rename=(mhmean=mhmean)
  rename=(sf36_rawmh=mhraw)
  rename=(sf36_mh=mh)
  rename=(ghnum=ghnum)
  rename=(ghmean=ghmean)
  rename=(sf36_rawgh=ghraw)
  rename=(sf36_gh=gh)
  rename=(bpnum=bpnum)
  rename=(sf36_rawbp=bpraw)
  rename=(sf36_bp=bp)
  rename=(sfnum=sfnum)
  rename=(sfmean=sfmean)
  rename=(sf36_rawsf=sfraw)
  rename=(sf36_sf=sf)
  rename=(PF_Z=pfz)
  rename=(RP_Z=rpz)
  rename=(BP_Z=bpz)
  rename=(GH_Z=ghz)
  rename=(VT_Z=vtz)
  rename=(SF_Z=sfz)
  rename=(RE_Z=rez)
  rename=(MH_Z=mhz)
  rename=(PF_norm=pfnorm)
  rename=(RP_norm=rpnorm)
  rename=(BP_norm=bpnorm)
  rename=(GH_norm=ghnorm)
  rename=(VT_norm=vtnorm)
  rename=(SF_norm=sfnorm)
  rename=(RE_norm=renorm)
  rename=(MH_norm=mhnorm)
  rename=(agg_phys=aggphys)
  rename=(agg_ment=aggment)
  rename=(sf36_PCS=pcs)
  rename=(sf36_MCS=mcs)
  rename=(rand_siteid=siteid)
  rename=(rand_treatmentarm=randtreat)
  rename=(qctonom_pwv1=pwv1)
  rename=(qctonom_pwv2=pwv2)
  rename=(qctonom_pwv3=pwv3)
  rename=(qctonom_pwv4=pwv4)
  rename=(qctonom_augix1=augix1)
  rename=(qctonom_augix2=augix2)
  rename=(qctonom_aix3=augix3)
  rename=(qctonom_aix4=augix4)
  rename=(avgpwv=avgpwv)
  rename=(avgaugix=avgaugix)
  rename=(essdo_you_snore=bersnore)
  rename=(essyour_snoring_is=bervol)
  rename=(esshow_often_do_you_snore=berfreq)
  rename=(esshas_your_snoring_ever=berbother)
  rename=(ess_quit_breathing_sleep=berbreathing)
  rename=(ess_fatigued_tired=berfatigue)
  rename=(ess_waking_time_tired=berwaking)
  rename=(ess_sleeping_driving=bervehicle)
  rename=(ess_how_often=beroften)
  rename=(ess_blood_pressure=berbp)
  rename=(ess_height1=berheightft)
  rename=(ess_height2=berheightin)
  rename=(ess_weight=berweight)
  rename=(ess_bmi=berbmi)
  rename=(ess_redcap_calc_berscore=rberscor)
  rename=(ess_eligibility=berelig)
  rename=(embqs_study_passed=emblpass)
  rename=(embqs_first_pass_ahi=emblahi)
  rename=(embqs_ekg_signal=ekgsignal)
  rename=(embqs_cannula_flow_signal=cannulasignal)
  rename=(embqs_thoracic_signal=thoracicsignal)
  rename=(embqs_abdomen_signal=abdomensignal)
  rename=(embqs_oximetry_signal=oximetrysignal)
  rename=(embqs_flow_signal=flowsignal)
  rename=(embqs_ekg_qcode=ekgqual)
  rename=(embqs_cannula_flow_qcode=cannulaqual)
  rename=(embqs_thoracic_qcode=thoracicqual)
  rename=(embqs_abdomen_qcode=abdomenqual)
  rename=(embqs_oximetry_qcode=oximetryqual)
  rename=(embqs_flow_qcode=flowqual)
  rename=(embqs_overall_quality=emblqual)
  rename=(embqs_alert=emblalert)
  rename=(embqs_reason___1=emblreason)
  rename=(embqs_heart_ecg___1=heartecg1)
  rename=(embqs_heart_ecg___2=heartecg2)
  rename=(embqs_heart_ecg___3=heartecg3)
  rename=(embqs_heart_ecg___4=heartecg4)
  rename=(embqs_heart_ecg___5=heartecg5)
  rename=(embqs_heart_ecg___6=heartecg6)
  rename=(elig_source=eligsource)
  rename=(elig_sourceother=eligsourceother)
  rename=(elig_incl01agerange=eligagerange)
  rename=(elig_incl02infconsent=eligconsent)
  rename=(elig_incl03osa=eligosa)
  rename=(elig_incl03osaahi=eligahi)
  rename=(elig_incl03osadiag=eligdiag)
  rename=(elig_incl03osa3=eligosa3)
  rename=(elig_incl03osa4=eligosa4)
  rename=(elig_incl04cvd=eligcvd)
  rename=(elig_incl04ami=eligmi)
  rename=(elig_incl04bsten=eligsten)
  rename=(elig_incl04cstroke=eligstroke)
  rename=(elig_incl04ddiabetes=eligdiabetes)
  rename=(elig_incl04dhyper=elighyper)
  rename=(elig_incl04malesex=eligmale)
  rename=(elig_incl04fbmi=eligbmi)
  rename=(elig_incl04gcholes=eligcholesterol)
  rename=(elig_incl04hsmoking=eligsmoking)
  rename=(elig_incl04ediabetes=eligdiabetesold)
  rename=(elig_excl01ejec=eligef)
  rename=(elig_excl02miproc=eligmiproc)
  rename=(elig_excl03poorhyper=eligpoorhyper)
  rename=(elig_excl04strokeimp=eligstrokeimp)
  rename=(elig_excl05medprob=eligmedprob)
  rename=(elig_excl06oxsat=eligoxsat)
  rename=(elig_excl07pap=eligpap)
  rename=(elig_excl07papstatus=eligpapstatus)
  rename=(elig_excl08sixhrsbed=eligsixhrs)
  rename=(elig_excl09epworth=eligepworth)
  rename=(elig_excl09epworthscore=eligessscore)
  rename=(elig_berlin=eligberlin)
  rename=(elig_berlinscore=eligberlinscore)
  rename=(elig_excl10driver=eligdriver)
  rename=(elig_excl11csa=eligcsa)
  rename=(elig_excl12refusal=eligrefusal)
  rename=(elig_excl14=eligconcurrent)
  rename=(elig_meetstatus=meetstatus)
  rename=(elig_partstatus=partstatus)
  rename=(elig_notinterested=notinterested)
  rename=(elig_toobusy=toobusy)
  rename=(elig_misswork=misswork)
  rename=(elig_transportation=transportation)
  rename=(elig_distance=distance)
  rename=(elig_extratests=extratests)
  rename=(elig_passive=passive)
  rename=(elig_onlycpap=onlycpap)
  rename=(elig_otherreason=otherreason)
  rename=(elig_otherreasonspecify=otherreasonspecify)
  rename=(elig_physiciandoesnotgrant=physicianapproval)
  rename=(elig_gender=gender)
  rename=(elig_raceamerind=raceindalas)
  rename=(elig_raceasian=raceasian)
  rename=(elig_racehawaiian=racehawaiian)
  rename=(elig_raceblack=raceblack)
  rename=(elig_racewhite=racewhite)
  rename=(elig_raceother=raceother)
  rename=(elig_raceotherspecify=raceotherspecify)
  rename=(elig_ethnicity=ethnicity)
  rename=(elig_education=education)
  rename=(journal_averagebedtime=avgbedtime)
  rename=(journal_averagewaketime=avgwaketime)
  rename=(journal_dayscompleted=dayscomplete)
  rename=(journal_daysmaskused=daysmask)
  rename=(journal_daysstripsused=daysstrips)
  rename=(rand_cvdstatus=cvdstatus)
  rename=(rand_diagtype=randdiag)
  rename=(rand_manufacturer=randmanu)
  rename=(anth_heightcm1=height1)
  rename=(anth_heightcm2=height2)
  rename=(anth_heightcm3=height3)
  rename=(anth_weightkg=weight)
  rename=(anth_neckcm1=neck1)
  rename=(anth_neckcm2=neck2)
  rename=(anth_neckcm3=neck3)
  rename=(anth_waistcm1=waist1)
  rename=(anth_waistcm2=waist2)
  rename=(anth_waistcm3=waist3)
  rename=(anth_hipcm1=hip1)
  rename=(anth_hipcm2=hip2)
  rename=(anth_hipcm3=hip3)
  rename=(bprp_bpsys1=sys1)
  rename=(bprp_bpdia1=dia1)
  rename=(bprp_bpsys2=sys2)
  rename=(bprp_bpdia2=dia2)
  rename=(bprp_bpsys3=sys3)
  rename=(bprp_bpdia3=dia3)
  rename=(bprp_bpsite=bpsite)
  rename=(bprp_cuffsize=bprpcuff)
  rename=(bprp_rp1=rp1)
  rename=(bprp_rp2=rp2)
  rename=(bprp_rp3=rp3)
  rename=(bpj_78am=bpj78am)
  rename=(bpj_89am=bpj89am)
  rename=(bpj_910am=bpj910am)
  rename=(bpj_1011am=bpj1011am)
  rename=(bpj_1112pm=bpj1112pm)
  rename=(bpj_121pm=bpj121pm)
  rename=(bpj_12pm=bpj12pm)
  rename=(bpj_23pm=bpj23pm)
  rename=(bpj_34pm=bpj34pm)
  rename=(bpj_45pm=bpj45pm)
  rename=(bpj_56pm=bpj56pm)
  rename=(bpj_67pm=bpj67pm)
  rename=(bpj_78pm=bpj78pm)
  rename=(bpj_89pm=bpj89pm)
  rename=(bpj_910pm=bpj910pm)
  rename=(bpj_1011pm=bpj1011pm)
  rename=(bpj_1112am=bpj1112am)
  rename=(bpj_121am=bpj121am)
  rename=(bpj_12am=bpj12am)
  rename=(bpj_23am=bpj23am)
  rename=(bpj_34am=bpj34am)
  rename=(bpj_45am=bpj45am)
  rename=(bpj_56am=bpj56am)
  rename=(bpj_67am=bpj67am)
  rename=(bpj_timebed=bpjtimebed)
  rename=(bpj_timewake=bpjtimewake)
  rename=(bplog_attachtime=attachtime)
  rename=(bplog_removaltime=removaltime)
  rename=(bplog_manualbpr=manualbpr)
  rename=(bplog_manualbpl=manualbpl)
  rename=(bplog_armcirc=armcirc)
  rename=(bplog_cuffsize=bplogcuffsize)
  rename=(bplog_monitorbpr=monitorbpr)
  rename=(bplog_monitorbpl=monitorbpl)
  rename=(bplog_pulse=pulse)
  rename=(cal_a01=a01)
  rename=(cal_a02=a02)
  rename=(cal_a03=a03)
  rename=(cal_a04=a04)
  rename=(cal_a05=a05)
  rename=(cal_a06=a06)
  rename=(cal_a07=a07)
  rename=(cal_a08=a08)
  rename=(cal_a09=a09)
  rename=(cal_a10=a10)
  rename=(cal_a11=a11)
  rename=(cal_b01=b01)
  rename=(cal_b02=b02)
  rename=(cal_b03=b03)
  rename=(cal_b04=b04)
  rename=(cal_b05=b05)
  rename=(cal_b06=b06)
  rename=(cal_b07=b07)
  rename=(cal_b08=b08)
  rename=(cal_b09=b09)
  rename=(cal_b10=b10)
  rename=(cal_b11=b11)
  rename=(cal_b12=b12)
  rename=(cal_b13=b13)
  rename=(cal_c01=c01)
  rename=(cal_c02=c02)
  rename=(cal_c03=c03)
  rename=(cal_c04=c04)
  rename=(cal_c05=c05)
  rename=(cal_c06=c06)
  rename=(cal_c07=c07)
  rename=(cal_c08=c08)
  rename=(cal_c09=c09)
  rename=(cal_c10=c10)
  rename=(cal_c11=c11)
  rename=(cal_d01=d01)
  rename=(cal_d02=d02)
  rename=(cal_d03=d03)
  rename=(cal_d04=d04)
  rename=(cal_d05=d05)
  rename=(cal_d06=d06)
  rename=(cal_d07=d07)
  rename=(cal_d08=d08)
  rename=(cal_d09=d09)
  rename=(cal_d10=d10)
  rename=(cal_d11=d11)
  rename=(cal_d12=d12)
  rename=(cal_d13=d13)
  rename=(cal_d14=d14)
  rename=(cal_d15=d15)
  rename=(cal_d16=d16)
  rename=(cal_d17=d17)
  rename=(cal_d18=d18)
  rename=(cal_d19=d19)
  rename=(cal_d20=d20)
  rename=(cal_d21=d21)
  rename=(cal_d22=d22)
  rename=(cal_d22s=d22s)
  rename=(cal_d23=d23)
  rename=(cal_d23s=d23s)
  rename=(cal_ds01=ds01)
  rename=(cal_ds01p=ds01p)
  rename=(cal_ds02=ds02)
  rename=(cal_ds02p=ds02p)
  rename=(cal_ds03=ds03)
  rename=(cal_ds03p=ds03p)
  rename=(cal_ds04=ds04)
  rename=(cal_ds04p=ds04p)
  rename=(cal_ds05=ds05)
  rename=(cal_ds05p=ds05p)
  rename=(cal_e01=e01)
  rename=(cal_e02=e02)
  rename=(cal_e03=e03)
  rename=(cal_e04=e04)
  rename=(cal_e05=e05)
  rename=(cal_e06=e06)
  rename=(cal_e07=e07)
  rename=(cal_e08=e08)
  rename=(cal_e09=e09)
  rename=(cal_e10=e10)
  rename=(cal_e11=e11)
  rename=(cal_e12=e12)
  rename=(cal_e13=e13)
  rename=(cal_e14=e14)
  rename=(cal_e15=e15)
  rename=(cal_e16=e16)
  rename=(cal_e17=e17)
  rename=(cal_e18=e18)
  rename=(cal_e19=e19)
  rename=(cal_e20=e20)
  rename=(cal_e21=e21)
  rename=(cal_e22=e22)
  rename=(cal_e23=e23)
  rename=(cal_e24=e24)
  rename=(cal_e25=e25)
  rename=(cal_e26=e26)
  rename=(cal_e27=e27)
  rename=(cal_e27s=e27s)
  rename=(cal_e28=e28)
  rename=(cal_e28s=e28s)
  rename=(cal_es01=es01)
  rename=(cal_es01p=es01p)
  rename=(cal_es02=es02)
  rename=(cal_es02p=es02p)
  rename=(cal_es03=es03)
  rename=(cal_es03p=es03p)
  rename=(cal_es04=es04)
  rename=(cal_es04p=es04p)
  rename=(cal_es05=es05)
  rename=(cal_es05p=es05p)
  rename=(cal_f01=f01)
  rename=(cal_f02=f02)
  rename=(cpappres_arm=cpaptreat)
  rename=(cpappres_originaltx=originaltx)
  rename=(cpappres_randtx=randtx)
  rename=(cpappres_titration=titration)
  rename=(cpappres_studytype=studytype)
  rename=(cpappres_masktype=masktype)
  rename=(cpappres_maskbrand=maskbrand)
  rename=(cpappres_masksize=masksize)
  rename=(cpappres_chinstrap=chinstrap)
  rename=(cpappres_ramp=ramp)
  rename=(cpappres_c_flex=cflex)
  rename=(phq8_difficulty=phqdiff)
  rename=(shq_hrspnightweek=hrspnightweek)
  rename=(shq_hrspnightweekends=hrspnightweekends)
  rename=(shq_minbedtime=minbedtime)
  rename=(shq_waketimenightsleep=waketimenightsleep)
  rename=(shq_gotobedweek=gotobedweek)
  rename=(shq_gotobedweekends=gotobedweekends)
  rename=(shq_wakeweekdays=wakeweekdays)
  rename=(shq_wakeweekends=wakeweekends)
  rename=(shq_nap5min=nap5min)
  rename=(shq_trasleep=trasleep)
  rename=(shq_wokeupsev=wokeupsev)
  rename=(shq_wokeupearly=wokeupearly)
  rename=(shq_trbacktosleep=trbacktosleep)
  rename=(shq_trpills=trpills)
  rename=(shq_typnightsleep=typnightsleep)
  rename=(shq_unrestedday=unrestedday)
  rename=(shq_sleepyday=sleepyday)
  rename=(shq_notenoughsleep=notenoughsleep)
  rename=(shq_feelingbestgetup=feelingbestgetup)
  rename=(shq_wokentired=wokentired)
  rename=(shq_timefeeltired=timefeeltired)
  rename=(shq_timefeelingbest=timefeelingbest)
  rename=(shq_morevetypes=morevetypes)
  rename=(shq_worksched=worksched)
  rename=(shq_sitread=sitread)
  rename=(shq_watchingtv=watchingtv)
  rename=(shq_sitinactive=sitinactive)
  rename=(shq_ridingforhour=ridingforhour)
  rename=(shq_lyingdown=lyingdown)
  rename=(shq_sittalk=sittalk)
  rename=(shq_afterlunch=afterlunch)
  rename=(shq_stoppedcar=stoppedcar)
  rename=(shq_driving=driving)
  rename=(shq_eversnored=eversnored)
  rename=(shq_snorenow=snorenow)
  rename=(shq_stopbreath=stopbreath)
  rename=(shq_stopbreathfrq=stopbreathfrq)
  rename=(shq_snorted=snorted)
  rename=(shq_snortingfrq=snortingfreq)
  rename=(shq_coughing=shqcoughing)
  rename=(shq_chestpain=shqchestpain)
  rename=(shq_shortnessbreath=shqshortnessbreath)
  rename=(shq_sweats=shqsweats)
  rename=(shq_noise=shqnoise)
  rename=(shq_pain=shqpain)
  rename=(shq_heartburn=shqheartburn)
  rename=(shq_cramps=shqcramps)
  rename=(shq_needbathroom=shqneedbathroom)
  rename=(shq_legsdiscomfort=legsdiscomfort)
  rename=(shq_legsdiscomfortfrq=legsdiscomfortfrq)
  rename=(shq_legsdiscomfortrest=legsdiscomfortrest)
  rename=(shq_legsdiscomfortday=legsdiscomfortday)
  rename=(shq_allergies=allergies)
  rename=(shq_allergiesskintest=allergiesskintest)
  rename=(shq_anxietydisorder=anxietydisorder)
  rename=(shq_asthma=asthma)
  rename=(shq_add_adhd=addadhd)
  rename=(shq_cancer=cancer)
  rename=(shq_prostatecancer=prostatecancer)
  rename=(shq_breastcancer=breastcancer)
  rename=(shq_lungcancer=lungcancer)
  rename=(shq_coloncancer=coloncancer)
  rename=(shq_bloodcancer=bloodcancer)
  rename=(shq_othercancer=othercancer)
  rename=(shq_chronicbronchitis=chronicbronchitis)
  rename=(shq_depression=depression)
  rename=(shq_diabetes=diabetes)
  rename=(shq_diabetesmed=diabetesmed)
  rename=(shq_diabetesage=diabetesage)
  rename=(shq_diabetesinsulin=diabetesinsulin)
  rename=(shq_emphysema=emphysema)
  rename=(shq_epilepsy=epilepsy)
  rename=(shq_gerd=gerd)
  rename=(shq_highbp=highbp)
  rename=(shq_highbpmed=highbpmed)
  rename=(shq_highbpage=highbpage)
  rename=(shq_highcholes=highcholes)
  rename=(shq_highcholesmed=highcholesmed)
  rename=(shq_highcholesage=highcholesage)
  rename=(shq_ibm=ibm)
  rename=(shq_insomnia=insomnia)
  rename=(shq_migraine=migraine)
  rename=(shq_ms=ms)
  rename=(shq_restlesslegs=restlesslegs)
  rename=(shq_ra=ra)
  rename=(shq_sinus=sinus)
  rename=(shq_other1=shqother1)
  rename=(shq_other2=shqother2)
  rename=(shq_famparheart=famparheart)
  rename=(shq_famparstroke=famparstroke)
  rename=(shq_famparapnea=famparapnea)
  rename=(shq_nosib=nosib)
  rename=(shq_famsibheart=famsibheart)
  rename=(shq_famsibstroke=famsibstroke)
  rename=(shq_famsibapnea=famsibapnea)
  rename=(shq_nochi=nochi)
  rename=(shq_famchiheart=famchiheart)
  rename=(shq_famchistroke=famchistroke)
  rename=(shq_famchiapnea=famchiapnea)
  rename=(shq_eversmoked=eversmoked)
  rename=(shq_eversmokeagestart=eversmokeagestart)
  rename=(shq_eversmokeeachday=eversmokeeachday)
  rename=(shq_eversmokeoldstop=eversmokeoldstop)
  rename=(shq_smokedlast4weeks=smokedlast)
  rename=(shq_smokenow=smokenow)
  rename=(shq_drinkcaffeine=drinkcaffeine)
  rename=(shq_consumealcohol=consumealcohol)
  rename=(shq_numberdrinks=numberdrinks)
  rename=(shq_drinkbeforebedtime=drinkbeforebed)
  rename=(shq_painlegswalk=painlegswalk)
  rename=(shq_painlegswalkstill=painlegsstill)
  rename=(shq_painlegswalkuphill=painlegsuphill)
  rename=(shq_painlegswalkpace=painlegspace)
  rename=(shq_painlegswalkstandstill=painlegsstand)
  rename=(shq_painlegswalklocbuttock=painlegsbuttock)
  rename=(shq_painlegswalkloccalf=painlegscalf)
  rename=(shq_painlegswalklocfeet=painlegsfeet)
  rename=(shq_painlegswalklocham=painlegsham)
  rename=(shq_painlegswalklocjoints=painlegsjoints)
  rename=(shq_painlegswalklocrad=painlegsrad)
  rename=(shq_painlegswalklocshins=painlegsshins)
  rename=(shq_painlegswalklocthigh=painlegsthigh)
  rename=(shq_swelling=swelling)
  rename=(shq_swellingdaynight=swellingdaynight)
  rename=(shq_awktrbbreathing=awktrbbreathing)
  rename=(shq_pillowsbreathe=pillowsbreathe)
  rename=(shq_painchest=painchest)
  rename=(shq_pressurechest=pressurechest)
  rename=(shq_pressurechestuphill=pressurechestuphill)
  rename=(shq_pressurechestordinary=pressurechestordinary)
  rename=(shq_pressurechestwalking=pressurechestwalking)
  rename=(shq_pressurecheststill=pressurecheststill)
  rename=(shq_pressurechesthowsoon=pressurechesthowsoon)
  rename=(shq_pressurechestdoctor=pressurechestdoctor)
  rename=(shq_pressurechestdoctsay=pressurechestdoctsay)
  rename=(shq_menopause=menopause)
  rename=(shq_ovaries=ovaries)
  rename=(shq_ovariesage=ovariesage)
  rename=(shq_ovariesremov=ovariesremov)
  rename=(shq_hysterectomy=hysterectomy)
  rename=(shq_hysterectomyage=hysterectomyage)
  rename=(shq_menstrual=menstrual)
  rename=(shq_menstrualnumber=menstrualnumber)
  rename=(shq_hormonert=hormonert)
  rename=(shq_hormonertage=hormonertage)
  rename=(shq_hormonertagestart=hormonertagestart)
  rename=(shq_hormonertagestop=hormonertagestop)
  rename=(shq_typeofhormonert=typeofhormonert)
  rename=(shq_typeofhormonertspecify=typeofhormonertspecify)
  rename=(shq_hrspnightweek6=hrspnightweek6)
  rename=(shq_hrspnightweekends6=hrspnightweekends6)
  rename=(shq_minbedtime6=minbedtime6)
  rename=(shq_waketimenightsleep6=waketimenightsleep6)
  rename=(shq_gotobedweek6=gotobedweek6)
  rename=(shq_gotobedweekends6=gotobedweekends6)
  rename=(shq_wakeweekdays6=wakeweekdays6)
  rename=(shq_wakeweekends6=wakeweekends6)
  rename=(shq_nap5min6=nap5min6)
  rename=(shq_trasleep6=trasleep6)
  rename=(shq_wokeupsev6=wokeupsev6)
  rename=(shq_wokeupearly6=wokeupearly6)
  rename=(shq_trbacktosleep6=trbacktosleep6)
  rename=(shq_trpills6=trpills6)
  rename=(shq_typnightsleep6=typnightsleep6)
  rename=(shq_unrestedday6=unrestedday6)
  rename=(shq_sleepyday6=sleepyday6)
  rename=(shq_notenoughsleep6=notenoughsleep6)
  rename=(shq_feelingbestgetup6=feelingbestgetup6)
  rename=(shq_wokentired6=wokentired6)
  rename=(shq_timefeeltired6=timefeeltired6)
  rename=(shq_timefeelingbest6=timefeelingbest6)
  rename=(shq_morevetypes6=morevetypes6)
  rename=(shq_worksched6=worksched6)
  rename=(shq_sitread6=sitread6)
  rename=(shq_watchingtv6=watchingtv6)
  rename=(shq_sitinactive6=sitinactive6)
  rename=(shq_ridingforhour6=ridingforhour6)
  rename=(shq_lyingdown6=lyingdown6)
  rename=(shq_sittalk6=sittalk6)
  rename=(shq_afterlunch6=afterlunch6)
  rename=(shq_stoppedcar6=stoppedcar6)
  rename=(shq_driving6=driving6)
  rename=(shq_haveyousnored6=haveyousnored6)
  rename=(shq_snorenow6=snorenow6)
  rename=(shq_stopbreath6=stopbreath6)
  rename=(shq_stopbreathfrq6=stopbreathfrq6)
  rename=(shq_snorted6=snorted6)
  rename=(shq_snortingfrq6=snortingfreq6)
  rename=(shq_coughing6=shqcoughing6)
  rename=(shq_chestpain6=shqchestpain6)
  rename=(shq_shortnessbreath6=shqshortnessbreath6)
  rename=(shq_sweats6=shqsweats6)
  rename=(shq_noise6=shqnoise6)
  rename=(shq_pain6=shqpain6)
  rename=(shq_heartburn6=shqheartburn6)
  rename=(shq_cramps6=shqcramps6)
  rename=(shq_needbathroom6=shqneedbathroom6)
  rename=(shq_legsdiscomfort6=legsdiscomfort6)
  rename=(shq_legsdiscomfortfrq6=legsdiscomfortfrq6)
  rename=(shq_legsdiscomfortrest6=legsdiscomfortrest6)
  rename=(shq_legsdiscomfortday6=legsdiscomfortday6)
  rename=(shq_cigperday6=cigperday6)
  rename=(shq_drinkcaffeine6=drinkcaffeine6)
  rename=(shq_numberdrinks6=numberdrinks6)
  rename=(shq_drinkbeforebedtime6=drinkbeforebed6)
  rename=(shq_painlegswalk6=painlegswalk6)
  rename=(shq_painlegswalkstill6=painlegsstill6)
  rename=(shq_painlegswalkuphill6=painlegsuphill6)
  rename=(shq_painlegswalkpace6=painlegspace6)
  rename=(shq_painlegswalkstandstill6=painlegsstand6)
  rename=(shq_painlegswalklocbuttock6=painlegsbuttock6)
  rename=(shq_painlegswalkloccalf6=painlegscalf6)
  rename=(shq_painlegswalklocfeet6=painlegsfeet6)
  rename=(shq_painlegswalklocham6=painlegsham6)
  rename=(shq_painlegswalklocjoints6=painlegsjoints6)
  rename=(shq_painlegswalklocrad6=painlegsrad6)
  rename=(shq_painlegswalklocshins6=painlegsshins6)
  rename=(shq_painlegswalklocthigh6=painlegsthigh6)
  rename=(shq_swelling6=swelling6)
  rename=(shq_swellingdaynight6=swellingdaynight6)
  rename=(shq_awktrbbreathing6=awktrbbreathing6)
  rename=(shq_pillowsbreathe6=pillowsbreathe6)
  rename=(shq_painchest6=painchest6)
  rename=(shq_pressurechest6=pressurechest6)
  rename=(shq_pressurechestuphill6=pressurechestuphill6)
  rename=(shq_pressurechestordinary6=pressurechestordinary6)
  rename=(shq_pressurechestwalking6=pressurechestwalking6)
  rename=(shq_pressurecheststill6=pressurecheststill6)
  rename=(shq_pressurechesthowsoon6=pressurechesthowsoon6)
  rename=(shq_pressurechestdoctor6=pressurechestdoctor6)
  rename=(shq_pressurechestdoctsay6=pressurechestdoctsay6)
  rename=(qctonom_bp_pwv=bp_pwv)
  rename=(qctonom_map_pwv=map_pwv)
  rename=(qctonom_proximaldistance1=proximaldistance1)
  rename=(qctonom_distaldistance1=distaldistance1)
  rename=(qctonom_qcnumbersred1=qcnumbersred1)
  rename=(qctonom_standdev1=standdev1)
  rename=(qctonom_standarddeviation1=standarddeviation1)
  rename=(qctonom_proximaldistance2=proximaldistance2)
  rename=(qctonom_distaldistance2=distaldistance2)
  rename=(qctonom_qcnumbersred2=qcnumbersred2)
  rename=(qctonom_standdev2=standdev2)
  rename=(qctonom_standarddeviation2=standarddeviation2)
  rename=(qctonom_pwv1pwv2=pwv1pwv2)
  rename=(qctonom_proximaldistance3=proximaldistance3)
  rename=(qctonom_distaldistance3=distaldistance3)
  rename=(qctonom_qcnumbersred3=qcnumbersred3)
  rename=(qctonom_standdev3=standdev3)
  rename=(qctonom_standarddeviation3=standarddeviation3)
  rename=(qctonom_proximaldista2_50e=proximaldistance4)
  rename=(qctonom_distaldistanc2_f1a=distaldistance4)
  rename=(qctonom_qcnumbersred32_d69=qcnumbersred4)
  rename=(qctonom_standdev4=standdev4)
  rename=(qctonom_standarddeviation4=standarddeviation4)
  rename=(qctonom_bp=bp_pwa)
  rename=(qctonom_map1=map_pwa)
  rename=(qctonom_operatorindex1=operatorindex1)
  rename=(qctonom_specifyoi1=specifyoi1)
  rename=(qctonom_qcnumbersredpwa1=qcnumbersredpwa1)
  rename=(qctonom_notes1=tonomnotes1)
  rename=(qctonom_specifynotes1=specifynotes1)
  rename=(qctonom_augpress1=augpress1)
  rename=(qctonom_operatorindex2=operatorindex2)
  rename=(qctonom_specifyoi2=specifyoi2)
  rename=(qctonom_qcnumbersredpwa2=qcnumbersredpwa2)
  rename=(qctonom_notes2=tonomnotes2)
  rename=(qctonom_specifynotes2=specifynotes2)
  rename=(qctonom_augpress2=augpress2)
  rename=(qctonom_aorticaug=aorticaug)
  rename=(qctonom_operatorindex3=operatorindex3)
  rename=(qctonom_specifyoi3=specifyoi3)
  rename=(qctonom_qcnumbersredpwa3=qcnumbersredpwa3)
  rename=(qctonom_notes3=tonomnotes3)
  rename=(qctonom_specifynotes3=specifynotes3)
  rename=(qctonom_augpress3=augpress3)
  rename=(qctonom_operatorindex4=operatorindex4)
  rename=(qctonom_specifyoi4=specifyoi4)
  rename=(qctonom_qcnumbersredpwa4=qcnumbersredpwa4)
  rename=(qctonom_notes4=tonomnotes4)
  rename=(qctonom_specifynotes4=specifynotes4)
  rename=(qctonom_augpress4=augpress4)
  rename=(twpas_light_yn=houselightyn)
  rename=(twpas_light_days=houselightdays)
  rename=(twpas_light_hrs=houselighthrs)
  rename=(twpas_light_min=houselightmin)
  rename=(twpas_moderate_yn=housemodyn)
  rename=(twpas_moderate_days=housemoddays)
  rename=(twpas_moderate_hrs=housemodhrs)
  rename=(twpas_moderate_min=housemodmin)
  rename=(twpas_lawnmod_yn=lawnmodyn)
  rename=(twpas_lawnmod_days=lawnmoddays)
  rename=(twpas_lawnmod_hrs=lawnmodhrs)
  rename=(twpas_lawnmod_min=lawnmodmin)
  rename=(twpas_lawnheavy_yn=lawnheavyyn)
  rename=(twpas_lawnheavy_days=lawnheavydays)
  rename=(twpas_lawnheavy_hrs=lawnheavyhrs)
  rename=(twpas_lawnheavy_min=lawnheavymin)
  rename=(twpas_carelight_yn=carelightyn)
  rename=(twpas_carelight_days=carelightdays)
  rename=(twpas_carelight_hrs=carelighthrs)
  rename=(twpas_carelight_min=carelightmin)
  rename=(twpas_caremod_yn=caremodyn)
  rename=(twpas_caremod_days=caremoddays)
  rename=(twpas_caremod_hrs=caremodhrs)
  rename=(twpas_caremod_min=caremodmin)
  rename=(twpas_walkget_yn=walkgetyn)
  rename=(twpas_walkget_days=walkgetdays)
  rename=(twpas_walkget_hrs=walkgethrs)
  rename=(twpas_walkget_min=walkgetmin)
  rename=(twpas_walkex_yn=walkexyn)
  rename=(twpas_walkex_days=walkexdays)
  rename=(twpas_walkex_hrs=walkexhrs)
  rename=(twpas_walkex_min=walkexmin)
  rename=(twpas_dancing_yn=dancingyn)
  rename=(twpas_dancing_days=dancingdays)
  rename=(twpas_dancing_hrs=dancinghrs)
  rename=(twpas_dancing_min=dancingmin)
  rename=(twpas_teamsports_yn=teamsportsyn)
  rename=(twpas_teamsports_days=teamsportsdays)
  rename=(twpas_teamsports_hrs=teamsportshrs)
  rename=(twpas_teamsports_min=teamsportsmin)
  rename=(twpas_dualsports_yn=dualsportsyn)
  rename=(twpas_dualsports_days=dualsportsdays)
  rename=(twpas_dualsports_hrs=dualsportshrs)
  rename=(twpas_dualsports_min=dualsportsmin)
  rename=(twpas_indivact_yn=indivactyn)
  rename=(twpas_indivact_days=indivactdays)
  rename=(twpas_indivact_hrs=indivacthrs)
  rename=(twpas_indivact_min=indivactmin)
  rename=(twpas_condmod_yn=condmodyn)
  rename=(twpas_condmod_days=condmoddays)
  rename=(twpas_condmod_hrs=condmodhrs)
  rename=(twpas_condmod_min=condmodmin)
  rename=(twpas_condheavy_yn=condheavyyn)
  rename=(twpas_condheavy_days=condheavydays)
  rename=(twpas_condheavy_hrs=condheavyhrs)
  rename=(twpas_condheavy_min=condheavymin)
  rename=(twpas_sitrecline_yn=leisureyn)
  rename=(twpas_sitrecline_days=leisuredays)
  rename=(twpas_sitrecline_hrs=leisurehrs)
  rename=(twpas_sitrecline_min=leisuremin)
  rename=(twpas_worklightsit_yn=worklightsityn)
  rename=(twpas_worklightsit_days=worklightsithrs)
  rename=(twpas_worklightsit_hrs=worklightsitdays)
  rename=(twpas_worklightstand_yn=worklightstandyn)
  rename=(twpas_worklightstand_days=worklightstandhrs)
  rename=(twpas_worklightstand_hrs=worklightstanddays)
  rename=(twpas_workmod_yn=workmodyn)
  rename=(twpas_workmod_days=workmodhrs)
  rename=(twpas_workmod_hrs=workmoddays)
  rename=(twpas_workheavy_yn=workheavyyn)
  rename=(twpas_workheavy_days=workheavyhrs)
  rename=(twpas_workheavy_hrs=workheavydays)
  rename=(twpas_usualpace=usualpace)
  rename=(twomonth_chestpain=twochestpain)
  rename=(twomonth_shortnessofbreath=twoshortnessofbreath)
  rename=(twomonth_sleepiness=twosleepiness)
  rename=(twomonth_healthprofess=twohealthprofess)
  rename=(twomonth_overnightstay=twoovernightstay)
  rename=(twomonth_docrec=twodocrec)
  rename=(twomonth_conditions=twoconditions)
  rename=(twomonth_missednights=twomissednights)
  rename=(twomonth_maskfit=twomaskfit)
  rename=(twomonth_headgear=twoheadgear)
  rename=(twomonth_maskleaks=twomaskleaks)
  rename=(twomonth_pressure=twopressure)
  rename=(twomonth_nasalcongestion=twonasal)
  rename=(twomonth_throatdryness=twothroatdryness)
  rename=(twomonth_sinus=twosinus)
  rename=(twomonth_noise=twonoise)
  rename=(twomonth_eyeirrit=twoeyeirrit)
  rename=(twomonth_skinirrit=twoskinirritation)
  rename=(twomonth_other=twoother)
  rename=(twomonth_nasalstrips=twonasalstrips)
  rename=(twomonth_sleepreg=twosleepreg)
  rename=(twomonth_positionchange=twopositionchange)
  rename=(twomonth_changestime=twochangestime)
  rename=(twomonth_recipes=tworecipes)
  rename=(twomonth_exercise=twoexercise)
  rename=(phonechanges_initiated_by=phoneinitby)
  rename=(phonechanges_call_reason___1=phonereason1)
  rename=(phonechanges_call_reason___2=phonereason2)
  rename=(phonechanges_call_reason___3=phonereason3)
  rename=(phonechanges_call_reason___4=phonereason4)
  rename=(phonechanges_call_reason___5=phonereason5)
  rename=(phonechanges_call_reason___6=phonereason6)
  rename=(phonechanges_call_reason___7=phonereason7)
  rename=(phonechanges_reasonother=phonereasonother)
  rename=(phonechange_resolved___1=phoneresolve1)
  rename=(phonechange_resolved___2=phoneresolve2)
  rename=(phonechange_resolved___3=phoneresolve3)
  rename=(phonechange_resolved___4=phoneresolve4)
  rename=(phonechanges_resolother=phoneresolveother)
  rename=(phonechanges_changed___1=phonechange1)
  rename=(phonechanges_changed___2=phonechange2)
  rename=(phonechanges_changed___3=phonechange3)
  rename=(phonechanges_changed___4=phonechange4)
  rename=(phonechanges_changesvp=phonechangevp)
  rename=(phonechanges_changesvc=phonechangevc)
  rename=(phonechanges_amounttime=phoneamounttime)
  rename=(treatdisc_reason=discreason)
  rename=(treatdisc_crossover=disccrossover)
  rename=(treatdisc_crossreason=disccrossreason)
  rename=(sc_primaryreason=scprimaryreason)
  rename=(sc_primaryreason_other=scprimaryreasonother)
  rename=(cbt1_rate1=cbt1motivation1)
  rename=(cbt1_video1=cbt1video1)
  rename=(cbt1_video2=cbt1video2)
  rename=(cbt1_consequence=cbt1consequence)
  rename=(cbt1_holdbreath=cbt1holdbreath)
  rename=(cbt1_oxygen1=cbt1oxygen1)
  rename=(cbt1_oxygen2=cbt1oxygen2)
  rename=(cbt1_oxygen3=cbt1oxygen3)
  rename=(cbt1_concerns=cbt1concerns)
  rename=(cbt1_plan=cbt1plan)
  rename=(cbt1_motivation2=cbt1motivation2)
  rename=(cbt1_sleepy=cbt1sleepy)
  rename=(cbt1_sideeffects=cbt1sideeffects)
  rename=(cbt1_healthier=cbt1healthy)
  rename=(cbt1_sleepbetter=cbt1sleepbetter)
  rename=(cbt1_discomfort=cbt1discomfort)
  rename=(cbt1_concentration=cbt1concentrate)
  rename=(cbt1_sleeping=cbt1trsleeping)
  rename=(cbt1_nightly=cbt1nightly)
  rename=(cbt1_worthwhile=cbt1worthwhile)
  rename=(cbt1_getinway=cbt1getinway)
  rename=(cbt1_assistance=cbt1assistance)
  rename=(cbt1_regularly1=cbt1regularly1)
  rename=(cbt1_regularly2=cbt1regularly2)
  rename=(cbt1_regularly3=cbt1regularly3)
  rename=(cbt1_regularly4=cbt1regularly4)
  rename=(cbt1_comfortable=cbt1comfortable)
  rename=(cbt2_thoughts=cbt2thoughts)
  rename=(cbt2_initial=cbt2initial)
  rename=(cbt2_use=cbt2use)
  rename=(cbt2_difficult=cbt2difficult)
  rename=(cbt2_benefits=cbt2benefits)
  rename=(cbt2_threemos=cbt2threemos)
  rename=(cbt2_sixmos=cbt2sixmos)
  rename=(cbt2_sixmosinfreq=cbt2sixmosinfreq)
  rename=(cbt2_video=cbt2video)
  rename=(cbt2_spendtime=cbt2spendtime)
  rename=(cbt2_cpaphelp=cbt2cpaphelp)
  rename=(cbt2_cpaphinder=cbt2cpaphinder)
  rename=(cbt2_chancesnocpap=cbt2chancesnocpap)
  rename=(cbt2_chancescpap=cbt2chancescpap)
  rename=(cbt2_motivated1=cbt2motivated1)
  rename=(cbt2_motivated2=cbt2motivated2)
  rename=(cbt2_motivated3=cbt2motivated3)
  rename=(cbt2_difficultregularly=cbt2difficultregularly)
  rename=(cbt2_easier=cbt2easier)
  rename=(cbtp1_callnum=cbtp1callnum)
  rename=(cbtp1_week=cbtp1week)
  rename=(cbtp1_occur=cbtp1occur)
  rename=(cbtp1_nooccur=cbtp1nooccur)
  rename=(cbtp1_lastcall=cbtp1lastcall)
  rename=(cbtp1_sleeplast=cbtp1sleeplast)
  rename=(cbtp1_paplast=cbtp1paplast)
  rename=(cbtp1_usedpastweek=cbtp1usedpastweek)
  rename=(cbtp1_highestnumofhours=cbtp1highestnumhrs)
  rename=(cbtp1_lowestnumofhours=cbtp1lowestnumhrs)
  rename=(cbtp1_papdifference=cbtp1papdifference)
  rename=(cbtp1_usepapfeel=cbtp1usepapfeel)
  rename=(cbtp1_keepuse=cbtp1keepuse)
  rename=(cbtp1_gotinway=cbtp1gotinway)
  rename=(cbtp1_notusepapfeel=cbtp1notusepapfeel)
  rename=(cbtp1_handlechallenges=cbtp1handlechallenges)
  rename=(cbtp1_monitorpap=cbtp1monitorpap)
  rename=(cbtp1_thoughtspap=cbtp1thoughtspap)
  rename=(cbtp1_motivated=cbtp1motivated)
  rename=(cbtp1_easiertougher=cbtp1easiertougher)
  rename=(cbtp1_confidence=cbtp1confidence)
  rename=(cbtp1_notlower=cbtp1notlower)
  rename=(cbtp1_what8910=cbtp1whathigher)
  rename=(cbtp1_situations1=cbtp1situations1)
  rename=(cbtp1_siuations2=cbtp1situations2)
  rename=(cbtp1_situations3=cbtp1situations3)
  rename=(cbtp1_situations4=cbtp1situations4)
  rename=(cbtp1_situations5=cbtp1situations5)
  rename=(cbtp1_situations6=cbtp1situations6)
  rename=(cbtp1_situations7=cbtp1situations7)
  rename=(cbtp1_situations8=cbtp1situations8)
  rename=(cbtp1_helpconfidence=cbtp1helpconfidence)
  rename=(cbtp1_dealwithconcern=cbtp1dealwithconcern)
  rename=(cbtp1_developplan=cbtp1developplan)
  rename=(cbtp1_overcome1=cbtp1overcome1)
  rename=(cbtp1_overcome2=cbtp1overcome2)
  rename=(cbtp1_overcome3=cbtp1overcome3)
  rename=(cbtp1_managesituation=cbtp1managesituation)
  rename=(cbtp1_helppapreg=cbtp1helppapreg)
  rename=(cbtp2_callnum=cbtp2callnum)
  rename=(cbtp2_week=cbtp2week)
  rename=(cbtp2_occur=cbtp2occur)
  rename=(cbtp2_nooccur=cbtp2nooccur)
  rename=(cbtp2_lastcall=cbtp2lastcall)
  rename=(cbtp2_sleeplast=cbtp2sleeplast)
  rename=(cbtp2_paplast=cbtp2paplast)
  rename=(cbtp2_usedpastweek=cbtp2usedpastweek)
  rename=(cbtp2_highestnumofhours=cbtp2highestnumhrs)
  rename=(cbtp2_lowestnumofhours=cbtp2lowestnumhrs)
  rename=(cbtp2_papdifference=cbtp2papdifference)
  rename=(cbtp2_usepapfeel=cbtp2usepapfeel)
  rename=(cbtp2_keepuse=cbtp2keepuse)
  rename=(cbtp2_gotinway=cbtp2gotinway)
  rename=(cbtp2_notusepapfeel=cbtp2notusepapfeel)
  rename=(cbtp2_handlechallenges=cbtp2handlechallenges)
  rename=(cbtp2_monitorpap=cbtp2monitorpap)
  rename=(cbtp2_thoughtspap=cbtp2thoughtspap)
  rename=(cbtp2_motivated=cbtp2motivated));
run;

proc export data=bamaster2 outfile="documents\bestair_master.csv" dbms=csv replace;
run;
