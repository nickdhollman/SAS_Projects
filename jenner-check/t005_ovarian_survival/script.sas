/* Adapted from Ovary_Cancer_Survival_Analysis.sas (nickdhollman/SAS_Projects)
   -- the staging / CA125-quartile / descriptive front section plus the
   Kaplan-Meier overall-survival summary. The original imported the
   cohort from filepath\CA125 in Ovary Cancer.xlsx via PROC IMPORT; here
   the same columns (Stage, Initial_CA125, BMI, age_dx, Plt_count, WBC,
   white, OS, Delta_OS) are supplied inline. The staging recode, the
   quartile categorization, the labels, and the PROC FREQ / PROC MEANS /
   PROC LIFETEST calls are unchanged. */

*create new_stage variable;
proc format;
value stage
1="IA,IB,IC"
2="IIA,IIB,IIC"
3="IIIA,IIIB,IIIC"
4="IV"
;
value white
1='White'
0='Not White'
;
value delta
0='alive/censored'
1='dead'
;
run;
data ovarian_a; set ovarian;
if Stage=10 or Stage=11 or Stage=12 then new_stage=1;
if Stage=20 or Stage=21 or Stage=22 then new_stage=2;
if Stage=30 or Stage=31 or Stage=32 then new_stage=3;
if Stage=40 then new_stage=4;
run;
proc freq data=ovarian_a;
tables new_stage;
tables stage;
format new_stage stage.;
run;

*create quartiles of Initial_CA125;
proc means data=ovarian_a n min max q1 median q3 mean std;
var Initial_CA125;
run;
data ovarian_b; set ovarian_a;
if 0 le Initial_CA125 lt 61.00 then Initial_CA125_Cat=0;
if 61.00 le Initial_CA125 lt 262.00 then Initial_CA125_Cat=1;
if 262.00 le Initial_CA125 lt 940.00 then Initial_CA125_Cat=2;
if Initial_CA125 ge 940.00 then Initial_CA125_Cat=3;
label Initial_CA125='Cancer antigen 125 level measured in units per mililiter (U/mL)';
label Initial_CA125_Cat='Quartile of Cancer antigen 125 level measured in units per mililiter (U/mL)';
label Patient='Patient ID';
label BMI='Body mass index (kg/m2)';
label Grade='Cancer grade (1-4)';
label Plt_count='Platelet count (x 10*9/L)';
label WBC='White blood cell count (x 10*9/L)';
label age_dx='Age at diagnosis(year)';
label white='White race (Y/N)';
label OS='Overall survival(months)';
label Delta_OS='Event: 0=censored/alive 1=observed/dead'
;
run;
*check even distribution and that code worked properly;
proc freq data=ovarian_b;
tables Initial_CA125_Cat;
run;
proc means data=ovarian_b n min max;
var Initial_CA125;
class Initial_CA125_Cat;
run;
proc lifetest data=ovarian_b;
time OS*Delta_OS(0);
run;

*Descriptive Statistics;
*continuous covariates/outcome;
proc univariate data=ovarian_b plot normal;
var BMI age_dx Plt_count WBC OS;
run;
