libname exam1 "filepath\Exam 1";

data cheese; set exam1.cheese;
run;

*run individual simple linear regression to show association of the 3 chemicals with taste;

*prediction w/ loess-lactic acid;
proc loess data=cheese;
  model taste=lacticacid /smooth=0.5 all; /* default settings */
  ods output OutputStatistics=myout1;
  run;
quit;

*THIS IS THE GRAPH SHE WANTED ON #2; *BUT... You need to run code above first to create myout dataset;
proc sort data=myout1;
  by lacticacid;
run;
goptions ftext=swissb htext=1.5;
axis1 label=(a=90 "Taste") value=(h=1) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Lactic acid (mg/L)") minor=none offset=(1 cm);
symbol1 v=dot h=.8 cv=green i=rl c=red line=2 width=4;
symbol2 c=blue i=join v=none h=1 width=4;
proc gplot data=myout1;
  plot DepVar*lacticacid=1 Pred*lacticacid=2 /overlay haxis=axis2 vaxis=axis1;
run;
quit;

*graph with predictions, graph with prediction equation and proc reg, loess plot seperate-lactic acid;
goptions ftext=swissb htext=1.2;
title "Taste by Lactic Acid";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Lactic acid(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot taste*lacticacid / vaxis=axis1 haxis=axis2;
proc reg data=cheese; 
model taste = lacticacid /clb ; 
plot taste*lacticacid;
run;
goptions reset=all;
ods graphics on;
proc sgplot data=cheese noautolegend;
   title 'Loess Plot-Taste by Lactic Acid';
   loess y=Taste x=Lacticacid;
run;
ods graphics off;

*prediction w/ loess-acetic acid;
proc loess data=cheese;
  model taste=aceticacid /smooth=0.5 all; /* default settings */
  ods output OutputStatistics=myout1;
  run;
quit;
proc sort data=myout1;
  by aceticacid;
run;
goptions ftext=swissb htext=1.5;
axis1 label=(a=90 "Taste") value=(h=1) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Acetic acid (mg/L)") minor=none offset=(1 cm);
symbol1 v=dot h=.8 cv=green i=rl c=red line=2 width=4;
symbol2 c=blue i=join v=none h=1 width=4;
proc gplot data=myout1;
  plot DepVar*aceticacid=1 Pred*aceticacid=2 /overlay haxis=axis2 vaxis=axis1;
run;
quit;

*graph with predictions, graph with prediction equation and proc reg, loess plot seperate-acetic acid;
goptions ftext=swissb htext=1.2;
title "Taste by Acetic Acid";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Acetic acid(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot data=cheese;
  plot taste*aceticacid / vaxis=axis1 haxis=axis2;
  run;
proc reg data=cheese; 
model taste = aceticacid /clb; 
plot taste*aceticacid;
run;
goptions reset=all;
ods graphics on;
proc sgplot data=cheese noautolegend;
   title 'Loess Plot-Taste by Acetic Acid';
   loess y=Taste x=aceticacid;
run;
ods graphics off;

*prediction w/ loess-hsulfide;
proc loess data=cheese;
  model taste=hsulfide /smooth=0.5 all; /* default settings */
  ods output OutputStatistics=myout1;
  run;
quit;
proc sort data=myout1;
  by hsulfide;
run;
goptions ftext=swissb htext=1.5;
axis1 label=(a=90 "Taste") value=(h=1) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Hydrogen Sulfide (mg/L)") minor=none offset=(1 cm);
symbol1 v=dot h=.8 cv=green i=rl c=red line=2 width=4;
symbol2 c=blue i=join v=none h=1 width=4;
proc gplot data=myout1;
  plot DepVar*hsulfide=1 Pred*hsulfide=2 /overlay haxis=axis2 vaxis=axis1;
run;
quit;

*scatter plot, graph with prediction equation and proc reg, loess plot seperate-hsulfid;
goptions ftext=swissb htext=1.2;
title "Taste by Hydrogen Sulfide";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Hydrogen Sulfide(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot data=cheese;
  plot taste*hsulfide / vaxis=axis1 haxis=axis2;
  run;
proc reg data=cheese; 
model taste = hsulfide/clb ; 
plot taste*hsulfide;
run;
proc sgplot data=cheese noautolegend;
   title 'Loess Plot-Taste by Hydrogen Sulfide';
   loess y=Taste x=hsulfide;
run;
ods graphics off;

*quadratic model betwen taste and lactic acid;
data cheese_b; set cheese;
sqrtlactic = sqrt(lacticacid);
run;
proc loess data=cheese_b;
  model taste=sqrtlactic /smooth=0.5 all; /* default settings */
  ods output OutputStatistics=myout1;
  run;
quit;
proc sort data=myout1;
  by sqrtlactic;
run;
goptions ftext=swissb htext=1.5;
axis1 label=(a=90 "Taste") value=(h=1) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Sqrt Lactic acid (mg/L)") minor=none offset=(1 cm);
symbol1 v=dot h=.8 cv=green i=rl c=red line=2 width=4;
symbol2 c=blue i=join v=none h=1 width=4;
proc gplot data=myout1;
  plot DepVar*sqrtlactic=1 Pred*sqrtlactic=2 /overlay haxis=axis2 vaxis=axis1;
run;
quit;

goptions ftext=swissb htext=1.2;
title "Taste by Quadratic Lactic Acid";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Lactic acid(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot data=cheese_b;
  plot taste*sqrtlactic / vaxis=axis1 haxis=axis2;
proc reg data=cheese_b; 
model taste = lacticacid sqrtlactic /clb ; 
plot taste*sqrtlactic;
run;
goptions reset=all;
ods graphics on;
proc sgplot data=cheese_b noautolegend;
   title 'Loess Plot-Taste by Quadratic Lactic Acid';
   loess y=Taste x=sqrtlactic;
run;
ods graphics off;
*Assess if quadratic model fit from R-square, Mean squared error;

*quadratic model betwen taste and acetic acid;
data cheese_c; set cheese;
sqrtacetic = sqrt(aceticacid);
run;
proc loess data=cheese_c;
  model taste=sqrtacetic /smooth=0.5 all; /* default settings */
  ods output OutputStatistics=myout1;
  run;
quit;
proc sort data=myout1;
  by sqrtacetic;
run;
goptions ftext=swissb htext=1.5;
axis1 label=(a=90 "Taste") value=(h=1) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Sqrt Acetic acid (mg/L)") minor=none offset=(1 cm);
symbol1 v=dot h=.8 cv=green i=rl c=red line=2 width=4;
symbol2 c=blue i=join v=none h=1 width=4;
proc gplot data=myout1;
  plot DepVar*sqrtacetic=1 Pred*sqrtacetic=2 /overlay haxis=axis2 vaxis=axis1;
run;
quit;

goptions ftext=swissb htext=1.2;
title "Taste by Quadratic Acetic Acid";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("Acetic acid(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot taste*sqrtacetic / vaxis=axis1 haxis=axis2;
proc reg data=cheese_c; 
model taste = aceticacid sqrtacetic /clb ; 
plot taste*sqrtacetic;
run;
goptions reset=all;
ods graphics on;
proc sgplot data=cheese_c noautolegend;
   title 'Loess Plot-Taste by Quadratic Acetic Acid';
   loess y=Taste x=sqrtacetic;
run;
ods graphics off;
*Assess if quadratic model fit from R-square, Mean squared error;

*Initial model of taste and hydrogen sulfide nonlinear, do square root and natural log transformations 
and see if this is corrected;
*NATURAL LOG TRANSFORMATION-TASTE;
data cheese_ln; set cheese;
lntaste = log(taste);
run;
goptions ftext=swissb htext=1.2;
title "ln Taste by Hydrogen Sulfide";
axis1 label=(a=90) value=(h=.8) order=(-1 to 6 by 1) minor=(n=1) ;
axis2 label=("Hydrogen Sulfide(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot lntaste*hsulfide / vaxis=axis1 haxis=axis2;
proc reg data=cheese_ln; 
model lntaste = hsulfide /clb ; 
plot lntaste*hsulfide;
run;
ods graphics on;
proc sgplot data=cheese_ln noautolegend;
   title 'Loess Plot-ln Taste by Hydrogen Sulfide';
   loess y=lnTaste x=hsulfide;
run;
ods graphics off;
*NATURAL LOG TRANSFORMATION-HSULFIDE;
data cheese_ln_; set cheese;
lnhsulfide = log(hsulfide);
run;
goptions ftext=swissb htext=1.2;
title "Taste by ln Hydrogen Sulfide";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("ln Hydrogen Sulfide(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot taste*lnhsulfide / vaxis=axis1 haxis=axis2;
proc reg data=cheese_ln_; 
model taste = lnhsulfide hsulfide /clb ; 
plot taste*lnhsulfide;
run;
ods graphics on;
proc sgplot data=cheese_ln_ noautolegend;
   title 'Loess Plot-Taste by ln Hydrogen Sulfide';
   loess y=Taste x=lnhsulfide;
run;

*SQUARE ROOT TRANSFORMATION-TASTE;
data cheese_d; set cheese;
sqrttaste= sqrt (taste);
run;
goptions ftext=swissb htext=1.2;
title "Sqrt Taste by Hydrogen Sulfide";
axis1 label=(a=90) value=(h=.8) order=(0 to 9 by 1) minor=(n=1) ;
axis2 label=("Hydrogen Sulfide(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot sqrttaste*hsulfide / vaxis=axis1 haxis=axis2;
proc reg data=cheese_d; 
model sqrttaste = hsulfide /clb ; 
plot sqrttaste*hsulfide;
run;
ods graphics on;
proc sgplot data=cheese_d noautolegend;
   title 'Loess Plot-Sqrt Taste by Hydrogen Sulfide';
   loess y=sqrtTaste x=hsulfide;
run;
ods graphics off;
*SQUARE ROOT TRANSFORMATION-HSULFIDE;
data cheese_d_; set cheese;
sqrthsulfide= sqrt (hsulfide);
run;
goptions ftext=swissb htext=1.2;
title "Taste by sqrt Hydrogen Sulfide";
axis1 label=(a=90) value=(h=.8) order=(0 to 60 by 10) minor=(n=1) ;
axis2 label=("sqrt Hydrogen Sulfide(mg/L)") minor=none offset=(1 cm);
symbol v=dot h=.8 cv=green ;
proc gplot;
  plot taste*sqrthsulfide / vaxis=axis1 haxis=axis2;
proc reg data=cheese_d_; 
model taste = sqrthsulfide /clb ; 
plot taste*sqrthsulfide;
run;
ods graphics on;
proc sgplot data=cheese_d_ noautolegend;
   title 'Loess Plot-Taste by sqrt Hydrogen Sulfide';
   loess y=Taste x=sqrthsulfide;
run;
ods graphics off;
goptions reset=all;

*multiple linear regression;
data cheese_i; set cheese;
lnhsulfide= log (hsulfide);
lactic_acetic= lacticacid*aceticacid;
lactic_lnhsulfide= lacticacid*lnhsulfide;
acetic_lnhsulfide= aceticacid*lnhsulfide;
sqrttaste= sqrt (taste);
lntaste= log (taste);
run;

*no interaction terms;
proc reg data=cheese_i; 
model taste = lacticacid aceticacid lnhsulfide /clb ; 
run;

*with interaction terms;
proc reg data=cheese_i; 
model taste = lacticacid aceticacid lnhsulfide lactic_acetic lactic_lnhsulfide acetic_lnhsulfide /clb ; 
run;
*no interaction terms significant;

*determine if transformation is needed;
proc reg data=cheese_i; 
model taste = lacticacid aceticacid lnhsulfide lactic_acetic lactic_lnhsulfide acetic_lnhsulfide /clb ; 
output out=resid residual=residual predicted=predicted student=student rstudent=jackknife;
run;
quit;

title "model fit plots";
proc gplot data=resid;
  plot jackknife*predicted / vref=0;
  plot jackknife*taste / vref=0;
  plot jackknife*lacticacid / vref=0;
  plot jackknife*aceticacid / vref=0;
  plot jackknife*lnhsulfide / vref=0;
  plot jackknife*predicted / vref=0;
run;
proc univariate data=resid; var jackknife ;
qqplot jackknife / normal(mu=0 sigma=1) ; run;
*Does not seem to violate assumption of normality except one outlier;

*SAS model selection;
proc reg data=cheese_i; 
model taste = lacticacid aceticacid lnhsulfide lactic_acetic lactic_lnhsulfide acetic_lnhsulfide /clb selection=backward SLSTAY= 0.05;
run;
*resulting model has aceticacid, lnhsulfide, and lactic_acetic coefficient;
proc reg data=cheese_i; 
model taste = aceticacid lnhsulfide lactic_acetic  /clb;
run;
*same results through manual removal of terms by highest p-value;
*evidence of interaction between acetic acid and lactic acid, no need to test for confounding;

********FINAL MODEL******;
proc reg data=cheese_i; 
model taste = aceticacid lnhsulfide lactic_acetic  /clb;
run;

*test final model model fit;
proc reg data=cheese_i; 
model taste = aceticacid lnhsulfide lactic_acetic  /clb;
output out=resid residual=residual predicted=predicted student=student rstudent=jackknife;
run;
quit;

title "model fit plots";
proc gplot data=resid;
  plot jackknife*predicted / vref=0;
  plot jackknife*taste / vref=0;
  plot jackknife*aceticacid / vref=0;
  plot jackknife*lnhsulfide / vref=0;
  plot jackknife*lactic_acetic / vref=0;
  plot jackknife*predicted / vref=0;
run;
proc univariate data=resid; var jackknife ;
qqplot jackknife / normal(mu=0 sigma=1) ; run;

*does this make sense graphically;
symbol v=square c=red;
proc gplot data=cheese_i;
plot aceticacid*lacticacid;
run;
quit;
*these do seem to have a correlation, interaction term makes sense;
goptions reset=all;
