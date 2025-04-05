*Nicholas Hollman;
*Final Project;

*import dataset;
proc import file="filepath\CA125 in Ovary Cancer.xlsx"
out=work.ovarian
replace
dbms=xlsx;
getnames=yes;
run;

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
*Lower Quartile  Median    Upper Quartile  Mean       Std Dev 
61.0000000     262.0000000 940.0000000    895.3285714 1802.54 ;
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
label Plt_count='Platelet count (× 10*9/L)';
label WBC='White blood cell count (× 10*9/L)';
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
proc lifetest data=ovarian_b;  *median survival time = 17 (95% CI: 12 - 36) months, censoring rate 25%;
time OS*Delta_OS(0);
run;

*Descriptive Statistics;
*continuous covariates/outcome;
proc univariate data=ovarian_b plot normal;
var BMI age_dx Plt_count WBC OS;
run;
*categorical covariates/outcome;
proc freq data=ovarian_b;
tables Initial_CA125_Cat new_stage Grade white Delta_OS;
format new_stage stage. white white. Delta_OS delta.;
run;

*checking the functional form of continuous covariates;
*Martingale residuals from the null model;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=/rl;
output out=res_null resmart=mart resdev=dev;
run;
title 'Martingale residuals (null model) vs. BMI';
proc sgplot data=res_null;
loess y=mart x=BMI;
run;
title 'Martingale residuals (null model) vs. age at diagnosis';
proc sgplot data=res_null;
loess y=mart x=age_dx;
run;
title 'Martingale residuals (null model) vs. Platelet count';
proc sgplot data=res_null;
loess y=mart x=Plt_count;
run;
title 'Martingale residuals (null model) vs. White Blood Cell Count';
proc sgplot data=res_null;
loess y=mart x=WBC;
run;

*Univariate Analysis;
*BMI;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=BMI/rl;
assess var=(BMI)/seed=12345 resample;
run;
*univariate significance- p=0.205 -not Significant at univariate level;
*p=0.7100, functional form is appropriate;

***check PH assumption for BMI;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=BMI/rl;
output out=out ressch=ressch_BMI;
run;
proc sgplot data=out;
scatter y=ressch_BMI x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=BMI/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.2640;

***Final unadjusted model for BMI;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=BMI/rl;;
run;
*p=0.2045-not significant;

*repeat above code for age_dx, Plt_count, WBC;
*Age_dx;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=age_dx/rl;
assess var=(age_dx)/seed=12345 resample;
output out=res_age resmart=mart resdev=dev;
run;
*univariate significance- p=0.0004 -Significant at univariate level;
*p=0.841, functional form is appropriate;

***check PH assumption for age;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=age_dx/rl;
output out=out ressch=ressch_age_dx;
run;
proc sgplot data=out;
scatter y=ressch_age_dx x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=age_dx/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.1250;

***Final unadjusted model for age;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=age_dx/rl;;
run;
*p=0.0.0004;

*Plt_count;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=Plt_count/rl;
assess var=(Plt_count)/seed=12345 resample;
output out=res_Plt_count resmart=mart resdev=dev;
run;
*univariate significance- p=0.0049 -Significant at univariate level;
*p=0.2170, functional form is appropriate;

***check PH assumption for Plt_count;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=Plt_count/rl;
output out=out ressch=ressch_Plt_count;
run;
proc sgplot data=out;
scatter y=ressch_Plt_count x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=Plt_count/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.9200;

***Final unadjusted model for Plt_count;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=Plt_count/rl;;
run;
*p=0.0049;

*WBC;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=WBC/rl;
assess var=(WBC)/seed=12345 resample;
output out=res_WBC resmart=mart resdev=dev;
run;
*univariate significance- p=0.0956 -Significant at univariate level;
*p=0.3520, functional form is appropriate;

***check PH assumption for WBC;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=WBC/rl;
output out=out ressch=ressch_WBC;
run;
proc sgplot data=out;
scatter y=ressch_WBC x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=WBC/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.0800;


***Final unadjusted model for WBC;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=WBC/rl;;
run;
*p=0.0049;

*Initial_CA125_Cat ;
*Do I need to use class statement or not?;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=Initial_CA125_Cat/rl;
run;
*-2log liklihood ratio statistic : 1799.745;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=Initial_CA125_Cat/rl;
run;
*-2log liklihood ratio statistic : 1788.105;
*Liklihood ratio test;
data lrt; 
y=sdf('CHISQ',11.64, 2);
run;
*p=0.0029676051;
*significantly different, must use as categorical;

***check PH assumption for Initial_CA125_Cat;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=Initial_CA125_Cat/rl;
output out=out ressch=ressch_Initial_CA125_Cat;
run;
proc sgplot data=out;
scatter y=ressch_Initial_CA125_Cat x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=Initial_CA125_Cat/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.6090, p=0.2330, p=0.7790;

***Final unadjusted model for Initial_CA125_Cat;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=Initial_CA125_Cat/rl;;
run;

*Do I need to use class statement or not?;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=new_stage/rl;
run;
*-2log liklihood ratio statistic : 1759.303;
proc phreg data=ovarian_b;
class new_stage(ref='1');
model OS*Delta_OS(0)=new_stage/rl;
run;
*-2log liklihood ratio statistic : 1758.268;
*Liklihood ratio test;
data lrt; 
y=sdf('CHISQ',1.035, 2);
run;
*p=0.5960087088;
*not significantly different, use as continuous -no class statement needed;

***check PH assumption for new_stage;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=new_stage/rl;
output out=out ressch=ressch_new_stage;
run;
proc sgplot data=out;
scatter y=ressch_new_stage x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=new_stage/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.4680;

***Final unadjusted model for new_stage;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=new_stage/rl;;
run;
*p=<.0001;

*Do I need to use class statement or not?;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=grade/rl;
run;
*-2log liklihood ratio statistic : 1833.875;
proc phreg data=ovarian_b;
class grade(ref='1');
model OS*Delta_OS(0)=grade/rl;
run;
*-2log liklihood ratio statistic : 1833.335;
*Liklihood ratio test;
data lrt; 
y=sdf('CHISQ',0.54, 2);
run;
*p=0.7633794943;
*not significantly different, use as continuous -no class statement needed;

***check PH assumption for grade;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=grade/rl;
output out=out ressch=ressch_grade;
run;
proc sgplot data=out;
scatter y=ressch_grade x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=grade/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.4600;

***Final unadjusted model for grade;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=grade/rl;;
run;
*p=0.0045;

*Do I need to use class statement or not?;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=white/rl;
run;
*-2log liklihood ratio statistic : 1841.743;
proc phreg data=ovarian_b;
class white(ref='0');
model OS*Delta_OS(0)=white/rl;
run;
*-2log liklihood ratio statistic : 1841.743;
*Liklihood ratio test;
data lrt; 
y=sdf('CHISQ',0, 2);
run;
*p=1.0;
*not significantly different, use as continuous -no class statement needed;

***check PH assumption for white;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=white/rl;
output out=out ressch=ressch_white;
run;
proc sgplot data=out;
scatter y=ressch_white x=OS;
refline 0/axis=y;
title ' ';
run;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=white/rl;
assess ph/seed=12345 resample;
run;
*supremum test for propotional hazards p=0.8010;

***Final unadjusted model for grade;
proc phreg data=ovarian_b;
model OS*Delta_OS(0)=white/rl;
run;
*p=0.5504-not significant at the univariate level;

*multivairate MAIN EFFECTS model (covariates with p < 0.15 from univariate analysis): age_dx, Plt_count, WBC, Initial_CA125_Cat (treat as 
																						categorical),new stage, grade;

 
*
1) Run cox regression models excluding one variate at a time and then plot the martingale residuals with variable excluded 
					as the x variable (see example below);
*Age_dx;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=Plt_count WBC Initial_CA125_Cat new_stage grade/rl;
output out=ex_age_dx resmart=mart;
run;
title 'excluded age_dx';
proc sgplot data=ex_age_dx;
loess y=mart x=age_dx;
run;

*Plt_count; 
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx WBC Initial_CA125_Cat new_stage grade/rl;
output out=ex_Plt_count resmart=mart;
run;
title 'excluded Plt_count';
proc sgplot data=ex_Plt_count;
loess y=mart x=Plt_count;
run;

*WBC;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Plt_count Initial_CA125_Cat new_stage grade/rl;
output out=ex_WBC resmart=mart resdev=dev dfbeta=db_WBC;
run;
title 'excluded WBC';
proc sgplot data=ex_WBC;
loess y=mart x=WBC;
run;
*only plot that did not look okay but this because the loess smooth, the points themselves are still scattered pretty evenly around the null value;
*check for outliers and influential points;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Plt_count WBC Initial_CA125_Cat new_stage grade/rl;
output out=out_WBC resmart=mart resdev=dev dfbeta=db_WBC;
run;
*do not think functional form is inappropriate, but is ther outliers?;
title 'excluded WBC';
proc sgplot data=out_WBC;
loess y=dev x=WBC;
run;
*check for influenctial points;
proc sgplot data=out_WBC;
scatter y=db_WBC x=WBC;   *SE for age_dx is 0.01867. Thus no influential points;
refline 0/axis=y;
title ' ';
run;

*2)Formally test the functional form in the adjusted model.;
*full multivariate model wiht all significant variables from univariate;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Plt_count WBC Initial_CA125_Cat new_stage grade/rl;
assess var=(age_dx Plt_count WBC)/seed=12345 resample;
run;
*all p-values >0.05, functional form appropriate;
*now test for final model;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage/rl;
assess var=(age_dx)/seed=12345 resample;
run;

*3)Now trim down main effects model to get multivariate model with only significant effects remaining;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Plt_count WBC Initial_CA125_Cat new_stage grade/rl;
run;
*Plt_count highest p-value, remove;
*2LogL-1708.906;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx WBC Initial_CA125_Cat new_stage grade/rl;
run;
*Grade highest p-value, remove;
*2LogL-1710.214;
data lrt; 
y=sdf('CHISQ',1.298, 1);
run;
*p=0.25;
*select simpler model;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx WBC Initial_CA125_Cat new_stage/rl;
run;
*WBC p-value >0.05, remove;
*2LogL-1712.117;
data lrt; 
y=sdf('CHISQ',1.903, 1);
run;
*p=0.17;
*select simpler model;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage/rl;
run;
*all factors significant;
*2LogL-1714.783;
data lrt; 
y=sdf('CHISQ',2.666, 1);
run;
*p=0.10;
*all factors significant;

*check if machine selects the same model;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=BMI age_dx Plt_count WBC Initial_CA125_Cat new_stage grade white/selection=backward rl;
output out=ex_age_dx resmart=mart;
run;
*same model selected with age_dx, Initial_CA125, and new_stage;

*4)Then test for interaction for final multivariate model of significant effects;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage age_dx*Initial_CA125_Cat age_dx*new_stage Initial_CA125_Cat*new_stage/rl;
run;
*no significant interaction;
*-2LogL-1701.582;

*Check if machine selection is same as manual selection;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage age_dx*Initial_CA125_Cat age_dx*new_stage Initial_CA125_Cat*new_stage/selection=backward rl;
run;
*concluded no interaction present;

*Final model selected is with no interaction and main effects of age_dx, Initial_CA125_Cat, and new_stage;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage/rl;
run;
*-2LogL-1714.783;
*LR-13.248, df=12-5=7;
data lrt; 
y=sdf('CHISQ',13.248, 7);
run;
*p=0.07;

*5)Check the proportional hazards assumption of the final model with plots of Schoenfeld residuals and formally with 
	assess PH/seed=12345 resample as seen in the univariate models above;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage/rl;
output out=out resdev=dev xbeta=linpred
dfbeta=db_age_dx db_Initial_CA125_Cat db_new_stage ressch=ressch_age_dx ressch_Initial_CA125_Cat ressch_new_stage;
assess ph/seed=12345 resample;
run;
*all p-value >0.05, proportional hazards assumption appropriate;

*now plot schoenfeld residuals for each covariate against survival time;
"Schoenfeld residual for age_dx vs overall survival";
proc sgplot data=out;
scatter y=ressch_age_dx x=OS;
refline 0/axis=y;
title ' ';
run;
"Schoenfeld residual for Initial_CA125_Cat vs overall survival";
proc sgplot data=out;
scatter y=ressch_Initial_CA125_Cat x=OS;
refline 0/axis=y;
title ' ';
run;
"Schoenfeld residual for New Stage vs overall survival";
proc sgplot data=out;
scatter y=ressch_new_stage x=OS;
refline 0/axis=y;
yaxis label="Schenfeld residual for new_stage";
title ' ';
run;

*6)/*now we check outliers*/
*--plot deviance residuals (full model) by linear predictor (xbeta)--; 
title 'Deviance Residuals vs. Linear Predictor';
proc sgplot data=out;
scatter x=linpred y=dev;   *no extreme outliers;
refline 0/axis=y;
run;


*7)/*now we check influential points*/
*--identify influential observations--;
/*plot delta betas against each predictor*/ 
proc sgplot data=out;
scatter y=dev x=age_dx;    *again, no extreme outliers;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=dev x=Initial_CA125_Cat;    *again, no extreme outliers;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=dev x=new_stage;    *again, no extreme outliers;
refline 0/axis=y;
title ' ';
run;

*Delta beta values should not be greater than the absolute value of the standard error for each covariate parameter);
*SE (age_dx)=0.00725;
*SE (Initial_CA125_Cat(1 v 0)=0.28348;
*SE (Initial_CA125_Cat(2 v 0)=0.27526;
*SE (Initial_CA125_Cat(3 v 0)=0.27993;
*SE (new_stage)=0.13999;
title 'Delta-Beta (full model) by each covariate';
proc sgplot data=out;
scatter y=db_age_dx x=age_dx;   *SE for age_dx is 0.00725. Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_Initial_CA125_Cat x=Initial_CA125_Cat;     *SE (Initial_CA125_Cat(1 v 0)=0.28348;
														*SE (Initial_CA125_Cat(2 v 0)=0.27526;
														*SE (Initial_CA125_Cat(3 v 0)=0.27993. 
													Thus no influential points;
refline 0/axis=y;
title ' ';
run;
proc sgplot data=out;
scatter y=db_new_stage x=new_stage;   *SE for new_stage is 0.13999. Thus no influential points;
refline 0/axis=y;
title ' ';
yaxis label="Difference in the parameter for new_stage";
run;


*Final model in summary;
proc phreg data=ovarian_b;
class Initial_CA125_Cat(ref='0');
model OS*Delta_OS(0)=age_dx Initial_CA125_Cat new_stage/rl;
run;
