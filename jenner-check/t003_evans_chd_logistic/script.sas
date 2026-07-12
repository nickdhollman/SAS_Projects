/* Adapted from Categorical_Data_Analysis_Final.sas (nickdhollman/SAS_Projects)
   -- the "COHORT STUDY" section analyzing coronary heart disease (CHD),
   electrocardiographic abnormalities (ECG) and hypertension (HTN) in the
   classic Evans County cohort. The original read the cohort from
   LIBNAME final "filepath\Analysis of Frequency" (final.evans); here the
   same three binary columns are supplied inline. The formats, the
   PROC FREQ stratified/chi-square/relrisk analysis, and the univariate,
   multivariate and interaction PROC LOGISTIC models are unchanged. The
   ODS RTF report target is redirected to a relative path. */

*Coronary Heart Disease
CHD: 1=present 0=absent
Electrocardiographic abnormalities
ECG: 1=any abnormality 0=no abnormalities
Hypertension
HTN: 1=present 0=absent
;
proc format;
value CHD
	1="a. CHD Present"
	0="b. CHD Absent" ;
value ECG
	1="Any Abnormality"
	0="No Abnormalities" ;
value HTN
	1="a. Hypertension Present"
	0="b. No Hypertension" ;
run;

*general layout of each variable;
proc freq data=evans ;
tables ECG;
tables CHD;
tables HTN;
run;

*stratified analysis for chi-square and summary statistics;
proc freq data=evans order=formatted;
tables ECG*HTN*CHD / nopercent nocol chisq relrisk;
format ECG ECG. HTN HTN. CHD CHD.;
run;

*univariate analysis;
proc logistic descending data=evans;
model CHD (event='1') = HTN ;
run;

proc logistic descending data=evans;
model CHD (event='1') = ECG ;
run;

*multivariate analysis;
proc logistic descending data=evans;
model CHD (event='1') = HTN ECG /selection=forward slentry=0.2 details ;
run;
