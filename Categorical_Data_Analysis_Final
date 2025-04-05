*Nicholas Hollman;
*Analysis of Frequency;
*Take Home Final;

libname final "filepath\Analysis of Frequency";

*COHORT STUDY;
*make work dataset for evans;
data evans;
set final.evans;
run;

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

proc contents data=evans;
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

*generate document for table;
ODS RTF FILE="filepath\Report Graph.rtf";

proc freq data=evans;
tables ECG*HTN*CHD / nopercent nocol chisq relrisk riskdiff;
format ECG ECG. HTN HTN. CHD CHD.;
run;

ODS RTF CLOSE;

*univariate analysis;
proc logistic descending data=evans;
model CHD (event='1') = HTN ;
run;
*HTN B 0.8593, p=0.0009;

proc logistic descending data=evans;
model CHD (event='1') = ECG ;
run;
*ECG B 0.7036,p=0.0070;

*multivariate analysis;
proc logistic descending data=evans;
model CHD (event='1') = HTN ECG /selection=forward slentry=0.2 details ;
run;
*HTN 1 vs 0 OR=2.102, 95% CI 1.247,3.545, B 0.7431, p=0.0053
 ECG 1 vs 0 OR=1.672, 95% CI 0.984,2.841, B 0.5142, p=0.0572;
*Both variables significant in multivariate model;

*Test for interaction;
proc logistic descending data=evans; 
model CHD (event='1') = HTN ECG HTN*ECG / lackfit;
run;
*Join Test Results
        Wald Chi-square   p-value
HTN        11.8454        0.0006 
ECG         8.4121        0.0037 
HTN*ECG     4.2933        0.0383 
*Interaction term significant, conclude interaction between HTN and ECG;
*Test goodness of fit;
*Model Fit Statistics 
Criterion Intercept Only Intercept and Covariates 
AIC           440.558            427.477 
SC            444.970            445.124 
-2 Log L      438.558            419.477 
c-statistic for predictability=0.638, moderate predictive power;
*all terms significant so no need to evaluate confounding;
*Stratify results;
proc logistic descending data=evans; by ECG;
model CHD (event='1') = HTN / lackfit;
run;

*ECG=1
AIC      155.802 157.796 
SC       158.914 164.020 
-2 Log L 153.802 153.796 
HTN p-value of estimate 0.9396
HTN OR 1.032, 95% CI 0.452 2.356 

ECG=0
HTN p-value of estimate 0.0006 
HTN 1 vs 0 OR 3.137 95% CI 1.636 6.014 
c=0.638;
*Model fit
AIC      279.782 269.681 
SC       283.875 277.868 
-2 Log L 277.782 265.681 ;

*FLU STUDY;

data flu;
set final.flu;
run;

*1 to 1 match;
data one2one;
set flu;
if MsetID=0 then delete;
run;

*univariate;

proc logistic desc data=one2one;
class outcome lung/param=ref ref=first;
model outcome(event='1')=lung;
   strata Mset;
run;

proc logistic desc data=one2one;
class outcome vaccine/param=ref ref=first;
model outcome(event='1')=vaccine ;
   strata Mset;
run;

*multivariate;

proc logistic desc data=one2one;
class outcome vaccine lung/param=ref ref=first;
model outcome(event='1')=vaccine lung /selection=backward;
   strata Mset;
run;
*lung is kept;

*interaction;
proc logistic desc data=one2one;
class outcome vaccine lung/param=ref ref=first;
model outcome(event='1')=vaccine lung lung*vaccine /selection=backward;
   strata Mset;
run;
*no significant interaction;

*test confounding;
proc logistic desc data=one2one;
class outcome vaccine lung/param=ref ref=first;
model outcome (event='1')=vaccine lung ;
   strata Mset;
run;
*OR lung=4.244, no confounding;

**FINAL MODEL***;
proc logistic desc data=one2one;
class outcome lung/param=ref ref=first;
model outcome (event='1')=lung;
   strata Mset;
run;

*1 to 2 match;
*univariate;

proc logistic desc data=flu;
class outcome lung/param=ref ref=first;
model outcome(event='1')=lung;
   strata Mset;
run;

proc logistic desc data=flu;
class outcome vaccine/param=ref ref=first;
model outcome(event='1')=vaccine ;
   strata Mset;
run;

*multivariate;

proc logistic desc data=flu;
class outcome vaccine lung/param=ref ref=first;
model outcome(event='1')=vaccine lung /selection=backward;
   strata Mset;
run;
*lung is kept;

*interaction;
proc logistic desc data=flu;
class outcome vaccine lung/param=ref ref=first;
model outcome(event='1')=vaccine lung lung*vaccine /selection=backward;
   strata Mset;
run;
*no significant interaction;

*test confounding;
proc logistic desc data=flu;
class outcome vaccine lung/param=ref ref=first;
model outcome (event='1')=vaccine lung ;
   strata Mset;
run;
*OR lung=3.689, no confounding;

**FINAL MODEL***;
proc logistic desc data=flu;
class outcome lung/param=ref ref=first;
model outcome (event='1')=lung ;
   strata Mset;
run;

*model without matching;
proc logistic desc data=flu;
class outcome vaccine lung/param=ref ref=first;
model outcome (event='1')=vaccine lung /selection=backward;
run;

data kappa; input A $ B $ count @@@;
datalines;
1 1 38
1 2 5
1 3 0
1 4 1
2 1 33
2 2 11
2 3 3
2 4 0
3 1 10
3 2 14
3 3 5
3 4 6
4 1 3
4 2 7
4 3 3
4 4 10
;

proc freq data=kappa;
    weight count;
	tables A*B/norow nocol nopercent agree;
run;
*below is to get p-value for kappa;
proc freq data=kappa;
    weight count;
	tables A*B/norow nocol nopercent agree;
	test kappa;
run;

proc freq data=kappa;
    weight count;
	tables A*B/norow nocol nopercent;
	exact symmetry kappa wtkap;
run;

*alcohol;

proc import file="filepath\alcohol1.xls"
out=work.alcohol
replace
dbms=xls;
getnames=yes;
run;

data alc;
set alcohol;
do i=1 to n; /* creat individual data */
output;
end;
run;
*Alcgp: 	0 =  0-39
         		1 = 40-79
         		2 = 80-119
         		3 = 120+
Casestatus:	Case=1 Control=0
N:		Number of subjects
;
proc freq data=alc; 
weight N;
tables Alcgp*Casestatus/chisq trend nopercent nocol crosslist stdres;
run;

data alc2;
set alc;
do i=1 to n; /* creat individual data */
output;
end;
run;
proc format;
value alcgp
	0 ='0-39'
	1 ='40-79'
	2 ='80-119'
	3 ='120+'
;
value Casestatus
	0='Control'
	1='Case'
;
ODS RTF FILE="filepath\Report Graph2.rtf";
proc gchart data=alc2 ;
  vbar Casestatus / group=Alcgp discrete
          width=10 gspace=2 outside=percent
					type=percent g100 
					errorbar=both;
 format Casestatus Casestatus. alcgp alcgp.;
run; quit;
ODS RTF CLOSE;

proc freq data=alc; 
weight N;
tables Alcgp*Casestatus/chisq trend nopercent nocol crosslist stdres;
output out=chi chisq;
run;

data gofcalc;
set chi;
GOFCHI=_PCHI_-_MHCHI_;
DF_GOFCHI=DF_PCHI-1; *1 is because MHCHI df is always 1; 
P_GOFCHI=1-probchi(GOFCHI,DF_GOFCHI);
keep n _PCHI_ _MHCHI_ GOFCHI P_GOFCHI P_PCHI P_MHCHI DF_GOFCHI DF_PCHI DF_MHCHI;
proc print DATA=GOFCALC ;
VAR n _PCHI_ DF_PCHI P_PCHI _MHCHI_ DF_MHCHI P_MHCHI GOFCHI DF_GOFCHI  P_GOFCHI;
run;

*odds ratios from dummy variables;
proc logistic descending data=alc;
class Alcgp(ref='0')/param=ref;
model Casestatus(event='1') = Alcgp / scale=none aggregate scale=none;
freq N;
oddsratios Alcgp;
run;

proc logistic descending data=alc;
class Alcgp(ref='0')casestatus /param=ref;
model Casestatus(event='1') = Alcgp / lackfit;
freq N;
run;
