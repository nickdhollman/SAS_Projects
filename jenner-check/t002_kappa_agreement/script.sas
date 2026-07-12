/* Extracted verbatim from Categorical_Data_Analysis_Final.sas
   (nickdhollman/SAS_Projects) -- the inter-rater agreement / kappa
   statistic block. Already self-contained via inline DATALINES in the
   original file; no data or logic substitution needed. */

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
