options obs=100; /* cap input rows for the captured run */

/* Mock stand-in for the CA125-in-ovary-cancer cohort (originally
   imported from filepath\CA125 in Ovary Cancer.xlsx). Same columns the
   script reads: Patient, Stage (sub-stage codes 10/11/12=IA-IC,
   20/21/22=IIA-IIC, 30/31/32=IIIA-IIIC, 40=IV), Initial_CA125, BMI,
   Grade, Plt_count, WBC, age_dx, white, OS (overall survival months),
   Delta_OS (0=censored 1=dead). CA125 values are spread around the
   original script's own reported quartile breakpoints (Q1=61,
   median=262, Q3=940) so the derived quartile categories are populated. */
data ovarian;
  input Patient Stage Initial_CA125 BMI Grade Plt_count WBC age_dx white OS Delta_OS;
  datalines;
1  10 35   24.1 1 210 6.1 52 1 41 0
2  11 58   27.8 1 195 5.4 61 1 33 1
3  12 60   22.5 2 240 7.2 47 0 55 0
4  20 120  31.0 2 260 8.1 58 1 22 1
5  21 180  28.4 2 205 6.8 63 1 18 1
6  22 250  26.9 2 300 9.0 44 1 60 0
7  30 300  25.2 3 190 5.9 66 0 14 1
8  31 400  33.6 3 275 7.7 55 1 9  1
9  32 620  29.9 3 220 8.4 71 1 7  1
10 40 950  30.5 4 310 10.2 68 0 5  1
11 40 1200 27.1 4 260 9.5 59 1 3  1
12 10 45   23.0 1 200 5.7 39 1 70 0
13 21 200  26.0 2 230 6.9 50 1 25 0
14 31 700  28.8 3 250 8.9 62 1 11 1
15 40 1500 31.9 4 290 11.0 74 1 4  1
16 11 55   24.7 1 215 6.0 43 0 65 0
17 22 260  27.5 2 240 7.5 57 1 20 1
18 30 320  25.9 3 205 6.4 60 1 16 0
19 12 65   22.9 2 195 5.6 48 1 48 0
20 32 940  29.0 3 265 8.6 64 0 8  1
;
run;
