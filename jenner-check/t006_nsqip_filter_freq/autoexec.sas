options obs=100; /* cap input rows for the captured run */

/* Mock stand-in for NSQIP_.panniculectomy_new (the original script's
   LIBNAME NSQIP_ 'filepath\SAS Datasets_share'). Columns match what the
   script reads: OperYR, the ten OTHERCPT/CONCPT slots checked for
   abdominoplasty code 15847, ELECTSURG, prsepis, bmi and Age (read as a
   character field, matching the script's own input(Age, 4.) numeric
   conversion). */
data panniculectomy;
  length ELECTSURG $3 prsepis $10 Age $4
         OTHERCPT1-OTHERCPT10 CONCPT1-CONCPT10 $8;
  array oc{10} OTHERCPT1-OTHERCPT10;
  array cc{10} CONCPT1-CONCPT10;
  input OperYR ELECTSURG $ prsepis $ bmi Age $ AbdCode $;
  do i = 1 to 10;
    oc{i} = ' ';
    cc{i} = ' ';
  end;
  if AbdCode = 'Y' then OTHERCPT1 = '15847';
  drop AbdCode i;
  datalines;
2013 Yes  None 28.4 45 N
2014 Yes  None 31.2 52 Y
2015 Yes  None 26.8 39 N
2016 No   None 33.9 61 N
2017 Yes  Null 29.5 58 Y
2018 Yes  None 35.1 72 N
2019 Yes  SIRS 27.7 66 N
2020 Yes  None 24.9 48 N
2012 Yes  None 30.4 75 Y
2021 Yes  None 32.0 55 N
2013 Yes  None 22.1 41 N
2014 Yes  None 34.4 68 Y
2015 No   None 29.9 33 N
2016 Yes  None 31.5 70 N
2017 Yes  None 26.3 44 N
2018 Yes  Null 28.9 63 Y
2019 Yes  None 33.3 59 N
2020 Yes  None 27.0 71 N
2021 Yes  None 25.5 36 N
2012 Yes  None 30.9 49 N
;
run;
