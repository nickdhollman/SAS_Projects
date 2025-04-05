

proc setinit;
run;
*Moen - NHANES - longitudinal phase 2 study;


************** STOCK SYNTAX BELOW IS FROM PHASE 1 CROSS-SECTIONAL STUDY*********************;
*************************************************************************************************;
* Example code to download/import NHANES data files (SAS transport .XPT files) as a dataset     *;
* For SAS and SAS-callable SUDAAN                                                               *;
*************************************************************************************************;

***************************************************************************;
** Example 1: import SAS transport file that is saved on your hard drive **;
***************************************************************************;

* First, download the NHANES 2015-2016 Demographics file and save it to your hard drive *;
* from: https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Demographics&CycleBeginYear=2015 *;
* You may need to right-click the link to the data file and select "Save target as..." *;


************ IMPORT DATA FOR BASELINE - 1999 - 2014 *****************************;


*********** CBC - contains RDW, NLR (segmented neutrophil num / lymphocyte number) data ********************;

** TutorialUser: update this libname to reference the directory on your hard drive where you have saved the files **;
* note that the libref points to the .xpt file, NOT the directory it is saved in (unlike a typical libname) *;
libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\LAB25.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc;
  set xp.LAB25;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\L25_B.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_B;
  set xp.L25_B;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\L25_C.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_C;
  set xp.L25_C;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\CBC_D.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_D;
  set xp.CBC_D;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\CBC_E.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_E;
  set xp.CBC_E;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\CBC_F.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_F;
  set xp.CBC_F;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\CBC_G.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_G;
  set xp.CBC_G;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\CBC_RDW_NLR\CBC_H.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cbc_H;
  set xp.CBC_H;
rename LBDNENO = neutro;
rename LBDLYMNO = lympho;
rename LBXRDW = rdw;
run;

********** STACK CBC DATA ************;
data CBC_ ;
set CBC CBC_B CBC_C CBC_D CBC_E CBC_F CBC_G CBC_H;
run;

data CBC_master;
set CBC_ (keep=seqn neutro lympho rdw);
run;

proc copy in=work out=moen;
select cbc_master;
run;


*********** HDL *********************;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\HDL_H.xpt";

* or using a data step *;
data hdl_H;
  set xp.HDL_H;
rename LBDHDD = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\HDL_G.xpt";

* or using a data step *;
data hdl_G;
  set xp.HDL_G;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\HDL_F.xpt";

* or using a data step *;
data hdl_F;
  set xp.HDL_F;
rename LBDHDD = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\HDL_E.xpt";

* or using a data step *;
data hdl_E;
  set xp.HDL_E;
rename LBDHDD = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\HDL_D.xpt";

* or using a data step *;
data hdl_D;
  set xp.HDL_D;
rename LBDHDD = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\L13_C.xpt";

* or using a data step *;
data L13_C;
  set xp.L13_C;
run;

*trim to only HDL data;
data HDL_C;
set L13_C (keep=seqn LBXHDD LBDHDDSI);
rename LBXHDD = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\L13_B.xpt";

* or using a data step *;
data L13_B;
  set xp.L13_B;
run;

*trim to only HDL data;
data HDL_B;
set L13_B (keep=seqn LBDHDL LBDHDLSI);
rename LBDHDL = HDL;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\HDL\LAB13.xpt";

* or using a data step *;
data LAB13;
  set xp.LAB13;
run;

*trim to only HDL data;
data HDL;
set LAB13 (keep=seqn LBDHDL LBDHDLSI);
rename LBDHDL = HDL;
run;


*************** STACK HDL DATA ***********************;
data HDL_ ;
set HDL HDL_B HDL_C HDL_D HDL_E HDL_F HDL_G HDL_H;
run;

data HDL_master;
set HDL_ (keep=seqn HDL);
run;

proc copy in=work out=moen;
select hdl_master;
run;

********** LDL & TRIGLYCERIDES ********;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\LAB13AM.xpt";

* or using a data step *;
data TG;
  set xp.LAB13AM;
rename LBXTR = TG;
rename WTSAF4YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\L13AM_B.xpt";

* or using a data step *;
data TG_B;
  set xp.L13AM_B;
rename LBXTR = TG;
rename WTSAF4YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\L13AM_C.xpt";

* or using a data step *;
data TG_C;
  set xp.L13AM_C;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\TRIGLY_D.xpt";

* or using a data step *;
data TG_D;
  set xp.TRIGLY_D;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\TRIGLY_E.xpt";

* or using a data step *;
data TG_E;
  set xp.TRIGLY_E;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\TRIGLY_F.xpt";

* or using a data step *;
data TG_F;
  set xp.TRIGLY_F;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\TRIGLY_G.xpt";

* or using a data step *;
data TG_G;
  set xp.TRIGLY_G;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\TG\TRIGLY_H.xpt";

* or using a data step *;
data TG_H;
  set xp.TRIGLY_H;
rename LBXTR = TG;
rename WTSAF2YR = fast_weight;
run;

******** STACK TG DATA *********;

data TG_ ;
set TG TG_B TG_C TG_D TG_E TG_F TG_G TG_H;
run;

data TG_master;
set TG_ (keep=seqn TG fast_weight);
run;

proc copy in=work out=moen;
select TG_master;
run;


******** HEALTH COMORBIDITIES SURVEY DATA (CVD) *************;

libname XP xport "U:\Moen_CVD_risk\MCQ_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data cvd;
  set xp.MCQ_J;
run;


******* THE ABOVE CONTAINS ALL OUR PRIMARY EXPOSURES/OUTCOMES OF INTEREST, BUT WE NEED TO ADJUST FOR COVARIATES (FRAMINGHAM);

*DEMOGRAPHICS - RACE, EDUCATION LEVEL, AGE, GENDER*********;
*1999 - 2000;
libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO;
  set xp.DEMO (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_B.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_B;
  set xp.DEMO_B (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_C.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_C;
  set xp.DEMO_C (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_D.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_D;
  set xp.DEMO_D (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_E.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_E;
  set xp.DEMO_E (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_F.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_F;
  set xp.DEMO_F (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_G.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_G;
  set xp.DEMO_G (keep=seqn--SDMVSTRA);
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\DEMO\DEMO_H.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data DEMO_H;
  set xp.DEMO_H (keep=seqn--SDMVSTRA);
run;

*COMPARE 2014 DATA TO 1999 DATA;
proc compare base = DEMO compare = DEMO_H LISTVAR ;
run;

************* STACK DEMOGRAPHICS DATA **************;
data DEMO_ ;
set DEMO DEMO_B DEMO_C DEMO_D DEMO_E DEMO_F DEMO_G DEMO_H;
run;

proc copy in=work out=moen;
select DEMO_;
run;

********* STILL NEED TO CLEAN DEMOGRAPHICS DATA ***********;



********* MERGE DEMO, CBC, HDL, AND TG DATA ***********;
proc sort data=demo_; by seqn; run;
proc sort data=tg_master; by seqn; run;
proc sort data=hdl_master; by seqn; run;
proc sort data=cbc_master; by seqn; run;

data nhanes_master;
merge demo_ (in=a) tg_master (in=b) hdl_master (in=c) cbc_master (in=d);
by seqn;
if a=1 and b=1 and c=1 and d=1;
run;

proc copy in=work out=moen;
select nhanes_master;
run;

/*
*DRINKING STATUS (Never (< 12 drinks/lifetime), former drinker (= 12 drinks/lifetime but not in the past year),
current light/moderate drinker (= 1 drink/day for women and = 2 drinks/day for men in the past year),
or current heavy drinker (> 1 drink/day for women and > 2 drinks/day for men in the past year) ;
libname XP xport "U:\Moen_CVD_risk\ALQ_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data alcohol;
  set xp.ALQ_J ;
run;
                                                                                                                                                                                 ,

*SMOKING STATUS (Never (< 100 cigarettes/lifetime), former smoker (> 100 cigarettes/lifetime and absolutely no smoking now),
or current smoker (> 100 cigarettes/lifetime and currently smoking some days or every day) ;
libname XP xport "U:\Moen_CVD_risk\SMQ_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data smoking;
  set xp.SMQ_J ;
run;

*BLOOD PRESSURE (SYSTOLIC);
libname XP xport "U:\Moen_CVD_risk\BPX_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data bp;
  set xp.BPX_J ;
run;

*TOTAL CHOLESTEROL;
libname XP xport "U:\Moen_CVD_risk\TCHOL_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data t_cholest;
  set xp.TCHOL_J ;
run;


*HDL LEVELS;

        ****************** ALREADY HAVE HDL FROM OUR PRIMARY EXPOSURE FILES **************;


*BP TREATMENT (MEDS);
libname XP xport "U:\Moen_CVD_risk\BPQ_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data bp_treat;
  set xp.BPQ_J ;
run;

*DIABETES STATUS;
libname XP xport "U:\Moen_CVD_risk\DIQ_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data diabetes;
  set xp.DIQ_J ;
run;

*BMI;
libname XP xport "U:\Moen_CVD_risk\BMX_J.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

* or using a data step *;
data bmi;
  set xp.BMX_J ;
run;
*/

*unique ID to tie datasets together;
 SEQN

*sample stratum var;
 SDMVSTRA

*sample cluster/PSU var;
 SDMVPSU

*sample weight variable;
  *sample interview weight - WTINT2YR  ;
  *sample exam weight - WTMEC2YR       ;
  *fasting subsample weight - WTSAF2YR *************THIS IS THE WEIGHT WE WILL USE FOR THE ANALYSIS;

  *general guidelines on which sample weight to use - Use of the correct sample weight for NHANES analyses depends on the variables being used.
  A good rule of thumb is to use "the least common denominator" where the variable of interest that was collected on the smallest number of respondents
  is the "least common denominator." The sample weight that applies to that variable is the appropriate one to use for that particular analysis. ;

  *more info -  https://wwwn.cdc.gov/nchs/nhanes/tutorials/Weighting.aspx  ;

*all datasets that need to be combined : primary exposures (cbc, hdl, tri_ldl), primary outcome (cvd), and covariates (demo, alcohol, smoking, bp, t_cholest, bp_treat,
diabetes, bmi);


*subsample fasting weight applies to : tri_ldl;

*sample exam weight applies to : cbc, hdl, bp, t_cholest, bmi;

*sample interview wieght applies to : cvd, demo, alcohol, smoking, bp_treat, diabetes;

*because one of our primary exposures uses the subsample fasting weight, we need to use this for the analysis;

/*
*merge all datasets described above;
proc sort data=cbc; by seqn; run;
proc sort data=hdl; by seqn; run;
proc sort data=tri_ldl; by seqn; run;
proc sort data=cvd; by seqn; run;
proc sort data=demo; by seqn; run;
proc sort data=alcohol; by seqn; run;
proc sort data=smoking; by seqn; run;
proc sort data=bp; by seqn; run;
proc sort data=t_cholest; by seqn; run;
proc sort data=bp_treat; by seqn; run;
proc sort data=diabetes; by seqn; run;
proc sort data=bmi; by seqn; run;

data nhanes_prim_exp;
merge cbc (in=a) hdl (in=b) tri_ldl (in=c) ;
by seqn;
if a=1 and b=1 and c=1;
run;

data nhanes_prim_exp_out;
merge nhanes_prim_exp (in=a) cvd (in=b);
by seqn;
if a=1 and b=1;
run;

data nhanes_prim_exp_out_demo;
merge nhanes_prim_exp_out (in=a) demo (in=b);
by seqn;
if a=1 and b=1;
run;

data nhanes_prim_exp_out_demo_cov_a;
merge nhanes_prim_exp_out_demo (in=a) alcohol (in=b);
by seqn;
if a=1 and b=1;
run;

data nhanes_prim_exp_out_demo_cov_b;
merge nhanes_prim_exp_out_demo_cov_a (in=a) smoking (in=b) bp (in=c) t_cholest (in=d) bp_treat (in=e) diabetes (in=f) bmi (in=g);
by seqn;
if a=1 and b=1 and c=1 and d=1 and e=1 and f=1 and g=1;
run;
*n=2,652 (same as below dataset);


data nhanes_master;
merge cbc (in=a) hdl (in=b) tri_ldl (in=c) cvd (in=d) demo (in=e) alcohol (in=f) smoking (in=g) bp (in=h) t_cholest (in=i) bp_treat (in=j) diabetes (in=k) bmi (in=l);
by seqn;
if a=1 and b=1 and c=1 and d=1 and e=1 and f=1 and g=1 and h=1 and i=1 and j=1 and k=1 and l=1;
run;
*n=2,652 that have all data;

data nonpos_weights;
set nhanes_master;
where wtsaf2yr=0;
run;
*/

*************************** IMPORT FOLLOW-UP DATA - NATIONAL DEATH INDEX ****************************;
*********************************************************************************************
May 2022

** PUBLIC-USE LINKED MORTALITY FOLLOW-UP THROUGH DECEMBER 31, 2019 **

The following SAS code can be used to read the fixed-width format ASCII public-use Linked
Mortality Files (LMFs) from a stored location into a temporary SAS work dataset.  Basic
frequencies are also produced.

NOTE:  The format definitions given below will result in
       procedure output showing values that have been
       grouped as they are shown in the file layout
       documentation.

NOTE:  In order to read the public-use linked mortality ASCII file
       into a permanent SAS dataset, please consult SAS documentation
       and modify the program accordingly.

NOTE:  As some variables are survey-specific, we have created two versions of the program.
            One is for the National Health and Nutrition Examination Survey (NHANES),
            and the other is for the National Health Interview Survey (NHIS).

*********************************************************************************************


To download and save the public-use LMFs to your hard drive, follow these steps:

*Step 1: Designate a folder on your hard drive to download the public-use LMF.
             In this example, the data will be saved to: "C:\PUBLIC USE DATA\".

*Step 2: To download the public-use LMF, go to the website:
           https://ftp.cdc.gov/pub/health_statistics/nchs/datalinkage/linked_mortality/.

         Right-click on the desired survey link and select "Save target as...".  A "Save As"
         screen will appear where you will need to select and input a location where to
         save the data file on your hard drive.

         Also note that the "Save as type:" box should read "DAT File (*.dat)".  This will ensure
         that the data file is saved to your hard drive in the correct format.

         In this example, the data file is saved in the folder, "C:\PUBLIC USE DATA\", and the
         data file is saved as "<SURVEYNAME>_MORT_2019_PUBLIC.DAT".





*****************;
*MACRO VARIABLES*;
*****************;

*2017 - 2018 data;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2017_2018 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2017_2018 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2017_2018;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2017_2018;
var PERMTH_INT PERMTH_EXM ;
run;


*2015 - 2016 data;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2015_2016 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2015_2016 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2015_2016;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2015_2016 ;
var PERMTH_INT PERMTH_EXM ;
run;


***** 2013 - 2014 *********;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2013_2014 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2013_2014 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2013_2014;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2013_2014 ;
var PERMTH_INT PERMTH_EXM ;
run;


*********** 2011 - 2012 ***********;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2011_2012 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2011_2012 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2011_2012;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2011_2012 ;
var PERMTH_INT PERMTH_EXM ;
run;

********2009 - 2010 data******************;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2009_2010 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2009_2010 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2009_2010;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2009_2010;
var PERMTH_INT PERMTH_EXM ;
run;

***************2007 - 2008 *****************;
** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2007_2008 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2007_2008 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2007_2008;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2007_2008;
var PERMTH_INT PERMTH_EXM ;
run;

************2005 - 2006 **********************;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2005_2006 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2005_2006 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2005_2006;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2005_2006;
var PERMTH_INT PERMTH_EXM ;
run;

**********************2003 - 2004 ***************************************;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2003_2004 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2003_2004 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2003_2004;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2003_2004;
var PERMTH_INT PERMTH_EXM ;
run;


*************2001 - 2002************************;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2001_2002 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_2001_2002 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_2001_2002;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_2001_2002;
var PERMTH_INT PERMTH_EXM ;
run;


*********1999 - 2000*****************************;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_1999_2000 ; /* For example, NHIS_1986 or NHANES_1999_2000*/

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=U:\Moen_CVD_risk\Longitudinal Analysis\NDI Data\;
* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA &SURVEY.;
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT

      SEQN                  1-6
      ELIGSTAT            15
      MORTSTAT            16
      UCOD_LEADING      $17-19
      DIABETES            20
      HYPERTEN            21
      PERMTH_INT            43-45
      PERMTH_EXM            46-48
     ;

* DEFINE VARIABLE LABELS;
LABEL
      SEQN                  =      'NHANES Respondent Sequence Number'
      ELIGSTAT            =      'Eligibility Status for Mortality Follow-up'
      MORTSTAT            =      'Final Mortality Status'
      UCOD_LEADING      =      'Underlying Leading Cause of Death: Recode'
      DIABETES            =      'Diabetes Flag from Multiple Cause of Death (MCOD)'
      HYPERTEN            =      'Hypertension Flag from Multiple Cause of Death (MCOD)'
      PERMTH_INT            =      'Number of Person-Months of Follow-up from NHANES Interview date'
      PERMTH_EXM            =      'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT
      ELIGSTAT             ELIGFMT.
      MORTSTAT             MORTFMT.
      UCOD_LEADING      UCODFMT.
      DIABETES             FLAGFMT.
      HYPERTEN             FLAGFMT.
      PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=NHANES_1999_2000 VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=NHANES_1999_2000;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=NHANES_1999_2000;
var PERMTH_INT PERMTH_EXM ;
run;

********* STACK ALL NATIONAL DEATH INDEX DATASETS ***********;
data ndi_master;
set nhanes_1999_2000 nhanes_2001_2002 nhanes_2003_2004 nhanes_2005_2006 nhanes_2007_2008 nhanes_2009_2010 nhanes_2011_2012 nhanes_2013_2014
nhanes_2015_2016 nhanes_2017_2018;
run;

*double check there are no duplicates;
proc sort data=ndi_master nodup out=ndi_master_no_dup;
by seqn;
run;
*no duplicates found;

*RUN PROC CONTENTS;
PROC CONTENTS DATA=ndi_master VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=ndi_master;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc means data=ndi_master;
var PERMTH_INT PERMTH_EXM ;
run;

proc univariate data=ndi_master;
var PERMTH_EXM;
run;

proc format;
value follow
0='0 year'
1='1 year'
2='2 year'
3='3 year'
4='4 year'
5='5 year'
6='6 year'
7='7 year'
8='8 year'
9='9 year'
10='10 year'
11='11 year'
12='12+year'
;
run;

*separate by follow-up time;
data ndi_master_follow;
set ndi_master;
if 0 le permth_exm lt 12 then follow=0;
else if 12 le permth_exm lt 24 then follow=1;
else if 24 le permth_exm lt 36 then follow=2;
else if 36 le permth_exm lt 48 then follow=3;
else if 48 le permth_exm lt 60 then follow=4;
else if 60 le permth_exm lt 72 then follow=5;
else if 72 le permth_exm lt 84 then follow=6;
else if 84 le permth_exm lt 96 then follow=7;
else if 96 le permth_exm lt 108 then follow=8;
else if 108 le permth_exm lt 120 then follow=9;
else if 120 le permth_exm lt 132 then follow=10;
else if 132 le permth_exm lt 144 then follow=11;
else if permth_exm ge 144 then follow=12;
run;

proc freq data=ndi_master_follow;
stables follow;
tables follow*mortstat/nocol nopercent nocum;
tables follow*ucod_leading/nocol nopercent nocum;
format follow follow.;
run;

PROC FREQ DATA=ndi_master_follow;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

data ten_plus;
set ndi_master_follow;
where follow ge 10;
run;

proc means data=ten_plus min max;
var PERMTH_EXM;
run;

proc freq data=ten_plus;
tables follow;
tables mortstat;
tables ucod_leading;
format follow follow.;
run;

**** NOW THAT I KNOW PROCESS ABOVE WORKS, REPEAT WITH NHANES DATA *****;

libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

proc copy in=work out=moen;
select ndi_master_follow;
run;

proc sort data=ndi_master_follow;
by seqn;
run;

data nhanes_ndi_master;
merge nhanes_master (in=a) ndi_master_follow (in=b);
by seqn;
if a=1 and b=1;
run;

proc copy in=work out=moen;
select nhanes_ndi_master;
run;

proc freq data=nhanes_ndi_master;
tables follow;
tables follow*mortstat/nocol nopercent nocum;
tables follow*ucod_leading/nocol nopercent nocum;
format follow follow.;
run;

PROC FREQ DATA=nhanes_ndi_master;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;


********************************merge with nhanes data*************************;

PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;

proc format;
value follow
0='0 year'
1='1 year'
2='2 year'
3='3 year'
4='4 year'
5='5 year'
6='6 year'
7='7 year'
8='8 year'
9='9 year'
10='10 year'
11='11 year'
12='12+year'
;
run;

*import master file;

libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

data nhanes_ndi_master;
set nhanes_ndi_master (drop=fast_weight);
run;

proc sort data=nhanes_ndi_master;
by seqn;
run;

data tg_weight;
set tg_master (drop=tg);
run;

proc sort data=tg_weight;
by seqn;
run;

data nhanes_ndi_master_;
merge nhanes_ndi_master (in=a) tg_weight (in=b);
by seqn;
if a=1 and b=1;
run;

proc copy in=work out=moen;
select nhanes_ndi_master_;
run;

***** create labels for year of interview based off cycle number;

data cvd;
set nhanes_ndi_master_;
if SDDSRVYR =1 then NHANES='1999-2000';
else if SDDSRVYR =2 then NHANES='2001-2002';
else if SDDSRVYR =3 then NHANES='2003-2004';
else if SDDSRVYR =4 then NHANES='2005-2006';
else if SDDSRVYR =5 then NHANES='2007-2008';
else if SDDSRVYR =6 then NHANES='2009-2010';
else if SDDSRVYR =7 then NHANES='2011-2012';
else if SDDSRVYR =8 then NHANES='2013-2014';

if (NHANES='1999-2000' and follow=0) then death='2000';
else if (NHANES='1999-2000' and follow=1) then death='2001';
else if (NHANES='1999-2000' and follow=2) then death='2002';
else if (NHANES='1999-2000' and follow=3) then death='2003';
else if (NHANES='1999-2000' and follow=4) then death='2004';
else if (NHANES='1999-2000' and follow=5) then death='2005';
else if (NHANES='1999-2000' and follow=6) then death='2006';
else if (NHANES='1999-2000' and follow=7) then death='2007';
else if (NHANES='1999-2000' and follow=8) then death='2008';
else if (NHANES='1999-2000' and follow=9) then death='2009';
else if (NHANES='1999-2000' and follow=10) then death='2010';
else if (NHANES='1999-2000' and follow=11) then death='2011';
else if (NHANES='1999-2000' and follow=12) then death='2012';
else if (NHANES='1999-2000' and follow=13) then death='2013';
else if (NHANES='1999-2000' and follow=14) then death='2014';
else if (NHANES='1999-2000' and follow=15) then death='2015';
else if (NHANES='1999-2000' and follow=16) then death='2016';
else if (NHANES='1999-2000' and follow=17) then death='2017';
else if (NHANES='1999-2000' and follow=18) then death='2018';
else if (NHANES='1999-2000' and follow=19) then death='2019';

if (NHANES='2001-2002' and follow=0) then death='2002';
else if (NHANES='2001-2002' and follow=1) then death='2003';
else if (NHANES='2001-2002' and follow=2) then death='2004';
else if (NHANES='2001-2002' and follow=3) then death='2005';
else if (NHANES='2001-2002' and follow=4) then death='2006';
else if (NHANES='2001-2002' and follow=5) then death='2007';
else if (NHANES='2001-2002' and follow=6) then death='2008';
else if (NHANES='2001-2002' and follow=7) then death='2009';
else if (NHANES='2001-2002' and follow=8) then death='2010';
else if (NHANES='2001-2002' and follow=9) then death='2011';
else if (NHANES='2001-2002' and follow=10) then death='2012';
else if (NHANES='2001-2002' and follow=11) then death='2013';
else if (NHANES='2001-2002' and follow=12) then death='2014';
else if (NHANES='2001-2002' and follow=13) then death='2015';
else if (NHANES='2001-2002' and follow=14) then death='2016';
else if (NHANES='2001-2002' and follow=15) then death='2017';
else if (NHANES='2001-2002' and follow=16) then death='2018';
else if (NHANES='2001-2002' and follow=17) then death='2019';

if (NHANES='2003-2004' and follow=0) then death='2004';
else if (NHANES='2003-2004' and follow=1) then death='2005';
else if (NHANES='2003-2004' and follow=2) then death='2006';
else if (NHANES='2003-2004' and follow=3) then death='2007';
else if (NHANES='2003-2004' and follow=4) then death='2008';
else if (NHANES='2003-2004' and follow=5) then death='2009';
else if (NHANES='2003-2004' and follow=6) then death='2010';
else if (NHANES='2003-2004' and follow=7) then death='2011';
else if (NHANES='2003-2004' and follow=8) then death='2012';
else if (NHANES='2003-2004' and follow=9) then death='2013';
else if (NHANES='2003-2004' and follow=10) then death='2014';
else if (NHANES='2003-2004' and follow=11) then death='2015';
else if (NHANES='2003-2004' and follow=12) then death='2016';
else if (NHANES='2003-2004' and follow=13) then death='2017';
else if (NHANES='2003-2004' and follow=14) then death='2018';
else if (NHANES='2003-2004' and follow=15) then death='2019';

if (NHANES='2005-2006' and follow=0) then death='2006';
else if (NHANES='2005-2006' and follow=1) then death='2007';
else if (NHANES='2005-2006' and follow=2) then death='2008';
else if (NHANES='2005-2006' and follow=3) then death='2009';
else if (NHANES='2005-2006' and follow=4) then death='2010';
else if (NHANES='2005-2006' and follow=5) then death='2011';
else if (NHANES='2005-2006' and follow=6) then death='2012';
else if (NHANES='2005-2006' and follow=7) then death='2013';
else if (NHANES='2005-2006' and follow=8) then death='2014';
else if (NHANES='2005-2006' and follow=9) then death='2015';
else if (NHANES='2005-2006' and follow=10) then death='2016';
else if (NHANES='2005-2006' and follow=11) then death='2017';
else if (NHANES='2005-2006' and follow=12) then death='2018';
else if (NHANES='2005-2006' and follow=13) then death='2019';

if (NHANES='2007-2008' and follow=0) then death='2008';
else if (NHANES='2007-2008' and follow=1) then death='2009';
else if (NHANES='2007-2008' and follow=2) then death='2010';
else if (NHANES='2007-2008' and follow=3) then death='2011';
else if (NHANES='2007-2008' and follow=4) then death='2012';
else if (NHANES='2007-2008' and follow=5) then death='2013';
else if (NHANES='2007-2008' and follow=6) then death='2014';
else if (NHANES='2007-2008' and follow=7) then death='2015';
else if (NHANES='2007-2008' and follow=8) then death='2016';
else if (NHANES='2007-2008' and follow=9) then death='2017';
else if (NHANES='2007-2008' and follow=10) then death='2018';
else if (NHANES='2007-2008' and follow=11) then death='2019';
else if (NHANES='2007-2008' and follow=12) then death='2019';
else if (NHANES='2007-2008' and follow=13) then death='2019';

if (NHANES='2009-2010' and follow=0) then death='2010';
else if (NHANES='2009-2010' and follow=1) then death='2011';
else if (NHANES='2009-2010' and follow=2) then death='2012';
else if (NHANES='2009-2010' and follow=3) then death='2013';
else if (NHANES='2009-2010' and follow=4) then death='2014';
else if (NHANES='2009-2010' and follow=5) then death='2015';
else if (NHANES='2009-2010' and follow=6) then death='2016';
else if (NHANES='2009-2010' and follow=7) then death='2017';
else if (NHANES='2009-2010' and follow=8) then death='2018';
else if (NHANES='2009-2010' and follow=9) then death='2019';
else if (NHANES='2009-2010' and follow=10) then death='2019';
else if (NHANES='2009-2010' and follow=11) then death='2019';

if (NHANES='2011-2012' and follow=0) then death='2012';
else if (NHANES='2011-2012' and follow=1) then death='2013';
else if (NHANES='2011-2012' and follow=2) then death='2014';
else if (NHANES='2011-2012' and follow=3) then death='2015';
else if (NHANES='2011-2012' and follow=4) then death='2016';
else if (NHANES='2011-2012' and follow=5) then death='2017';
else if (NHANES='2011-2012' and follow=6) then death='2018';
else if (NHANES='2011-2012' and follow=7) then death='2019';
else if (NHANES='2011-2012' and follow=8) then death='2019';
else if (NHANES='2011-2012' and follow=9) then death='2019';

if (NHANES='2013-2014' and follow=0) then death='2014';
else if (NHANES='2013-2014' and follow=1) then death='2015';
else if (NHANES='2013-2014' and follow=2) then death='2016';
else if (NHANES='2013-2014' and follow=3) then death='2017';
else if (NHANES='2013-2014' and follow=4) then death='2018';
else if (NHANES='2013-2014' and follow=5) then death='2019';
else if (NHANES='2013-2014' and follow=6) then death='2019';
else if (NHANES='2013-2014' and follow=7) then death='2019';

if (NHANES='2015-2016' and follow=0) then death='2016';
else if (NHANES='2015-2016' and follow=1) then death='2017';
else if (NHANES='2015-2016' and follow=2) then death='2018';
else if (NHANES='2015-2016' and follow=3) then death='2019';
else if (NHANES='2015-2016' and follow=4) then death='2019';
else if (NHANES='2015-2016' and follow=5) then death='2019';

if (NHANES='2017-2018' and follow=0) then death='2018';
else if (NHANES='2017-2018' and follow=1) then death='2019';
else if (NHANES='2017-2018' and follow=2) then death='2019';
else if (NHANES='2017-2018' and follow=3) then death='2019';

if (NHANES='2019-2020' and follow=0) then death='2019';
else if (NHANES='2019-2020' and follow=2) then death='2019';
else if (NHANES='2019-2020' and follow=3) then death='2019';

if (death='2000' or death='2001') then death_cat='2000-2001';
else if (death='2002' or death='2003') then death_cat='2002-2003';
else if (death='2004' or death='2005') then death_cat='2004-2005';
else if (death='2006' or death='2007') then death_cat='2006-2007';
else if (death='2008' or death='2009') then death_cat='2008-2009';
else if (death='2010' or death='2011') then death_cat='2010-2011';
else if (death='2012' or death='2013') then death_cat='2012-2013';
else if (death='2014' or death='2015') then death_cat='2014-2015';
else if (death='2016' or death='2017') then death_cat='2016-2017';
else if (death='2018' or death='2019') then death_cat='2018-2019';

run;

proc freq data=cvd;
tables follow*NHANES;
tables death*NHANES;
run;

PROC FREQ DATA=cvd;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc freq data=cvd;
tables follow;
tables mortstat;
tables ucod_leading;
tables SDDSRVYR ;
tables NHANES;
tables death*death_cat;
tables ucod_leading*NHANES/nopercent norow;
tables ucod_leading*death/nopercent norow;
tables ucod_leading*death_cat/nopercent norow;
format follow follow.;
run;

*********** identify CVD death variable********;
data cvd_b;
set cvd;
if (ucod_leading='001' or ucod_leading='005') then cvd_death=1;
else if (mortstat=0 or mortstat=1) then cvd_death=0;
run;

proc freq data=cvd_b;
tables cvd_death;
tables ucod_leading;
tables mortstat;
run;

proc univariate data=cvd_b;
var PERMTH_EXM;
run;


************ filter to only those participants with 10 years of follow-up data *********;

data cvd_final;
set cvd_b;
where follow ge 10;
run;

proc means data=cvd_final min max;
var PERMTH_EXM;
run;

PROC FREQ DATA=cvd_final;
TABLES
      ELIGSTAT
      MORTSTAT
      UCOD_LEADING
      DIABETES
      HYPERTEN
      PERMTH_INT
      PERMTH_EXM

      / MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE,
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

proc freq data=cvd_final;
tables follow;
tables mortstat;
tables ucod_leading;
tables ucod_leading*diabetes/nopercent nocol;
tables ucod_leading*hyperten/nopercent nocol;
format follow follow.;
run;


*********************************** INITIAL VARIABLE CODING AND ANALYSIS --- SCROLL DOWN TO WORK DONE ON 10/24/24 --
****************************RE-RUN ANALYSIS WITH AGE 20-39 AS REFERENCE GROUP, 10 YR AGE GROUPS FROM 40 - 79 FOR FINAL ANALYSIS **************;


************* code exposures in the format we want ****************;
*how many surveys are there?;
proc freq data=cvd_final_;
tables SDDSRVYR ;
run;

data cvd_final_;
set cvd_final;
tg_hdl = TG/HDL;
NLR = neutro/lympho;

*create quartiles based on quartiles option below;
if 0 le tg_hdl le 1.341840 then tg_hdl_q=0;
else if 1.341840 lt tg_hdl le 2.180499 then tg_hdl_q=1;
else if 2.180499  lt tg_hdl le 3.672537 then tg_hdl_q=2;
else if tg_hdl gt 3.672537 then tg_hdl_q=3;

if 0 le nlr le 1.494459 then nlr_q=0;
else if 1.494459 lt nlr le 1.946381 then nlr_q=1;
else if 1.946381 lt nlr le 2.568824 then nlr_q=2;
else if nlr gt 2.568824 then nlr_q=3;

if 0 le rdw le 11.985134 then rdw_q=0;
else if 11.985134 lt rdw le 12.384471 then rdw_q=1;
else if 12.384471 lt rdw le 12.876047 then rdw_q=2;
else if rdw gt 12.876047 then rdw_q=3;

*create combined sample weights;
if sddsrvyr in (1,2) then weight_comb = 2/6 * fast_weight;
else if sddsrvyr in (3,4,5,6) then weight_comb = 1/6 * fast_weight;

if 18 le RIDAGEYR lt 30 then age_cat=0;
else if 30 le RIDAGEYR lt 40 then age_cat=1;
else if 40 le RIDAGEYR lt 50 then age_cat=2;
else if 50 le RIDAGEYR lt 60 then age_cat=3;
else if 60 le RIDAGEYR lt 70 then age_cat=4;
else if 70 le RIDAGEYR lt 80 then age_cat=5;
else if RIDAGEYR ge 80 then age_cat=6;

run;

proc format;
value age_cat
0='18 - 29'
1='30 - 39'
2='40 - 49'
3='50 - 59'
4='60 - 69'
5='70 - 79'
6='80 and above'
;
run;

proc freq data=cvd_final_;
tables sddsrvyr;
run;

proc freq data=cvd_final_;
tables age_cat;
run;

data confirm_sample_size;
set cvd_final_;
where 20 le RIDAGEYR lt 80;
run;

proc surveyfreq data=confirm_sample_size;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
run;

proc means data=cvd_final_ min max;
var RIDAGEYR;
run;

proc means data=confirm_sample_size min max;
var RIDAGEYR;
run;
*confirmed;


libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

data work.cvd_final_;
set moen.cvd_final_age_0_to_84;
run;

data cvd_final_;
set cvd_final_;
if 18 le RIDAGEYR lt 30 then age_cat=0;
else if 30 le RIDAGEYR lt 40 then age_cat=1;
else if 40 le RIDAGEYR lt 50 then age_cat=2;
else if 50 le RIDAGEYR lt 60 then age_cat=3;
else if 60 le RIDAGEYR lt 70 then age_cat=4;
else if 70 le RIDAGEYR lt 80 then age_cat=5;
else if RIDAGEYR ge 80 then age_cat=6;
run;

proc copy in=work out=moen;
select cvd_final_;
run;

/*proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
run;*/
*Q1=1.329174
 Q2=2.152398
 Q3=3.607749 ;

proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
run;
*Q1=1.341840
 Q2=2.180499
 Q3=3.672537 ;

/*proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
run; */
*Q1=1.482920
 Q2=1.942650
 Q3=2.560777 ;

proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
run;
*Q1=1.494459
 Q2=1.946381
 Q3=2.568824 ;

/*proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
run; */
*Q1=11.997090
 Q2=12.394739
 Q3=12.889099 ;

proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
run;
*Q1=11.985134
 Q2=12.384471
 Q3=12.876047 ;


**** DISTRIBUTION OF QUARTILES AND DESCRIPTIVE STATISTICS OF DEATH ***********;

/*proc surveyfreq data=cvd_final_;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_q;
run; */

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_q;
run;

/*proc surveyfreq data=cvd_final_;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q;
run; */

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q;
run;

/*proc surveyfreq data=cvd_final_;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_q;
run; */

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_q;
run;

/*proc surveyfreq data=cvd_final_;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run; */

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

/*
proc surveyfreq data=cvd_final_;
weight fast_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;*/

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

************ DESCRIPTIVE TABLE STATS - EXPOSURE QUARTILES X CVD/OVERALL DEATH ************;
**** CVD DEATH ****;
proc sort data=cvd_final_;
by nlr_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by nlr_q;
run;

proc sort data=cvd_final_;
by tg_hdl_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by tg_hdl_q;
run;

proc sort data=cvd_final_;
by rdw_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by rdw_q;
run;

**** OVERALL DEATH *****;
proc sort data=cvd_final_;
by nlr_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
by nlr_q;
run;

proc sort data=cvd_final_;
by tg_hdl_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
by tg_hdl_q;
run;

proc sort data=cvd_final_;
by rdw_q;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
by rdw_q;
run;

**** COVARIATES OF INTEREST - AGE GROUP - GENDER ****;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
run;

proc sort data=cvd_final_;
by cvd_death;
run;
proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;
proc surveymeans data=cvd_final_ mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

data age_top;
set cvd_final_;
where RIDAGEYR=85;
run;

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
format age_cat age_cat.;
run;

*limit to ages lt 85;
data cvd_final_b;
set cvd_final_;
where RIDAGEYR lt 85;
if 0 le age_cat le 1 then age_cat_b=0;
else if age_cat=2 then age_cat_b=1;
else if age_cat=3 then age_cat_b=2;
else if age_cat=4 then age_cat_b=3;
else if age_cat=5 then age_cat_b=4;
else if age_cat=6 then age_cat_b=5;

run;

proc univariate data=cvd_final_b;
var RIDAGEYR;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
format age_cat age_cat.;
run;

*collapsed age_cat;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat_b;
*format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat_b;
by cvd_death;
*format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
run;

proc sort data=cvd_final_b;
by cvd_death;
run;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

*Interaction between age, gender, and CVD;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/expected row;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat_b*cvd_death/expected row;
run;

proc sort data=cvd_final_b;
by cvd_death RIAGENDR;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death RIAGENDR;
run;

**** CVD DEATH ****;
proc sort data=cvd_final_b;
by nlr_q;
run;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by nlr_q;
run;

proc sort data=cvd_final_b;
by tg_hdl_q;
run;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by tg_hdl_q;
run;

proc sort data=cvd_final_b;
by rdw_q;
run;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
by rdw_q;
run;

*test association between nlr, tg_hdl, and rdw with gender and age;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q*RIAGENDR/chisq expected row;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_q*RIAGENDR/chisq expected row;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_q*RIAGENDR/chisq expected row;
run;

proc sort data=cvd_final_b;
by nlr_q;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by nlr_q;
run;

proc sort data=cvd_final_b;
by tg_hdl_q;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by tg_hdl_q;
run;

proc sort data=cvd_final_b;
by rdw_q;
run;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by rdw_q;
run;

proc surveyreg data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0');
model RIDAGEYR=nlr_q;
run;

proc surveyreg data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0');
model RIDAGEYR=tg_hdl_q;
run;

proc surveyreg data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0');
model RIDAGEYR=rdw_q;
run;

*Mean age by gender and CVD death within each quartile;
proc sort data=cvd_final_b;
by cvd_death RIAGENDR nlr_q;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death RIAGENDR nlr_q;
run;

proc sort data=cvd_final_b;
by cvd_death RIAGENDR tg_hdl_q;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death RIAGENDR tg_hdl_q;
run;

proc sort data=cvd_final_b;
by cvd_death RIAGENDR rdw_q;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death RIAGENDR rdw_q;
run;

*NLR value;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
run;

proc sort data=cvd_final_b;
by RIAGENDR;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
by RIAGENDR;
run;

proc sort data=cvd_final_b;
by age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
by age_cat;
run;

proc sort data=cvd_final_b;
by RIAGENDR age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
by RIAGENDR age_cat;
run;

*TG:HDL value;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
run;

proc sort data=cvd_final_b;
by RIAGENDR;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
by RIAGENDR;
run;

proc sort data=cvd_final_b;
by age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
by age_cat;
run;

proc sort data=cvd_final_b;
by RIAGENDR age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
by RIAGENDR age_cat;
run;

*RDW value;
proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
run;

proc sort data=cvd_final_b;
by RIAGENDR;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
by RIAGENDR;
run;

proc sort data=cvd_final_b;
by age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
by age_cat;
run;

proc sort data=cvd_final_b;
by RIAGENDR age_cat;
run;

proc surveymeans data=cvd_final_b mean stderr median quartiles;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
by RIAGENDR age_cat;
run;

*Scatter plots;
proc sgplot data=cvd_final_b;
  scatter x=RIDAGEYR y=nlr ;
run;

proc surveyselect data=cvd_final_b method=pps_wr sampsize=500 out=ppssamp seed=1142938;
 size weight_comb;
proc gplot data=ppssamp;
 plot nlr*RIDAGEYR;
run;

proc surveyselect data=cvd_final_b method=pps_wr sampsize=500 out=ppssamp seed=1142938;
 size weight_comb;
proc gplot data=ppssamp;
 plot tg_hdl*RIDAGEYR;
run;

proc surveyselect data=cvd_final_b method=pps_wr sampsize=500 out=ppssamp seed=1142938;
 size weight_comb;
proc gplot data=ppssamp;
 plot rdw*RIDAGEYR;
run;

proc copy in=work out=moen;
select cvd_final_b;
run;


******************************************************* SCROLL DOWN TO BOTTOM OF COMMENTED OUT CODE TO GET UP-TO-DATE ANALYSIS ********************;


****** ONLY DOING COX REGRESSION *********;
/*

*logistic regression;
*OVERALL MORTALITY;
proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0');
model mortstat (event='Assumed deceased')= tg_hdl_q;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0');
model mortstat (event='Assumed deceased')= rdw_q;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0');
model mortstat (event='Assumed deceased')= nlr_q;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0') rdw_q (ref='0') nlr_q (ref='0');
model mortstat (event='Assumed deceased')= tg_hdl_q rdw_q nlr_q;
run ;

*CVD MORTALITY;
proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0');
model cvd_death (event='1')= tg_hdl_q ;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') ;
model cvd_death (event='1')= rdw_q ;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0');
model cvd_death (event='1')= nlr_q ;
run ;

proc surveylogistic data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0') rdw_q (ref='0') nlr_q (ref='0');
model cvd_death (event='1')= tg_hdl_q rdw_q nlr_q ;
run ;
*/

/*

*cox proportional hazards;
*overall mortality;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = tg_hdl_q /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = nlr_q /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q /risklimits;;
run;

*test confounding / interaction with age in each model*;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = tg_hdl_q /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q nlr_q tg_hdl_q /risklimits;;
run;

*CVD mortality;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_q /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q /risklimits;;
run;

proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q /risklimits;;
run;

*** TEST FOR INTERACTION IN CVD MODEL ****;
**Gender;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_q RIAGENDR tg_hdl_q*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q RIAGENDR nlr_q*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q RIAGENDR rdw_q*RIAGENDR /risklimits;;
run;

**Age Category;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_q age_cat tg_hdl_q*age_cat /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q age_cat nlr_q*age_cat /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q age_cat rdw_q*age_cat /risklimits;;
run;

**** Adjust original model 1 with three factors included for age_cat*NLR;
proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q age_cat age_cat*nlr_q /risklimits;
run;

*** Is confounding present in the model?;
proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q RIAGENDR age_cat age_cat*nlr_q /risklimits;
run;

** Predictive value of model;
proc phreg data=cvd_final_ concordance;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q ;
run;
*concordance not recognized;

*** TEST FOR INTERACTION IN OVERALL MORTALITY MODEL ****;
**Gender;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = tg_hdl_q RIAGENDR tg_hdl_q*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = nlr_q RIAGENDR nlr_q*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q RIAGENDR rdw_q*RIAGENDR /risklimits;;
run;

**Age Category;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = tg_hdl_q age_cat tg_hdl_q*age_cat /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = nlr_q age_cat nlr_q*age_cat /risklimits;;
run;

proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0')/ param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q age_cat rdw_q*age_cat /risklimits;;
run;

**** Adjust for interaction with age and gender in model;
proc surveyphreg data=cvd_final_;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='1') / param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q nlr_q tg_hdl_q tg_hdl_q*age_cat age_cat rdw_q*RIAGENDR RIAGENDR /risklimits;;
run;

proc univariate data=cvd_final_;
var weight_comb;
run;  */

/*
************ ANALYSIS POST-MEETING WITH DR. WILLIAMS 6/17 - BUILD SEPARATE MODELS FOR EACH ********************************;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_q nlr_q tg_hdl_q;
tables cvd_death;
tables age_cat RIAGENDR ;
run;

proc surveymeans data=cvd_final_b min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc phreg data=cvd_final_;
model PERMTH_EXM*cvd_death(0)=age_cat;
assess var=(age_cat)/seed=12345 resample;
run;


*********** ANALYSIS POST-MEETING 8/14 - LIMIT AGE TO 40 AND UP;
data cvd_final_c;
set cvd_final_b;
*where ((RIAGENDR=1 and RIDAGEYR ge 45) or (RIAGENDR=2 and RIDAGEYR ge 55));
where RIDAGEYR ge 40;
run;

*double check everyone has at least 10 years of follow-up;
proc freq data=cvd_final_c;
tables follow;
run;

*double check males have age 45 - 84 & females have age 55 - 84;
proc sort data=cvd_final_c;
by RIAGENDR;
run;

proc surveymeans data=cvd_final_c min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by RIAGENDR;
run;

proc format;
value age_cat
0='40 - 49'
1='50 - 59'
2='60 - 69'
3='70 - 79'
4='80 +'
;
run;

proc copy in=moen out=work;
select Cvd_final_age_0_to_84;
run;

proc means data=Cvd_final_age_0_to_84 min max;
var RIDAGEYR;
run;

data cvd_final_c;
set Cvd_final_8_20_age_40_84;
run;

*identify clinical risk factors;
data cvd_final_d;
set cvd_final_c;
/*if 0 le tg_hdl lt 3.00 then tg_hdl_bi=0;
else if tg_hdl ge 3.00 then tg_hdl_bi=1;*/
/*

if 0 le tg_hdl lt 4.00 then tg_hdl_bi=0;
else if tg_hdl ge 4.00 then tg_hdl_bi=1;

if 0 le nlr lt 2.56 then nlr_bi=0;
else if nlr ge 2.56 then nlr_bi=1;

if 0 le rdw lt 13.10 then rdw_bi=0;
else if rdw ge 13.10 then rdw_bi=1;

if 40 le RIDAGEYR lt 50 then age_cat=0;
else if 50 le RIDAGEYR lt 60 then age_cat=1;
else if 60 le RIDAGEYR lt 70 then age_cat=2;
else if 70 le RIDAGEYR lt 80 then age_cat=3;
else if RIDAGEYR ge 80 then age_cat=4;

run;

*double check that risk factors were coded in appropriate range;
proc sort data=cvd_final_d;
by tg_hdl_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
by tg_hdl_bi;
run;

proc sort data=cvd_final_d;
by nlr_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
by nlr_bi;
run;

proc sort data=cvd_final_d;
by rdw_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
by rdw_bi;
run;

proc copy in=work out=moen;
select cvd_final_d;
run;

*********************************************************** STARTING POINT AS OF 9/5/24 *******************;
proc format;
value age_cat
0='40 - 49'
1='50 - 59'
2='60 - 69'
3='70 - 79'
4='80 +'
;
run;

PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;

libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

proc copy in=moen out=work;
select Cvd_final_8_20_age_40_84;
run;

proc copy in=moen out=work;
select Cvd_final_age_0_to_84;
run;

proc means data=Cvd_final_age_0_to_84 min max;
var RIDAGEYR;
run;

data cvd_final_d;
set Cvd_final_8_20_age_40_84;
run;

****** DESCRIPTIVE STATS *******;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
tables cvd_death;
tables age_cat RIAGENDR ;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
run;

**** DESCRIPTIVE STATS BY CVD DEATH *********;
proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*cvd_death/row;
run;

*********** Shows number of missing data points;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*rdw_bi*cvd_death/row;
tables age_cat*nlr_bi*cvd_death/row;
tables age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*rdw_bi*cvd_death/row;
tables RIAGENDR*age_cat*nlr_bi*cvd_death/row;
tables RIAGENDR*age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
tables RIAGENDR*rdw_bi*cvd_death/row;
run;


******** RDW ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi  /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIAGENDR rdw_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR rdw_bi*RIDAGEYR /risklimits;;
run;


******** NLR ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi  /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIAGENDR nlr_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR nlr_bi*RIDAGEYR /risklimits;;
run;

*descriptive table;
proc sort data=cvd_final_b;
by nlr_q cvd_death;
run;

proc surveymeans data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by nlr_q cvd_death;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q*RIAGENDR*cvd_death/chisq row;
run;

*Does SAS give an error message from low sample - no;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q*age_cat*cvd_death/chisq expected row;
run;

*what about if we used the raw frequencies - no;
proc freq data=cvd_final_b;
tables nlr_q*age_cat*cvd_death/chisq ;
run;

******** TG_HDL ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIAGENDR tg_hdl_bi*RIAGENDR/risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR tg_hdl_bi*RIDAGEYR /risklimits;;
run;

********** WHAT IF WE INCLUDED ALL FACTORS IN ONE MODEL ************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi tg_hdl_bi rdw_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi tg_hdl_bi rdw_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

/*test for interaction;
proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR nlr_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR tg_hdl_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR rdw_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;  */
/*
*models stratified by gender;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

/*testing for interaction;
proc surveymeans data=cvd_final_b mean median;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q RIDAGEYR nlr_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_q RIDAGEYR tg_hdl_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q RIDAGEYR rdw_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run; */

/*
*************** CREATE INDEX VARIABLE - STOPPING PLACE FOR 8/1 AM *****************;
data cvd_index;
set cvd_final_d;

rdw_tg_hdl_i = rdw_bi + tg_hdl_bi;
rdw_nlr_i = rdw_bi + nlr_bi;
tg_hdl_nlr_i = tg_hdl_bi + nlr_bi;

nlr_tg_hdl_rdw_i = nlr_bi + tg_hdl_bi + rdw_bi;

/*if rdw_i=1 and tg_hdl_i=1 then rdw_tg_hdl_1_=1;
else if rdw_i=1 and tg_hdl_i=2 then rdw_tg_hdl_1_=2;
else if rdw_i=1 and tg_hdl_i=3 then rdw_tg_hdl_1_=3;
else if rdw_i=1 and tg_hdl_i=4 then rdw_tg_hdl_1_=4;

if rdw_i=2 and tg_hdl_i=1 then rdw_tg_hdl_2_=1;
else if rdw_i=2 and tg_hdl_i=2 then rdw_tg_hdl_2_=2;
else if rdw_i=2 and tg_hdl_i=3 then rdw_tg_hdl_2_=3;
else if rdw_i=2 and tg_hdl_i=4 then rdw_tg_hdl_2_=4;

if rdw_i=3 and tg_hdl_i=1 then rdw_tg_hdl_3_=1;
else if rdw_i=3 and tg_hdl_i=2 then rdw_tg_hdl_3_=2;
else if rdw_i=3 and tg_hdl_i=3 then rdw_tg_hdl_3_=3;
else if rdw_i=3 and tg_hdl_i=4 then rdw_tg_hdl_3_=4;

if rdw_i=4 and tg_hdl_i=1 then rdw_tg_hdl_4_=1;
else if rdw_i=4 and tg_hdl_i=2 then rdw_tg_hdl_4_=2;
else if rdw_i=4 and tg_hdl_i=3 then rdw_tg_hdl_4_=3;
else if rdw_i=4 and tg_hdl_i=4 then rdw_tg_hdl_4_=4; */

/*
run;

proc freq data=cvd_index;
tables rdw_tg_hdl_i;
tables rdw_nlr_i;
tables tg_hdl_nlr_i;
tables nlr_tg_hdl_rdw_i;
run;

proc means data=cvd_index min max;
var rdw_tg_hdl_i rdw_nlr_i tg_hdl_nlr_i nlr_tg_hdl_rdw_i;
run;

**** PROP HAZARDS REGRESS WITH INDEX VARIABLE ****;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_tg_hdl_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_tg_hdl_rdw_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
run;

**** Stratified analysis for cvd index;
proc sort data=cvd_index;
by RIAGENDR;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_tg_hdl_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_tg_hdl_rdw_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

***** TO-DO 9/10 - GENERATE DESCRIPTIVE TABLES OF WEIGHTED % CVD DEATH BY INDEX VARIABLES *************;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*tg_hdl_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*tg_hdl_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*nlr_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_bi*rdw_bi*nlr_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_tg_hdl_rdw_i*cvd_death/row;
run;


************ REPEAT ABOVE ANALYSIS WITH THOSE LESS THAN 80********************************************************;
data cvd_final_e;
set cvd_index;
where RIDAGEYR lt 80;
run;

libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

proc copy in=moen out=work;
select cvd_final_age_40_79;
run;

data cvd_final_e;
set cvd_final_age_40_79;
run;

**** DESCRIPTIVE STATS BY CVD DEATH --- TO-DO 9/10 AFTER LUNCH*********;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
tables cvd_death;
tables age_cat RIAGENDR ;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveymeans data=cvd_final_e min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveymeans data=cvd_final_e min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc sort data=cvd_final_e;
by cvd_death;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc sort data=cvd_final_e;
by cvd_death;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
run;

proc sort data=cvd_final_e;
by cvd_death;
run;
proc surveymeans data=cvd_final_e min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
by cvd_death;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*rdw_bi*cvd_death/row;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*cvd_death/row;
run;

proc freq data=cvd_index;
tables SDDSRVYR;
tables SDDSRVYR*follow;
run;

***** COX PROPORTIONAL HAZARDS MODELING;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR /risklimits;;
run;

*** stratified models ***;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

************** RUN INDEX VARIABLE ANALYSIS ----- ****;
proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_tg_hdl_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_tg_hdl_rdw_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
run;

**** Stratified analysis for cvd index;
proc sort data=cvd_final_e;
by RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_tg_hdl_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_nlr_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_e ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_tg_hdl_rdw_i (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

***** TO-DO 9/10 - GENERATE DESCRIPTIVE TABLES OF WEIGHTED % CVD DEATH BY INDEX VARIABLES *************;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*tg_hdl_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*tg_hdl_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*nlr_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_bi*rdw_bi*nlr_bi*cvd_death/row;
run;
proc surveyfreq data=cvd_final_e;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_tg_hdl_rdw_i*cvd_death/row;
run;


********************** 10-1-24 ANALYSIS - RE-RUN ANALYSIS WITH AGE 20 - 79 FOR 10/14/24 MEETING **************************;
libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

proc copy in=moen out=work;
select Cvd_final_age_18_to_84;
run;

proc means data=Cvd_final_age_18_to_84 min max;
var RIDAGEYR;
run;

PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;

data cvd_final_c;
set Cvd_final_age_18_to_84;
run;

proc format;
value age_cat
0='20-29'
1='30-39'
2='40-49'
3='50-59'
4='60-69'
5='70-79'
;
value age_cat_b
0='20-39'
1='40-59'
2='60-79'
;
run;


*identify clinical risk factors;
data cvd_final_d;
set cvd_final_c;

where 20 le RIDAGEYR lt 80;

/*if 0 le tg_hdl lt 3.00 then tg_hdl_bi=0;
else if tg_hdl ge 3.00 then tg_hdl_bi=1;*/
/*
if 0 le tg_hdl lt 4.00 then tg_hdl_bi=0;
else if tg_hdl ge 4.00 then tg_hdl_bi=1;

if 0 le nlr lt 2.56 then nlr_bi=0;
else if nlr ge 2.56 then nlr_bi=1;

if 0 le rdw lt 13.10 then rdw_bi=0;
else if rdw ge 13.10 then rdw_bi=1;

if 20 le RIDAGEYR lt 40 then age_cat_b=0;
else if 40 le RIDAGEYR lt 60 then age_cat_b=1;
else if 60 le RIDAGEYR lt 80 then age_cat_b=2;

if 20 le RIDAGEYR lt 30 then age_cat=0;
else if 30 le RIDAGEYR lt 40 then age_cat=1;
else if 40 le RIDAGEYR lt 50 then age_cat=2;
else if 50 le RIDAGEYR lt 60 then age_cat=3;
else if 60 le RIDAGEYR lt 70 then age_cat=4;
else if 70 le RIDAGEYR lt 80 then age_cat=5;

run;

proc sort data=cvd_final_d;
by age_cat_b;
run;

proc means data=Cvd_final_d min max;
var RIDAGEYR;
by age_cat_b;
run;

proc sort data=cvd_final_d;
by age_cat;
run;

proc means data=Cvd_final_d min max;
var RIDAGEYR;
by age_cat;
run;

*repeat descriptive stats;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
tables cvd_death;
tables age_cat RIAGENDR ;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*rdw_bi*cvd_death/row;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*cvd_death/row;
run;

**** stopping point post lunch - need to generate % CVD death by NLR and age cat_b;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat_b*nlr_bi*cvd_death/chisq row;
tables age_cat_b*tg_hdl_bi*cvd_death/chisq row;
tables age_cat_b*rdw_bi*cvd_death/chisq row;
format age_cat_b age_cat_b.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat_b*nlr_bi*cvd_death/chisq row;
tables RIAGENDR*age_cat_b*tg_hdl_bi*cvd_death/chisq row;
tables RIAGENDR*age_cat_b*rdw_bi*cvd_death/chisq row;
format age_cat_b age_cat_b.;
run;

*cox proportional models w/ age treated as categorical;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b /risklimits;;
run;

*test interaction term with biological sex/gender;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b RIAGENDR nlr_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b RIAGENDR tg_hdl_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b RIAGENDR rdw_bi*RIAGENDR /risklimits;;
run;

*test interaction term with age category;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b nlr_bi*age_cat_b  /risklimits;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b tg_hdl_bi*age_cat_b  /risklimits;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b rdw_bi*age_cat_b  /risklimits;
run;

*cox proportional models w/ age treated as categorical - stratified by gender;
proc sort data=cvd_final_d;
by RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

*cox proportional models stratified by age group;
proc sort data=cvd_final_d;
by age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi /risklimits;
domain age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;
domain age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi /risklimits;
domain age_cat_b;
run;

*cox proportional models stratified by age group and gender;
proc sort data=cvd_final_d;
by age_cat_b RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

********** IMPORT MEDICATION DATA ***********************;
/*
libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\RXQ_RX_B.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
data meds;
  set xp.RXQ_RX_B ;
run;

proc format;
value RXD030_
1='Yes'
2='No'
7='Refused'
9='Dont know'
;
value RXQ250_
1='Yes'
2='No'
;
value RXD260_
77777='Refused'
99999='Dont know'
;
run;

proc freq data=meds;
tables RXD030 RXD240B NHCODE RXQ250 RXD260 RXD295 RXDDRGID FDACODE1 FDACODE2 FDACODE3 FDACODE4 FDACODE5 FDACODE6;
format RXD030 RXD030_. RXQ250 RXQ250_. RXD260 RXD260_.;
run;
*/

***************************************** FINAL ANALYSIS RESULTS -- RE-RUN ANALYSIS WITH AGE 20-39 AS REFERENCE GROUP, 10 YR AGE GROUPS FROM 40 - 79;
libname moen 'U:\Moen_CVD_risk\Longitudinal Analysis';

proc copy in=moen out=work;
select Cvd_final_age_18_to_84;
run;

proc means data=Cvd_final_age_18_to_84 min max;
var RIDAGEYR;
run;

PROC FORMAT;
  VALUE PREMISS
      .='MISSING'
         OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
            "001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
            "002" = "Malignant neoplasms (C00-C97)"
            "003" = "Chronic lower respiratory diseases (J40-J47)"
            "004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
            "005" = "Cerebrovascular diseases (I60-I69)"
            "006" = "Alzheimer's disease (G30)"
            "007" = "Diabetes mellitus (E10-E14)"
            "008" = "Influenza and pneumonia (J09-J18)"
            "009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
            "010" = "All other causes (residual)"
            "   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;

data cvd_final_c;
set Cvd_final_age_18_to_84;
run;

proc format;
value age_cat
0='20-29'
1='30-39'
2='40-49'
3='50-59'
4='60-69'
5='70-79'
;
value age_cat_b
0='20-39'
1='40-49'
2='50-59'
3='60-69'
4='70-79'
;
run;


*identify clinical risk factors;
data cvd_final_d;
set cvd_final_c;

where 20 le RIDAGEYR lt 80;

/*if 0 le tg_hdl lt 3.00 then tg_hdl_bi=0;
else if tg_hdl ge 3.00 then tg_hdl_bi=1;*/

if 0 le tg_hdl lt 4.00 then tg_hdl_bi=0;
else if tg_hdl ge 4.00 then tg_hdl_bi=1;

if 0 le nlr lt 2.56 then nlr_bi=0;
else if nlr ge 2.56 then nlr_bi=1;

if 0 le rdw lt 13.10 then rdw_bi=0;
else if rdw ge 13.10 then rdw_bi=1;

if 20 le RIDAGEYR lt 40 then age_cat_b=0;
else if 40 le RIDAGEYR lt 50 then age_cat_b=1;
else if 50 le RIDAGEYR lt 60 then age_cat_b=2;
else if 60 le RIDAGEYR lt 70 then age_cat_b=3;
else if 70 le RIDAGEYR lt 80 then age_cat_b=4;

if 20 le RIDAGEYR lt 30 then age_cat=0;
else if 30 le RIDAGEYR lt 40 then age_cat=1;
else if 40 le RIDAGEYR lt 50 then age_cat=2;
else if 50 le RIDAGEYR lt 60 then age_cat=3;
else if 60 le RIDAGEYR lt 70 then age_cat=4;
else if 70 le RIDAGEYR lt 80 then age_cat=5;

run;

proc sort data=cvd_final_d;
by age_cat_b;
run;

proc means data=Cvd_final_d min max;
var RIDAGEYR;
by age_cat_b;
run;

proc sort data=cvd_final_d;
by age_cat;
run;

proc means data=Cvd_final_d min max;
var RIDAGEYR;
by age_cat;
run;

*repeat descriptive stats;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
tables cvd_death;
tables age_cat RIAGENDR ;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*RIAGENDR/col;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*rdw_bi*cvd_death/row;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat_b*nlr_bi*cvd_death/chisq row;
tables age_cat_b*tg_hdl_bi*cvd_death/chisq row;
tables age_cat_b*rdw_bi*cvd_death/chisq row;
format age_cat_b age_cat_b.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat_b*nlr_bi*cvd_death/chisq row;
tables RIAGENDR*age_cat_b*tg_hdl_bi*cvd_death/chisq row;
tables RIAGENDR*age_cat_b*rdw_bi*cvd_death/chisq row;
format age_cat_b age_cat_b.;
run;

/************************ FINAL MODELS NOT STRATIFIED *******************/

*cox proportional models w/ age treated as categorical;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b /risklimits;;
run;

*test interaction term with biological sex/gender;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b RIAGENDR nlr_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b RIAGENDR tg_hdl_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b RIAGENDR rdw_bi*RIAGENDR /risklimits;;
run;

*test interaction term with age category;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b nlr_bi*age_cat_b  /risklimits;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b tg_hdl_bi*age_cat_b  /risklimits;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b rdw_bi*age_cat_b  /risklimits;
run;

*cox proportional models w/ age treated as categorical - stratified by gender;
proc sort data=cvd_final_d;
by RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') age_cat_b (ref='0')  / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi age_cat_b /risklimits;
domain RIAGENDR;
run;

/******************** FINAL MODELS STRATIFIED *******************/

*cox proportional models stratified by age group;
proc sort data=cvd_final_d;
by age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi /risklimits;
domain age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;
domain age_cat_b;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi /risklimits;
domain age_cat_b;
run;


*cox proportional models stratified by age group and gender;
proc sort data=cvd_final_d;
by age_cat_b RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi /risklimits;
domain age_cat_b*RIAGENDR;
run;

proc freq data=cvd_final_d;
tables NHANES;
run;
*1999 - 2010 ;


******* CODE FOR PHYSICAL ACTIVITY ************;
**import physical activity data;
libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Physical Activity\PAQ_E.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Physical Activity\PAQ_F.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data PA_master ;
set PAQ_E PAQ_F;
run;

proc freq data=PA_master;
tables paq610 pad615 paq625 pad630 paq640 pad645 paq655 pad660 paq670 pad675;
run;


data PAQ_;
      set PA_master (keep= SEQN paq605 paq610 pad615 paq620 paq625 pad630 paq635 paq640 pad645 paq650 paq655 pad660 paq665 paq670 pad675) ;
      *data cleaning - set all 99/9999 to missing;
      if PAQ610=99 then PAQ610=.;
      if PAD615=9999 then PAD615=.;
      if PAQ625=99 then PAQ625=.;
      if PAD630=9999 then PAD630=.;
      if PAQ640=99 then PAQ640=.;
      if PAD645=9999 then PAD645=.;
      if PAQ655=99 then PAQ655=.;
      if PAD660=9999 then PAD660=.;
      if PAQ670=99 then PAQ670=.;
      if PAD675=9999 then PAD675=.;
      *set participants with all missing values to missing;
      if paq610=. and pad615=. and paq625=. and pad630=. and paq640=. and pad645=. and paq655=. and pad660=. and paq670=. and pad675=. then totalPA=.;
      if paq610=. and pad615=. and paq655=. and pad660=. then vig_MET_week=.;
      if paq624=. and pad630=. and paq640=. and pad645=. and paq655=. and pad660=. and paq670=. and pad675=. then moderate_MET_week=.;
      *if vig_activity (PAQ605) = no (2), set PAQ610 =0 and PAD615=0;
      if PAQ605=2 then PAQ610=0;
      if PAQ605=2 then PAD615=0;
      *if mod_activity (PAQ620) = no (2), set PAQ625 =0 and PAD630=0;
      if PAQ620=2 then PAQ625=0;
      if PAQ620=2 then PAD630=0;
      *if walk/bicycle (PAQ635) = no (2), set PAQ40 =0 and PAD645=0;
      if PAQ635=2 then PAQ640=0;
      if PAQ635=2 then PAD645=0;
      *if vig_rec_activity (PAQ50) = no (2), set PAQ655 =0 and PAD660=0;
      if PAQ650=2 then PAQ655=0;
      if PAQ650=2 then PAD660=0;
      *if mod_rec_activity (PAQ665) = no (2), set PAQ670 =0 and PAD675=0;
      if PAQ665=2 then PAQ670=0;
      if PAQ655=2 then PAD675=0;
      /*compute total physical activity or total MET-min/week*/
      totPA=sum((paq610*pad615*8),(paq625*pad630*4),(paq640*pad645*4),(paq655*pad660*8),(paq670*pad675*4));
      vig_MET_week = sum((paq610*pad615*8),(paq655*pad660*8));
      moderate_MET_week = sum((paq625*pad630*4),(paq640*pad645*4),(paq670*pad675*4)) ;
run;

/* Key

610 = Number of days vigorous work
615 = Minutes vigorous intensity work
625 = Number of days moderate work
630 = Minutes moderate intensity work
640 = Number of days walk or bicycle
645 = Minutes walk/bicycle for transportation
655 = Days vigorous recreational activities
660 = Minutes vigorous recreational activities
670 = Days moderate recreational activities
675 = Minutes moderate recreational activity

Suggested MET Scores from NHANES
615 = 8.0
630 = 4.0
645 = 4.0
660 = 8.0
675 = 4.0

*/

proc means data=PAQ_;
var totPA moderate_MET_week vig_MET_week;
run;

data PAQ_miss;
set PAQ_;
where totPA=. or moderate_MET_week=. or vig_MET_week=.;
run;

*merge with NHANES dataset;
proc sort data=PAQ_;
by seqn;
run;

proc sort data=cvd_final_d;
by seqn;
run;

data nhanes_PAQ;
merge cvd_final_d (in=a) PAQ_ (in=b);
by seqn;
if a=1 and b=1 ;
run;

data PAQ_sleep;
      set PA_master (keep= SEQN pad680) ;
run;

proc sort data=PAQ_sleep;
by seqn;
run;

proc sort data=nhanes_PAQ;
by seqn;
run;

data nhanes_PAQ_sleep;
merge nhanes_PAQ (in=a) PAQ_sleep (in=b);
by seqn;
if a=1 and b=1 ;
run;

proc freq data=nhanes_PAQ_sleep;
tables PAD680;
run;

data nhanes_PAQ_sleep;
merge nhanes_PAQ (in=a) PAQ_sleep (in=b);
by seqn;
if a=1 and b=1 ;
if PAD680=9999 then PAD680=.;
run;

/******************* SCROLL DOWN TO WHERE MINIMAL / ADEQUATE CUT-OFFS ARE CREATED *********************
proc means data=nhanes_PAQ;
var totPA moderate_MET_week vig_MET_week;
run;

******* TOTAL PHYSICAL ACTIVITY *************;

proc sort data=nhanes_PAQ;
by nlr_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95) ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain nlr_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain nlr_bi;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain tg_hdl_bi;
run;

proc sort data=nhanes_PAQ;
by rdw_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain rdw_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain rdw_bi;
run;

******* VIGOROUS PHYSICAL ACTIVITY *************;

proc sort data=nhanes_PAQ;
by nlr_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain nlr_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain nlr_bi;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain tg_hdl_bi;
run;

proc sort data=nhanes_PAQ;
by rdw_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain rdw_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain rdw_bi;
run;

******** MODERATE PHYSICAL ACTIVITY ***********;
proc sort data=nhanes_PAQ;
by nlr_bi;
run;

proc means data=nhanes_PAQ;
var moderate_MET_week;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain nlr_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain nlr_bi;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain tg_hdl_bi;
run;

proc sort data=nhanes_PAQ;
by rdw_bi;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain rdw_bi;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain rdw_bi;
run;

****** STRATIFIED RESULTS BY BIOLOGICAL SEX *************;

******* TOTAL PHYSICAL ACTIVITY *************;

proc sort data=nhanes_PAQ;
by nlr_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95) ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain nlr_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain tg_hdl_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by rdw_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var totPA;
domain rdw_bi*RIAGENDR;
run;

******* VIGOROUS PHYSICAL ACTIVITY *************;

proc sort data=nhanes_PAQ;
by nlr_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain nlr_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain tg_hdl_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by rdw_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var vig_MET_week;
domain rdw_bi*RIAGENDR;
run;

******** MODERATE PHYSICAL ACTIVITY ***********;
proc sort data=nhanes_PAQ;
by nlr_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain nlr_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by tg_hdl_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain tg_hdl_bi*RIAGENDR;
run;

proc sort data=nhanes_PAQ;
by rdw_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var moderate_MET_week;
domain rdw_bi*RIAGENDR;
run;

*distribution plots;
proc sort data=nhanes_PAQ_sleep; by tg_hdl_bi; run;
proc sort data=nhanes_PAQ_sleep; by nlr_bi; run;
proc sort data=nhanes_PAQ_sleep; by rdw_bi; run;

proc univariate data=nhanes_PAQ_sleep plot normal;
var moderate_MET_week;
by tg_hdl_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var vig_MET_week;
by tg_hdl_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var totPA;
by tg_hdl_bi;
run;

proc univariate data=nhanes_PAQ_sleep plot normal;
var moderate_MET_week;
by nlr_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var vig_MET_week;
by nlr_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var totPA;
by nlr_bi;
run;

proc univariate data=nhanes_PAQ_sleep plot normal;
var moderate_MET_week;
by rdw_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var vig_MET_week;
by rdw_bi;
run;
proc univariate data=nhanes_PAQ_sleep plot normal;
var totPA;
by rdw_bi;
run;
*/

**************************** ESTABLISH ADEQUATE LEVELS OF MODERATE PHYSICAL ACTIVITY ***************************;
data nhanes_PAQ_cut;
set nhanes_PAQ_sleep;
if 0 le moderate_MET_week lt 600 then PA_cut_ad=0;
else if moderate_MET_week ge 600 then PA_cut_ad=1;

if 0 le moderate_MET_week lt 450 then PA_cut_min=0;
else if moderate_MET_week ge 450 then PA_cut_min=1;

if sddsrvyr in (5,6) then PA_weight = 1/2 * fast_weight;

run;

proc sort data=nhanes_PAQ_cut; by PA_cut_ad; run;

proc means data=nhanes_PAQ_cut n min max;
var moderate_MET_week;
by PA_cut_ad;
run;

proc sort data=nhanes_PAQ_cut; by PA_cut_min; run;

proc means data=nhanes_PAQ_cut n min max;
var moderate_MET_week;
by PA_cut_min;
run;

/*create combined sample weights;
if sddsrvyr in (5,6) then PA_weight = 1/2 * fast_weight;
*/
proc freq data=nhanes_PAQ_sleep;
table sddsrvyr;
run;

proc surveyfreq data=nhanes_PAQ_cut;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables PA_cut_ad/row;
tables PA_cut_min/row;
run;

proc surveyfreq data=nhanes_PAQ_cut;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*PA_cut_ad/chisq or row;
tables rdw_bi*PA_cut_ad/chisq or row;
tables tg_hdl_bi*PA_cut_ad/chisq or row;
run;

proc surveyfreq data=nhanes_PAQ_cut;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*PA_cut_ad/chisq row;
tables RIAGENDR*rdw_bi*PA_cut_ad/chisq row;
tables RIAGENDR*tg_hdl_bi*PA_cut_ad/chisq row;
run;

proc surveyfreq data=nhanes_PAQ_cut;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*PA_cut_min/chisq row;
tables rdw_bi*PA_cut_min/chisq row;
tables tg_hdl_bi*PA_cut_min/chisq row;
run;

proc surveyfreq data=nhanes_PAQ_cut;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*PA_cut_min/chisq row;
tables RIAGENDR*rdw_bi*PA_cut_min/chisq row;
tables RIAGENDR*tg_hdl_bi*PA_cut_min/chisq row;
run;

**************************** SEDENTARY ACTIVITY *****************************;
data nhanes_PAQ_sleep;
set nhanes_PAQ_sleep;
if sddsrvyr in (5,6) then PA_weight = 1/2 * fast_weight;
run;

proc freq data=nhanes_PAQ_sleep;
tables sddsrvyr;
run;

proc freq data=nhanes_PAQ_sleep;
tables PAD680;
run;

proc univariate data=nhanes_PAQ_sleep plot normal;
var PAD680;
run;


*Overall;
*nlr;
proc sort data=nhanes_PAQ_sleep;
by nlr_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain nlr_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain nlr_bi;
run;

*distribution plot;
proc univariate data=nhanes_PAQ_sleep plot normal;
var PAD680;
by nlr_bi;
run;

*tg_hdl;
proc sort data=nhanes_PAQ_sleep;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain tg_hdl_bi;
run;

*distribution plot;
proc univariate data=nhanes_PAQ_sleep plot normal;
var PAD680;
by tg_hdl_bi;
run;

*rdw;
proc sort data=nhanes_PAQ_sleep;
by rdw_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain rdw_bi;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain rdw_bi;
run;

*distribution plot;
proc univariate data=nhanes_PAQ_sleep plot normal;
var PAD680;
by rdw_bi;
run;


*Stratified by Gender;
proc sort data=nhanes_PAQ_sleep;
by nlr_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain nlr_bi*RIAGENDR;
run;

*tg_hdl;
proc sort data=nhanes_PAQ_sleep;
by tg_hdl_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain tg_hdl_bi*RIAGENDR;
run;

*rdw;
proc sort data=nhanes_PAQ_sleep;
by rdw_bi RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep median percentile=(25,50,75,90,95);
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
var PAD680;
domain rdw_bi;
run;

proc surveyreg data=nhanes_PAQ_sleep;
weight PA_weight ; strata sdmvstra ; cluster sdmvpsu ;
model PAD680 = rdw_bi;
run;

/***** OLD CODE FOR FV INTAKE ********************;
libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DRXTOT.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_a;
  set DRXTOT /*(keep=seqn DRXTKCAL DRXTFIBE)*/;
*rename DRXTKCAL = kcal;
*rename DRXTFIBE = fibe;
/*run;

data Diet_a;
set Diet_a;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DRXTOT_B.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_b;
  set DRXTOT_B /*(keep=seqn DRXTKCAL DRXTFIBE)*/;
*rename DRXTKCAL = kcal;
*rename DRXTFIBE = fibe;
/*run;

data Diet_b;
set Diet_b;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DR1TOT_C.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_c;
  set DR1TOT_C /*(keep=seqn DR1TKCAL DR1TFIBE)*/;
*rename DR1TKCAL = kcal;
*rename DR1TFIBE = fibe;
/*run;

data Diet_c;
set Diet_c;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DR1TOT_D.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_d;
  set DR1TOT_D /*(keep=seqn DR1TKCAL DR1TFIBE)*/;
*rename DR1TKCAL = kcal;
*rename DR1TFIBE = fibe;
/*run;

data Diet_d;
set Diet_d;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DR1TOT_E.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_e;
  set DR1TOT_E /*(keep=seqn DR1TKCAL DR1TFIBE)*/;
*rename DR1TKCAL = kcal;
*rename DR1TFIBE = fibe;
/*run;

data Diet_e;
set Diet_e;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

libname XP xport "U:\Moen_CVD_risk\Longitudinal Analysis\Nutrition\DR1TOT_F.xpt";

* Import the xpt file and save as a temporary SAS dataset in your work directory *;
* using Proc COPY *;
proc copy in=xp out=work;
run;

data Diet_f;
  set DR1TOT_F /*(keep=seqn DR1TKCAL DR1TFIBE)*/;
*rename DR1TKCAL = kcal;
*rename DR1TFIBE = fibe;
/*run;

data Diet_f;
set Diet_f;
*fibe_kcal = (fibe/kcal)*1000;
*if 0 le fibe_kcal lt 14 then fib_cut=0;
*else if fibe_kcal ge 14 then fib_cut=1;
run;

** Diet ***;

data Diet_master ;
set Diet_a Diet_b Diet_c Diet_d Diet_e Diet_f;
run;


** Merge NHANES w/ Diet;

proc sort data=Diet_master;
by seqn;
run;

proc sort data=cvd_final_d;
by seqn;
run;

data nhanes_Diet;
merge cvd_final_d (in=a) Diet_master (in=b);
by seqn;
if a=1 and b=1 ;
run;

*** Fiber intake by risk factor ;
proc sort data=nhanes_Diet;
by nlr_bi;
run;

proc surveymeans data=nhanes_Diet min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var fibe_kcal;
domain nlr_bi;
run;

proc sort data=nhanes_Diet;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_Diet min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var fibe_kcal;
domain tg_hdl_bi;
run;

proc sort data=nhanes_Diet;
by rdw_bi;
run;

proc surveymeans data=nhanes_Diet min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var fibe_kcal;
domain rdw_bi;
run;

proc surveyfreq data=nhanes_Diet;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*fib_cut/chisq row;
tables tg_hdl_bi*fib_cut/chisq row;
tables rdw_bi*fib_cut/chisq row;
run;  */


************************************** FV intake FROM FPED DATABASE ;
libname HEI "U:\Moen_CVD_risk\Longitudinal Analysis\HEI" ;

proc copy in=HEI out=work;
run;

*Dark green veg = DR1T_V_DRKGR;
*Red orange veg = DR1T_V_REDOR_TOTAL;
data FV_master_day1_ ;
set fped_dr1tot_0506 /*fped_dr2tot_0506*/ fped_dr1tot_0708 /*fped_dr2tot_0708*/ fped_dr1tot_0910 /*fped_dr2tot_0910*/ ;
run;

data FV_master_day1_b;
set FV_master_day1_ (keep=SEQN DR1T_F_TOTAL DR1T_V_TOTAL DR1T_V_DRKGR DR1T_V_REDOR_TOTAL) ;
run;

data FV_master_day2_ ;
set /*fped_dr1tot_0506*/ fped_dr2tot_0506 /*fped_dr1tot_0708*/ fped_dr2tot_0708 /*fped_dr1tot_0910*/ fped_dr2tot_0910 ;
run;

data FV_master_day2_b;
set FV_master_day2_ (keep=SEQN DR2T_F_TOTAL DR2T_V_TOTAL DR2T_V_DRKGR DR2T_V_REDOR_TOTAL) ;
run;

proc sort data=FV_master_day2_b;
by SEQN;
run;
proc sort data=FV_master_day1_b;
by SEQN;
run;

data FV_master;
merge FV_master_day1_b (in=a) FV_master_day2_b (in=b);
by seqn;
if a=1 and b=1;
run;

*Average day 1 and day 2 intake;
data FV_keep;
set FV_master ;
Fruit_avg = (DR1T_F_TOTAL + DR2T_F_TOTAL)/2;
Veg_avg = (DR1T_V_TOTAL + DR2T_V_TOTAL)/2;
if (DR1T_F_TOTAL=. or DR2T_F_TOTAL=.) then Fruit_avg=.;
if (DR1T_V_TOTAL=. or DR2T_V_TOTAL=.) then Veg_avg=.;
Green_Veg_avg = (DR1T_V_DRKGR + DR2T_V_DRKGR)/2;
Orange_Veg_avg = (DR1T_V_REDOR_TOTAL + DR2T_V_REDOR_TOTAL)/2;
if (DR1T_V_REDOR_TOTAL=. or DR2T_V_REDOR_TOTAL=.) then Orange_Veg_avg=.;
if (DR1T_V_DRKGR=. or DR2T_V_DRKGR=.) then Green_Veg_avg=.;
run;

proc sort data=FV_keep;
by SEQN;
run;
proc sort data=cvd_final_d;
by SEQN;
run;

proc freq data=cvd_final_d;
tables NHANES;
run;

data nhanes_FV;
merge cvd_final_d (in=a) FV_keep (in=b);
by seqn;
if a=1 and b=1 ;
if sddsrvyr in (4,5,6) then FV_weight = 1/3 * fast_weight;
run;

proc freq data=nhanes_FV;
tables sddsrvyr;
run;

proc surveyfreq data=nhanes_FV;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables NHANES;
run;

/** AVERAGE INTAKE OF DARK GREEN & RED-ORANGE VEGETABLE INTAKE BY RISK FACTORS OF INTEREST **/
**** OVERALL SAMPLE ****;

ods rtf file='U:\Dark Green and Red Orange Veg Intake NHANES.Rtf' ;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
run;

**** BY NLR ****;
proc sort data=nhanes_FV;
by nlr_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain nlr_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain nlr_bi;
run;
proc sort data=nhanes_FV;
by nlr_bi RIAGENDR;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain nlr_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain nlr_bi;
run;

***** BY TG:HDL ****;
proc sort data=nhanes_FV;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain tg_hdl_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain tg_hdl_bi;
run;
proc sort data=nhanes_FV;
by tg_hdl_bi RIAGENDR;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain tg_hdl_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain tg_hdl_bi;
run;

***** BY RDW ****;
proc sort data=nhanes_FV;
by rdw_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain rdw_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain rdw_bi;
run;
proc sort data=nhanes_FV;
by rdw_bi RIAGENDR;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Orange_Veg_avg;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(5,10,25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain rdw_bi;
run;
proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var Green_Veg_avg;
domain rdw_bi;
run;

ods rtf close;


/* SCROLL DOWN TO WHERE MINIMAL CUT-OFFS ARE CREATED *******************
*** Overall Sample;
proc sort data=nhanes_FV;
by nlr_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain nlr_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain nlr_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain nlr_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain nlr_bi;
run;

*distribution plots;
proc univariate data=nhanes_FV plot normal;
var DR1T_F_TOTAL;
by nlr_bi;
run;
proc univariate data=nhanes_FV plot normal;
var DR1T_V_TOTAL;
by nlr_bi;
run;

proc sort data=nhanes_FV;
by tg_hdl_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain tg_hdl_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain tg_hdl_bi;
run;

*distribution plots;
proc univariate data=nhanes_FV plot normal;
var DR1T_F_TOTAL;
by tg_hdl_bi;
run;
proc univariate data=nhanes_FV plot normal;
var DR1T_V_TOTAL;
by tg_hdl_bi;
run;

proc sort data=nhanes_FV;
by rdw_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain rdw_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain rdw_bi;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain rdw_bi;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain rdw_bi;
run;

*distribution plots;
proc univariate data=nhanes_FV plot normal;
var DR1T_F_TOTAL;
by rdw_bi;
run;
proc univariate data=nhanes_FV plot normal;
var DR1T_V_TOTAL;
by rdw_bi;
run;

**** STRATIFIED BY SEX;
proc sort data=nhanes_FV;
by nlr_bi RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain nlr_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain nlr_bi*RIAGENDR;
run;

proc sort data=nhanes_FV;
by tg_hdl_bi RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain tg_hdl_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain tg_hdl_bi*RIAGENDR;
run;

proc sort data=nhanes_FV;
by rdw_bi RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_F_TOTAL;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV median percentile=(25,50,75,90,95);
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain rdw_bi*RIAGENDR;
run;

proc surveymeans data=nhanes_FV ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var DR1T_V_TOTAL;
domain rdw_bi*RIAGENDR;
run;
*/

**************************** ESTABLISH ADEQUATE LEVELS OF FRUIT AND VEGETABLE INTAKE ***************************;
data nhanes_FV_cut;
set nhanes_FV;
if 0 le Fruit_avg le 1.49999999999999999999999999999999999999 then fruit_cut=0;
else if Fruit_avg ge 1.50000000 then fruit_cut=1;

if 0 le Veg_avg lt 1.9999999999999999999999999999999999999999 then veg_cut=0;
else if Veg_avg ge 2.00000000 then veg_cut=1;

run;

proc sort data=nhanes_FV_cut; by fruit_cut; run;

proc freq data=nhanes_FV_cut;
table fruit_cut veg_cut;
run;

proc means data=nhanes_FV_cut n min max;
var Fruit_avg;
by fruit_cut;
run;

proc sort data=nhanes_FV_cut; by veg_cut; run;

proc means data=nhanes_FV_cut n min max;
var Veg_avg;
by veg_cut;
run;

proc surveyfreq data=nhanes_FV_cut;
weight FV_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables fruit_cut/row;
tables veg_cut/row;
run;

proc surveyfreq data=nhanes_FV_cut;
weight FV_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*fruit_cut/chisq row;
tables rdw_bi*fruit_cut/chisq row;
tables tg_hdl_bi*fruit_cut/chisq row;
run;

proc surveyfreq data=nhanes_FV_cut;
weight FV_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*fruit_cut/chisq row;
tables RIAGENDR*rdw_bi*fruit_cut/chisq row;
tables RIAGENDR*tg_hdl_bi*fruit_cut/chisq row;
run;

proc surveyfreq data=nhanes_FV_cut;
weight FV_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_bi*veg_cut/chisq row;
tables rdw_bi*veg_cut/chisq row;
tables tg_hdl_bi*veg_cut/chisq row;
run;

proc surveyfreq data=nhanes_FV_cut;
weight FV_weight ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*veg_cut/chisq row;
tables RIAGENDR*rdw_bi*veg_cut/chisq row;
tables RIAGENDR*tg_hdl_bi*veg_cut/chisq row;
run;



********************************************* WORK DONE ON 8-8-24 REQUEST BY DR. MOEN BELOW --- COMPARE ABOVE RESULTS LIMITING SAMPLE BY AGE AT BASELINE USING CLINICAL CUT-OFFS
                                              TO RESULTS IF WE USED CLINICAL CUT-OFFS BUT DID NOT LIMIT THE SAMPLE BY AGE********************************;
/*
data cvd_final_c;
set cvd_final_b;
*where ((RIAGENDR=1 and RIDAGEYR ge 45) or (RIAGENDR=2 and RIDAGEYR ge 55));
run;

*double check everyone has at least 10 years of follow-up;
proc freq data=cvd_final_c;
tables follow;
run;

*double check males have age 45 - 84 & females have age 55 - 84;
proc sort data=cvd_final_c;
by RIAGENDR;
run;

proc surveymeans data=cvd_final_c min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by RIAGENDR;
run;

proc format;
value age_cat
0='45 - 59'
1='60 - 69'
2='70 - 79'
3='80 +'
;
run;

*identify clinical risk factors;
data cvd_final_d;
set cvd_final_c;
if 0 le tg_hdl lt 3.00 then tg_hdl_bi=0;
else if tg_hdl ge 3.00 then tg_hdl_bi=1;

if 0 le tg_hdl lt 4.00 then tg_hdl_bi_b=0;
else if tg_hdl ge 4.00 then tg_hdl_bi_b=1;

if 0 le tg_hdl lt 5.00 then tg_hdl_bi_c=0;
else if tg_hdl ge 5.00 then tg_hdl_bi_c=1;

if 0 le nlr lt 2.56 then nlr_bi=0;
else if nlr ge 2.56 then nlr_bi=1;

if 0 le rdw lt 13.10 then rdw_bi=0;
else if rdw ge 13.10 then rdw_bi=1;

/*if 45 le RIDAGEYR lt 60 then age_cat=0;
else if 60 le RIDAGEYR lt 70 then age_cat=1;
else if 70 le RIDAGEYR lt 80 then age_cat=2;
else if RIDAGEYR ge 80 then age_cat=3; */
/*
run;

************** TABLES TO PRODUCE FOR DR. MOEN TO DECIDE ON FINAL AGE GROUP **********;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*rdw_bi*cvd_death/row;
tables age_cat*nlr_bi*cvd_death/row;
tables age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*rdw_bi*cvd_death/row;
tables RIAGENDR*age_cat*nlr_bi*cvd_death/row;
tables RIAGENDR*age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
tables RIAGENDR*rdw_bi*cvd_death/row;
run;

***************************************************************************************;


*double check that risk factors were coded in appropriate range;
proc sort data=cvd_final_d;
by tg_hdl_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var tg_hdl;
by tg_hdl_bi;
run;

proc sort data=cvd_final_d;
by nlr_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var nlr;
by nlr_bi;
run;

proc sort data=cvd_final_d;
by rdw_bi;
run;

proc surveymeans data=cvd_final_d min max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var rdw;
by rdw_bi;
run;

proc copy in=work out=moen;
select cvd_final_d;
run;

****** DESCRIPTIVE STATS *******;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi tg_hdl_bi_b tg_hdl_bi_c;
tables cvd_death;
tables age_cat RIAGENDR ;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables mortstat;
run;

proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
run;

**** DESCRIPTIVE STATS BY CVD DEATH *********;
proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat;
by cvd_death;
run;

proc sort data=cvd_final_d;
by cvd_death;
run;
proc surveymeans data=cvd_final_d min median mean max;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi nlr_bi tg_hdl_bi;
by cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*cvd_death/chisq row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables cvd_death;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables rdw_bi*cvd_death/row;
tables nlr_bi*cvd_death/row;
tables tg_hdl_bi*cvd_death/row;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables age_cat*rdw_bi*cvd_death/row;
tables age_cat*nlr_bi*cvd_death/row;
tables age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*age_cat*rdw_bi*cvd_death/row;
tables RIAGENDR*age_cat*nlr_bi*cvd_death/row;
tables RIAGENDR*age_cat*tg_hdl_bi*cvd_death/row;
format age_cat age_cat.;
run;

proc surveyfreq data=cvd_final_d;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables RIAGENDR*nlr_bi*cvd_death/row;
tables RIAGENDR*tg_hdl_bi*cvd_death/row;
tables RIAGENDR*rdw_bi*cvd_death/row;
run;


******** RDW ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi  /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIAGENDR rdw_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR rdw_bi*RIDAGEYR /risklimits;;
run;

******** NLR ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi  /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIAGENDR nlr_bi*RIAGENDR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR nlr_bi*RIDAGEYR /risklimits;;
run;

*descriptive table;
proc sort data=cvd_final_b;
by nlr_q cvd_death;
run;

proc surveymeans data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
by nlr_q cvd_death;
run;

proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q*RIAGENDR*cvd_death/chisq row;
run;

*Does SAS give an error message from low sample - no;
proc surveyfreq data=cvd_final_b;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_q*age_cat*cvd_death/chisq expected row;
run;

*what about if we used the raw frequencies - no;
proc freq data=cvd_final_b;
tables nlr_q*age_cat*cvd_death/chisq ;
run;

******** TG_HDL ***************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR RIAGENDR /risklimits;;
run;

**** TEST INTERACTION **;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIAGENDR tg_hdl_bi*RIAGENDR/risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR tg_hdl_bi*RIDAGEYR /risklimits;;
run;

********** WHAT IF WE INCLUDED ALL FACTORS IN ONE MODEL ************;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi tg_hdl_bi rdw_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi tg_hdl_bi rdw_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

/*test for interaction;
proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR nlr_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR tg_hdl_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q tg_hdl_q rdw_q RIDAGEYR rdw_q*RIDAGEYR /risklimits;;
domain RIAGENDR;
run;  */
/*

*models stratified by gender;
proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref; ;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_d ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

/*testing for interaction;
proc surveymeans data=cvd_final_b mean median;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
var RIDAGEYR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_q RIDAGEYR nlr_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_q RIDAGEYR tg_hdl_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run;

proc surveyphreg data=cvd_final_b ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q RIDAGEYR rdw_q*RIDAGEYR/risklimits;;
domain RIAGENDR;
run; */


*************** CREATE INDEX VARIABLE - STOPPING PLACE FOR 8/1 AM *****************;
/*
data cvd_index;
set cvd_final_d;

rdw_tg_hdl_i = rdw_bi + tg_hdl_bi;
rdw_nlr_i = rdw_bi + nlr_bi;
tg_hdl_nlr_i = tg_hdl_bi + nlr_bi;

nlr_tg_hdl_rdw_i = nlr_bi + tg_hdl_bi + rdw_bi;

/*if rdw_i=1 and tg_hdl_i=1 then rdw_tg_hdl_1_=1;
else if rdw_i=1 and tg_hdl_i=2 then rdw_tg_hdl_1_=2;
else if rdw_i=1 and tg_hdl_i=3 then rdw_tg_hdl_1_=3;
else if rdw_i=1 and tg_hdl_i=4 then rdw_tg_hdl_1_=4;

if rdw_i=2 and tg_hdl_i=1 then rdw_tg_hdl_2_=1;
else if rdw_i=2 and tg_hdl_i=2 then rdw_tg_hdl_2_=2;
else if rdw_i=2 and tg_hdl_i=3 then rdw_tg_hdl_2_=3;
else if rdw_i=2 and tg_hdl_i=4 then rdw_tg_hdl_2_=4;

if rdw_i=3 and tg_hdl_i=1 then rdw_tg_hdl_3_=1;
else if rdw_i=3 and tg_hdl_i=2 then rdw_tg_hdl_3_=2;
else if rdw_i=3 and tg_hdl_i=3 then rdw_tg_hdl_3_=3;
else if rdw_i=3 and tg_hdl_i=4 then rdw_tg_hdl_3_=4;

if rdw_i=4 and tg_hdl_i=1 then rdw_tg_hdl_4_=1;
else if rdw_i=4 and tg_hdl_i=2 then rdw_tg_hdl_4_=2;
else if rdw_i=4 and tg_hdl_i=3 then rdw_tg_hdl_4_=3;
else if rdw_i=4 and tg_hdl_i=4 then rdw_tg_hdl_4_=4; */

/*
run;

proc freq data=cvd_index;
tables rdw_bi nlr_bi tg_hdl_bi;
tables rdw_tg_hdl_i;
tables rdw_nlr_i;
tables tg_hdl_nlr_i;
tables nlr_tg_hdl_rdw_i;
run;

proc sort data=cvd_index;
by tg_hdl_bi;
run;

proc means data=cvd_index min max;
var tg_hdl;
by tg_hdl_bi;
run;

proc means data=cvd_index min max;
var rdw_tg_hdl_i rdw_nlr_i tg_hdl_nlr_i nlr_tg_hdl_rdw_i;
run;

**** PROP HAZARDS REGRESS WITH INDEX VARIABLE ****;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = rdw_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = nlr_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = tg_hdl_bi RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
class rdw_bi (ref='0') nlr_bi (ref='0') tg_hdl_bi (ref='0') / param=ref;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
run;



















/**** PROP HAZARDS REGRESS WITH CLASS STATEMENT FOR INDEX VARIABLE ****;
proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_nlr_i (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_nlr_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_tg_hdl_i (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_tg_hdl_i RIDAGEYR/risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class tg_hdl_nlr_i (ref='2')/ param=ref;
model PERMTH_EXM*cvd_death(0) = tg_hdl_nlr_i RIDAGEYR /risklimits;;
run;

proc surveyphreg data=cvd_index ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class nlr_tg_hdl_rdw_i (ref='3')/ param=ref;
model PERMTH_EXM*cvd_death(0) = nlr_tg_hdl_rdw_i RIDAGEYR/risklimits;;
run;

******** DESCRIPTIVE STATS FOR INTERACTION TESTED ABOVE W/ INDEX VAR **********;
proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_i*rdw_i*cvd_death/chisq row;
run;

proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables nlr_i*tg_hdl_i*cvd_death/chisq row;
run;

proc surveyfreq data=cvd_index;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
tables tg_hdl_i*rdw_i*cvd_death/chisq row;
run;      */


****************** TEST MODEL ASSUMPTIONS - CVD ******************* STOPPING PLACE 5-29-24;
 /*

**** Test PH assumption ****;

*stock syntax from survival analysis final - alter to moen's models;

*5)Check the proportional hazards assumption of the final model with plots of Schoenfeld residuals and formally with
 assess PH/seed=12345 resample as seen in the univariate models above;
proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q age_cat age_cat*nlr_q /risklimits;
run;

proc phreg data=cvd_final_;
class  rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0');
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q age_cat age_cat*nlr_q /rl;
output out=out resdev=dev xbeta=linpred
dfbeta=db_rdw_q2 db_rdw_q3 db_rdw_q4
db_nlr_q2 db_nlr_q3 db_nlr_q4
db_tg_hdl_q2 db_tg_hdl_q3 db_tg_hdl_q4
db_age_cat
db_age_cat_nlr_q2 db_age_cat_nlr_q3 db_age_cat_nlr_q4

ressch=ressch_rdw_q2 ressch_rdw_q3 ressch_rdw_q4
ressch_nlr_q2 ressch_nlr_q3 ressch_nlr_q4
ressch_tg_hdl_q2 ressch_tg_hdl_q3 ressch_tg_hdl_q4
ressch_age_cat
ressch_age_cat_nlr_q2 ressch_age_cat_nlr_q3 ressch_age_cat_nlr_q4 ;
assess ph/seed=12345 resample;
run;
*all p-value >0.05, proportional hazards assumption appropriate;

*now plot schoenfeld residuals for each covariate against survival time;
"Schoenfeld residual for age_dx vs overall survival";
proc sgplot data=out;
scatter y=ressch_rdw_q2 x=PERMTH_EXM;
refline 0/axis=y;
title 'RDW Quartile 2 by Follow-up';
run;

**** Test Extreme Outlier assumption****;

*stock syntax from survival analysis final - alter to moen's models;

*6)/*now we check outliers*/
*--plot deviance residuals (full model) by linear predictor (xbeta)--;
/*
title 'Deviance Residuals vs. Linear Predictor';
proc sgplot data=out;
scatter x=linpred y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. RDW Quartile';
proc sgplot data=out;
scatter x=rdw_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. NLR Quartile';
proc sgplot data=out;
scatter x=nlr_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. TG:HDL Quartile';
proc sgplot data=out;
scatter x=tg_hdl_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. Age Category';
proc sgplot data=out;
scatter x=age_cat y=dev;   *no extreme outliers;
refline 0/axis=y;
run;


**** Test influential points assumption***;

*stock syntax from survival analysis final - alter to moen's models;
*--identify influential observations--;

*Delta beta values should not be greater than the absolute value of the standard error for each covariate parameter);
*SE rdw_q2=0.22746;
*SE rdw_q3=0.21267;
*SE rdw_q4=0.20033;
*SE nlr_q2=0.55767;
*SE nlr_q3=0.50458;
*SE nlr_q4=0.49046;
*SE tg_hdl_q2=0.18199;
*SE tg_hdl_q3=0.18106;
*SE tg_hdl_q4=0.17612;
*SE age_cat=0.08245;
*SE age_cat*nlr_q2=0.12789;
*SE age_cat*nlr_q3=0.11600;
*SE age_cat*nlr_q4=0.11125;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q2 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q3 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q4 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_nlr_q2 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_nlr_q3 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_nlr_q4 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_tg_hdl_q2 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_tg_hdl_q3 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_tg_hdl_q4 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_age_cat x=age_cat;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

*not able to prodcue for interaction;
proc sgplot data=out;
scatter y=db_age_cat_nlr_q2 x=nlr_q1age_cat;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;


*** Test PH Assumption using survey PHREG;
*statement from SAS;
proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q age_cat age_cat*nlr_q x;
*x=PERMTH_EXM*(rdw_q=0);
x=PERMTH_EXM*(rdw_q=1);
*x=PERMTH_EXM*(rdw_q=2);
*x=PERMTH_EXM*(rdw_q=3);
*x=PERMTH_EXM*(nlr_q=1);
*x=PERMTH_EXM*(nlr_q=2);
*x=PERMTH_EXM*(nlr_q=3);
*x=PERMTH_EXM*(tg_hdl_q=1);
*x=PERMTH_EXM*(tg_hdl_q=2);
*x=PERMTH_EXM*(tg_hdl_q=3);
*x=PERMTH_EXM*(age_cat=1);
*x=PERMTH_EXM*(age_cat=2);
*x=PERMTH_EXM*(age_cat=3);
*x=PERMTH_EXM*(age_cat=4);
*x=PERMTH_EXM*(age_cat=5);
*x=PERMTH_EXM*(age_cat=6);
run;

*stock syntax from SAS help site;
proc surveyphreg data = mortality nomcar;
   class gender;
   strata varstrata;
   cluster varpsu;
   weight sweight;
   model age*vitalstatus(1 4 5 6) = gender x;
   x = age*(gender=1);
run;


****************** TEST MODEL ASSUMPTIONS - OVERALL MORTALITY *******************;

*5)Check the proportional hazards assumption of the final model with plots of Schoenfeld residuals and formally with
 assess PH/seed=12345 resample as seen in the univariate models above;
proc phreg data=cvd_final_;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') RIAGENDR (ref='1') / param=ref;
model PERMTH_EXM*mortstat(0) = rdw_q nlr_q tg_hdl_q tg_hdl_q*age_cat age_cat rdw_q*RIAGENDR RIAGENDR /risklimits;
ouput out=out resdev=dev xbeta=linpred
dfbeta=db_rdw_q2 db_rdw_q3 db_rdw_q4
db_nlr_q2 db_nlr_q3 db_nlr_q4
db_tg_hdl_q2 db_tg_hdl_q3 db_tg_hdl_q4
db_age_cat
db_age_cat_nlr_q2 db_age_cat_nlr_q3 db_age_cat_nlr_q4
db_gender
;
assess ph/seed=12345 resample;
run;
*all p-value >0.05, proportional hazards assumption appropriate;

*now plot schoenfeld residuals for each covariate against survival time;
"Schoenfeld residual for age_dx vs overall survival";
proc sgplot data=out;
scatter y=ressch_rdw_q2 x=PERMTH_EXM;
refline 0/axis=y;
title 'RDW Quartile 2 by Follow-up';
run;

**** Test Extreme Outlier assumption****;

*stock syntax from survival analysis final - alter to moen's models;

*6)/*now we check outliers*/
*--plot deviance residuals (full model) by linear predictor (xbeta)--;
/*
title 'Deviance Residuals vs. Linear Predictor';
proc sgplot data=out;
scatter x=linpred y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. RDW Quartile';
proc sgplot data=out;
scatter x=rdw_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. NLR Quartile';
proc sgplot data=out;
scatter x=nlr_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. TG:HDL Quartile';
proc sgplot data=out;
scatter x=tg_hdl_q y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. Age Category';
proc sgplot data=out;
scatter x=age_cat y=dev;   *no extreme outliers;
refline 0/axis=y;
run;

title 'Deviance Residuals vs. Gender';
proc sgplot data=out;
scatter x=RIAGENDR y=dev;   *no extreme outliers;
refline 0/axis=y;
run;


**** Test influential points assumption***;

*stock syntax from survival analysis final - alter to moen's models;
*--identify influential observations--;

*Delta beta values should not be greater than the absolute value of the standard error for each covariate parameter);
*SE rdw_q2=0.18413;
*SE rdw_q3=0.17369;
*SE rdw_q4=0.16603;
*SE nlr_q2=0.09428;
*SE nlr_q3=0.08932;
*SE nlr_q4=0.08537;
*SE tg_hdl_q2=0.30075;
*SE tg_hdl_q3=0.30056;
*SE tg_hdl_q4=0.29696;
*SE age_cat=0.05311;
*SE gender=0.19370;

title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q2 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q3 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_rdw_q4 x=rdw_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_nlr_q2 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_nlr_q3 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_nlr_q4 x=nlr_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_tg_hdl_q2 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_tg_hdl_q3 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_tg_hdl_q4 x=tg_hdl_q;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

proc sgplot data=out;
scatter y=db_age_cat x=age_cat;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

*not able to prodcue for interaction;
proc sgplot data=out;
scatter y=db_gender x=RIAGENDR;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;


*** Test PH Assumption using survey PHREG;
*statement from SAS;
proc surveyphreg data=cvd_final_ ;
weight weight_comb ; strata sdmvstra ; cluster sdmvpsu ;
class rdw_q (ref='0') nlr_q (ref='0') tg_hdl_q (ref='0') / param=ref;
model PERMTH_EXM*cvd_death(0) = rdw_q nlr_q tg_hdl_q age_cat age_cat*nlr_q x;
*x=PERMTH_EXM*(rdw_q=0);
x=PERMTH_EXM*(rdw_q=1);
*x=PERMTH_EXM*(rdw_q=2);
*x=PERMTH_EXM*(rdw_q=3);
*x=PERMTH_EXM*(nlr_q=1);
*x=PERMTH_EXM*(nlr_q=2);
*x=PERMTH_EXM*(nlr_q=3);
*x=PERMTH_EXM*(tg_hdl_q=1);
*x=PERMTH_EXM*(tg_hdl_q=2);
*x=PERMTH_EXM*(tg_hdl_q=3);
*x=PERMTH_EXM*(age_cat=1);
*x=PERMTH_EXM*(age_cat=2);
*x=PERMTH_EXM*(age_cat=3);
*x=PERMTH_EXM*(age_cat=4);
*x=PERMTH_EXM*(age_cat=5);
*x=PERMTH_EXM*(age_cat=6);
run;

*stock syntax from SAS help site;
proc surveyphreg data = mortality nomcar;
   class gender;
   strata varstrata;
   cluster varpsu;
   weight sweight;
   model age*vitalstatus(1 4 5 6) = gender x;
   x = age*(gender=1);
run;


*/
