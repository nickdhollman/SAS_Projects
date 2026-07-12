/* Adapted from LinearRegression_midterm_biostat_2_.sas
   (nickdhollman/SAS_Projects) -- the multiple-linear-regression section
   of the cheddar cheese taste analysis. The original read the cheese
   dataset from LIBNAME exam1 "filepath\Exam 1" (exam1.cheese); here the
   same four columns (taste, lacticacid, aceticacid, hsulfide) are
   supplied inline. The derived-variable DATA step and the "no
   interaction terms" / "with interaction terms" / final PROC REG models
   with CLB confidence limits are unchanged. */

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

********FINAL MODEL******;
proc reg data=cheese_i;
model taste = aceticacid lnhsulfide lactic_acetic  /clb;
run;
quit;
