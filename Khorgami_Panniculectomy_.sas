

*Import data;
proc import file="U:\Khorgami_Wang_BMI_Panniculectomy\NSQIP_2012_2021_Panniculectomy.xlsx"
out=work.pann_excel
replace
dbms=xlsx;
getnames=yes;
run;

data pann_excel_b;
set pann_excel;
where ELECTSURG ne 'No';
run;

data pann_excel_c;
set pann_excel_b;
where prsepis='None' or prsepis='Null';
run;

data pann_excel_d;
set pann_excel_c;
where bmi gt 0;
run;

proc freq data=pann_excel_d;
tables OperYR;
run;

libname NSQIP_ 'U:\Khorgami_NSQIP\SAS Datasets_share';

data panniculectomy;
set NSQIP_.panniculectomy_new;
run;


*syntax from colostomy project - need to change to panniculectomy ;
*double check everyone only has CPT code 15830 for panniculectomy;
proc freq data=panniculectomy_f;
tables CPT;
run;
*all have panniculectomy;

*identify those with abdominoplasty;
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
*n=7585 with abcominoplasty;

*define panniculectomy dataset;
data panniculectomy_only;
set panniculectomy_a;
where Abdominoplasty=0;
run;
*n=14,059;

*define abdominoplasty dataset;
data abdominoplasty;
set panniculectomy_a;
where Abdominoplasty=1;
run;
*n=7,585;

proc freq data=panniculectomy_a;
tables ELECTSURG;
run;
*n=327 ;

*exclude anyone with urgent surgery;
data panniculectomy_b;
set panniculectomy_a;
where ELECTSURG ne 'No';
run;
*n=19,060;

*exlucde anyone with systematic sepsis;
proc freq data=panniculectomy_b;
tables prsepis;
run;
*if prsepis="None" or prsepsis='Null' then sepsis=0;
*if (prsepis="SIRS" or prsepis="Sepsis" or prsepis="Septic Shock") then sepsis=1;
data panniculectomy_c;
set panniculectomy_b;
where prsepis='None';
Age_num = input(Age, 4.);
if 0 le age_num lt 50 then age_cat=0;
else if 50 le age_num lt 70 then age_cat=1;
else if age_num ge 70 then age_cat=2;
run;
*n=21,212;

proc univariate data=panniculectomy_c plot normal;
var age_num;
run;

proc freq data=panniculectomy_c;
tables age_cat;
run;

proc freq data=panniculectomy_c;
tables Abdominoplasty;
run;


*Predictor/Risk factor collapsing;
proc freq data=panniculectomy_c;
tables sex;
table race_new;
tables ETHNICITY_HISPANIC ;
run;

proc format;
value sex
0='female'
1='male'
;
value race
0='white'
1='American Indian or Alaska Native'
2='Asian'
3='Black or African American'
4='Native Hawaiian or Other Pacific Islander'
5='Other'
6='Unknown/Not Reported'
7='Multiracial'
;
value race_cat
0='white'
1='Asian'
2='Black or African American'
3='Other'
4='Unknown/Not Reported'
;
value race_cat_b
0='White'
1='Black or African American'
2='Other'
3='Unknown/Not Reported'
;
value ethnicity
0='Not Hispanic'
1='Hispanic'
2='Unknown/Not Reported'
;
value age_cat
0='18-49'
1='50-69'
2='70+'
;
value bmi_cat
0='0-29'
1='30-35'
2='35-40'
3='40-45'
4='45+'
;
value bmi_cat_b
0='18.5-24.9'
1='0-18.49'
2='25-29.9'
3='30-39.9'
4='40+'
;
value diabetes
0='No'
1='Yes'
;
value fnstat
0='Not independent'
1='Independent'
;
value obesity
0='Not obese'
1='Obese (ge 30 BMI)'
;
value ten_pct_wtloss
0='Did not 10% of weight in last 6 months'
1='Lost gt 10% of weight in last 6 months'
;
run;

proc freq data=panniculectomy_c;
tables diabetes fnstatus2 smoke hxcopd ascites hxchf hypermed dialysis discancr steroid bleeddis transfus;
run;


*identify risk factors that are the same as the panniculectomy project;
data panniculectomy_d;
set panniculectomy_c;
if sex='female' then sex_=0;
if sex='male' then sex_=1;
if (race_new='American Indian or Alaska' or race_new='American Indian or Alaska Native') then race=1;
if race_new='Asian' then race=2;
if race_new='Black or African American' then race=3;
if (race_new='Native Hawaiian or Pacific Islander' or race_new='Native Hawaiian or Pacifi' or race_new='Native Hawaiian or Other Pacific Isl') then race=4;
if race_new='Some Other Race' then race=5;
if (race_new='Unknown/Not Reported' or race_new='Unknown') then race=6;
if (race_new='White,American Indian or Alaska Nati' or race_new='White,Some Other Race ' or
race_new='Race combinations with low frequency') then race=7;
if race_new='White' then race=0;
if race_new='NULL' then race=' ';

if race=0 then race_cat=0;
if race=1 then race_cat=3;
if race=2 then race_cat=1;
if race=3 then race_cat=2;
if race=4 then race_cat=3;
if race=5 then race_cat=3;
if race=6 then race_cat=4;
if race=7 then race_cat=3;

if race_cat=0 then race_cat_b=0;
if race_cat=1 then race_cat_b=2;
if race_cat=2 then race_cat_b=1;
if race_cat=3 then race_cat_b=2;
if race_cat=4 then race_cat_b=3;

if (ethnicity_hispanic="Y" or ethnicity_hispanic="Yes") then ethnicity=1;
else if (ethnicity_hispanic='N' or ethnicity_hispanic='No') then ethnicity=0;
else if (ethnicity_hispanic='U' or ethnicity_hispanic='Unk' or ethnicity_hispanic='Unkn' or ethnicity_hispanic='NULL') then ethnicity=2;

*if 0 le age lt 50 then age_cat=0;
*else if 50 le age lt 60 then age_cat=1;
*else if 60 le age lt 70 then age_cat=2;
*else if age ge 70 then age_cat=3;

*if age_cat=3 then age_cat_b=1;
*else if (age_cat=0 or age_cat=1 or age_cat=2) then age_cat_b=0;

*BMI 30-35, 35-40, 40-45, and >45 kg/m2 ;

if height=-99 then height=.;
if weight=-99 then weight=.;

height_sq = height * height;

BMI= weight / height_sq * 703;

if bmi lt 0 then obesity=.;
if 0 le bmi lt 30 then obesity=0;
if bmi ge 30 then obesity=1;

*need to adjust bmi so those with bmi lt 0 have missing bmi;
if bmi lt 0 then bmi=.;

if (diabetes='INSULIN' or diabetes='NON-INSULIN' or diabetes='ORAL') then diabetes_=1;
else if diabetes='NO' then diabetes_=0;

if (fnstatus2='Partially D' or fnstatus2='Partially Dependent' or fnstatus2='Totally Dep' or fnstatus2='Totally Dependent' or
fnstatus2='Unknown') then fnstat=0;
if fnstatus2='Independent' then fnstat=1;

if smoke="Yes" then smoker=1;
if smoke="No" then smoker=0;

if hxcopd="Yes" then copd=1;
if hxcopd="No" then copd=0;

if ascites="Yes" then ascites_=1;
if ascites="No" then ascites_=0;

if hxchf="Yes" then chf=1;
if hxchf="Ye" then chf=1;
if hxchf="No" then chf=0;

if hypermed="Yes" then hypermed_=1;
if hypermed="No" then hypermed_=0;

if dialysis="Yes" then dialysis_=1;
if dialysis="Ye" then dialysis_=1;
if dialysis="No" then dialysis_=0;

if discancr="Yes" then cancer=1;
if discancr="No" then cancer=0;

if steroid="Yes" then steroid_=1;
if steroid="No" then steroid_=0;

if bleeddis="No" then bleed=0;
if bleeddis="Yes" then bleed=1;
if bleeddis=" " then bleed=0;

if transfus="Yes" then transfus_=1;
if transfus="No" then transfus_=0;

*if prsepis="None" then sepsis=0;
*if (prsepis="SIRS" or prsepis="Sepsis" or prsepis="Septic Shock") then sepsis=1;

if YRDEATH=-99 then YRDEATH=.;

if TOTHLOS=-99 then TOTHLOS=.;

if WTLOSS="Yes" then ten_pct_wtloss=1;
if WTLOSS="No" then ten_pct_wtloss=0;

run;

proc sort data=panniculectomy_d;
by race;
run;

data race;
set panniculectomy_d (keep=race race_new);
where race=' ';
run;

proc freq data=panniculectomy_d;
tables race race_new*race race_cat sex;
run;

proc freq data= panniculectomy_d;
tables DISCHDEST TOTHLOS REOPERATION1 REOPERATION2 READMISSION1 READMISSION2 READMISSION3 READMISSION4 READMISSION5 WTLOSS;
run;
proc univariate data=panniculectomy_d plot normal;
var YRDEATH TOTHLOS;
run;

proc format;
value home
0='Not home'
1='Home'
;
value death
0='No death'
1='Death'
;
value los_gt_3_
0='Length of stay less than or equal to 3 days'
1='Length of stay greater than 3 days'
;
value unplanned_reop
0='No unplanned reoperation or unknown'
1='Unplanned reoperation'
;
value unplanned_readmit
0='No unplanned readmission or unknown'
1='Unplanned readmission'
;
value any_complication
0='No complication'
1='Any complication experienced'
;
value maj_complication
0='No major complication'
1='Major complication experienced'
;
value wound_complication
0='No wound complication'
1='Wound complication experienced'
;
run;

proc univariate data=panniculectomy_d;
var height weight bmi;
run;

*identify new risk factors unique to panniculectomy project, outcome identification;
data panniculectomy_e;
set panniculectomy_d;

if sex='female' then sex_=0;
if sex='male' then sex_=1;
if (race_new='American Indian or Alaska' or race_new='American Indian or Alaska Native') then race=1;
if race_new='Asian' then race=2;
if race_new='Black or African American' then race=3;
if (race_new='Native Hawaiian or Pacific Islander' or race_new='Native Hawaiian or Pacifi' or race_new='Native Hawaiian or Other Pacific') then race=4;
if race_new='Some Other Race' then race=5;
if (race_new='Unknown/Not Reported' or race_new='Unknown') then race=6;
if (race_new='White American Indian or Alaska Nati' or race_new='White,Some Other Race ' or
race_new='Race combinations with low frequency') then race=7;
if race_new='White' then race=0;
if race_new='NULL' then race=' ';

if bmi lt 0 then bmi_cat=.;
if 0 le bmi lt 30 then bmi_cat=0;
if 30 le bmi lt 35 then bmi_cat=1;
if 35 le bmi lt 40 then bmi_cat=2;
if 40 le bmi lt 45 then bmi_cat=3;
if bmi ge 45 then bmi_cat=4;

if race=0 then race_cat=0;
if race=1 then race_cat=3;
if race=2 then race_cat=1;
if race=3 then race_cat=2;
if race=4 then race_cat=3;
if race=5 then race_cat=3;
if race=6 then race_cat=4;
if race=7 then race_cat=3;

if race_cat=0 then race_cat_b=0;
if race_cat=1 then race_cat_b=2;
if race_cat=2 then race_cat_b=1;
if race_cat=3 then race_cat_b=2;
if race_cat=4 then race_cat_b=3;

where bmi ne .;

*identify wound complication;
if (NWNDINFD gt 0 or NORGSPCSSI gt 0 or NDEHIS gt 0 or NSUPINFEC gt 0) then wound_complication=1;
else wound_complication=0;

*identify any_comp;
if (NWNDINFD gt 0 or NORGSPCSSI gt 0 or NDEHIS gt 0 or NOUPNEUMO gt 0 or NREINTUB gt 0 or NPULEMBOL gt 0 or NFAILWEAN gt 0 or
NOPRENAFL gt 0 or NCNSCVA gt 0 or NCDARREST gt 0 or NCDMI gt 0 or NOTHBLEED gt 0 or NOTHDVT gt 0 or NOTHSYSEP gt 0 or NOTHSESHOCK gt 0
or NSUPINFEC gt 0 or NURNINFEC gt 0)
then any_complication=1;
else any_complication=0;

*identify major complication;
if (NWNDINFD gt 0 or NORGSPCSSI gt 0 or NDEHIS gt 0 or NOUPNEUMO gt 0 or NREINTUB gt 0 or NPULEMBOL gt 0 or NFAILWEAN gt 0 or
NOPRENAFL gt 0 or NCNSCVA gt 0 or NCDARREST gt 0 or NCDMI gt 0 or NOTHBLEED gt 0 or NOTHDVT gt 0 or NOTHSYSEP gt 0 or NOTHSESHOCK gt 0)
then maj_complication=1;
else maj_complication=0;

*identify unplanned readmission;
if (READMISSION1="Yes" or READMISSION2="Yes" or READMISSION2="Ye" or READMISSION3="Yes" or READMISSION3="Ye") then unplanned_readmit=1;
else unplanned_readmit=0;

*identify unplanned reoperation;
if (REOPERATION1="Yes" or REOPERATION2="Yes" or REOPERATION2="Ye") then unplanned_reop=1;
else unplanned_reop=0;

*identify length of stay gt 3 days;
if TOTHLOS gt 3 then los_gt_3_ =1;
else if 0 le TOTHLOS le 3 then los_gt_3_ = 0;

*identify discharge destination - home vs not home;
if (DISCHDEST='Home' or DISCHDEST='Facility Which was Home' or DISCHDEST='Home/Permanent Residence') then home=1;
else home=0;

*identify mortality - discharge destination (DISCHDEST) or year of death (YRDEATH);
if (DISCHDEST='Expired' or YRDEATH ne .) then death=1;
else death=0;

*define plastic surg var;
if surgspec='Plastics' then plast_surg=1;
else plast_surg=0;

run;

proc freq data=panniculectomy_e;
tables readmission1 readmission2 readmission3 readmission4 readmission5;
run;

proc freq data=panniculectomy_e;
tables death los_gt_3_ unplanned_reop unplanned_readmit any_complication maj_complication wound_complication;
format death death. los_gt_3_ los_gt_3_. unplanned_reop unplanned_reop. unplanned_readmit unplanned_readmit. any_complication
any_complication. maj_complication maj_complication. wound_complication wound_complication.;
run;

proc freq data=panniculectomy_e;
tables race race_new*race race_cat sex;
run;

*demographics & risk factors for overall sample;

data missing_reop_readmit;
set panniculectomy_f;
where (reoperation1=' ' or reoperation2=' ' or readmission1=' ' or readmission2=' ' or readmission3=' ' or readmission4=' ' or
readmission5=' ');
run;

*limit the sample to the operation year of 2012 - 2022;
data panniculectomy_f;
set panniculectomy_e;
where 2012 le OperYR le 2022;
run;

proc freq data=panniculectomy_f;
tables OperYR;
run;

****** STOPPING PLACE FOR 4-5-24******************;


**************************************;
proc freq data=panniculectomy_f;
tables bmi_cat;
format bmi_cat bmi_cat.;
run;

data bmi_error;
set panniculectomy_e;
where bmi lt 0;
run;
*n=69 - not counted in bmi category or obese category;

proc freq data=panniculectomy_f;
tables sex_;
format sex_ sex.;
run;

proc freq data=panniculectomy_f;
tables race_new;
tables race;
tables race_cat;
tables race_cat_b;
*format race race. race_cat race_cat. race_cat_b race_cat_b.;
run;

proc freq data=panniculectomy_f;
tables ethnicity_hispanic;
tables ethnicity;
format ethnicity ethnicity.;
run;

proc univariate data=panniculectomy_f plot normal;
var age_num;
run;

proc freq data=panniculectomy_f;
tables age_cat;
format age_cat age_cat.;
*tables age_cat_b;
run;

proc univariate data=panniculectomy_f plot normal;
var bmi;
run;

proc freq data=panniculectomy_f;
tables bmi_cat obesity;
format bmi_cat bmi_cat. obesity obesity.;
run;

proc freq data=panniculectomy_f;
tables diabetes;
tables diabetes_ ;
run;

proc freq data=panniculectomy_f;
tables smoke;
tables smoker;
run;

proc freq data=panniculectomy_f;
tables fnstatus2;
tables fnstat;
run;

proc freq data=panniculectomy_f;
tables ventilat;
run;

proc freq data=panniculectomy_f;
tables hxcopd;
tables copd;
run;

proc freq data=panniculectomy_f;
tables ascites;
tables ascites_ ;
run;

proc freq data=panniculectomy_f;
tables hxchf;
tables chf;
run;

proc freq data=panniculectomy_f;
tables hypermed;
tables hypermed_;
run;

proc freq data=panniculectomy_f;
tables dialysis;
tables dialysis_;
run;

proc freq data=panniculectomy_f;
tables discancr;
tables cancer;
run;

proc freq data=panniculectomy_f;
tables steroid;
tables steroid_;
run;

proc freq data=panniculectomy_f;
tables bleedis;
tables bleed;
run;

proc freq data=panniculectomy_f;
tables transfus;
tables transfus_;
run;

proc freq data=panniculectomy_f;
tables prsepis;
*tables sepsis;
run;

proc freq data=panniculectomy_f;
tables DISCHDEST;
tables home;
run;

proc freq data=panniculectomy_e;
tables death los_gt_3_ unplanned_reop unplanned_readmit any_complication maj_complication wound_complication;
format death death. los_gt_3_ los_gt_3_. unplanned_reop unplanned_reop. unplanned_readmit unplanned_readmit. any_complication
any_complication. maj_complication maj_complication. wound_complication wound_complication.;
run;

*double check complication vars;
proc univariate data=panniculectomy_f;
var NWNDINFD ;
run;
proc univariate data=panniculectomy_f;
var NORGSPCSSI ;
run;
proc univariate data=panniculectomy_f;
var NDEHIS ;
run;
proc univariate data=panniculectomy_f;
var NOUPNEUMO ;
run;
proc univariate data=panniculectomy_f;
var NREINTUB ;
run;
proc univariate data=panniculectomy_f;
var NPULEMBOL ;
run;
proc univariate data=panniculectomy_f;
var  NFAILWEAN ;
run;
proc univariate data=panniculectomy_f;
var NOPRENAFL ;
run;
proc univariate data=panniculectomy_f;
var NCNSCVA ;
run;
proc univariate data=panniculectomy_f;
var NCDARREST ;
run;
proc univariate data=panniculectomy_f;
var NCDMI ;
run;
proc univariate data=panniculectomy_f;
var NOTHBLEED ;
run;
proc univariate data=panniculectomy_f;
var NOTHDVT ;
run;
proc univariate data=panniculectomy_f;
var NOTHSYSEP ;
run;
proc univariate data=panniculectomy_f;
var NOTHSESHOCK ;
run;
proc univariate data=panniculectomy_f;
var NSUPINFEC ;
run;
proc univariate data=panniculectomy_f;
var NURNINFEC ;
run;
*no missing values, all numerical ranging from 0-1/2/3;

proc freq data=panniculectomy_f;
tables any_complication maj_complication wound_complication abdominoplasty;
tables obesity*any_complication;
tables obesity*maj_complication;
tables obesity*wound_complication;
run;

proc freq data=panniculectomy_f;
tables death los_gt_3_ unplanned_reop unplanned_readmit any_complication maj_complication wound_complication;
format death death. los_gt_3_ los_gt_3_. unplanned_reop unplanned_reop. unplanned_readmit unplanned_readmit. any_complication
any_complication. maj_complication maj_complication. wound_complication wound_complication.;
run;


*demographics & risk factors stratified by obesity - overall sample;
proc freq data=panniculectomy_f;
tables obesity*bmi_cat;
format bmi_cat bmi_cat.;
run;

data bmi_error;
set panniculectomy_e;
where bmi lt 0;
run;
*n=69 - not counted in bmi category or obese category;

proc freq data=panniculectomy_f;
tables obesity*sex_;
format sex_ sex.;
run;

proc freq data=panniculectomy_f;
tables obesity*race/chisq;
tables obesity*race_cat;
tables race_cat_b;
*format race race. race_cat race_cat. race_cat_b race_cat_b.;
run;

proc freq data=panniculectomy_f;
tables any_complication*race/chisq;
tables any_complication*race_cat/chisq;
tables race_cat_b;
*format race race. race_cat race_cat. race_cat_b race_cat_b.;
run;

proc freq data=panniculectomy_f;
tables ethnicity_hispanic;
tables ethnicity*obesity;
format ethnicity ethnicity.;
run;

proc sort data=panniculectomy_f;
by obesity;
run;

proc univariate data=panniculectomy_f plot normal;
var age_num;
by obesity;
run;

proc freq data=panniculectomy_f;
tables obesity*age_cat;
format age_cat age_cat.;
*tables age_cat_b;
run;

proc univariate data=panniculectomy_f plot normal;
var bmi;
run;

proc freq data=panniculectomy_f;
tables bmi_cat obesity;
format bmi_cat bmi_cat. obesity obesity.;
run;

proc freq data=panniculectomy_f;
tables obesity*diabetes;
tables obesity*diabetes_ ;
run;

proc freq data=panniculectomy_f;
tables smoke;
tables obesity*smoker;
run;

proc freq data=panniculectomy_f;
tables fnstatus2;
tables obesity*fnstat;
run;

proc freq data=panniculectomy_f;
tables ventilat;
run;

proc freq data=panniculectomy_f;
tables hxcopd;
tables obesity*copd;
run;

proc freq data=panniculectomy_f;
tables ascites;
tables ascites_ ;
run;

proc freq data=panniculectomy_f;
tables hxchf;
tables obesity*chf;
run;

proc freq data=panniculectomy_f;
tables hypermed;
tables obesity*hypermed_;
run;

proc freq data=panniculectomy_f;
tables dialysis;
tables obesity*dialysis_;
run;

proc freq data=panniculectomy_f;
tables discancr;
tables obesity*cancer;
run;

proc freq data=panniculectomy_f;
tables steroid;
tables obesity*steroid_;
run;

proc freq data=panniculectomy_f;
tables bleeddis;
tables obesity*bleed;
run;

proc freq data=panniculectomy_f;
tables transfus;
tables obesity*transfus_;
run;

proc freq data=panniculectomy_f;
tables ten_pct_wtloss*OperYR;
tables OperYR;
tables obesity*ten_pct_wtloss;
run;

proc freq data=panniculectomy_f;
tables prsepis;
*tables sepsis;
run;

proc freq data=panniculectomy_f;
tables DISCHDEST;
tables obesity*home;
run;

proc freq data=panniculectomy_f;
tables surgspec;
tables plast_surg;
tables obesity*plast_surg;
run;

*stratify datasets by abdominoplasty status;
*define panniculectomy dataset;
data panniculectomy_only_;
set panniculectomy_f;
where Abdominoplasty=0;
run;
*n=11,842;

*define abdominoplasty dataset;
data abdominoplasty_;
set panniculectomy_f;
where Abdominoplasty=1;
run;
*n=7,049;

proc freq data=panniculectomy_f;
tables abdominoplasty;
run;

libname pannic 'U:\Khorgami_Wang_BMI_Panniculectomy';

proc copy in=work out=pannic memtype=data;
   select panniculectomy_f;
run;
quit;

data work.panniculectomy_f;
set pannic.panniculectomy_f;
run;

*define plastic surg var;
data panniculectomy_f;
set panniculectomy_f;
if surgspec='Plastics' then plast_surg=1;
else plast_surg=0;
run;

proc freq data=panniculectomy_f;
tables abdominoplasty;
tables obesity*abdominoplasty;
tables ethnicity;
tables race;
run;


*univariate analsysis of association between obesity and any, major, or wound complication;
*overall sample;
*any complication;
proc univariate data=panniculectomy_f plot normal;
var bmi age;
run;

proc freq data=panniculectomy_f;
tables obesity*any_complication/chisq exact oddsratio;
format obesity obesity. any_complication any_complication.;
run;

proc logistic data=panniculectomy_f;
class obesity (ref='0')/param=ref;
model any_complication(event='1')= obesity;
run;

proc freq data=panniculectomy_f;
tables bmi_cat*any_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. any_complication any_complication.;
run;

*major complication;
proc freq data=panniculectomy_f;
tables obesity*maj_complication/chisq exact oddsratio;
format obesity obesity. maj_complication maj_complication.;
run;

proc freq data=panniculectomy_f;
tables bmi_cat*maj_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. maj_complication maj_complication.;
run;

*wound complication;
proc freq data=panniculectomy_f;
tables obesity*wound_complication/chisq exact oddsratio;
format obesity obesity. wound_complication wound_complication.;
run;

proc freq data=panniculectomy_f;
tables bmi_cat*wound_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. wound_complication wound_complication.;
run;

*unplanned readmission;
proc freq data=panniculectomy_f;
tables obesity*unplanned_readmit/chisq exact oddsratio;
format obesity obesity. unplanned_readmit unplanned_readmit.;
run;

*unplanned reoperation;
proc freq data=panniculectomy_f;
tables obesity*unplanned_reop/chisq exact oddsratio;
format obesity obesity. unplanned_reop unplanned_reop.;
run;

*LOS > 3 days;
proc freq data=panniculectomy_f;
tables obesity*los_gt_3_/chisq exact oddsratio;
format obesity obesity. los_gt_3_ los_gt_3_.;
run;

*discharge to a facility;
proc freq data=panniculectomy_f;
tables obesity*home/chisq exact oddsratio;
format obesity obesity. home home.;
run;

*death;
proc freq data=panniculectomy_f;
tables obesity*death/chisq exact oddsratio;
format obesity obesity. death death.;
run;

proc univariate data=panniculectomy_f;
var TOTHLOS;
run;

proc freq data=panniculectomy_f;
tables death home los_gt_3_ unplanned_readmit wound_complication maj_complication any_complication;
run;

*those with panniculectomy and no abdominoplasty;
*any complication;
proc univariate data=panniculectomy_only_ plot normal;
var bmi age;
run;

proc freq data=panniculectomy_only_;
tables obesity*any_complication/chisq exact oddsratio;
format obesity obesity. any_complication any_complication.;
run;

proc logistic data=panniculectomy_only_;
class obesity (ref='0')/param=ref;
model any_complication(event='1')= obesity;
run;

proc freq data=panniculectomy_only_;
tables bmi_cat*any_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. any_complication any_complication.;
run;

*major complication;
proc freq data=panniculectomy_only_;
tables obesity*maj_complication/chisq exact oddsratio;
format obesity obesity. maj_complication maj_complication.;
run;

proc freq data=panniculectomy_only_;
tables bmi_cat*maj_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. maj_complication maj_complication.;
run;

*wound complication;
proc freq data=panniculectomy_only_;
tables obesity*wound_complication/chisq exact oddsratio;
format obesity obesity. wound_complication wound_complication.;
run;

proc freq data=panniculectomy_only_;
tables bmi_cat*wound_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. wound_complication wound_complication.;
run;

*unplanned readmission;
proc freq data=panniculectomy_only_;
tables obesity*unplanned_readmit/chisq exact oddsratio;
format obesity obesity. unplanned_readmit unplanned_readmit.;
run;

*unplanned reoperation;
proc freq data=panniculectomy_only_;
tables obesity*unplanned_reop/chisq exact oddsratio;
format obesity obesity. unplanned_reop unplanned_reop.;
run;

*LOS > 3 days;
proc freq data=panniculectomy_only_;
tables obesity*los_gt_3_/chisq exact oddsratio;
format obesity obesity. los_gt_3_ los_gt_3_.;
run;

*discharge to a facility;
proc freq data=panniculectomy_only_;
tables obesity*home/chisq exact oddsratio;
format obesity obesity. home home.;
run;

proc logistic data=panniculectomy_only_;
class obesity (ref='0')/param=ref;
model home (event='0')= obesity;
run;

*death;
proc freq data=panniculectomy_only_;
tables obesity*death/chisq exact oddsratio;
format obesity obesity. death death.;
run;

*those with panniculectomy + abdominoplasty;
*any complication;
proc univariate data=abdominoplasty_ plot normal;
var bmi age;
run;

proc freq data=abdominoplasty_;
tables obesity*any_complication/chisq exact oddsratio;
format obesity obesity. any_complication any_complication.;
run;

proc logistic data=abdominoplasty_;
class obesity (ref='0')/param=ref;
model any_complication(event='1')= obesity;
run;

proc freq data=abdominoplasty_;
tables bmi_cat*any_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. any_complication any_complication.;
run;

*major complication;
proc freq data=abdominoplasty_;
tables obesity*maj_complication/chisq exact oddsratio;
format obesity obesity. maj_complication maj_complication.;
run;

proc freq data=abdominoplasty_;
tables bmi_cat*maj_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. maj_complication maj_complication.;
run;

*wound complication;
proc freq data=abdominoplasty_;
tables obesity*wound_complication/chisq exact oddsratio;
format obesity obesity. wound_complication wound_complication.;
run;

proc freq data=abdominoplasty_;
tables bmi_cat*wound_complication/chisq exact oddsratio;
format bmi_cat bmi_cat. wound_complication wound_complication.;
run;

*unplanned readmission;
proc freq data=abdominoplasty_;
tables obesity*unplanned_readmit/chisq exact oddsratio;
format obesity obesity. unplanned_readmit unplanned_readmit.;
run;

*unplanned reoperation;
proc freq data=abdominoplasty_;
tables obesity*unplanned_reop/chisq exact oddsratio;
format obesity obesity. unplanned_reop unplanned_reop.;
run;

*LOS > 3 days;
proc freq data=abdominoplasty_;
tables obesity*los_gt_3_/chisq exact oddsratio;
format obesity obesity. los_gt_3_ los_gt_3_.;
run;

*discharge to a facility;
proc freq data=abdominoplasty_;
tables obesity*home/chisq exact oddsratio;
format obesity obesity. home home.;
run;

proc logistic data=abdominoplasty_;
class obesity (ref='0')/param=ref;
model home (event='0')= obesity;
run;

*death;
proc freq data=abdominoplasty_;
tables obesity*death/chisq exact oddsratio;
format obesity obesity. death death.;
run;

proc freq data=abdominoplasty_;
tables death los_gt_3_ unplanned_reop unplanned_readmit any_complication maj_complication wound_complication home;
format death death. los_gt_3_ los_gt_3_. unplanned_reop unplanned_reop. unplanned_readmit unplanned_readmit. any_complication
any_complication. maj_complication maj_complication. wound_complication wound_complication. home home.;
run;
*univaraite analyssis of association between obesity and unplanned readmission, unplanned reoperation, los gt 3 days,
discharge to home vs not home, mortality (death vs no death);


*univariate analysis of any complication by risk factors;
proc freq data=panniculectomy_f;
tables ten_pct_wtloss*OperYR;
tables OperYR;
tables ten_pct_wtloss*any_complication/chisq;
run;

proc freq data=panniculectomy_f;
tables sex_*any_complication/chisq exact;
format sex_ sex.;
run;

proc freq data=panniculectomy_f;
tables age_cat*any_complication/chisq;
format age_cat age_cat.;
*tables age_cat_b;
run;

proc freq data=panniculectomy_f;
*tables race;
tables race_cat*any_complication/chisq ;
tables race_cat_b*any_complication/chisq ;
format race_cat race_cat. race_cat_b race_cat_b.;
run;

proc freq data=panniculectomy_f;
tables ethnicity_hispanic;
tables ethnicity*any_complication/chisq exact;
format ethnicity ethnicity.;
run;

proc freq data=panniculectomy_f;
tables ethnicity_hispanic;
tables ethnicity*obesity/chisq exact;
format ethnicity ethnicity.;
run;

proc logistic data=panniculectomy_f;
model any_complication (event='1')= age_num;
run;

proc freq data=panniculectomy_f;
tables age_cat*any_complication/chisq exact;
tables age_cat_b*any_complication/chisq exact;
format age_cat age_cat.;
run;

proc univariate data=panniculectomy_f plot normal;
var bmi;
run;

proc freq data=panniculectomy_f;
tables obesity*any_complication/chisq ;
*tables bmi_cat_b*any_complication/chisq;
format obesity obesity.;
run;

proc freq data=panniculectomy_f;
tables diabetes;
tables diabetes_ *any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables smoke;
tables smoker*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables fnstatus2;
tables fnstat*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables ventilat;
run;

proc freq data=panniculectomy_f;
tables hxcopd;
tables copd*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables ethnicity*any_complication/chisq exact;
format ethnicity ethnicity.;
run;

proc freq data=panniculectomy_f;
tables ascites;
tables ascites_ *any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables hxchf;
tables chf*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables hypermed;
tables hypermed_*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables dialysis;
tables dialysis_*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables discancr;
tables cancer*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables steroid;
tables steroid_*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables home;
tables home*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables bleeddis;
tables bleed*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables transfus;
tables transfus_*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables CPT;
tables colost_type*any_complication/chisq exact;
run;

proc freq data=panniculectomy_f;
tables plast_surg;
tables plast_surg*any_complication/chisq exact;
run;


*Multivariable analysis;
*double check race result;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0')  race_cat(ref='0') /param=ref;
model any_complication(event='1')= race_cat /scale=none aggregate;
run;
proc logistic data=panniculectomy_f ;
class  race_cat(ref='0') /param=ref;
model maj_complication(event='1')= race_cat /scale=none aggregate;
run;
proc logistic data=panniculectomy_f ;
class  race_cat(ref='0') /param=ref;
model wound_complication(event='1')= race_cat /scale=none aggregate;
run;
data sup_wound_infec;
set panniculectomy_f;
if NSUPINFEC gt 0 then sup_infec=1;
if NSUPINFEC=0 then sup_infec=0;

if NURNINFEC gt 0 then UTI=1;
if NURNINFEC=0 then UTI=0;

run;

proc freq data=sup_wound_infec;
tables sup_infec;
tables
tables race_cat*sup_infec/chisq;
run;
proc logistic data=sup_wound_infec ;
class  race_cat(ref='0') /param=ref;
model sup_infec(event='1')= race_cat /scale=none aggregate;
run;
*remove superficial wound infection from any complication definition;
data sup_wound_infec_b;
set sup_wound_infec;
if (NWNDINFD gt 0 or NORGSPCSSI gt 0 or NDEHIS gt 0 or NOUPNEUMO gt 0 or NREINTUB gt 0 or NPULEMBOL gt 0 or NFAILWEAN gt 0 or
NOPRENAFL gt 0 or NCNSCVA gt 0 or NCDARREST gt 0 or NCDMI gt 0 or NOTHBLEED gt 0 or NOTHDVT gt 0 or NOTHSYSEP gt 0 or NOTHSESHOCK gt 0
or NURNINFEC gt 0)
then any_complication_b=1;
else any_complication_b=0;
run;
proc freq data=sup_wound_infec_b;
tables any_complication_b;
tables race_cat*any_complication_b/chisq;
run;
proc logistic data=sup_wound_infec_b ;
class  race_cat(ref='0') /param=ref;
model any_complication_b(event='1')= race_cat /scale=none aggregate;
run;


*start of multivariable model analysis;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') fnstat(ref='1') bleed(ref='0') plast_surg(ref='0') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat bleed plast_surg/scale=none aggregate;
run;

*remove bleed;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') home(ref='1') fnstat(ref='1') plast_surg(ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg /scale=none aggregate;
run;
*****FINAL MODEL CHOSEN - MODIFY SEE FURTHER DOWN;

*test for confounding - add back in bleed and dialysis;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') home(ref='1') fnstat(ref='1') plast_surg(ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg bleed dialysis_ /scale=none aggregate;
run;

*test assumptions of model;
*no values fall below 0.1 for tolerance;
*nothing above the value of 10 for variance inflation;
*for collinearity, some of of our Eigenvalues are close to zero (online there is no cut-off provided, but all are greater than 0.01),
and one of the Condition Index values are abnormally large (online a rough cut-off given is 30 is a number that warrants further investigation -
https://blogs.sas.com/content/iml/2020/01/23/collinearity-regression-collin-option.html);
proc reg data=panniculectomy_f;
model any_complication= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg /  vif tol collin;
run;
*for the For the 11th row (condition index=34.4), there are two cells that are 0.5 or greater (rounded to four decimals). The cells are in the Intercept and functional health stat columns.
This indicates that the Functional health stat and Intercept terms are nearly collinear. Collinearities with the intercept term can be hard to interpret.;

**** WHAT IF WE INCLUDED ETHNICITY ******;
*start of multivariable model analysis;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0')  ethnicity(ref='0') race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') fnstat(ref='1') bleed(ref='0') plast_surg(ref='0') /param=ref;
model any_complication(event='1')= sex_ ethnicity race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat bleed plast_surg/scale=none aggregate;
run;

*remove bleed;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0') ethnicity(ref='0') race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') home(ref='1') fnstat(ref='1') plast_surg(ref='1') /param=ref;
model any_complication(event='1')= sex_ ethnicity race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg /scale=none aggregate;
run;

*remove steroid use;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0') ethnicity(ref='0') race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') home(ref='1') fnstat(ref='1') plast_surg(ref='1') /param=ref;
model any_complication(event='1')= sex_ ethnicity race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat plast_surg /scale=none aggregate;
run;

*****FINAL MODEL CHOSEN - MODIFIED - SEE FURTHER DOWN;

*test for confounding - add back in bleed and dialysis and steroid;
proc logistic data=panniculectomy_f ;
class sex_ (ref='0') ethnicity(ref='0') race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') steroid_(ref='0') home(ref='1') fnstat(ref='1') plast_surg(ref='1') /param=ref;
model any_complication(event='1')= sex_ ethnicity race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg bleed dialysis_ /scale=none aggregate;
run;

*test assumptions of model;
*no values fall below 0.1 for tolerance;
*nothing above the value of 10 for variance inflation;
*for collinearity, some of of our Eigenvalues are close to zero (online there is no cut-off provided, but all are greater than 0.01),
and one of the Condition Index values are abnormally large (online a rough cut-off given is 30 is a number that warrants further investigation -
https://blogs.sas.com/content/iml/2020/01/23/collinearity-regression-collin-option.html);
proc reg data=panniculectomy_f;
model any_complication= sex_ race_cat ethnicity age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg /  vif tol collin;
run;
*for the For the 11th row (condition index=34.4), there are two cells that are 0.5 or greater (rounded to four decimals). The cells are in the Intercept and functional health stat columns.
This indicates that the Functional health stat and Intercept terms are nearly collinear. Collinearities with the intercept term can be hard to interpret.;
proc reg data=panniculectomy_f;
model any_complication= sex_ race_cat ethnicity age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg /  vif tol collinoint;
run;


*what if we reomove functional health status?;
proc reg data=panniculectomy_f;
model any_complication= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ plast_surg /  vif tol collin;
run;
*collinearity no longer exists;

*what if we center the data? ;
proc reg data=panniculectomy_f;
model any_complication= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ steroid_ fnstat plast_surg/  vif tol collinoint;
run;

*no collinearity detected;

*how does model fit change when we remove functional health status?;
proc logistic data=panniculectomy_f  plots=(roc);
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') home(ref='1') fnstat(ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_  /scale=none aggregate;
run;

*because standard errors for coefficients in the model remain steady, keep fnstat in the model;


proc logistic data=panniculectomy_f  plots=(roc);
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') fnstat(ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat /scale=none aggregate;
run;
*****FINAL MODEL CHOSEN - MODIFIED - SEE FURTHER DOWN;


********* ;
proc logistic data=sup_wound_infec_b  plots=(roc);
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') home(ref='1') fnstat(ref='1') /param=ref;
model any_complication_b(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ home fnstat /scale=none aggregate;
run;

*Define BMI Categories;
data panniculectomy_g;
set panniculectomy_f;
if 0 le BMI lt 30 then obese_cat=0;
else if 30 le BMI lt 35 then obese_cat=1;
else if 35 le BMI lt 40 then obese_cat=2;
else if 40 le BMI lt 45 then obese_cat=3;
else if BMI ge 45 then obese_cat=4;
run;

proc freq data=panniculectomy_g;
tables obese_cat;
tables obese_cat*any_complication;
tables obese_cat*maj_complication;
tables obese_cat*wound_complication;
run;

proc logistic data=panniculectomy_g ;
class obese_cat(ref='0') /param=ref;
model any_complication(event='1')= obese_cat /scale=none aggregate;
run;

proc logistic data=panniculectomy_g ;
class obese_cat(ref='0') /param=ref;
model maj_complication(event='1')= obese_cat /scale=none aggregate;
run;

proc logistic data=panniculectomy_g ;
class obese_cat(ref='0') /param=ref;
model wound_complication(event='1')= obese_cat /scale=none aggregate;
run;

*make adjustments based on final meet;

*look at age var disbtrib;
proc univariate data=panniculectomy_f;
var age_num;
run;

data panniculectomy_h;
set panniculectomy_f;
if 0 le age_num le 45 then age_cat=0;
if age_num gt 45 then age_cat=1;

if 0 le age_num le 40 then age_cat_b=0;
if age_num gt 40 then age_cat_b=1;

if 0 le age_num le 50 then age_cat_c=0;
if age_num gt 50 then age_cat_c=1;

if 0 le age_num le 60 then age_cat_d=0;
if age_num gt 60 then age_cat_d=1;
run;

proc freq data=panniculectomy_h;
tables age_cat age_cat_b age_cat_c age_cat_d;
tables age_cat*any_complication/chisq;
tables age_cat_b*any_complication/chisq;
tables age_cat_c*any_complication/chisq;
run;

proc freq data=panniculectomy_h;
tables age_cat age_cat_b age_cat_c age_cat_d;
tables age_cat*obesity/chisq;
tables age_cat_b*obesity/chisq;
tables age_cat_c*obesity/chisq;
run;

*use median of 45 years;
proc logistic data=panniculectomy_h  plots=(roc);
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') fnstat(ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat /scale=none aggregate;
run;


*look at LOS distrib;
proc univariate data=panniculectomy_h;
var tothlos;
run;

data panniculectomy_i;
set panniculectomy_h;
if tothlos=0 then los_cat=0;
else if tothlos=1 then los_cat=1;
else if tothlos=2 then los_cat=2;
else if tothlos=3 then los_cat=3;
else if tothlos gt 3 then los_cat=4;

if 0 le tothlos le 2 then los_cat_b=0;
else if tothlos gt 2 then los_cat_b=1;
run;

proc freq data=panniculectomy_i;
tables los_cat los_cat_b;
tables los_cat_b*obesity/chisq;
run;

data pannic_only_b;
set panniculectomy_i;
where abdominoplasty=0;
run;

data abdomino_b;
set panniculectomy_i;
where abdominoplasty=1;
run;

proc freq data=pannic_only_b;
tables los_cat_b*obesity/chisq oddsratio;
run;

proc freq data=abdomino_b;
tables los_cat_b*obesity/chisq oddsratio;
run;

proc freq data=panniculectomy_j;
tables ethnicity;
run;

*collapse unknown/missing race, ethnicity;
data panniculectomy_j;
set panniculectomy_i;

if race=0 then race_cat=0;
if race=1 then race_cat=3;
if race=2 then race_cat=1;
if race=3 then race_cat=2;
if race=4 then race_cat=3;
if race=5 then race_cat=3;
if race=6 then race_cat=3;
if race=7 then race_cat=3;

if (ethnicity=0 or ethnicity=2) then ethnicity_cat=0;
if ethnicity=1 then ethnicity_cat=1;

run;

proc freq data=panniculectomy_j;
tables ethnicity_cat;
run;

proc freq data=panniculectomy_j;
tables race_cat;
run;

************************** FINAL MODEL CHOSEN FOR PAPER ******************************************;
libname pann 'U:\Khorgami_Wang_BMI_Panniculectomy';

data work.panniculectomy_f;
set pann.panniculectomy_f;
run;

proc logistic data=panniculectomy_j  plots=(roc);
class sex_ (ref='0')  race_cat(ref='0') age_cat (ref='0') ethnicity_cat (ref='0') obesity(ref='0') diabetes_(ref='0') smoker(ref='0') copd(ref='0')
chf(ref='0') hypermed_(ref='0') fnstat(ref='1') plast_surg (ref='1') /param=ref;
model any_complication(event='1')= sex_ race_cat ethnicity_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat plast_surg/scale=none aggregate
selection=backward slstay=0.05;
run;

*test assumptions of model;
*no values fall below 0.1 for tolerance;
*nothing above the value of 10 for variance inflation;
proc reg data=panniculectomy_j;
model any_complication= sex_ race_cat ethnicity_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat plast_surg /  vif tol;
run;

*supplemental material of race by SSI, race by UTI, race by major comp, race by any comp;
data sup_wound_infec;
set panniculectomy_j;
if NSUPINFEC gt 0 then sup_infec=1;
if NSUPINFEC=0 then sup_infec=0;

if NURNINFEC gt 0 then UTI=1;
if NURNINFEC=0 then UTI=0;

run;

proc freq data=panniculectomy_j;
tables any_complication sex_ race_cat ethnicity_cat age_cat obesity diabetes_ smoker copd chf hypermed_ fnstat plast_surg;
run;

proc format;
value race_cat;
0='White'
1='Asian'
2='Black or African American'
3='Other'
;
run;

proc freq data=sup_wound_infec;
tables sup_infec;
tables UTI;
tables race_cat;
tables race_cat*sup_infec/chisq;
tables race_cat*UTI/chisq;
tables race_cat*maj_complication/chisq;
tables race_cat*any_complication/chisq;
format race_cat race_cat.;
run;

proc logistic data=sup_wound_infec ;
class  race_cat(ref='0') /param=ref;
model sup_infec(event='1')= race_cat /scale=none aggregate;
run;

proc logistic data=sup_wound_infec ;
class  race_cat(ref='0') /param=ref;
model UTI(event='1')= race_cat /scale=none aggregate;
run;

proc logistic data=sup_wound_infec ;
class  race_cat(ref='0') /param=ref;
model maj_complication(event='1')= race_cat /scale=none aggregate;
run;

proc logistic data=sup_wound_infec ;
class  race_cat(ref='0') /param=ref;
model any_complication(event='1')= race_cat /scale=none aggregate;
run;


**** post-hoc power analysis ****;
proc power;
        /* Logistic Regression Power Analysis */

 logistic
 test = lrchi
 vardist("obesity") = ordinal((0, 1) : (0.491, 0.509))
 vardist("sex_") = ordinal((0, 1) : (0.894, 0.106))
 vardist("race_asian") = ordinal((0, 1) : (0.99, 0.01))
 vardist("race_black") = ordinal((0, 1) : (0.85, 0.15))
 vardist("race_other") = ordinal((0, 1) : (0.794, 0.206))
 vardist("ethnicity_cat") = ordinal((0, 1) : (0.893, 0.107))
 vardist("age_cat") = ordinal((0, 1) : (0.504, 0.496))
 vardist("diabetes_") = ordinal((0, 1) : (0.893, 0.107))
 vardist("smoker") = ordinal((0, 1) : (0.916, 0.084))
 vardist("copd") = ordinal((0, 1) : (0.986, 0.014))
 vardist("chf") = ordinal((0, 1) : (0.997, 0.003))
 vardist("hypermed_") = ordinal((0, 1) : (0.741, 0.259))
 vardist("fnstat") = ordinal((0, 1) : (0.991, 0.009))
 vardist("plast_surg") = ordinal((0, 1) : (0.835, 0.165))
/* Specify the predictor variable */

 testpredictor = 'obesity'

 /* Specify covariates */

 covariates = 'sex_' | 'race_asian' | 'race_black' | 'race_other' | 'ethnicity_cat' | 'age_cat' | 'diabetes_' | 'smoker' | 'copd' | 'chf' | 'hypermed_' | 'fnstat' | 'plast_surg'
/* Response prob */
 responseprob = 0.113 

 /* Specify the effect size of primary predictor */

 testoddsratio = 1.97 

/* specify the effect size of covariates of interes */
 covoddsratios = 1.25 | 0.69 | 0.79 | 1.14 | 0.80 | 1.15 | 1.47 | 1.56 | 1.52 | 2.14 | 1.20 | 2.26 | 2.02
/* Specify the sample size */

 ntotal = 18890 /* Example: Sample size from original study */

/* Specify the alpha level */

 alpha = 0.05

/* Calculate power */

 power = .;

run;

proc power;
        /* Logistic Regression Power Analysis */

 logistic
 test = lrchi
 vardist("obesity") = ordinal((0, 1) : (0.491, 0.509))
 vardist("sex_") = ordinal((0, 1) : (0.894, 0.106))
 vardist("race_asian") = ordinal((0, 1) : (0.99, 0.01))
 vardist("race_black") = ordinal((0, 1) : (0.85, 0.15))
 vardist("race_other") = ordinal((0, 1) : (0.794, 0.206))
 vardist("ethnicity_cat") = ordinal((0, 1) : (0.893, 0.107))
 vardist("age_cat") = ordinal((0, 1) : (0.504, 0.496))
 vardist("diabetes_") = ordinal((0, 1) : (0.893, 0.107))
 vardist("smoker") = ordinal((0, 1) : (0.916, 0.084))
 vardist("copd") = ordinal((0, 1) : (0.986, 0.014))
 vardist("chf") = ordinal((0, 1) : (0.997, 0.003))
 vardist("hypermed_") = ordinal((0, 1) : (0.741, 0.259))
 vardist("fnstat") = ordinal((0, 1) : (0.991, 0.009))
 vardist("plast_surg") = ordinal((0, 1) : (0.835, 0.165))
/* Specify the predictor variable */

 testpredictor = 'race_other'

 /* Specify covariates */

 covariates = 'sex_' | 'race_asian' | 'race_black' | 'obesity' | 'ethnicity_cat' | 'age_cat' | 'diabetes_' | 'smoker' | 'copd' | 'chf' | 'hypermed_' | 'fnstat' | 'plast_surg'
/* Response prob */
 responseprob = 0.113 

 /* Specify the effect size of primary predictor */

 testoddsratio = 1.14 

/* specify the effect size of covariates of interes */
 covoddsratios = 1.25 | 0.69 | 0.79 | 1.97 | 0.80 | 1.15 | 1.47 | 1.56 | 1.52 | 2.14 | 1.20 | 2.26 | 2.02
/* Specify the sample size */

 ntotal = 18890 /* Example: Sample size from original study */

/* Specify the alpha level */

 alpha = 0.05

/* Calculate power */

 power = .;

run;

proc freq data=panniculectomy_j;
tables any_complication obesity sex_ race_cat ethnicity_cat age_cat diabetes_ smoker copd chf hypermed_ fnstat plast_surg ;
format race_cat race_cat.;
run;
