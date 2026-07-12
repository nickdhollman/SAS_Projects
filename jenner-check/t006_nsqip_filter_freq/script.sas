/* Adapted from NSQIP_Panniculectomy_Complications_LogitRegression.sas
   (nickdhollman/SAS_Projects) -- the abdominoplasty-flagging and
   cohort-exclusion pipeline. The original read the surgical cohort from
   LIBNAME NSQIP_ 'filepath\SAS Datasets_share' (NSQIP_.panniculectomy_new);
   here the same columns the script reads (OperYR, the ten OTHERCPT/
   CONCPT slots checked for code 15847, ELECTSURG, prsepis, bmi, Age) are
   supplied inline. The abdominoplasty CPT-code flag, the elective-surgery
   / sepsis / bmi exclusion filters, and the age-category derivation are
   unchanged. */

data panniculectomy_a;
set panniculectomy;
where OperYR ge 2012;

if (OTHERCPT1='15847' or OTHERCPT2='15847' or OTHERCPT3='15847' or OTHERCPT4='15847' or OTHERCPT5='15847' or OTHERCPT6='15847' or
OTHERCPT7='15847' or OTHERCPT8='15847' or OTHERCPT9='15847' or OTHERCPT10='15847' or CONCPT1='15847' or CONCPT2='15847'
or CONCPT3='15847' or CONCPT4='15847' or CONCPT5='15847' or CONCPT6='15847' or CONCPT7='15847' or CONCPT8='15847'
or CONCPT9='15847' or CONCPT10='15847') then Abdominoplasty=1;
else Abdominoplasty=0;
run;

proc freq data=panniculectomy_a;
tables Abdominoplasty;
run;

*define panniculectomy dataset;
data panniculectomy_only;
set panniculectomy_a;
where Abdominoplasty=0;
run;

*define abdominoplasty dataset;
data abdominoplasty;
set panniculectomy_a;
where Abdominoplasty=1;
run;

proc freq data=panniculectomy_a;
tables ELECTSURG;
run;

*exclude anyone with urgent surgery;
data panniculectomy_b;
set panniculectomy_a;
where ELECTSURG ne 'No';
run;

*exlucde anyone with systematic sepsis;
proc freq data=panniculectomy_b;
tables prsepis;
run;

data panniculectomy_c;
set panniculectomy_b;
where prsepis='None';
Age_num = input(Age, 4.);
if 0 le age_num lt 50 then age_cat=0;
else if 50 le age_num lt 70 then age_cat=1;
else if age_num ge 70 then age_cat=2;
run;

proc univariate data=panniculectomy_c plot normal;
var age_num;
run;

proc freq data=panniculectomy_c;
tables age_cat;
run;

proc freq data=panniculectomy_c;
tables Abdominoplasty;
run;
