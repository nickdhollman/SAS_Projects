options obs=100; /* cap input rows for the captured run */

/* Mock stand-in for the Evans County cohort (final.evans in the original
   script). Same three binary columns the script reads: CHD (outcome),
   ECG, HTN. Sorted by ECG since the script's final model runs
   "by ECG;" and PROC LOGISTIC/BY requires pre-sorted input. */
data evans;
  input CHD ECG HTN @@;
  datalines;
0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 1  0 0 1
0 0 1  0 0 1  0 0 1  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0
1 0 0  1 0 0  1 0 0  1 0 1  1 0 1  1 0 1  1 0 1  1 0 0  1 0 0  1 0 1
0 0 0  0 0 0  0 0 0  0 0 1  0 0 0  0 0 0  0 0 0  0 0 1  0 0 0  0 0 0
1 1 0  1 1 0  1 1 0  1 1 1  1 1 1  1 1 1  1 1 1  1 1 1  1 1 0  1 1 0
1 1 1  1 1 1  1 1 1  1 1 1  1 1 0  1 1 0  1 1 1  1 1 1  1 1 0  1 1 1
0 1 0  0 1 0  0 1 0  0 1 1  0 1 1  0 1 0  0 1 0  0 1 1  0 1 0  0 1 0
0 1 1  0 1 0  0 1 1  0 1 0  0 1 0  0 1 1  0 1 0  0 1 0  0 1 1  0 1 0
;
run;
