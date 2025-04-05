

libname test 'C:\Users\nhollman\Documents\SAS Datasets';


*must run all formats before running below statement to import master;

data work.nhats_master_s;
set test.nhats_master_s;
run;



************************* NHATS_Round_7_DBS_Read SAS FILE*****************************************;



proc format;

VALUE f_dresid
        -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R5 (FQ only)'
        8 = '8 Nursing home in R1 and R5 (FQ only)' ;

VALUE DBS001F
0 = '0 Cards Obtained'
1 = '1 Card Obtained'
2 = '2 Cards Obtained'
-1 = '-1 Inapplicable';

VALUE RFDK_YN
1 = ' 1 Yes'
2 = ' 2 No'
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBSF0MTH
1 = '1 January'
2 = '2 February'
3 = '3 March'
4 = '4 April'
5 = '5 May'
6 = '6 June'
7 = '7 July'
8 = '8 August'
9 = '9 September'
10 = '10 October'
11 = '11 November'
12 = '12 December'
-7 = '-7 RF'
-8 = '-8 DK'
 -1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBS002F
.338-10.000 = 'Values of direct_IL6 assay result reported to three decimals .338-10.000'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS003F
.853-116.000 = 'Values of pe_IL6 assay result reported to three decimals .853-116.000'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS004F
1 = '1 Value assigned to minimum or maximum'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBSF0YR
2018 = '2018'
2019 = '2019'
-7 = '-7 RF'
-8 = '-8 DK'
 -1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBS005F
1 = '1 Card 1'
2 = '2 Card 2'
3 = '3 Card 1 and Card 2'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS006F
4.2-13.4 = 'Values of Direct_A1c assay result reported to one decimal 4.2-13.4'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS007F
4.1-15.9 = 'Values of PE_A1c assay result reported to one decimal 4.1-15.9'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS012F
-1 = '-1 Inapplicable'
1 = '1 Batch 1'
2 = '2 Batch 2'
;
VALUE DBS016F
20-1585= 'Values of Direct_CMV assay result reported in whole numbers (no decimal) 20-1585'
-1 = '-1 Inapplicable'
-9 = '-9 No result';
VALUE DBS017F
43-2290= 'Values of PE_CMV assay result reported in whole numbers (no decimal) 43-2290'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS021F
0.075-4.998= 'Values of Direct_CRP assay result reported to three decimals 0.075-4.998'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS022F
0.106-19.662= 'Values of PE_CRP assay result reported to three decimals 0.106-19.662'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS026F
-1 = '-1 Inapplicable'
1 = '1 Yes'
2 = '2 Consented and no assay result obtained';

VALUE DBS027F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Below lower limit of detection (LLoD)'
3 = '3 Above analytical measurement range (AMR)'
;
VALUE DBS028F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Below lower limit of detection (LLoD)'
3 = '3 Above analytical measurement range (AMR)'
4 = '4 Issue during assay, no result'
;
VALUE DBS029F
-1 = '-1 Inapplicable'
1 = '1 Yes'
;
VALUE DBS040F
-1 ='-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Interfering peak, no result'
3 = '3 No A1c peak, no result'
4 = '4 %HbA1c adjusted due to false low level of HbS'
5 = '5 Bad chromatogram: area <1.5M, no result'
6 = '6 Bad chromatogram: aberrant A1c integration, no result'
7 = '7 HPLC instrument error, no result'
8 = '8 Non-A hemoglobin variant >60%; no result'
;
VALUE DBS061F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Above analytical measurement range (AMR), no result'
3 = '3 Equivocal, no result'
4 = '4 Negative, no result'
;
VALUE DBS074F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Issue during assay, no result'
3 = '3 Below lower limit of detection (LLoD), no result'
4 = '4 Below limit of quantification (LoQ); CV>20%'
5 = '5 Above analytical measurement range (AMR), no result'
6 = '6 Punch did not elute, no result'
;

VALUE DBS075F
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Ineligible'
-9 = '-9 Missing'
1 = "1 Eligible and consented"
2 = "2 Eligible and did not consent"
3 = "3 Ineligible, proxy respondent";

  VALUE DBS076F
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing'
1 = "1 SAMPLE PERSON (SP)"
2 = "2 PROXY"  ;

run;
Data NHATS_Round_7_DBS_File;


INFILE   "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\DBS\NHATS_Round_7_DBS_File.txt"
LRECL=1249 ;
inPUT
@1 spid 8.
@9 r7dresid 2.
@11 bc7dconsent 2.
@13 dbs7danyassay 2.
@15 dbs7dnumcards 2.
@17 dbs7card1mt 2.
@19 dbs7card2mt 2.
@21 dbs7directil6 6.3
@27 dbs7peil6 8.3
@35 dbs7dfillil6 2.
@37 dbs7cardrdil6 2.
@39 dbs7readdtmtil6 2.
@41 dbs7readdtyril6 4.
@45 dbs7directa1c 4.1
@49 dbs7pea1c 4.1
@53 dbs7cardrda1c 2.
@55 dbs7readdtmta1c 2.
@57 dbs7readdtyra1c 4.
@61 dbs7dbatcha1c 2.
@63 dbs7directcmv 4.
@67 dbs7pecmv 4.
@71 dbs7cardrdcmv 2.
@73 dbs7readdtmtcmv 2.
@75 dbs7readdtyrcmv 4.
@79 dbs7directhscrp 6.3
@85 dbs7pehscrp 6.3
@91 dbs7cardrdhscrp 2.
@93 dbs7readdtmthscrp 2.
@95 dbs7readdtyrhscrp 4.
@99 dbs7rnoteil6 2.
@101 dbs7anoteil6 2.
@103 dbs7blankil6 2.
@105 dbs7mdropsil6 2.
@107 dbs7smearil6 2.
@109 dbs7smallil6 2.
@111 dbs7notcircil6 2.
@113 dbs7overlapil6 2.
@115 dbs7contamil6 2.
@117 dbs7abcoloril6 2.
@119 dbs7qualityil6 2.
@121 dbs7outsideil6 2.
@123 dbs7noremil6 2.
@125 dbs7rnotea1c 2.
@127 dbs7intpeaka1c 2.
@129 dbs7nopeaka1c 2.
@131 dbs7adjusta1c 2.
@133 dbs7badinta1c 2.
@135 dbs7smareaa1c 2.
@137 dbs7aberranta1c 2.
@139 dbs7rampinga1c 2.
@141 dbs7instrmnta1c 2.
@143 dbs7nonhgvara1c 2.
@145 dbs7blanka1c 2.
@147 dbs7mdropsa1c 2.
@149 dbs7smeara1c 2.
@151 dbs7smalla1c 2.
@153 dbs7notcirca1c 2.
@155 dbs7overlapa1c 2.
@157 dbs7damagea1c 2.
@159 dbs7abcolora1c 2.
@161 dbs7qualitya1c 2.
@163 dbs7outsidea1c 2.
@165 dbs7norema1c 2.
@167 dbs7rnotecmv 2.
@169 dbs7anotecmv 2.
@171 dbs7blankcmv 2.
@173 dbs7mdropscmv 2.
@175 dbs7smearcmv 2.
@177 dbs7smallcmv 2.
@179 dbs7notcirccmv 2.
@181 dbs7overlapcmv 2.
@183 dbs7damagecmv 2.
@185 dbs7abcolorcmv 2.
@187 dbs7qualitycmv 2.
@189 dbs7outsidecmv 2.
@191 dbs7noremcmv 2.
@193 dbs7rnotehscrp 2.
@195 dbs7anotehscrp 2.
@197 dbs7blankhscrp 2.
@199 dbs7mdropshscrp 2.
@201 dbs7smearhscrp 2.
@203 dbs7smallhscrp 2.
@205 dbs7notcirchscrp 2.
@207 dbs7overlaphscrp 2.
@209 dbs7damagehscrp 2.
@211 dbs7abcolorhscrp 2.
@213 dbs7qualityhscrp 2.
@215 dbs7outsidehscrp 2.
@217 dbs7noremhscrp 2.

@219 w7varstrat 2.
@221 w7varunit 2.
@223 w7dbsfinwgt0 18.11
@241 w7dbsfinwgt1 18.11
@259 w7dbsfinwgt2 18.11
@277 w7dbsfinwgt3 18.11
@295 w7dbsfinwgt4 18.11
@313 w7dbsfinwgt5 18.11
@331 w7dbsfinwgt6 18.11
@349 w7dbsfinwgt7 18.11
@367 w7dbsfinwgt8 18.11
@385 w7dbsfinwgt9 18.11
@403 w7dbsfinwgt10 18.11
@421 w7dbsfinwgt11 18.11
@439 w7dbsfinwgt12 18.11
@457 w7dbsfinwgt13 18.11
@475 w7dbsfinwgt14 18.11
@493 w7dbsfinwgt15 18.11
@511 w7dbsfinwgt16 18.11
@529 w7dbsfinwgt17 18.11
@547 w7dbsfinwgt18 18.11
@565 w7dbsfinwgt19 18.11
@583 w7dbsfinwgt20 18.11
@601 w7dbsfinwgt21 18.11
@619 w7dbsfinwgt22 18.11
@637 w7dbsfinwgt23 18.11
@655 w7dbsfinwgt24 18.11
@673 w7dbsfinwgt25 18.11
@691 w7dbsfinwgt26 18.11
@709 w7dbsfinwgt27 18.11
@727 w7dbsfinwgt28 18.11
@745 w7dbsfinwgt29 18.11
@763 w7dbsfinwgt30 18.11
@781 w7dbsfinwgt31 18.11
@799 w7dbsfinwgt32 18.11
@817 w7dbsfinwgt33 18.11
@835 w7dbsfinwgt34 18.11
@853 w7dbsfinwgt35 18.11
@871 w7dbsfinwgt36 18.11
@889 w7dbsfinwgt37 18.11
@907 w7dbsfinwgt38 18.11
@925 w7dbsfinwgt39 18.11
@943 w7dbsfinwgt40 18.11
@961 w7dbsfinwgt41 18.11
@979 w7dbsfinwgt42 18.11
@997 w7dbsfinwgt43 18.11
@1015 w7dbsfinwgt44 18.11
@1033 w7dbsfinwgt45 18.11
@1051 w7dbsfinwgt46 18.11
@1069 w7dbsfinwgt47 18.11
@1087 w7dbsfinwgt48 18.11
@1105 w7dbsfinwgt49 18.11
@1123 w7dbsfinwgt50 18.11
@1141 w7dbsfinwgt51 18.11
@1159 w7dbsfinwgt52 18.11
@1177 w7dbsfinwgt53 18.11
@1195 w7dbsfinwgt54 18.11
@1213 w7dbsfinwgt55 18.11
@1231 w7dbsfinwgt56 18.11




 ;
format
           dbs7card1mt dbs7card2mt dbs7readdtmtil6 dbs7readdtmta1c dbs7readdtmtcmv dbs7readdtmthscrp DBSF0MTH.
           dbs7readdtyril6 dbs7readdtyra1c dbs7readdtyrcmv dbs7readdtyrhscrp DBSF0YR.
           dbs7dnumcards DBS001F.
           dbs7directil6 DBS002F.
           dbs7peil6 DBS003F.
           dbs7dfillil6 DBS004F.

           dbs7cardrdil6 dbs7cardrda1c dbs7cardrdcmv dbs7cardrdhscrp DBS005F.
           dbs7directa1c DBS006F.
           dbs7pea1c DBS007F.
           dbs7dbatcha1c DBS012F.
           dbs7directcmv DBS016F.
           dbs7pecmv  DBS017F.
           dbs7directhscrp DBS021F.
           dbs7pehscrp DBS022F.
           dbs7danyassay DBS026F.
           dbs7rnoteil6 DBS028F.
           dbs7anoteil6 DBS028F.
           dbs7blankil6 DBS029F.
           dbs7mdropsil6 DBS029F.
           dbs7smearil6 DBS029F.
           dbs7smallil6 DBS029F.
           dbs7notcircil6 DBS029F.
           dbs7overlapil6 DBS029F.
           dbs7contamil6 DBS029F.
           dbs7abcoloril6 DBS029F.
           dbs7qualityil6 DBS029F.
           dbs7outsideil6 DBS029F.
           dbs7noremil6 DBS029F.
           dbs7rnotea1c DBS040F.
           dbs7intpeaka1c DBS029F.
           dbs7nopeaka1c DBS029F.
           dbs7adjusta1c DBS029F.
           dbs7badinta1c DBS029F.
           dbs7smareaa1c DBS029F.
           dbs7aberranta1c DBS029F.
           dbs7rampinga1c DBS029F.
           dbs7instrmnta1c dbs7nonhgvara1c dbs7blanka1c dbs7mdropsa1c dbs7smeara1c dbs7smalla1c dbs7notcirca1c dbs7overlapa1c dbs7damagea1c DBS029F.
           dbs7abcolora1c dbs7qualitya1c dbs7outsidea1c dbs7norema1c dbs7blankcmv dbs7mdropscmv dbs7smearcmv dbs7smallcmv dbs7notcirccmv dbs7overlapcmv DBS029F.
           dbs7damagecmv dbs7abcolorcmv dbs7qualitycmv dbs7outsidecmv dbs7noremcmv dbs7blankhscrp dbs7mdropshscrp dbs7smearhscrp dbs7smallhscrp dbs7notcirchscrp dbs7overlaphscrp dbs7damagehscrp DBS029F.
           dbs7abcolorhscrp dbs7qualityhscrp dbs7outsidehscrp dbs7noremhscrp DBS029F.
           dbs7rnotecmv dbs7anotecmv DBS061F.
           dbs7rnotehscrp dbs7anotehscrp DBS074F.
           bc7dconsent DBS075F.
          r7dresid f_dresid.

;
label
spid="NHATS SAMPLED PERSON ID"
r7dresid="R7 D RESIDENTIAL CARE STATUS"
bc7dconsent="R7 D BC2 SP CONSENT BLOOD SPOT COLLECTION"
dbs7dnumcards="R7 D DBS NUMBER OF DBS CARDS OBTAINED"
dbs7card1mt = "R7 DBS MONTH DBS CARD 1 OBTAINED"
dbs7card2mt = "R7 DBS MONTH DBS CARD 2 OBTAINED"
dbs7directil6="R7 DBS DIRECT IL6 ANALYTE CONCENTRATION FROM DBS"
dbs7peil6    ="R7 DBS PLASMA-EQUIVALENT IL6 ANALYTE CONCENTRATION"
dbs7dfillil6 ="R7 D DBS VALUES ASSIGNED IL6"
dbs7readdtmtil6="R7 DBS READ DATE MONTH IL6"
dbs7readdtyril6="R7 DBS READ DATE YEAR IL6"
dbs7cardrdil6 ="R7 DBS CARD USED FOR ASSAY IL6"

dbs7directa1c ="R7 DBS DIRECT A1C ANALYTE CONCENTRATION FROM DBS"
dbs7pea1c     ="R7 DBS PLASMA-EQUIVALENT A1C ANALYTE CONCENTRATION"
dbs7dbatcha1c ="R7 D DBS BATCH 1 OR 2 A1C"
dbs7readdtmta1c="R7 DBS READ DATE MONTH A1C"
dbs7readdtyra1c="R7 DBS READ DATE YEAR A1C"
/*15*/
dbs7cardrda1c="R7 DBS CARD USED FOR ASSAY A1C"
dbs7directcmv="R7 DBS DIRECT CMV ANALYTE CONCENTRATION FROM DBS"
dbs7pecmv="R7 DBS PLASMA-EQUIVALENT CMV ANALYTE CONCENTRATION"
dbs7readdtmtcmv="R7 DBS READ DATE MONTH CMV"
dbs7readdtyrcmv="R7 DBS READ DATE YEAR CMV"
dbs7cardrdcmv="R7 DBS CARD USED FOR ASSAY CMV"
dbs7directhscrp="R7 DBS DIRECT HSCRP ANALYTE CONCENTRATION FROM DBS"
dbs7pehscrp ="R7 DBS PLASMA-EQUIVALENT HSCRP ANALYTE CONCENTRATION"
dbs7readdtmthscrp="R7 DBS READ DATE MONTH HSCRP"
dbs7readdtyrhscrp="R7 DBS READ DATE YEAR HSCRP"
/*25*/
dbs7cardrdhscrp="R7 DBS CARD USED FOR ASSAY HSCRP"
dbs7danyassay="R7 D DBS ANY ASSAY RESULT OBTAINED"
dbs7rnoteil6="R7 DBS RESULT NOTE IL6"
dbs7anoteil6="R7 DBS ASSAY NOTE IL6"
dbs7blankil6="R7 DBS BLANK PUNCH IL6"
dbs7mdropsil6="R7 DBS MULTIPLE DROPS IN DBS CIRCLE IL6"
dbs7smearil6="R7 DBS SMEARED DROPS IL6"
dbs7smallil6="R7 DBS SMALL SPOT, <80% IL6"
dbs7notcircil6="R7 DBS NON-CIRCULAR DBS IL6"
dbs7overlapil6="R7 DBS OVERLAPPING BLOOD SPOTS IL6"
/*35*/
dbs7contamil6="R7 DBS CONTAMINATED SAMPLE IL6"
dbs7abcoloril6="R7 DBS ABNORMAL COLOR IL6"
dbs7qualityil6="R7 DBS DOES NOT MEET QUALITY CRITERIA IL6"
dbs7outsideil6="R7 DBS DROP OUTSIDE PRINTED CIRCLE IL6"
dbs7noremil6="R7 DBS NO DBS REMAINS IL6"
dbs7rnotea1c="R7 DBS RESULT NOTE A1C"
dbs7intpeaka1c="R7 DBS INTERFERING PEAK A1C, NO RESULT"
dbs7nopeaka1c="R7 DBS NO A1C PEAK, NO RESULT"
dbs7adjusta1c='R7 DBS %HBA1C ADJUSTED DUE TO FALSE LOW LEVEL OF HBS'
dbs7badinta1c="R7 DBS BAD CHROMATOGRAM INTEGRATION >1.8MIN A1C"
/*45*/
dbs7smareaa1c="R7 DBS BAD CHROMATOGRAM AREA <1.5M A1C, NO RESULT"
dbs7aberranta1c="R7 DBS BAD CHROMAT ABERRANT A1C INTEGRATION, NO RESULT"
dbs7rampinga1c="R7 DBS RAMPING BASELINE A1C"
dbs7instrmnta1c="R7 DBS HPLC INSTRUMENT ERROR A1C, NO RESULT"
dbs7nonhgvara1c="R7 DBS NON-A HEMOGLOBIN VARIANT >60% A1C, NO RESULT"
dbs7blanka1c="R7 DBS BLANK PUNCH A1C"
dbs7mdropsa1c="R7 DBS MULTIPLE DROPS IN DBS CIRCLE A1C"
dbs7smeara1c="R7 DBS SMEARED DROPS A1C"
dbs7smalla1c="R7 DBS SMALL SPOT, <80% A1C"
dbs7notcirca1c="R7 DBS NON-CIRCULAR DBS A1C"
dbs7overlapa1c="R7 DBS OVERLAPPING BLOOD SPOTS A1C"
dbs7damagea1c="R7 DBS PHYSICAL DAMAGE TO SAMPLE A1C"
dbs7abcolora1c="R7 DBS ABNORMAL COLOR A1C"
dbs7qualitya1c="R7 DBS DOES NOT MEET QUALITY CRITERIA A1C, NO RESULT"
dbs7outsidea1c="R7 DBS DROP OUTSIDE PRINTED CIRCLE A1C"
dbs7norema1c="R7 DBS NO DBS REMAINS A1C"
/*61*/
dbs7rnotecmv="R7 DBS RESULT NOTE CMV"
dbs7anotecmv="R7 DBS ASSAY NOTE CMV"
dbs7blankcmv="R7 DBS BLANK PUNCH CMV"
dbs7mdropscmv="R7 DBS MULTIPLE DROPS IN DBS CIRCLE CMV"
dbs7smearcmv="R7 DBS SMEARED DROPS CMV"
dbs7smallcmv="R7 DBS SMALL SPOT, <80% CMV"
dbs7notcirccmv="R7 DBS NON-CIRCULAR DBS CMV"
dbs7overlapcmv="R7 DBS OVERLAPPING BLOOD SPOTS CMV"
dbs7damagecmv="R7 DBS PHYSICAL DAMAGE TO SAMPLE CMV"
dbs7abcolorcmv="R7 DBS ABNORMAL COLOR CMV"
dbs7qualitycmv="R7 DBS DOES NOT MEET QUALITY CRITERIA CMV"
dbs7outsidecmv="R7 DBS DROP OUTSIDE PRINTED CIRCLE CMV"
dbs7noremcmv="R7 DBS NO DBS REMAINS CMV"
dbs7rnotehscrp="R7 DBS RESULT NOTE HSCRP"
dbs7anotehscrp="R7 DBS ASSAY NOTE HSCRP"
/*76*/
dbs7blankhscrp="R7 DBS BLANK PUNCH HSCRP"
dbs7mdropshscrp="R7 DBS MULTIPLE DROPS IN DBS CIRCLE HSCRP"
dbs7smearhscrp="R7 DBS SMEARED DROPS HSCRP"
dbs7smallhscrp="R7 DBS SMALL SPOT, <80% HSCRP"
dbs7notcirchscrp="R7 DBS NON-CIRCULAR DBS HSCRP"
dbs7overlaphscrp="R7 DBS OVERLAPPING BLOOD SPOTS HSCRP"
dbs7damagehscrp="R7 DBS PHYSICAL DAMAGE TO SAMPLE HSCRP"
dbs7abcolorhscrp="R7 DBS ABNORMAL COLOR HSCRP"
dbs7qualityhscrp="R7 DBS DOES NOT MEET QUALITY CRITERIA HSCRP"
dbs7outsidehscrp="R7 DBS DROP OUTSIDE PRINTED CIRCLE HSCRP"
dbs7noremhscrp="R7 DBS NO DBS REMAINS HSCRP"


w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP"
w7dbsfinwgt1="R7 DBS FINAL WGT REP 1"
w7dbsfinwgt2="R7 DBS FINAL WGT REP 2"
w7dbsfinwgt3="R7 DBS FINAL WGT REP 3"
w7dbsfinwgt4="R7 DBS FINAL WGT REP 4"
w7dbsfinwgt5="R7 DBS FINAL WGT REP 5"
w7dbsfinwgt6="R7 DBS FINAL WGT REP 6"
w7dbsfinwgt7="R7 DBS FINAL WGT REP 7"
w7dbsfinwgt8="R7 DBS FINAL WGT REP 8"
w7dbsfinwgt9="R7 DBS FINAL WGT REP 9"
w7dbsfinwgt10="R7 DBS FINAL WGT REP 10"
w7dbsfinwgt11="R7 DBS FINAL WGT REP 11"
w7dbsfinwgt12="R7 DBS FINAL WGT REP 12"
w7dbsfinwgt13="R7 DBS FINAL WGT REP 13"
w7dbsfinwgt14="R7 DBS FINAL WGT REP 14"
w7dbsfinwgt15="R7 DBS FINAL WGT REP 15"
w7dbsfinwgt16="R7 DBS FINAL WGT REP 16"
w7dbsfinwgt17="R7 DBS FINAL WGT REP 17"
w7dbsfinwgt18="R7 DBS FINAL WGT REP 18"
w7dbsfinwgt19="R7 DBS FINAL WGT REP 19"
w7dbsfinwgt20="R7 DBS FINAL WGT REP 20"
w7dbsfinwgt21="R7 DBS FINAL WGT REP 21"
w7dbsfinwgt22="R7 DBS FINAL WGT REP 22"
w7dbsfinwgt23="R7 DBS FINAL WGT REP 23"
w7dbsfinwgt24="R7 DBS FINAL WGT REP 24"
w7dbsfinwgt25="R7 DBS FINAL WGT REP 25"
w7dbsfinwgt26="R7 DBS FINAL WGT REP 26"
w7dbsfinwgt27="R7 DBS FINAL WGT REP 27"
w7dbsfinwgt28="R7 DBS FINAL WGT REP 28"
w7dbsfinwgt29="R7 DBS FINAL WGT REP 29"
w7dbsfinwgt30="R7 DBS FINAL WGT REP 30"
w7dbsfinwgt31="R7 DBS FINAL WGT REP 31"
w7dbsfinwgt32="R7 DBS FINAL WGT REP 32"
w7dbsfinwgt33="R7 DBS FINAL WGT REP 33"
w7dbsfinwgt34="R7 DBS FINAL WGT REP 34"
w7dbsfinwgt35="R7 DBS FINAL WGT REP 35"
w7dbsfinwgt36="R7 DBS FINAL WGT REP 36"
w7dbsfinwgt37="R7 DBS FINAL WGT REP 37"
w7dbsfinwgt38="R7 DBS FINAL WGT REP 38"
w7dbsfinwgt39="R7 DBS FINAL WGT REP 39"
w7dbsfinwgt40="R7 DBS FINAL WGT REP 40"
w7dbsfinwgt41="R7 DBS FINAL WGT REP 41"
w7dbsfinwgt42="R7 DBS FINAL WGT REP 42"
w7dbsfinwgt43="R7 DBS FINAL WGT REP 43"
w7dbsfinwgt44="R7 DBS FINAL WGT REP 44"
w7dbsfinwgt45="R7 DBS FINAL WGT REP 45"
w7dbsfinwgt46="R7 DBS FINAL WGT REP 46"
w7dbsfinwgt47="R7 DBS FINAL WGT REP 47"
w7dbsfinwgt48="R7 DBS FINAL WGT REP 48"
w7dbsfinwgt49="R7 DBS FINAL WGT REP 49"
w7dbsfinwgt50="R7 DBS FINAL WGT REP 50"
w7dbsfinwgt51="R7 DBS FINAL WGT REP 51"
w7dbsfinwgt52="R7 DBS FINAL WGT REP 52"
w7dbsfinwgt53="R7 DBS FINAL WGT REP 53"
w7dbsfinwgt54="R7 DBS FINAL WGT REP 54"
w7dbsfinwgt55="R7 DBS FINAL WGT REP 55"
w7dbsfinwgt56="R7 DBS FINAL WGT REP 56"


;


run;

*w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP" ;

data nhats_dbs;
set nhats_round_7_dbs_file;
run;

proc freq data=nhats_dbs;
tables dbs7danyassay;
run;
*n=4648 with results obtained;



********************************************************  NHATS_Round_7_SP_Sen_Dem_Read SAS FILE *****************************************;

/* NHATS_Round_7_SP_Sen_Dem_Read.SAS */

/* Section #1 - Creating the Formats */


PROC FORMAT ;
    VALUE RFDK_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
    VALUE RFDK_F
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
          VALUE W200038W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"  ;
          VALUE SP50139S
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 WHITE/CAUCASIAN"
    2 = "2 BLACK/AFRICAN AMERICAN"
    3 = "3 AMERICAN INDIAN"
    4 = "4 ALASKA NATIVE"
    5 = "5 ASIAN"
    6 = "6 NATIVE HAWAIIAN"
    7 = "7 PACIFIC ISLANDER"
    8 = "8 OTHER (SPECIFY)"  ;
           Value dcontnew
         1 = "1 Continuing sample from R1"
         2 = "2 New sample in R5"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';
run;
/* Section #2 - Input statement with variable name and location on the .txt file
                Reminder - change [PATH] to reflect your file locations       */
Data SP_SENS;
INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\SP\NHATS_Round_7_SP_Sen_Dem_File.txt"
LRECL=58 ;
INPUT   @1 spid 8.
@9 r5dbirthmth 2.
@11 r5dbirthyr 4.
@15 r7dintvwrage 3.
@18 pd7mthdied 2.
@20 pd7yrdied 4.
@24 r7ddeathage 3.
@27 hc7cancerty2 2.
@29 hc7cancerty3 2.
@31 hc7cancerty4 2.
@33 hc7cancerty5 2.
@35 hc7cancerty6 2.
@37 hc7cancerty7 2.
@39 hc7cancerty8 2.
@41 hh7mthendmar 2.
@43 hh7modob 2.
@45 hh7dmodoball 2.
@47 hh7yrdob 4.
@51 hh7dyrdoball 4.
@55 hh7spageall 4.;


/* Section #3 - format assignment statement   */
        format  r5dbirthyr r7dintvwrage pd7yrdied r7ddeathage hh7yrdob hh7dyrdoball  hh7spageall  RFDK_F.
                        hc7cancerty2 hc7cancerty3 hc7cancerty4 hc7cancerty5 hc7cancerty6 hc7cancerty7 hc7cancerty8 RFDK_YN.
                        r5dbirthmth pd7mthdied hh7mthendmar hh7modob hh7dmodoball W200038W.;

/* Section #4 - Label assignment statement   */
label spid="NHATS SAMPLED PERSON ID"
r5dbirthmth="R5 D BIRTH MONTH OF SP"
r5dbirthyr="R5 D BIRTH YEAR OF SP"
r7dintvwrage="R7 D AGE OF SP AT INTERVIEW"
pd7mthdied="R7 PD2A MONTH DIED"
pd7yrdied="R7 PD2B YEAR DIED"
r7ddeathage="R7 D AGE OF SP AT DEATH"
hc7cancerty2="R7 HC3 SP HAD BREAST CANCER"
hc7cancerty3="R7 HC3 SP HAD PROSTATE CANCER"
hc7cancerty4="R7 HC3 SP HAD BLADDER CANCER"
hc7cancerty5="R7 HC3 SP HAD CRV OVRN UTRN CNCR "
hc7cancerty6="R7 HC3 SP HAD COLON CANCER"
hc7cancerty7="R7 HC3 SP HAD KIDNEY CANCER"
hc7cancerty8="R7 HC3 SP HAD OTHER CANCER"
hh7mthendmar="R7 HH2A MTH MARR END OR SPS PASS"
hh7modob="R7 HH6A NEW R7 SPOU PART MO DOB"
hh7dmodoball="R7 D MONTH DOB OF SPOU PAR UPDATE AND NEW"
hh7yrdob="R7 HH6C NEW R7 SPOU PART YR DOB"
hh7dyrdoball="R7 D YEAR DOB OF SPOU PAR UPDATE AND NEW"
hh7spageall="R7 SPOU PAR AGE UPDATE AND NEW";

run;


data nhats_dem;
set sp_sens;
run;





********************************* NSOC_R7_Crss_SP_Tracker_Read SAS FILE **********************************************************;

PROC FORMAT;

 VALUE RFDK_F
     -2 = '-2 Helped last month, SP alive'
     -3 = '-3 Helped last month of life, SP deceased'
     -4 = '-4 Did not help last month or in last month of life'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
 ;

VALUE W000057W
    1 = '1 SP interview at 2017 NHATS & alive at NSOC'
    2 = '2 SP 2016 LML'
    3 = '3 SP 2017 LML'
    4 = '4 SP interview at 2017 & deceased at NSOC'
    5 = '5 SP interview at 2017 & more than 1 caregiver & at least 1 caregiver reports SP deceased at NSOC'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
;


 VALUE W000058W
         1 = '1 SP has eligible caregiver'
         -7 = '-7 RF'
         -8 = '-8 DK'
         -1 = '-1 Inapplicable'
         -9 = '-9 Missing'
 ;
 VALUE W000064W
 1 = '1 SP eligible for cross-sectional NSOC'
 -1 = '-1 Ineligible'
;
    run;

Data NSOC_R7_Crss_SP_Tracker_File;

INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\Cross-sectional\NSOC_R7_Crss_SP_Tracker_File.txt"

LRECL=19 ;
INPUT
@1 spid 8.
@9 fl7dnsoc 2.
@11 fl7dnsoccnt 2.
@13 fl7dcgcontactinfo 2.
@15 fl7dnsoccomp 2.
@17 fl7dtrackspstat 2.
;


    Label
spid       = "NHATS SAMPLED PERSON ID"
fl7dnsoc   = "R7 F CC SP IS ELIGIBLE FOR NSOC"
fl7dnsoccnt= "R7 F CC CNT HLPRS ELG FOR NSOC"
fl7dcgcontactinfo='R7 F CC HLPRS SP GAVE CONTACT INFO'
fl7dnsoccomp= "R7 D CC CNT HLPRS WITH NSOC COMP"
fl7dtrackspstat="R7 F D SP VITAL STATUS AT INTERVIEW"
;

format
spid 8.
fl7dnsoccnt fl7dnsoccomp fl7dcgcontactinfo RFDK_F.
fl7dtrackspstat W000057W.
fl7dnsoc W000064W.
;
run;

data nhats_tracker;
set NSOC_R7_Crss_SP_Tracker_File;
run;

proc freq data=nhats_tracker;
tables fl7dnsoc fl7dnsoccnt fl7dcgcontactinfo fl7dnsoccomp fl7dtrackspstat;
run;


*********************************************** NHATS_Round_7_SP_edited SAS FILE *******************************************;

/* NHATS_Round_7_SP_Read.SAS - General File */

/* Section #1 - Creating the Formats */


PROC FORMAT ;


    VALUE release
           -1 = '-1 Inapplicable'
        1 = '1 Main Sample'
        2 = '2 Reserve Sample'
        9 = '9 New Release Sample';

    VALUE STAT_DTa
          4 = " 4 April"
          5 = " 5 May"
          6 = " 6 June"
          7 = " 7 July"
          8 = " 8 August"
          9 = " 9 September"
         10 = "10 October"
         11 = "11 November"
         99 = "99 Prior to start of field work"
         -1 = '-1 Inapplicable';

    VALUE $DISP
          '10' = "10 Not Available "
          '11' = "11 Ready"
          '12' = "12 Started "
          '20' = "20 Final "
          '24' = "24 Not Required "
          '60' = "60 Complete "
          '61' = "61 Complete, NH facility"
          '62' = "62 Complete SP Deceased, Proxy Intv"
          '63' = "63 Complete SP, FQ not complete"
          '64' = "64 Complete FQ, SP not complete"
          '75' = "75 Physically/mentally unable to participate, no proxy"
          '76' = "76 Too ill to participate, no proxy"
          '77' = "77 Refusal, SP"
          '78' = "78 Language barrier"
          '79' = "79 Unable to locate"
          '80' = "80 Unavailable during field period"
          '82' = "82 Outside of PSU"
          '83' = "83 Ineligible"
          '85' = "85 Refusal, facility"
          '86' = "86 Deceased"
          '87' = "87 Refusal, proxy"
          '88' = "88 Work stopped"    ;

VALUE DISP_a
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required"
          60 = "60 Complete"
          61 = "61 Complete, NH facility"
          62 = "62 Complete SP Deceased, Proxy Intv"
          63 = "63 Complete SP, FQ not complete"
          64 = "64 Complete FQ, SP not complete "
          75 = "75 Physically/mentally unable to participate, no proxy"
          76 = "76 Too ill to participate, no proxy"
          77 = "77 Refusal, SP"
          78 = "78 Language barrier"
          79 = "79 Unable to locate"
          80 = "80 Unavailable during field period"
          82 = "82 Outside of PSU"
          83 = "83 Ineligible"
          85 = "85 Refusal, facility"
          86 = "86 Deceased"
          87 = "87 Refusal, proxy"
          88 = "88 Work stopped"    ;

    VALUE DISP_
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required";
    VALUE DISP_F
     -1 = '-1 Inapplicable'
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required"
          60 = "60 Complete"
          61 = "61 Complete, NH facility"
          62 = "62 Complete SP Deceased, Proxy Intv"
          63 = "63 Complete SP, FQ not complete"
          64 = "64 Complete FQ, SP not complete "
          75 = "75 Physically/mentally unable to participate, no proxy"
          76 = "76 Too ill to participate, no proxy"
          77 = "77 Refusal, SP"
          78 = "78 Language barrier"
          79 = "79 Unable to locate"
          80 = "80 Unavailable during field period"
                  81 = "81 Final deceased, new sample only"
          82 = "82 Outside of PSU"
          83 = "83 Ineligible"
          85 = "85 Refusal, facility"
          86 = "86 Deceased"
          87 = "87 Refusal, proxy"
          88 = "88 Work stopped"
          89 = "89 Final, Other Specify";

    VALUE RFDK
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE $RFDK_F
    '-7' = '-7 RF'
    '-8' = '-8 DK'
    '-1' = '-1 Inapplicable'
    '-9' = '-9 Missing';

    VALUE RFDK_F
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE RFDK_B
    -1 = '-1 Inapplicable'
    1 = '1 Yes-Breakoff';

VALUE $RFDK_C
    '-1' = '-1 Inapplicable'
    'CL' ='CL - Closing'
    'EW' ='EW - Economic Well-Being'
    'FQ' ='FQ - Facility Questionnaire'
    'HL' ='HL - Helper'
    'HW' ='HW - Height and Weight'
    'IP' ='IP - Insurance Plans'
    'LF' ='LF - Labor Force'
    'PA' ='PA - Participation'
    'PE' ='PE - Performance'
    'WB' ='WB - Well-being' ;

VALUE $RFDK_2C
    '-1' = '-1 Inapplicable'
    '-7' = '-7 RF'
    '-8' = '-8 DK'
    '-9' = '-9 Missing';

    VALUE RFDK_Y
     1 = ' 1 Yes'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE RFDK_I
     0 = ' 0 No'
     1 = ' 1 Yes'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE RFDK_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE DSTRP_G
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
    1 =  '1 X condition and word color condition accuracy below threshold (less than .42)'
    2 =  '2 word condition only below threshold (less than .42)'
    3 =  '3 X condition and word color condition meet criteria for accuracy'
    4 =  '4 fewer than 50% of X and word color condition trials answered'
    999 = '999 X condition only below threshold (less than .42)';

    VALUE DSTRP_R
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -999 = '-999 Inapplicable'
    other = 'Values ranging between -.353 and 1.115';

    VALUE DSTRP_M
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -999 = '-999 Inapplicable'
    other = 'Values ranging between -544.732 and 924.863';

VALUE FQ_4F
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
          1='1 YES'
          2='2 NO';

  VALUE CHILDDEC
    1 =  '1 CHILD DECEASED'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE W200001W
    12 = "12 STARTED"
    20 = "20 COMPLETE"
    21 = "21 INELIGIBLE - NOT 65+"   ;

  VALUE W200008x
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 UNDER 20"
    2 = "2 20-24"
    3 = "3 25-29"
    4 = "4 30-34"
    5 = "5 35-39"
    6 = "6 40-44"
    7 = "7 45-49"
    8 = "8 50-54"
    9 = "9 55-59"
    10 = "10 60-64"
    11 = "11 65-69"
    12 = "12 70-74"
    13 = "13 75-79"
    14 = "14 80-84"
    15 = "15 85-89"
    16 = "16 90 +";

  VALUE W200009W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SAMPLE PERSON"
    2 = "2 SPOUSE/ PARTNER"
    3 = "3 DAUGHTER"
    4 = "4 SON"
    5 = "5 DAUGHTER-IN-LAW"
    6 = "6 SON-IN-LAW"
    7 = "7 STEPDAUGHTER"
    8 = "8 STEPSON"
    9 = "9 SISTER"
    10 = "10 BROTHER"
    11 = "11 SISTER-IN-LAW"
    12 = "12 BROTHER-IN-LAW"
    13 = "13 MOTHER"
    14 = "14 STEPMOTHER"
    15 = "15 MOTHER-IN-LAW"
    16 = "16 FATHER"
    17 = "17 STEPFATHER"
    18 = "18 FATHER-IN-LAW"
    19 = "19 GRANDDAUGHTER"
    20 = "20 GRANDSON"
    21 = "21 NIECE"
    22 = "22 NEPHEW"
    23 = "23 AUNT"
    24 = "24 UNCLE"
    25 = "25 COUSIN"
    26 = "26 STEPDAUGHTER'S SON/ DAUGHTER"
    27 = "27 STEPSON'S SON/ DAUGHTER"
    28 = "28 DAUGHTER-IN-LAW'S SON/ DAUGHTER"
    29 = "29 SON-IN-LAW'S SON/ DAUGHTER"
    30 = "30 BOARDER/RENTER"
    31 = "31 PAID AIDE/ HOUSEKEEPER/ EMPLOYEE"
    32 = "32 ROOMMATE"
    33 = "33 EX-WIFE/ EX-HUSBAND"
    34 = "34 BOYFRIEND/ GIRLFRIEND"
    35 = "35 NEIGHBOR"
    36 = "36 FRIEND"
    37 = "37 SOMEONE/SERVICE AT THE PLACE SP LIVES/LIVED"
    38 = "38 CO-WORKER"
    39 = "39 MINISTER, PRIEST, OR OTHER CLERGY"
    40 = "40 PSYCHIATRIST, PSYCHOLOGIST, COUNSELOR, OR THERAPIST"
    41 = "41 DECEASED SPOUSE/PARTNER"
    91 = "91 OTHER RELATIVE"
    92 = "92 OTHER NONRELATIVE"   ;

   VALUE W200002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MALE"
    2 = "2 FEMALE";

   VALUE W200005W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NO SCHOOLING COMPLETED"
    2 = "2 1ST-8TH GRADE"
    3 = "3 9TH-12TH GRADE (NO DIPLOMA)"
    4 = "4 HIGH SCHOOL GRADUATE (HIGH SCHOOL DIPLOMA OR EQUIVALENT)"
    5 = "5 VOCATIONAL, TECHNICAL, BUSINESS, OR TRADE SCHOOL CERTIFICATE OR DIPLOMA (BEYOND HIGH SCHOOL LEVEL)"
    6 = "6 SOME COLLEGE BUT NO DEGREE"
    7 = "7 ASSOCIATE'S DEGREE"
    8 = "8 BACHELOR'S DEGREE"
    9 = "9 MASTER'S, PROFESSIONAL, OR DOCTORAL DEGREE"  ;

  VALUE W200010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MARRIED"
    2 = "2 LIVING WITH A PARTNER"
    3 = "3 SEPARATED"
    4 = "4 DIVORCED"
    5 = "5 WIDOWED"
    6 = "6 NEVER MARRIED";

  VALUE W200011W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 PREVIOUSLY REPORTED"  ;
VALUE W200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 REGULAR"
    2 = "2 VARIED"  ;

   VALUE W200013W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP AND/OR FAMILY"
    2 = "2 GOVERNMENT PROGRAM"
    3 = "3 INSURANCE"
    91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200015W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1='1 HOURLY'
    2='2 WEEKLY'
    3='3 MONTHLY'
    4='4 DID NOT PAY IN LAST MONTH'
        91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MEDICAID"
    2 = "2 MEDICARE"
    3 = "3 STATE PROGRAM"
    91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200018W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE-STANDING (DETACHED) SINGLE HOUSE"
    2 = "2 SINGLE HOUSE BUT ATTACHED TO OTHERS (ROW HOUSE, TOWNHOUSE, DUPLEX, TRIPLEX, OR TRIPLE DECKER)"
    3 = "3 MOBILE HOME OR TRAILER"
    4 = "4 MULTI-UNIT (2+) BUILDING"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200020W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOME"
    2 = "2 MULTI-UNIT"
    3 = "3 OTHER"  ;

  VALUE W200021W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 BUILDING HAS ONE FLOOR"
    2 = "2 BUILDING HAS MULTIPLE FLOORS"   ;

  VALUE W200022W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOME"
    2 = "2 APARTMENT"
    3 = "3 ROOM"
    4 = "4 UNIT"
    5 = "5 SUITE"
    6 = "6 SOMETHING ELSE (SPECIFY)"  ;

  VALUE W200030W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SAMPLE PERSON (SP)"
    2 = "2 PROXY"  ;

  VALUE W200032W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOSPITAL"
    2 = "2 NURSING HOME/REHAB CENTER"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200035W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SELF"
    2 = "2 SPOUSE/ PARTNER"
    3 = "3 DAUGHTER"
    4 = "4 SON"
    5 = "5 DAUGHTER-IN-LAW"
    6 = "6 SON-IN-LAW"
    7 = "7 STEPDAUGHTER"
    8 = "8 STEPSON"
    9 = "9 SISTER"
    10 = "10 BROTHER"
    11 = "11 SISTER-IN-LAW"
    12 = "12 BROTHER-IN-LAW"
    13 = "13 MOTHER"
    14 = "14 STEPMOTHER"
    15 = "15 MOTHER-IN-LAW"
    16 = "16 FATHER"
    17 = "17 STEPFATHER"
    18 = "18 FATHER-IN-LAW"
    19 = "19 GRANDDAUGHTER"
    20 = "20 GRANDSON"
    21 = "21 NIECE"
    22 = "22 NEPHEW"
    23 = "23 AUNT"
    24 = "24 UNCLE"
    25 = "25 COUSIN"
    26 = "26 STEPDAUGHTER'S SON/ DAUGHTER"
    27 = "27 STEPSON'S SON/ DAUGHTER"
    28 = "28 DAUGHTER-IN-LAW'S SON/ DAUGHTER"
    29 = "29 SON-IN-LAW'S SON/ DAUGHTER"
    30 = "30 BOARDER/RENTER"
    31 = "31 PAID AIDE/ HOUSEKEEPER/ EMPLOYEE"
    32 = "32 ROOMMATE"
    33 = "33 EX-WIFE/ EX-HUSBAND"
    34 = "34 BOYFRIEND/ GIRLFRIEND"
    35 = "35 NEIGHBOR"
    36 = "36 FRIEND"
    37 = "37 SOMEONE/SERVICE FROM THE PLACE SP LIVES/DIED"
    38 = "38 CO-WORKER"
    39 = "39 MINISTER, PRIEST, OR OTHER CLERGY"
    40 = "40 PSYCHIATRIST, PSYCHOLOGIST, COUNSELOR, OR THERAPIST"
    91 = "91 OTHER RELATIVE"
    92 = "92 OTHER NONRELATIVE"  ;

  VALUE W200036W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY FAMILIAR"
    2 = "2 SOMEWHAT FAMILIAR"
    3 = "3 A LITTLE FAMILIAR"
    4 = "4 NOT AT ALL FAMILIAR"  ;

  VALUE W200037W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, SAME ADDRESS"
    2 = "2 NO, DIFFERENT ADDRESS"
    3 = "3 YES, SAME ADDRESS WITH MINOR CORRECTIONS"  ;

  VALUE W200038W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"  ;

  VALUE W200039W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 2011"
    2 = "2 2012"
    3 = "3 YEAR2013"
    4 = "4 YEAR2014"
    5 = "5 YEAR2015"
    6 = "6 YEAR2016"
    7 = "7 YEAR2017"
    8 = "8 YEAR2018"
    9 = "9 YEAR2019"
    10 = "10 YEAR2020"  ;

  VALUE W200040W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 2011"
    2 = "2 2012"  ;

  VALUE W200041W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AT SPS OR SOMEONE ELSES HOME"
    2 = "2 IN A HOSPITAL"
    3 = "3 IN A NURSING HOME"
    4 = "4 IN A HOSPICE RESIDENCE"
    5 = "5 IN TRANSIT (AMBULANCE TO HOSPITAL)"
    91 = "91 SOMEWHERE ELSE (SPECIFY)";

  VALUE W200042W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP'S HOME"
    2 = "2 SOMEONE ELSE'S HOME"  ;

  VALUE W200043W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INTENSIVE CARE UNIT"
    2 = "2 PALLIATIVE CARE UNIT"
    3 = "3 INPATIENT HOSPICE UNIT"
    4 = "4 EMERGENCY ROOM"
    5 = "5 ANOTHER KIND OF UNIT"  ;

  VALUE W200044W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOSPICE AT A HOSPITAL"
    2 = "2 HOSPICE AT A NURSING HOME"
    3 = "3 RESIDENTIAL HOSPICE"
    4 = "4 OTHER HOSPICE"  ;

  VALUE W200045W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 DAYS"
    2 = "2 WEEKS"
    3 = "3 MONTHS"
    4 = "4 YEARS"  ;

  VALUE W200046W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AT SP'S HOME"
    2 = "2 IN A HOSPITAL"
    3 = "3 IN A NURSING HOME"
    4 = "4 IN A HOSPICE RESIDENCE"
    91 = "91 SOMEWHERE ELSE (SPECIFY)"  ;

  VALUE W200047W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY"
    2 = "2 MOST DAYS"
    3 = "3 SOME DAYS"
    4 = "4 RARELY"
    5 = "5 NOT AT ALL"  ;

  VALUE W200048W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN WAS NEEDED"
    2 = "2 MORE THAN WAS NEEDED"
    3 = "3 ABOUT RIGHT AMOUNT"  ;

  VALUE W200049W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"  ;

  VALUE W200050W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALWAYS"
    2 = "2 USUALLY"
    3 = "3 SOMETIMES"
    4 = "4 NEVER"
    5 = "5 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"  ;

  VALUE W200051W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EXCELLENT"
    2 = "2 VERY GOOD"
    3 = "3 GOOD"
    4 = "4 FAIR"
    5 = "5 POOR"  ;

  VALUE W200052W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NOT AT ALL"
    2 = "2 SEVERAL DAYS"
    3 = "3 MORE THAN HALF THE DAYS"
    4 = "4 NEARLY EVERY DAY"  ;

  VALUE W200053W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY NIGHT (7 NIGHTS A WEEK)"
    2 = "2 MOST NIGHTS (5-6 NIGHTS A WEEK)"
    3 = "3 SOME NIGHTS (2-4 NIGHTS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200054W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY NIGHT (7 NIGHTS A WEEK)"
    2 = "2 MOST NIGHTS (5-6 NIGHTS A WEEK)"
    3 = "3 SOME NIGHTS (2-4 NIGHTS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"
    7 = "7 DON'T WAKE UP/NOT A PROBLEM"  ;

  VALUE W200055W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PRIVATE RESIDENCE"
    2 = "2 A GROUP HOME, BOARD AND CARE, OR SUPERVISED HOUSING"
    3 = "3 ASSISTED LIVING FACILITY OR CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    4 = "4 RELIGIOUS GROUP QUARTERS"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200056W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 PLACE DOES NOT HAVE A NAME"  ;

  VALUE W200057W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 APARTMENT"
    2 = "2 ROOM"
    3 = "3 UNIT"
    4 = "4 SUITE"
    91 = "91 SOMETHING ELSE (SPECIFY)"  ;

  VALUE W200058W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO, DIFFERENT PERSON"
    3 = "3 NO, NAME MISSPELLED"  ;

   VALUE W200060W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PRIVATE RESIDENCE"
    2 = "2 A GROUP HOME, BOARD AND CARE, OR SUPERVISED HOUSING"
    3 = "3 ASSISTED LIVING FACILITY OR CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    5 = "5 NURSING HOME"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200061W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SEPARATION OR DIVORCE"
    2 = "2 DECEASED"
    3 = "3 MOVED ELSEWHERE"
    5 = "5 LAST INTERVIEW INFORMATION INCORRECT"
    8 = "8 OTHER REASON"   ;

  VALUE W200067W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 COMMON OR SHARED ENTRANCE"
    2 = "2 ENTRANCE DIRECTLY INTO HOME"  ;

  VALUE W200068W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1"
    2 = "2"
    3 = "3"
    4 = "4+"  ;

  VALUE W200069W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALL ITEMS HERE"
    2 = "2 ADDED ONE OR MORE ITEMS"  ;

  VALUE W200070W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $500"
    2 = "2 LESS THAN $500"
    3 = "3 JUST ABOUT $500"  ;

  VALUE W200071W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $1,000"
    2 = "2 LESS THAN $1,000"
    3 = "3 JUST ABOUT $1,000"  ;

  VALUE W200072W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $100"
    2 = "2 LESS THAN $100"
    3 = "3 JUST ABOUT $100"  ;

  VALUE W200073W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 YES, DOESNT KNOW HOW TO USE A COMPUTER"  ;

  VALUE W200074W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST DAYS"
    2 = "2 SOME DAYS"
    3 = "3 RARELY"  ;

  VALUE W200076W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 DEAF"  ;

  VALUE W200077W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 BLIND"  ;

  VALUE W200078W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY (7 DAYS A WEEK)"
    2 = "2 MOST DAYS (5-6 DAYS A WEEK)"
    3 = "3 SOME DAYS (2-4 DAYS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200080W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, A CHANGE"
    2 = "2 NO, NO CHANGE"
    3 = "3 DEMENTIA/ALZHEIMER'S REPORTED BY PROXY"  ;

  VALUE W200081W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP HAS DEMENTIA/ALZHEIMER'S/ NOT ABLE"
    2 = "2 SP IS UNABLE TO SPEAK"
    3 = "3 SP IS UNABLE TO HEAR"
    4 = "4 SP REFUSED"
    5 = "5 PROXY REFUSED"
    6 = "6 SP NOT PRESENT"
    7 = "7 SP TOO ILL"
    8 = "8 SP LANGUAGE BARRIER"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200082W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MUCH BETTER"
    2 = "2 BETTER"
    3 = "3 SAME"
    4 = "4 WORSE"
    5 = "5 MUCH WORSE"  ;

  VALUE W200083W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO/DON'T KNOW"  ;

  VALUE W200084W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 CONTINUE WITH ACTIVITY"
    2 = "2 SP REFUSES ACTIVITY"  ;

  VALUE W200085W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "Word[1]"
    2 = "Word[2]"
    3 = "Word[3]"
    4 = "Word[4]"
    5 = "Word[5]"
    6 = "Word[6]"
    7 = "Word[7]"
    8 = "Word[8]"
    9 = "Word[9]"
    10 = "Word[10]"
    91 = "91 NO WORDS REMEMBERED"
    92 = "92 REFUSED"  ;

  VALUE W200086W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 DIFFICULTY HEARING ANY OF THE WORDS"
    2 = "2 INTERRUPTION OCCURRED WHILE LIST WAS BEING READ"
    91 = "91 OTHER PROBLEM (SPECIFY)"
    92 = "92 NO PROBLEMS OCCURRED"
    97 = "97 SP REFUSED WORD RECALL TASK"  ;

  VALUE W200087W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP ATTEMPTED CLOCK DRAWING"
    2 = "2 SP DID NOT ATTEMPT CLOCK DRAWING"
    97 = "3 SP REFUSED CLOCK DRAWING"  ;

  VALUE W200089W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY (7 DAYS A WEEK)"
    2 = "2 MOST DAYS (5-6 DAYS A WEEK)"
    3 = "3 SOME DAYS (2-4 DAYS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200090W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY TIME"
    2 = "2 MOST TIMES"
    3 = "3 SOMETIMES"
    4 = "4 RARELY"
    5 = "5 NEVER"  ;

  VALUE W200092W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST TIMES"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"  ;

  VALUE W200093W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NONE"
    2 = "2 A LITTLE"
    3 = "3 SOME"
    4 = "4 A LOT"  ;

  VALUE W200094W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE OFTEN"
    2 = "2 LESS OFTEN"
    3 = "3 ABOUT THE SAME"  ;

  VALUE W200095W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"  ;

  VALUE W200096W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"  ;

  VALUE W200097W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO / NO LONGER DRIVE"  ;

  VALUE W200098W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 NO, NO RAIN OR BAD WEATHER"  ;

  VALUE W200099W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALWAYS DID IT BY SELF"
    2 = "2 ALWAYS DID IT TOGETHER WITH SOMEONE ELSE"
    3 = "3 SOMEONE ELSE ALWAYS DID IT"
    4 = "4 IT VARIED (MORE THAN ONE WAY)"
    5 = "5 NOT DONE IN LAST MONTH"  ;

  VALUE W200102W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE OFTEN"
    2 = "2 LESS OFTEN"
    3 = "3 SAME"  ;

  VALUE W200106W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 ALWAYS FED THROUGH IV OR TUBE"  ;

  VALUE W200107W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY TIME"
    2 = "2 MOST TIMES"
    3 = "3 SOMETIMES"
    4 = "4 RARELY"  ;

  VALUE W200109W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SHOWERING"
    2 = "2 TAKING BATHS"
    3 = "3 WASHING UP SOME OTHER WAY"  ;


  VALUE W200114W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY IMPORTANT"
    2 = "2 SOMEWHAT IMPORTANT"
    3 = "3 NOT SO IMPORTANT"  ;

  VALUE W200115W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    95 = "95 NO ACTIVITY LISTED"  ;

  VALUE W200116W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LEFT"
    2 = "2 RIGHT"
    3 = "3 BOTH"  ;

  VALUE W200117W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LEFT SIDE"
    2 = "2 RIGHT SIDE"
    3 = "3 BOTH SIDES"  ;

  VALUE W200118W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ONE SIDE"
    2 = "2 BOTH SIDES"  ;

  VALUE W200119W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 RECEIVE ALL TREATMENTS"
    2 = "2 STOP/REJECT ALL TREATMENTS"  ;

  VALUE W200120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LIVING IN THEIR OWN HOME WITH HELP FROM FRIENDS AND FAMILY"
    2 = "2 LIVING IN THEIR OWN HOME WITH HELP FROM SOMEONE PAID TO COME IN"
    3 = "3 LIVING WITH AN ADULT CHILD"
    4 = "4 LIVING IN AN ASSISTED LIVING FACILITY OR CONTINUING CARE RESIDENCE"
    5 = "5 LIVING IN A NURSING HOME"  ;

  VALUE W200121W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 DOESNT HAVE ANY MONEY TO PAY A CAREGIVER"
    4 = "4 WOULD NOT USE A PAID CAREGIVER"  ;

  VALUE W200122W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MAKE DECISIONS WITHOUT MUCH ADVICE FROM THEM"
    2 = "2 GET THEIR ADVICE AND THEN MAKE DECISIONS"
    3 = "3 MAKE DECISIONS TOGETHER"
    4 = "4 LEAVE DECISIONS UP TO THEM"  ;

  VALUE W200123W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HANDLE MOSTLY BY SELF"
    2 = "2 HANDLE TOGETHER WITH FAMILY OR CLOSE FRIENDS"
    3 = "3 FAMILY OR CLOSE FRIENDS MOSTLY HANDLE THESE THINGS"
    4 = "4 IT VARIES"  ;

  VALUE W200124W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NEVER"
    2 = "2 RARELY"
    3 = "3 SOMETIMES"
    4 = "4 OFTEN"  ;

  VALUE W200126W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AGREE A LOT"
    2 = "2 AGREE A LITTLE"
    3 = "3 DO NOT AGREE"  ;

  VALUE W200127W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AGREE A LOT"
    2 = "2 AGREE A LITTLE"
    3 = "3 AGREE NOT AT ALL"  ;

  VALUE W200129W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $1,000,"
    2 = "2 $1,000 to less than $2,000,"
    3 = "3 $2,000 to less than $3,000,"
    4 = "4 $3,000 to less than $5,000, or"
    5 = "5 $5,000 or more?"  ;

  VALUE W200131W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 RETIRED/DON'T WORK ANYMORE"  ;

  VALUE W200132W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY WEEK"
    2 = "2 EVERY TWO WEEKS"
    3 = "3 TWO TIMES A MONTH"
    4 = "4 ONCE A MONTH"
    5 = "5 DAILY"
    91 = "91 OTHER SCHEDULE (SPECIFY)"  ;

  VALUE W200133W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OWN"
    2 = "2 RENT"
    3 = "3 SOME OTHER ARRANGEMENT"  ;

  VALUE W200134W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PAID OFF"
    2 = "2 STILL MAKE PAYMENTS"
    3 = "3 REVERSE MORTGAGE"  ;

  VALUE W200135W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $250,"
    2 = "2 $250-$499,"
    3 = "3 $500-$999, or"
    4 = "4 $1,000 or more?"  ;
  VALUE W500135W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $250"
    2 = "2 $250 to less than $500"
    3 = "3 $500 to less than $1,000"
    4 = "4 $1,000 to less than $3,000"
        5 = "5 $3,000 to less than $5,000"
        6 = "6 $5,000 or more?"  ;
  VALUE W200136W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 5 YEARS"
    2 = "2 10 YEARS"
    3 = "3 LONGER THAN 10 YEARS"  ;

  VALUE W200137W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $50,000,"
    2 = "2 between $50,000 and $100,000, or"
    3 = "3 over $100,000?"  ;

  VALUE W200138W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $50,000,"
    2 = "2 $50,000-$74,999,"
    3 = "3 $75,000-$99,999,"
    4 = "4 $100,000-$199,999,"
    5 = "5 $200,000-$299,999,"
    6 = "6 $300,000-$499,999,"
    7 = "7 $500,000-$749,999, or"
    8 = "8 $750,000 or more?"  ;

  VALUE W200139W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PAY OFF BALANCE"
    2 = "2 PAY MINIMUM"
    3 = "3 PAY MORE THAN MINIMUM, BUT NOT ENTIRE BALANCE"
    4 = "4 DON'T HAVE ANY CREDIT CARDS"  ;

  VALUE W200140W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $1,000,"
    2 = "2 $1,000 - $1,999,"
    3 = "3 $2,000 - $3,999,"
    4 = "4 $4,000 - $5,999,"
    5 = "5 $6,000 - $9,999,"
    6 = "6 $10,000 - $19,999, or"
    7 = "7 $20,000 or more?"  ;

  VALUE W200141W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST"
    2 = "2 SOME"
    3 = "3 A LITTLE"  ;

  VALUE W200142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $500,"
    2 = "2 $500 - $999,"
    3 = "3 $1,000 - $1,999,"
    4 = "4 $2,000 - $3,999,"
    5 = "5 $4,000 - $5,999,"
    6 = "6 $6,000 - $9,999,"
    7 = "7 $10,000 - $19,999, or"
    8 = "8 $20,000 or more?"  ;

  VALUE W200146W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NEARLY EVERY DAY"
    2 = "2 MORE THAN HALF THE DAYS"
    3 = "3 SEVERAL DAYS (LESS THAN HALF)"
    4 = "4 A FEW DAYS"  ;

  VALUE W200147W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INCLUDED"
    2 = "2 EXTRA CHARGE"  ;

  VALUE W200148W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"  ;

VALUE F200006W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE STANDING NURSING HOME"
    2 = "2 FREE STANDING ASSISTED LIVING FACILITY"
    3 = "3 NURSING HOME AND ASSISTED LIVING FACILITY"
    4 = "4 CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    5 = "5 ADULT FAMILY CARE HOME"
    6 = "6 GROUP HOME"
    7 = "7 BOARD AND CARE HOME"
    8 = "8 RETIREMENT COMMUNITY OR SENIOR HOUSING (NOT CCRC)"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE F200007W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"  ;

  VALUE F200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INDEPENDENT LIVING"
    2 = "2 ASSISTED LIVING"
    3 = "3 SPECIAL CARE, MEMORY CARE, OR ALZHEIMER'S UNIT"
    4 = "4 NURSING HOME"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE F200009W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ASSISTED LIVING"
    2 = "2 NURSING HOME"  ;

  VALUE F200011W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, SERVICE PROVIDED AS PART OF PACKAGE"
    2 = "2 YES, SERVICE PROVIDED AT AN EXTRA CHARGE"
    3 = "3 NO, SERVICE NOT PROVIDED"  ;

  VALUE F200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP/FAMILY"
    2 = "2 SOCIAL SECURITY/SSI"
    3 = "3 MEDICAID"
    4 = "4 MEDICARE"
    5 = "5 OTHER SOURCE"  ;

  VALUE I200002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"  ;

  VALUE I200003W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 English"
    2 = "2 Spanish"
    3 = "3 Other (specify)"  ;

  VALUE I200005W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Friendly and interested"
    2 = "2 Cooperative but not particularly interested"
    3 = "3 Impatient and restless"
    4 = "4 Hostile"  ;

  VALUE I200006W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Good"
    2 = "2 Fair"
    3 = "3 Poor"  ;

  VALUE I200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 All of the time"
    2 = "2 Most of the time"
    3 = "3 Some of the time"
    4 = "4 Only for the cognition and/or performance parts"
    5 = "5 None of the time"  ;

   VALUE I200010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Interview was conducted by telephone"  ;

  VALUE I200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Not Administered"  ;

  VALUE I200013W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"  ;

  VALUE I200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Entire interview conducted by telephone"  ;

  VALUE I200017W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Not at all cluttered"
    2 = "2 Somewhat cluttered"
    3 = "3 Very cluttered"
    4 = "4 Could not see other rooms"  ;

  VALUE I200018W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 None"
    2 = "2 A little"
    3 = "3 Some"
    4 = "4 A lot"
    5 = "5 Could not observe"  ;

  VALUE I200019W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    7 = "7 Could not observe"  ;


/* DERIVED VARIABLE FORMATS */
  VALUE LVGARRG
    1 = '1 Alone'
    2 = '2 With spouse/partner only (spouse/partner in household)'
    3 = '3 With spouse/partner and with others'
    4 = '4 With others only'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DOUTSFDF
    8 = '8 Not done in last month'
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE DOUTDEVI
    8 = '8 Not done in last month'
    1 = '1 No use of devices to go outside in last month'
    2 = '2 Use of devices to go outside in last month'
    3 = '3 DKRF If used devices to go outside in last month'
    4 = '4 DKRF If used devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DOUTHELP
    8 = '8 Not done in last month'
    1 = '1 No help to go outside in last month'
    2 = '2 Had help to go outside in last month'
    3 = '3 DKRF If had help to go outside in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DINSDSFD
    8 = '8 Not done in last month'
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DINSDDEV
    8 = '8 Not done in last month'
    1 = '1 No use of devices inside in last month'
    2 = '2 Use of devices inside in last month'
    3 = '3 DKRF If used devices inside in last month'
    4 = '4 DKRF On use of devices'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dinsdhlp
    8 = '8 Not done in last month'
    1 = '1 No help to go around inside in last month'
    2 = '2 Had help to go around inside in last month'
    3 = '3 DKRF If had help to go around inside in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbedsfdf
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

   VALUE dbeddevi
    1 = '1 No use of cane or walker to get out of bed in last month'
    2 = '2 Use of cane or walker to get out of bed in last month'
    3 = '3 DKRF If Used cane or walker to get out of bed in last month'
    4 = '4 DKRF If used cane or walker in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbedhelp
    1 = '1 No help to get out of bed in last month'
    2 = '2 Had help to get out of bed in last month'
    3 = '3 DKRF If had help to get out of bed in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';


  VALUE dlaunsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';



  VALUE dlaunrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dshopsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dshoprea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmealsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE dmealrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbanksfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbankrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deatdevi
    1 = '1 No use of adapted utensils in last month'
    2 = '2 Use of adapted utensils in last month'
    8 = '8 Not done in last month'
    3 = '3 DKRF If used adapted utensils in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deathelp
    1 = '1 No help eating in last month'
    2 = '2 Had help eating in last month'
    3 = '3 DKRF If had help eating in last month'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deatsfdf
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using utensils)'
    3 = '3 Difficulty by self (and when using utensils)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathdev
    1 = '1 No use of grab bars or bath seats in last month'
    2 = '2 Use of grab bars or bath seats in last month'
    3 = '3 DKRF If use of grab bars or bath seats in last month'
    4 = '4 DKRF If had grab bars or bath seats in last month'
    9 = '9 No bars/seats/shower/tub or washes up other way'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathhel
    1 = '1 No help bathing in last month'
    2 = '2 Had help bathing in last month'
    3 = '3 DKRF If had help bathing in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathsfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using grab bars or tub seat)'
    3 = '3 Difficulty by self (and when using grab bars or tub seat)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoildev
    1 = '1 No use of toileting devices in last month'
    2 = '2 Use of toileting devices in last month'
    3 = '3 DKRF of some and no use of other toileting devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoilhel
    1 = '1 No help toileting in last month'
    2 = '2 Had help toileting in last month'
    3 = '3 DKRF If had help toileting in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoilsfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using toileting devices)'
    3 = '3 Difficulty by self (and when using toileting devices)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddresdev
    8 = '8 Not done in last month'
    9 = '9 DKRF If dressed in last month'
    2 = '2 Use of dressing devices in last month'
    1 = '1 No use of dressing devices in last month'
    3 = '3 DKRF If use of dressing devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddreshel
    8 = '8 Not done in last month'
    9 = '9 DKRF If dressed in last month'
    1 = '1 No help dressing in last month'
    2 = '2 Had help dressing in last month'
    3 = '3 DKRF If had help dressing in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddressfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using dressing devices)'
    3 = '3 Difficulty by self (and when using dressing devices)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
  VALUE dmedssfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    9 = '9 No or DKRF if medications taken in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmedsrea
    1 = '1 Health/functioning reason only'
    2 = '2 Other reason only'
    3 = '3 Both heath/functioning and other'
    4 = '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmarstat
    1 = '1 Married'
    2 = '2 Living with a partner'
    3 = '3 Separated'
    4 = '4 Divorced'
    5 = '5 Widowed'
    6 = '6 Never married'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
  VALUE DSPSAGEC
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
      1 = " 1 UNDER 50"
      2 = " 2 50-54"
      3 = " 3 55-59"
      4 = " 4 60-64"
      5 = " 5 65-69"
      6 = " 6 70-74"
      7 = " 7 75-79"
      8 = " 8 80-84"
      9 = " 9 85-89"
     10 = "10 90 +"    ;

    VALUE dresid
                -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential Care Resident not nursing home (SP interview complete)'
        3 = '3 Residential Care Resident not nursing home (FQ only)'
        4 = '4 Nursing Home Resident';
    VALUE f_dresid
                -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R5 (FQ only)'
        8 = '8 Nursing home in R1 and R5 (FQ only)' ;
    VALUE f2dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R2 (FQ only)'
        8 = '8 Nursing home in R1 and R2 (FQ only)' ;
    VALUE f3dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R3 (FQ only)'
        8 = '8 Nursing home in R1 and R3 (FQ only)' ;
    VALUE f4dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R4 (FQ only)'
        8 = '8 Nursing home in R1 and R4 (FQ only)' ;


VALUE QUARTILE
-9="-9 Missing"
-1="-1 Inapplicable";

VALUE SPPB
-9="-9 Missing"
-1="-1 Inapplicable";

    VALUE DCLCKSC
      0 = "0 Not recognizable as a clock"
      1 = "1 Severely distorted depiction of a clock"
      2 = "2 Moderately distorted depiction of a clock"
      3 = "3 Mildly distorted depiction of a clock"
      4 = "4 Reasonably accurate depiction of a clock"
      5 = "5 Accurate depiction of a clock (circular or square)"
    -7 = "-7 SP refused to draw clock"
    -8 = "-8 DK"
    -1 = "-1 Inapplicable"
    -2 = "-2 Proxy says cannot ask SP"
    -3 = "-3 Proxy says can ask SP but SP unable to answer"
    -4 = "-4 SP did not attempt to draw clock"
    -9 = "-9 Missing";

    VALUE DCLCKCL
      1 = '1 Very clear'
      2 = '2 Somewhat clear'
      3 = '3 Somewhat unclear'
      4 = '4 Very unclear'
      5 = '5 Blank'
    -7 = '-7 SP refused to draw clock'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -2 = '-2 Proxy says cannot ask SP'
    -3 = '-3 Proxy says can ask SP but SP unable to answer'
    -4 = '-4 SP did not attempt to draw clock'
    -9 = '-9 Missing';

VALUE RESULT
    -9='-9: MISSING'
    1='1: COMPLETED W RESULTS'
    2='2: COMPLETED MISSING RESULTS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    7='7: NO CHAIR/NO SPACE'
    9='9: NOT ATTEMPTED/MISSING';

    VALUE RESULT_SCH
    -9='-9: MISSING'
    1='1: COMPLETED W/OUT ARMS'
    2='2: COMPLETED W ARMS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    7='7: NO CHAIR/SAFETY REASON'
    8='8: NO CHAIR/NOT SAFETY REAS'
    9='9: NOT ATTEMPTED/MISSING'
    10='10: CH4=1 SINGLE CHAIR NOT COMPL';

    VALUE RESULT_RCH
    -9='-9: MISSING'
    1='1: COMPLETED W/OUT ARMS'
    2='2: COMPLETED MISSING RESULTS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    9='9: NO CHAIR OR NOT ATTEMPTED/MISSING';

    VALUE ZEROSCORE
    1="1: NOT ELIGIBLE DUE TO EXCLUSION CRITERIA"
    2="2: NOT ATTEMPTED FOR SAFETY REASON"
    3="3: ATTEMPTED CHAIR STANDS/NOT ATTEMPTED FOR SAFETY"
    4="4: ATTEMPTED"
    5="5: NEW WALKING EXCLUSION"
    9="9: NOT ASSIGNED A ZERO SCORE";

   VALUE D_LMLLOC
    1 = '1 Community'
    2 = '2 Residential Care'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

      VALUE D_LOCSP
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
        1 = "1 Independent Living/Housing/Retirement"
        2 = "2 Assisted Living/Personal Care"
        3 = "3 Special Care, Memory or Alzheimer's Unit"
        4 = "4 Nursing Home"
        8 = "8 Not Reported" ;

        VALUE PA25FMT
    -1 = '-1 Inapplicable'
        -8 = '-8 DK'
    -9 = '-9 Missing'
    111= '111 Sleeping Napping'
    131= '131 Eating'
    132= '132 Going out to eat'
    199= '199 Other self care activities'
    211= '211 Work and work-related activities'
    221= '221 Other income generating activities'
    241= '241 Volunteering'
    299= '299 Other productive activities'
    321= '321 Shopping for non-durable goods'
    399= '399 Other shopping'
    411= '411 Food and drink preparation'
    434= '434 Outdoor Maintenance'
    439= '439 Household chores (cannot tell if indoor/outdoor)'
    441= '441 Animal and pet care'
    442= '442 Walking and exercising pets'
    449= '449 Other animal and pet care'
    451= '451 Vehicle maintenance and repair'
    471= '471 Financial management'
    499= '499 Other household activities'
    511= '511 Physical care and assistance to others'
    599= '599 Other physical care'
    611= '611 Socializing with others in person'
    612= '612 Socializing with others on the phone'
    616= '616 Socializing and communicating on the computer'
    621= '621 Watching TV and movies'
    631= '631 Doing puzzles or games not on computer or online'
    632= '632 Gambling not online or at a casino'
    636= '636 Doing puzzles or games on a computer or online'
    641= '641 Arts and crafts or hobbies'
    642= '642 Reading'
    643= '643 Writing'
    644= '644 Listening to music'
    646= '646 Computer or online leisure activities'
    651= '651 Smoking or other tobacco use'
    652= '652 Drinking alcohol'
    661= '661 Doing nothing/relaxing'
    669= '669 No activity'
    699= '699 Other non active leisure'
    711= '711 Playing sports'
    712= '712 Walking or jogging'
    713= '713 Other outdoor recreating activities'
    714= '714 Attending sporting events'
    715= '715 Other physical activity, exercise, yoga, swimming, working out, dancing'
    718= '718 Watching sporting events'
    721= '721 Attending arts  including plays and concerts'
    723= '723 Attending movies'
    724= '724 Attending casinos'
    737= '737 Travel for leisure'
    799= '799 Other active leisure'
    811= '811 Attending religious activities'
    812= '812 Other religious and spirtual activities'
    821= '821 Attending meetings or events'
    899= '899 Other organizational activity'
    991= '991 Other miscellaneous'
    992= '992 No favorite activity'
    997= '997 Refused'
    998= '998 Dont Know'
    999= '999 Not Codeable';

          VALUE OCC_CODE
1   ='1 Management Occupations: 0010-0430'
2   ='2 Business and Financial Operations Occupations:  0500-0950'
3   ='3 Computer and mathematical occupations:  1000-1240'
4   ='4 Architecture and Engineering Occupations:   1300-1560'
5   ='5 Life, Physical, and Social Science Occupations: 1600-1965'
6   ='6 Community and Social Service Occupations:   2000-2060'
7   ='7 Legal Occupations:  2100-2160'
8   ='8 Education, Training, and Library Occupations:   2200-2550'
9   ='9 Arts, Design, Entertainment, Sports, and Media Occupations: 2600-2960'
10  ='10 Healthcare Practitioners and Technical Occupations:    3000-3540'
11  ='11 Healthcare Support Occupations:    3600-3655'
12  ='12 Protective Service Occupations:    3700-3955'
13  ='13 Food Preparation and Serving Related Occupations:  4000-4160'
14  ='14 Building and Grounds Cleaning and Maintenance Occupations: 4200-4250'
15  ='15 Personal Care and Service Occupations: 4300-4650'
16  ='16 Sales and Related Occupations: 4700-4965'
17  ='17 Office and Administrative Support Occupations: 5000-5940'
18  ='18 Farming, Fishing, and Forestry Occupations:    6000-6130'
19  ='19 Construction and Extraction Occupations:   6200-6940'
20  ='20 Installation, Maintenance, and Repair Occupations: 7000-7630'
21  ='21 Production Occupations:    7700-8965'
22  ='22 Transportation and Material Moving Occupations:    9000-9750'
23  ='23 Military Specific Occupations: 9800-9830'
24  ='24 No current occ (Unemployed, no work in the last 5 years, never worked):  9920'
25 = '25 Blank field'
26 = '26 Code did not match'
94 = '94 Uncodable'
95 = '95 Never Worked Entire Life'
96 = '96 Homemaker/Raised Children'
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing';

    Value fl_Dfac
1 = '1 Should have routed as facility but did not'
2 = '2 Routed as facility but determined not facility resident'
-1 = '-1 Inapplicable';
VALUE PE_RSLT
    -9='-9 Missing'
    -1 = '-1 Inapplicable'
    1='1 Completed'
    2='2 Attempted'
    3='3 Not attempted' ;
VALUE dosfacd /* FOR FQ2dosfacd  */
        -9= "-9 Missing"
       -8 = "-8 DK"
       -1 = "-1 INAPPLICABLE"
        1 = " 1 FREE STANDING NURSING HOME"
        2 = " 2 FREE STANDING ASSISTED LIVING FACILITY / RESIDENTIAL CARE FACILITY"
        3 = " 3 NURSING HOME AND ASSISTED LIVING FACILITY"
        4 = " 4 CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
        5 = " 5 ADULT FAMILY CARE HOME"
        6 = " 6 GROUP HOME"
        7 = " 7 BOARD AND CARE HOME / PERSONAL CARE HOME"
        8 = " 8 RETIREMENT COMMUNITY OR SENIOR HOUSING (NOT CCRC)"
        9 = " 9 INDEPENDENT LIVING"
       10 = " 10 ASSISTED AND INDEPENDENT/RETIREMENT (NO NURSING HOME)"
       11 = " 11 HOUSING (APT, CONDO, ETC.)";
        ;
    VALUE dosfaca /* FOR FQ2dosfaca */
        -9= "-9 Missing"
       -8 = "-8 DK"
       -1 = "-1 INAPPLICABLE"
        1 = " 1 INDEPENDENT LIVING / HOUSING / RETIREMENT "
        2 = " 2 ASSISTED LIVING / PERSONAL CARE"
        3 = " 3 SPECIAL CARE, MEMORY CARE, OR ALZHEIMER'S UNIT"
        4 = " 4 NURSING HOME"   ;

VALUE INAP_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -1 = '-1 Inapplicable' ;
VALUE CENDIV /* RE1DCENSDIV - Updated for R2 - Re-Release */
    1 =  '1 Northeast Region: New England Division (ME, NH, VT, MA, RI, CT)'
    2 =  '2 Northeast Region: Middle Atlantic Division (NY, NJ, PA)'
    3 =  '3 Midwest Region: East North Central Division (OH, IN, IL, MI, WI)'
    4 =  '4 Midwest Region: West North Central Division (MN, IA, MO, ND, SD, NE, KS)'
    5 =  '5 South Region: South Atlantic Division (DE, MD, DC, VA, WV, NC, SC, GA, FL)'
    6 =  '6 South Region: East South Central Division (KY, TN, AL, MS)'
    7 =  '7 South Region: West South Central Division (AR, LA, OK, TX)'
    8 =  '8 West Region: Mountain Division (MT, ID, WY, CO, NM, AZ, UT, NV)'
    9 =  '9 West Region: Pacific Division (WA, OR, CA, AK, HI)'
    -9 = '-9 Missing';

    VALUE W000002W
      -7 = '-7 RF'
      -8 = '-8 DK'
      -1 = '-1 Inapplicable'
      -9 = '-9 Missing'
       1 = "1 MALE"
       2 = "2 FEMALE"  ;

    VALUE W000005W
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE R1DRESID
        -1 = '-1 Inapplicable'
     1 = '1 Community '
     2 = '2 Residential Care Resident not nursing home (SP interview complete)'
     3 = '3 Residential Care Resident not nursing home (FQ only)'
     4 = '4 Nursing Home Resident';

  VALUE W200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MEDICAID"
    2 = "2 MEDICARE"
    3 = "3 STATE PROGRAM"
    91 = "91 OTHER (SPECIFY)"   ;

    VALUE W200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 REGULAR"
    2 = "2 VARIED"  ;

  VALUE W200061W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SEPARATION OR DIVORCE"
    2 = "2 DECEASED"
    3 = "3 MOVED ELSEWHERE"
    5 = "5 LAST INTERVIEW INFORMATION INCORRECT"
    8 = "8 OTHER REASON"   ;

  VALUE d2hrsmth
    -13= '-13 Deceased '
    -12= '-12 Zero days/wk'
    -11= '-11 Hours missing'
    -10= '-10 Days missing'
    -9 = ' -9 Days and hrs missing'
    -1 = ' -1 Inapplicable'
    -7 = ' -7 RF'
    -8 = ' -8 DK'
     0-<1  ='<1'
     1-<10 =' 1-<10'
    10-<20 ='10-<20'
    20-<30 ='20-<30'
    30-<40 ='30-<40'
    40-<60 ='40-<60'
    60-<120 ='60-<120'
    120-<180='120-<180'
    180-744='180-744 (24/7)'
     9999='9999 Not codeable, <1 hour/day' ;

  VALUE dhrsmth
    -11= '-11:hours missing'
    -10= '-10:days missing'
    -9 = '-9:days and hrs missing'
    -1 = '-1 Inapplicable'
    -7 = '-7 RF'
    -8 = '-8 DK'
     0-<1  ='<1'
     1-<10 =' 1-<10'
    10-<20 ='10-<20'
    20-<30 ='20-<30'
    30-<40 ='30-<40'
    40-<60 ='40-<60'
    60-<120 ='60-<120'
    120-<180='120-<180'
    180-744='180-744 (24/7)'
     9999='9999 Not codeable, <1 hour/day' ;

 Value dmissadd
-1='-1 Inapplicable'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section';

Value d2mssadd
-1='-1 Inapplicable'
 0='0 no flags and added at undetermined section'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section'
12='12 no flags and added at CS section'
13='13 no flags and added at HH section'
14='14 no flags and added at IS section';

Value dopage3c
 -9='-9 Missing'
 -8='-8 RF'
 -7='-7 DK'
 -1='-1 Inapplicable'
  1='1 UNDER 30'
  2='2 30-39'
  3='3 40-49'
  4='4 50-59'
  5='5 60-69'
  6='6 70-79'
  7='7 80-89'
  8='8 90 +';

 Value dopagect
-9='-9 Missing'
-8='-8 DK'
-7='-7 RF'
-1='-1 Inapplicable'
 1='1 UNDER 20'
 2='2 20-24'
 3='3 25-29'
 4='4 30-34'
 5='5 35-39'
 6='6 40-44'
 7='7 45-49'
 8='8 50-54'
 9='9 55-59'
10='10 60-64'
11='11 65-69'
12='12 70-74'
13='13 75-79'
14='14 80-84'
15='15 85-89'
16='16 90 +';


  VALUE W200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 UNDER 20"
    2 = "2 20-24"
    3 = "3 25-29"
    4 = "4 30-34"
    5 = "5 35-39"
    6 = "6 40-44"
    7 = "7 45-49"
    8 = "8 50-54"
    9 = "9 55-59"
    10 = "10 60-65"
    11 = "11 66-69"
    12 = "12 70-74"
    13 = "13 75-79"
    14 = "14 80-85"
    15 = "15 86-89"
    16 = "16 90-94"
    17 = "17 95-99"
    18 = "18 100 +"
  ;
    VALUE NumCigs
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
    999 = '999 SP smokes less than 1 cigarette / day';


  VALUE dlmlint
    1 = '1 Last month of life interview'
   -1 = '-1 Inapplicable'     ;

  VALUE d2intvra
     1 = '1 65 to 69'
     2 = '2 70 to 74'
     3 = '3 75 to 79'
     4 = '4 80 to 84'
     5 = '5 85 to 89'
     6 = '6 90+'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'     ;

  VALUE dad8dem
    1 = '1 DEMENTIA RESPONSE TO ANY AD8 ITEMS IN PRIOR ROUNDS'
   -1 = '-1 Inapplicable'    ;

  VALUE dwrdinon
  1 = '1 No words remembered'
   -1 = '-1 Inapplicable'
     -9 = '-9 Missing'     ;

  VALUE dwrdirre
    1 = '1 Refused word recall task'
   -1 = '-1 Inapplicable'
      -9 = '-9 Missing'     ;

 VALUE A0001AB
      1 = "1 AM"
      2 = "2 PM"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0002WA
      1 = "1 Yes, there is space to set up the walking course"
      2 = "2 No, there is not space to set up the walking course"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0004WA
      1 = "1 None"
      2 = "2 Cane"
      3 = "3 Walker or rollator"
      9 = "9 Other, specify"
     -1 = '-1 Inapplicable'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -9 = '-9 Missing';

 VALUE A0004CH
      1 = "1 No, chair stand not completed"
      2 = "2 Yes, chair stand completed"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0008CH
      1 = "1 With arms"
      2 = "2 Without arms"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0014CH
      1 = "1 1 Chair stand completed"
      2 = "2 2 Chair stands completed"
      3 = "3 3 Chair stands completed"
      4 = "4 4 Chair stands completed"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

VALUE BA1SS
    1 = '1 Eligible and recorded result for SxS Balance'
    2 = '2 Eligible and no recorded result for SxS Balance'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1STAN
    1 = '1 Eligible and recorded result for Semi Tandem Balance'
    2 = '2 Eligible and no recorded result for Semi Tandem Balance'
    3 = '3 Not administered because did not complete prior balance test'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1TAN
    1 = '1 Eligible and recorded result for full tandem balance'
    2 = '2 Eligible and no recorded result for full tandem balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1OP
    1 = '1 Eligible and recorded result for one leg eyes open balance'
    2 = '2 Eligible and no recorded result for one leg eyes open balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1CL
    1 = '1 Eligible and recorded result for one leg eyes closed balance'
    2 = '2 Eligible and no recorded result for one leg eyes closed balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE WA1WLK
    1 = '1 Eligible and recorded result for walking course'
    2 = '2 Eligible and no recorded result for walking course'
    4 = '4 Not Eligible due to exclusion criteria'
    5 = '5 Not Eligible on exclusion criteria but recorded result (SP changed mind)'
    -1 = '-1 Inapplicable '
    -9 = '-9 Missing';

VALUE CH1SCH
    1 = '1 Eligible and recorded result for single chair stand'
    2 = '2 Eligible and no recorded result for single chair stand'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE CH1RSH
    1 = '1 Eligible and recorded result for repeated chair stand'
    2 = '2 Eligible and no recorded result for repeated chair stand'
    3 = '3 Not administered because did not complete single chair stand w/o arms'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE GR1GRIP
    1 = '1 Eligible and recorded result for grip strength'
    2 = '2 Eligible and no recorded result for grip strength'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE WC1WAIST
    1 = '1 Eligible and recorded result for waist circumference'
    2 = '2 Eligible and no recorded result for waist circumference'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE PK1PEAK
    1 = '1 Eligible and recorded result for peak air flow'
    2 = '2 Eligible and no recorded result for peak air flow'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

 VALUE RGT_LFT
   1 = '1 Right'
   2 = '2 Left'
  -1 = '-1 Inapplicable'
  -9 = '-9 Missing';

 VALUE PERSON
    1 = '1 Interviewer'
    2 = '2 Sample person'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing';

 VALUE STAND
     1 = '1 Standing'
     2 = '2 Sitting'
     3 = '3 Lying down'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

 VALUE EFFORT
      1 = '1 Full effort'
      2 = '2 Less effort for health reason'
      3 = '3 Less effort for other reason'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';
    VALUE WORDREC
        1 = ' 1 LIST 1'
        2 = ' 2 LIST 2'
        3 = ' 3 LIST 3'
       -1 = '-1 Inapplicable '
       -9 = '-9 Missing';
    VALUE WORDRE_N
        -1 = '-1 Inapplicable'
        -2 = '-2 Proxy says cannot ask SP'
        -3 = '-3 Proxy says can ask SP but SP unable to answer'
        -7 = '-7 SP refused activity'
        -9 = '-9 Missing';


                VALUE SP30051W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EXCELLENT"
    2 = "2 VERY GOOD"
    3 = "3 GOOD"
    4 = "4 FAIR"
    5 = "5 POOR"
    6 = "6 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"
  ;
    VALUE SP3019aW
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"
  ;
  VALUE RACEHISP
        1 = ' 1 White, non-hispanic'
        2 = ' 2 Black, non-hispanic'
        3 = ' 3 Other (Am Indian/Asian/Native Hawaiian/Pacific Islander/other specify), non-Hispanic'
        4 = ' 4 Hispanic'
        5 = ' 5 More than one DKRF primary'
        6 = ' 6 DKRF'
       -9 = '-9 Missing';

    VALUE SPPB_MIS
       -7 = '-7 RF'
   -8 = '-8 DK'
   -9 = '-9 Missing'
    -1="-1 Inapplicable"
    1="1 Proxy interview"
    2="2 Missing walk and repeat chair and balance"
    3="3 Missing walk and repeat chair"
    4="4 Missing walk and balance"
    5="5 Missing repeat chair and balance"
    6="6 Missing walk"
    7="7 Missing repeat chair"
    8="8 Missing balance"
    9="9 No space"
    10="10 No chair"
    11="11 No space walk and no chair"
    12="12 No space walk and non-safety missing"
    13="13 No chair and non-safety missing"
    14="14 Non-safety walk"
    15="15 Non-safety chair"
    16="16 Non-safety balance"
    17="17 Non-safety walk and chair"
    18="18 Non-safety walk and balance"
    19="19 Non-safety chair and balance"
    20="20 Non-safety walk and chair and balance";

    VALUE QUARTILES
-9="-9 Missing"
-1="-1 Inapplicable"
;
  VALUE SP30025W
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE-STANDING (DETACHED) SINGLE HOUSE"
    2 = "2 SINGLE HOUSE BUT ATTACHED TO OTHERS (ROW HOUSE, TOWNHOUSE, DUPLEX, TRIPLEX, OR TRIPLE DECKER)"
    3 = "3 MOBILE HOME OR TRAILER"
    4 = "4 MULTI-UNIT (2+) BUILDING"
    91 = "91 OTHER (SPECIFY)"
  ;
    VALUE SP30046W
        -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
     1 = "1 AT SP'S HOME"
      2 = "2 IN A HOSPITAL"
      3 = "3 IN A NURSING HOME"
      4 = "4 IN A HOSPICE RESIDENCE"
      5 = "5 AT SOMEONE ELSE'S HOME"
      91 = "91 SOMEWHERE ELSE (SPECIFY)"
  ;
    VALUE SP30076W
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
      1 = "1 YES"
      2 = "2 NO"
      7 = "7 YES, DOESNT KNOW HOW TO USE"
  ;
    VALUE W300151W
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
      1 = "1 VERY GOOD"
      2 = "2 GOOD"
      3 = "3 FAIR"
      4 = "4 POOR"
    5 = "5 VERY POOR"  ;

      VALUE SP30076H
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
    95 = "95 NO USUAL NUMBER OF HOURS OR DIFFERENT FROM DAY TO DAY"  ;
      VALUE SP30076G
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
    95 = "95 NO USUAL TIME OR DIFFERENT FROM DAY TO DAY"  ;
          VALUE SP30076I
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
        95 = "95 NO USUAL NUMBER OF HOURS OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30076J
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
        95 = "95 NO USUAL TIME OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30076K
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
                   0 = "0 LESS THAN AN HOUR"
        90 = "90 FELL ASLEEP RIGHT AWAY"
        95 = "95 NO USUAL AMOUNT OF TIME TO FALL ASLEEP OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30155W
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
            1 = "1 NAPS PLANNED"
            2 = "2 FELL ASLEEP WITHOUT MEANING TO"
            3 = "3 BOTH (SOME PLANNED/SOME NOT)"  ;
  VALUE SP30120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OFTEN"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"  ;
Value HOURSF
 -13='-13 SP deceased/section not administered'
 -12='-12 Valid skip/staff'
 -11='-11 Hours missing'
 -10='-10 Days missing'
  -9='-9 Days and hrs missing'
  -1='-1 Inapplicable'
 0-  1='0-<1'
 1.01- 10='1-<10'
10.01- 20='10-<20'
20.01- 30='20-<30'
30.01-40='30-<40'
40.01-60='40-<60'
60.01-120='60-<120'
120.01-180='120-<180'
180.01-744='180-744 (24/7)'
9999='9999 Not codeable, <1 hour/day';
  VALUE SP30120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OFTEN"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"
  ;
  VALUE SP30118W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A LOT"
    2 = "2 SOME"
    3 = "3 A LITTLE"
    4 = "4 NOT AT ALL"  ;
  VALUE SP30141W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "less than $27,600,"
    2 = "$27,600-$41,999,"
    3 = "$42,000-$63,999,"
    4 = "$64,000-$107,999, or"
    5 = "$108,000 or more?"  ;
  VALUE SP30142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "less than $14,000,"
    2 = "$14,000-$21,999,"
    3 = "$22,000-$35,999,"
    4 = "$36,000-$48,999, or"
    5 = "$49,000 or more?"  ;
  VALUE INVENT
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
                104="104-Arthritis"
                107="107-Lung Disease"
                109="109-Dementia or Alzheimer's disease"
                110="110-Cancer"
                113="113-Other serious disease, illness, health problem"
                114="114-Knee surgery/problem"
                115="115-Hip repair or replacement/problem"
                117="117-Back or Spine Surgery/problem"
                121="121-Sleep Problems"
                201="201-Hearing problems"
                202="202-Sight problems"
                205="205-Pain"
                301="301-Breathing problems"
                302="302-Upper body strength movement"
                303="303-Lower body strength movement"
                304="304-Low energy"
                305="305-Balance or coordination problems"
                306="306-Walking distances"
                307="307-Climbing stairs"
                308="308-Lifting and carrying items"
                309="309-Kneeling"
                310="310-Bending"
                311="311-Reaching"
                312="312-Opening Jars"
                313="313-Grasping"
                401="401-Memory"
                501="501-Getting out of bed"
                502="502-Getting around inside"
                503="503-Getting outside"
                504="504-Travel/transportation"
                601="601-Eating"
                602="602-Washing"
                603="603-Toileting"
                604="604-Dressing"
                605="605-Grooming"
                701="701-Laundry"
                702="702-Shopping"
                703="703-Cooking"
                705="705-Money matters"
                706="706-Indoor cleaning and maintenance"
                707="707-Outdoor cleaning and maintenance"
                801="801-Medications"
                802="802-Doctor visits"
                804="804-Other medical self-care"
                1211="1211-Working"
                1442="1442-Walking/exercising pets"
                1451="1451-Vehicle repair and maintenance"
                1461="1461-Appliance tool, and toy use, set-up, repair, & maintenance"
                1462="1462-Computer use, set-up, repair, maintenance, and education"
                1473="1473-Household organization"
                1512="1512-Looking after someone else"
                1611="1611-Socializing and communicating with others-in person"
                1612="1612-Socializing and communication with others by talking on telephone"
                1613="1613-Attending or hosting party, wedding or social occasions"
                1614="1614-Reading and sorting through the mail"
                1621="1621-Watch television and movies"
                1631="1631-Games & puzzles"
                1641="1641-Arts and crafts, collecting, and hobbies, making music"
                1642="1642-Reading"
                1643="1642-Writing (personal, not on computer)"
                1644="1644-Listening to recorded music or radio"
                1711="1711-Playing/practicing sports or taking physical activity class/lessons"
                1712="1712-Walking/jogging for exercise or pleasure or working out"
                1713="1713-Other outdoor recreation activities"
                1813="1813-Religious & spiritual volunteer activities"
                1901="1901-Other, no existing code"
                1998="1998-Don't know"
                1999="1999-Refused/blank";
VALUE W500058W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MONTHS"
    2 = "2 YEARS"  ;
VALUE W500103W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 YES, A YEAR OR MORE"
    2 = "2 NO, LESS THAN A YEAR"  ;
  VALUE W500105W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MONTH AND YEAR"
    2 = "2 NUMBER OF MONTHS AGO"
    3 = "3 NUMBER OF YEARS AGO"
    4 = "4 AGE WHEN LAST DROVE"
    7 = "7 NEVER DROVE"  ;
VALUE W500123W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 STILL FAVORITE ACTIVITY"
    2 = "2 HAS A NEW FAVORITE ACTIVITY"
    95 = "95 NO FAVORITE ACTIVITY"   ;
VALUE W500124W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN 1 MONTH"
    2 = "2 1 TO 3 MONTHS"
    3 = "3 4 TO 5 MONTHS"
    4 = "4 6 OR MORE MONTHS" ;
  VALUE W500125W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN 1 WEEK"
    2 = "2 1 TO 2 WEEKS"
    3 = "3 3 TO 4 WEEKS"  ;
  VALUE W500126W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 A FRACTURE, SPRAIN, OR INJURY"
    2 = "2 A HIP, KNEE, OR OTHER JOINT REPLACEMENT"
    3 = "3 ANOTHER MUSCULOSKELETAL CONDITION"
    4 = "4 A STROKE OR TIA"
    5 = "5 A HEART ATTACK"
    6 = "6 ANOTHER HEART CONDITION OR VASCULAR DISEASE"
    7 = "7 A BREATHING CONDITION"
    8 = "8 A NEUROLOGICAL CONDITION LIKE MS OR PARKINSONS"
    9 = "9 CANCER"
    94 = "94 ANOTHER CONDITION (SPECIFY)"
    95 = "95 NO MEDICAL CONDITION (IF VOLUNTEERED)" ;
  VALUE W500128W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 DIFFICULTY CHEWING OR SWALLOWING"
    2 = "2 DIFFICULTY SPEAKING OR BEING UNDERSTOOD"
    3 = "3 PAIN LEVEL"
    4 = "4 PROBLEM WITH BREATHING"
    5 = "5 PROBLEM WITH STRENGTH (MUSCLE WEAKNESS)"
    6 = "6 PROBLEM WITH MOVEMENT (RANGE OF MOTION)"
    7 = "7 LOW ENERGY LEVEL"
    8 = "8 PROBLEM WITH BALANCE OR COORDINATION"
    9 = "9 PROBLEM WITH FALLS"
    10 = "10 PROBLEM WITH MEMORY"
    95 = "95 NONE OF THESE PROBLEMS"  ;
  VALUE W500131W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 AS AN OVERNIGHT PATIENT IN A HOSPITAL, NURSING HOME OR REHAD FACILITY"
    2 = "2 AT AN OUTPATIENT CENTER, CLINIC, DRs OR THERAPISTs OFFICE"
    3 = "3 HOME"
    4 = "4 SOMEWHERE ELSE"  ;
  VALUE W500132W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 IMPROVED"
    2 = "2 GOT WORSE"
    3 = "3 STAYED ABOUT THE SAME"
    4 = "4 VARIED/UP AND DOWN (IF VOLUNTEERED)"  ;
 VALUE W500133W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A LOT"
    2 = "2 SOMEWHAT"
    3 = "3 A LITTLE"  ;

  VALUE W500137W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 WELL OFF"
    2 = "2 ABOVE AVERAGE"
    3 = "3 AVERAGE"
    4 = "4 BELOW AVERAGE"
    5 = "5 POOR"  ;
VALUE W500010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MOTHER ONLY"
    2 = "2 FATHER ONLY"
    3 = "3 ANOTHER RELATIVE"
    4 = "4 NON-RELATIVES"
    5 = "5 VARIED/MOVED AROUND"  ;
  VALUE W500142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY WELL"
    2 = "2 WELL"
    3 = "3 NOT WELL"
    4 = "4 NOT AT ALL"  ;
  VALUE W500147W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 NUMBER OF YEARS"
    2 = "2 AGE"  ;
  VALUE W500150W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 ENTER PAYCHECK AMOUNT"
    2 = "2 ENTER PAY PER HOUR"
    3 = "3 ENTER PAY PER DAY"  ;
  VALUE W500151W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 ENTER OCCUPATION"
    2 = "2 NEVER WORKED ENTIRE LIFE"
    3 = "3 HOMEMAKER/RAISED CHILDREN/WORKED IN THE HOME"  ;
  VALUE W500152W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 SAME KIND OF WORK"
    2 = "2 SOMETHING DIFFERENT"  ;
  VALUE W500160W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MAIL"
    2 = "2 DIRECT DEPOSIT"
    3 = "3 PREPAID CARD"  ;
  VALUE W500165W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ENTER COMBINED AMOUNT"
    2 = "2 ENTER SP AND SPOUSE/PARTNER AMOUNTS SEPARATELY"  ;
  VALUE W500166W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,300"
    2 = "2 $1,300 TO LESS THAN $1,700"
    3 = "3 $1,700 TO LESS THAN $2,200"
    4 = "4 $2,200 TO LESS THAN $2,600"
    5 = "5 $2,600 OR MORE"  ;
  VALUE W500167W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN $700"
    2 = "2 $700 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $1,300"
    4 = "4 $1,300 TO LESS THAN $1,600"
    5 = "5 $1,600 OR MORE"  ;
  VALUE W500168W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $300"
    2 = "2 $300 TO LESS THAN $700"
    3 = "3 $700 TO LESS THAN $1,000"
    4 = "4 $1,000 OR MORE"   ;
  VALUE W500169W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN $100"
    2 = "2 $100 TO LESS THAN $200"
    3 = "3 $200 TO LESS THAN $400"
    4 = "4 $400 TO LESS THAN $700"
    5 = "5 $700 OR MORE"  ;
  VALUE W500170W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,000"
    2 = "2 $1,000 TO LESS THAN $1,400"
    3 = "3 $1,400 TO LESS THAN $1,800"
    4 = "4 $1,800 TO LESS THAN $2,200"
    5 = "5 $2,200 OR MORE"  ;
  VALUE W500171W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $500"
    2 = "2 $500 TO LESS THAN $700"
    3 = "3 $700 TO LESS THAN $900"
    4 = "4 $900 TO LESS THAN $1,100"
    5 = "5 $1,100 OR MORE"  ;
  VALUE W500172W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $600"
    2 = "2 $600 TO LESS THAN $1,300"
    3 = "3 $1,300 TO LESS THAN $2,100"
    4 = "4 $2,100 TO LESS THAN $5,900"
    5 = "5 $5,900 OR MORE"  ;
  VALUE W500173W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $400"
    2 = "2 $400 TO LESS THAN $900"
    3 = "3 $900 TO LESS THAN $1,600"
    4 = "4 $1,600 TO LESS THAN $3,800"
    5 = "5 $3,800 OR MORE"  ;
  VALUE W500174W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $34,000"
    2 = "2 $34,000 TO LESS THAN $82,000"
    3 = "3 $82,000 TO LESS THAN $175,000"
    4 = "4 $175,000 TO LESS THAN $413,000"
    5 = "5 $413,000 OR MORE"   ;
  VALUE W500175W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $20,000"
    2 = "2 $20,000 TO LESS THAN $47,000"
    3 = "3 $47,000 TO LESS THAN $92,000"
    4 = "4 $92,000 TO LESS THAN $218,000"
    5 = "5 $218,000 OR MORE"   ;
  VALUE W500176W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $200"
    2 = "2 $200 TO LESS THAN $500"
    3 = "3 $500 TO LESS THAN $1,000"
    4 = "4 $1,000 TO LESS THAN $2,500"
    5 = "5 $2,500 OR MORE"  ;
  VALUE W500177W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $100"
    2 = "2 $100 TO LESS THAN $300"
    3 = "3 $300 TO LESS THAN $700"
    4 = "4 $700 TO LESS THAN $1,700"
    5 = "5 $1,700 OR MORE"  ;
  VALUE W500178W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,400"
    2 = "2 $2,400 TO LESS THAN $6,000"
    3 = "3 $6,000 TO LESS THAN $12,000"
    4 = "4 $12,000 TO LESS THAN $30,000"
    5 = "5 $30,000 OR MORE"  ;
  VALUE W500179W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,200"
    2 = "2 $1,200 TO LESS THAN $3,600"
    3 = "3 $3,600 TO LESS THAN $8,400"
    4 = "4 $8,400 TO LESS THAN $20,400"
    5 = "5 $20,400 OR MORE"  ;
  VALUE W500180W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $9,000"
    2 = "2 $9,000 TO LESS THAN $18,000"
    3 = "3 $18,000 TO LESS THAN $93,000"
    4 = "4 $93,000 TO LESS THAN $350,000"
    5 = "5 $350,000 OR MORE"  ;
  VALUE W500181W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $600"
    2 = "2 $600 TO LESS THAN $5,000"
    3 = "3 $5,000 TO LESS THAN $16,000"
    4 = "4 $16,000 TO LESS THAN $62,000"
    5 = "5 $62,000 OR MORE"  ;
  VALUE W500182W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $8,000"
    2 = "2 $8,000 TO LESS THAN $62,000"
    3 = "3 $62,000 TO LESS THAN $192,000"
    4 = "4 $192,000 TO LESS THAN $213,000"
    5 = "5 $213,000 OR MORE"  ;
  VALUE W500183W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $300"
    2 = "2 $300 TO LESS THAN $2,500"
    3 = "3 $2,500 TO LESS THAN $8,000"
    4 = "4 $8,000 TO LESS THAN $37,000"
    5 = "5 $37,000 OR MORE"  ;
  VALUE W500184W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $11,000"
    2 = "2 $11,000 TO LESS THAN $25,000"
    3 = "3 $25,000 TO LESS THAN $50,000"
    4 = "4 $50,000 TO LESS THAN $108,000"
    5 = "5 $108,000 OR MORE"  ;
  VALUE W500185W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,000"
    2 = "2 $2,000 TO LESS THAN $7,000"
    3 = "3 $7,000 TO LESS THAN $17,000"
    4 = "4 $17,000 TO LESS THAN $57,000"
    5 = "5 $57,000 OR MORE"  ;
  VALUE W500186W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $8,000"
    2 = "2 $8,000 TO LESS THAN $13,000"
    3 = "3 $13,000 TO LESS THAN $28,000"
    4 = "4 $28,000 TO LESS THAN $54,000"
    5 = "5 $54,000 OR MORE"  ;
  VALUE W500187W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $500"
    2 = "2 $500 TO LESS THAN $1,900"
    3 = "3 $1,900 TO LESS THAN $5,000"
    4 = "4 $5,000 TO LESS THAN $20,000"
    5 = "5 $20,000 OR MORE"  ;
  VALUE W500188W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $200"
    2 = "2 $200 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $4,000"
    4 = "4 $4,000 TO LESS THAN $16,000"
    5 = "5 $16,000 OR MORE"  ;
  VALUE W500189W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $400"
    2 = "2 $400 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $2,000"
    4 = "4 $2,000 TO LESS THAN $11,000"
    5 = "5 $11,000 OR MORE"  ;
  VALUE W500190W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $30,000"
    2 = "2 $30,000 TO LESS THAN $101,000"
    3 = "3 $101,000 TO LESS THAN $247,000"
    4 = "4 $247,000 TO LESS THAN $703,000"
    5 = "5 $703,000 OR MORE"  ;
  VALUE W500191W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $18,000"
    2 = "2 $18,000 TO LESS THAN $68,000"
    3 = "3 $68,000 TO LESS THAN $122,000"
    4 = "4 $122,000 TO LESS THAN $293,000"
    5 = "5 $293,000 OR MORE"  ;
  VALUE W500192W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $3,600"
    2 = "2 $3,600 TO LESS THAN $12,000"
    3 = "3 $12,000 TO LESS THAN $25,000"
    4 = "4 $25,000 TO LESS THAN $64,000"
    5 = "5 $64,000 OR MORE"  ;
  VALUE W500193W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $3,600"
    2 = "2 $3,600 TO LESS THAN $7,200"
    3 = "3 $7,200 TO LESS THAN $14,000"
    4 = "4 $14,000 TO LESS THAN $38,000"
    5 = "5 $38,000 OR MORE"  ;
  VALUE W500194W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $30,000"
    2 = "2 $30,000 TO LESS THAN $43,000"
    3 = "3 $43,000 TO LESS THAN $66,000"
    4 = "4 $66,000 TO LESS THAN $109,000"
    5 = "5 $109,000 OR MORE"  ;
  VALUE W500195W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $18,000"
    2 = "2 $18,000 TO LESS THAN $22,000"
    3 = "3 $22,000 TO LESS THAN $36,000"
    4 = "4 $36,000 TO LESS THAN $56,000"
    5 = "5 $56,000 OR MORE" ;
  VALUE W500209W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 CANT DO - DONT DO"  ;
  VALUE W500196W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,500"
    2 = "2 $2,500 TO LESS THAN $5,000"
    3 = "3 $5,000 TO LESS THAN $10,000"
    4 = "4 $10,000 TO LESS THAN $20,000"
    5 = "5 $20,000 TO LESS THAN $50,000"
    6 = "6 $50,000 OR MORE"  ;
  VALUE dage2us
        0 = "0 Less than age 1"
        997 = "997 Born in US"
    -8 = "-8 DK"
    -7 = "-7 RF"
    -1 = "-1 Inapplicable";
  VALUE locsp
     -9 ="-9 MISSING"
    -8 ="-8 DK"
    -7 ="-7 RF"
    -1 ="-1 Inapplicable"
    1 = "1 Independent Living"
    2 = "2 Assisted Living"
    3 = "3 Special Care Unit"
    4 = "4 Nursing Home"
    8 = "8 Not Reported" ;

    VALUE resid
   -9 = '-9 Missing'
        -8 = "-8 DK"
        -7 = "-7 RF"
        -1 = "-1 Inapplicable"
        1 = "Community"
        2 = "Residential care not nursing home (SP interview)"
        3 = "Residential care not nursing home (FQ only)"
        4 = "Nursing home (SP interview)"
        5 = "Nursing home (FQ only)"
        6 = "Deceased"
        7 = "Residential care not nursing home in R1 and R2 (FQ only)"
        8 = "Nursing home in R1 and R2 (FQ only)";

    VALUE  residlml
        1 = "1 Community"
        2 = "2 Residential care"
        -1 = "-1 Inapplicable"
   -9 = '-9 Missing';

  VALUE SP50139W
    1 = "1 White/Caucasian"
    2 = "2 Black/African American"
    3 = "3 Other"
      -7 = '-7 RF'
      -8 = '-8 DK'
   -9 = '-9 Missing';

  VALUE Locat15w
          1= "1 Lives in same City and State as at age 15"
          2= "2 Lives in same state but different City (or DKRF city) as age 15"
          3= "3 Does not live in same State as age 15"
      -1= "-1 Inapplicable"
      -7 = '-7 RF'
      -8 = '-8 DK'
          -9 = '-9 Missing';
  Value  dresnew
         1 = "1 same residence as last int"
         2 = "2 new residence since last int"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';

   Value dcontnew
         1 = "1 Continuing sample from R1"
         2 = "2 New sample in R5"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';

     VALUE DMDDEVYR
      1 = ' 1 No Mobility device use in last year/since last interview'
      2 = ' 2 Mobility device use in last year/since last interview'
     -1 = '-1 Inapplicable '
     -7  = '-7 RF'
     -8  = '-8 DK'
     -9 = '-9 Missing';

    VALUE DMDEVST
     0 = '0 less than 1 month of mobility device use'
     1 = '1 month of mobility device use'
     2 = '2 months of mobility device use'
     3 = '3 months of mobility device use'
     4 = '4 months of mobility device use'
     5 = '5 months of mobility device use'
     6 = '6 months of mobility device use'
     7 = '7 months of mobility device use'
     8 = '8 months of mobility device use'
     9 = '9 months of mobility device use'
    10 = '10 months of mobility device use'
    11 = '11 months of mobility device use'
    -7 = '-7 used last month but RF number of months of use in year'
    -8 = '-8 used last month but DK number of months of use in year'
    -1 = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample';

     VALUE DMDEVEND
         0 = '0 Between 11 and 12 months since device use ended'
     1 = '1 month since mobility device use ended'
     2 = '2 months since mobility device use ended'
     3 = '3 months since mobility device use ended'
     4 = '4 months since mobility device use ended'
     5 = '5 months since mobility device use ended'
     6 = '6 months since mobility device use ended'
     7 = '7 months since mobility device use ended'
     8 = '8 months since mobility device use ended'
     9 = '9 months since mobility device use ended'
    10 = '10 months since mobility device use ended'
    11 = '11 months since mobility device use ended'
    -7 = '-7 no use last month and RF number of months since device use ended'
    -8 = '-8 no use last month and DK number of months since device use ended'
    -1 = '-1 Inapplicable '
        -2 = '-2 Not asked of continuing sample' ;
     VALUE DMDHLPYR
     1 = " 1 No mobility help in last year/since last interview"
     2 = " 2 Mobility help in last year/since last interview"
    -7 = " -7 RF"
    -8 = " -8 DK"
    -1 = " -1 Inapplicable "
                -2 = '-2 Not asked of continuing sample' ;

     VALUE DMDHLPST
      0 = '0 less than 1 month of help'
      1 = '1 month of help'
      2 = '2 months of help'
      3 = '3 months of help'
      4 = '4 months of help'
      5 = '5 months of help'
      6 = '6 months of help'
      7 = '7 months of help'
      8 = '8 months of help'
      9 = '9 months of help'
     10 = '10 months of help'
     11 = '11 months of help'
     -7 = '-7 help last month but RF number of months of help in year'
     -8 = '-8 help last month but DK number of months of help in year'
    -1 = " -1 Inapplicable "
    -2 = " -2 Not asked of continuing sample ";
     VALUE DMDHLPEN
      0 = '0 less than 1 month since help ended'
      1 = '1 month since help ended'
      2 = '2 months since help ended'
      3 = '3 months since help ended'
      4 = '4 months since help ended'
      5 = '5 months since help ended'
      6 = '6 months since help ended'
      7 = '7 months since help ended'
      8 = '8 months since help ended'
      9 = '9 months since help ended'
     10 = '10 months since help ended'
     11 = '11 months since help ended'
     -7 = '-7 no help last month and RF number of months since help ended'
     -8 = '-8 no help last month and DK number of months since help ended'
     -1 = '-1 Inapplicable '
    -2 = '-2 Not asked of continuing sample';
    VALUE DMHLPYRS
     0   = '0 none or less than 1 year'
     997 = '997 since birth'
     -7  = '-7 RF'
     -8  = '-8 DK'
     -1  = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample'
    -9  = '-9 Missing';
    VALUE DSDHLPYR
    1 = ' 1 No self care help in last year/since last interview'
    2 = ' 2 Self care help in last year/since last interview'
   -1 = '-1 Inapplicable'
   -7 = '-7 DK'
   -8 = '-8 RF'
   -9 = '-9 Missing';
    VALUE DSHLPND
                0 = ' 0 Between 11 and 12 months since self care help ended'
                1 = '1 Month since self care help ended'
                2 = '2 Months since self care help ended'
                3 = '3 Months since self care help ended'
                4 = '4 Months since self care help ended'
                5 = '5 Months since self care help ended'
                6 = '6 Months since self care help ended'
                7 = '7 Months since self care help ended'
                8 = '8 Months since self care help ended'
                9 = '9 Months since self care help ended'
                10 = '10 Months since self care help ended'
                11 = '11 Months since self care help ended'
        -7 = '-7 No help last month and RF number of months since help ended'
        -8 = '-8 No help last month and DK number of months since help ended'
        -1 = '-1 Inapplicable'
                -2 = '-2 Not asked of continuing sample'
        -9 = '-9 Missing'    ;

    VALUE DSHLPYRS
         0 = ' 0 None or less than 1 year of self care help'
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
                -2 = '-2 Not asked of continuing sample'
        -9 = '-9 Missing'
             997 = '997 since birth';
        VALUE SP5RH7W
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
        -9 = '-9 Missing'
                1 = "1 As an overnight patient in a hospital, nursing home, or rehab facility"
                2 = "2 At an outpatient center, clinic, or doctors office or therapists office"
        3 = "3 At home"
        4 = "4 Somewhere else"  ;
        VALUE SP5LF5W
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
        -9 = '-9 Missing'
        997 = "997 Number of hours vary each week"  ;

      VALUE  DMH_GRP
            1 = "1 Help started"
            2 = "2 Help ended"
            3 = "3 Help both interviews with gap"
            4 = "4 Help both interviews with no gap"
            5 = "5 Help between interviews only"
            6 = "6 No help either interview or between"
           11 = "11 Help started (month started missing)"
           21 = "21 Help ended (month ended missing)"
           41 = "41 Help both interviews (DK whether gap)"
           61 = "61 No help either interview (DK whether help between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 ="-3 Not asked of new sample"
         -999 = "-999 Not determined" ;

        VALUE  DMU_GRP
            1 = "1 Use started"
            2 = "2 Use ended"
            3 = "3 Use both interviews with gap"
            4 = "4 Use both interviews with no gap"
            5 = "5 Use between interviews only "
            6 = "6 No use either interview or between"
           11 = "11 Use started (month started missing)"
           21 = "21 Use ended (month ended missing)"
           41 = "41 Use both interviews (DK whether gap)"
           61 = "61 No use either interview (DK whether use between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 = "-3 Not asked of new sample"
         -999 = "-999 Not determined" ;

                VALUE  DMDS5FLG
            -1 = "-1 Inapplicable"
                        -3 = "-3 Not asked of new sample"
             0 = "0 No current SP interview"
             1 = "1 No SP interview last round"
             2 = "2 Died and month death missing"
             3 = "3 Died <=1 month after last interview"
             4 = "4 Died 12-13 months after last interview"
             7 = "7 Skipped 1 or more help questions" ;
                VALUE  DS_GRP
            1 = "1 Help started"
            2 = "2 Help ended"
            3 = "3 Help both interviews with gap"
            4 = "4 Help both interviews with no gap"
            5 = "5 Help between interviews only"
            6 = "6 No help either interview or between"
           11 = "11 Help started (month started missing)"
           21 = "21 Help ended (month ended missing)"
           41 = "41 Help both interviews (DK whether gap)"
           61 = "61 No help either interview (DK whether help between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 = "-3 Not asked of new sample"
         -999 = "-999 Not determined" ;


                   value groupmo 1 = "1 Started"
                         2 = "2 Ended"
                     3 = "3 Both times with gap"
                     4 = "4 Both times no gap"
                         5 = "5 Between only (end missing)"
                     6 = "6 Neither time AND not between"
                    11 = "11 Started (start missing)"
                    21 = "21 Ended (end missing)"
                    41 = "41 Both times (gap missing)"
                    61 = "61 Neither time (between missing)"
                                -1= "-1 Inapplicable"
                                        -3="-3 Not asked of new sample"
                          -7= "-7 RF"
                          -8= "-8 DK"
                          -9= "-9 Missing"
                  -999 = "-999 Not determined"
                   -99 = "-99 Partial" ;

                        VALUE nw_mths  0 = "0 Less than 1 month"
             1 ="1 month"
             2 ="2 months"
             3 ="3 months"
             4 ="4 months"
             5 ="5 months"
             6 ="6 months"
             7 ="7 months"
             8 ="8 months"
             9 ="9 months"
             10= "10 months"
             11= "11 months"
             12= "12 months"
             13= "13 months"
             14= "14 months"
             15= "15 months"
             16= "16 months"
             17= "17 months"
             18= "18 months"
             19= "19 months"
             20= "20 months"
             90= "90 Last round disputed"
             999= "999 No months"
             -1= "-1 Inapplicable"
                         -3="-3 Not asked of new sample"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing"
             -10= "-10 Not ascertained"
             -12= "-12 Outside of range (greater than months between interviews)"
             -13= "-13 None"
             -999= "-999 Not determined"
             -99= "-99 Partial";
                        VALUE chntinhh
             1 ="1 Yes, not in household"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";
                Value d4mssadd
-1='-1 Inapplicable'
 0='0 no flags and added at undetermined section'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section'
12='12 no flags and added at CS section'
13='13 no flags and added at HH section'
14='14 no flags and added at IS section'
15='15 no flags and added at HL section'
16='16 no flags and added at SL section';
                VALUE HA5DWHL
                        1 = "1 Meals on wheels last month"
                        -1 = "-1 Inapplicable";
                VALUE HA5DTKO
                        1 = "1 Restaurant or take out last month"
                        -1 = "-1 Inapplicable";
                VALUE RE5BLDG
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
VALUE S000163W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 SOCIALIZE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";

  VALUE S000164W
    1 = "1 SOCIALIZE MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";

  VALUE S000165W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000166W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000167W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000168W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000169W
    1 = "1 SOCIALIZING MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000170W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 SOCIALIZING MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000171W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000172W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000173W
    1 = "1 SOCIALIZING MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000174W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 SOCIALIZING MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000175W
    1 = "1 LESS THAN 1 HOUR"
    2 = "2 MORE THAN 1 HOUR"
    3 = "3 ABOUT 1 HOUR"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000176W
    1 = "1 LESS THAN 15 MINUTES"
    2 = "2 15 MINUTES"
    3 = "3 BETWEEN 15 AND 30 MINUTES"
    4 = "4 30 MINUTES"
    5 = "5 BETWEEN 30 AND 45 MINUTES"
    6 = "6 45 MINUTES"
    7 = "7 BETWEEN 45 AND 60 MINUTES"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000177W
    1 = "1 ABOUT 1  HOURS"
    2 = "2 ABOUT 2 HOURS"
    3 = "3 ABOUT 3 HOURS"
    4 = "4 ABOUT 4 HOURS"
    5 = "5 ABOUT 5 HOURS"
    6 = "6 6 OR MORE HOURS"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

     VALUE W600001W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 STRONGLY AGREE"
    2 = "2 AGREE"
    3 = "3 DISAGREE"
        4 = "4 STRONGLY DISAGREE";
     VALUE W600002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    0 = "0 NONE"
    1 = "1 1-2"
    2 = "2 3-5"
    3 = "3 6-10"
    4 = "4 11-15"
    5 = "5 16-20"
    6 = "6 MORE THAN 20";
     VALUE W600003W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A (picture showing 4 pills)"
    2 = "2 B (picture showing 8 pills)"
    3 = "3 C (picture showing 12 pills)"
    4 = "4 D (picture showing 16 pills)"
    5 = "5 E (picture showing 20 pills)"
    6 = "6 F (picture showing 24 pills)";

          VALUE YNF
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No";
          VALUE FQ6DLOCA
        1 = "1 Independent Living"
    2 = "2 Assisted Living"
    3 = "3 Special Care Unit"
    4 = "4 Nursing home"
        -8 = "-8 Not reported"
        -1 = "-1 Inapplicable";
           VALUE R6DRES1A
    1 = '1 Community'
    2 = '2 Residential Care'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
                        VALUE SP30023W
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
                        VALUE RE5BLDG
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
         VALUE WORDRECC
        -1 = '-1 Inapplicable'
        -2 = '-2 Proxy says cannot ask SP'
        -3 = '-3 Proxy says can ask SP but SP unable to answer'
        -7 = '-7 SP refused activity'
        -9 = '-9 Missing';
            VALUE OLDMTHS
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
            VALUE MONTHS
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
                        VALUE  FLAGS
            -1 = "-1 Inapplicable"
                        -3 = "-3 Not asked of new sample"
             0 = "0 No current SP interview"
             1 = "1 No SP interview last round"
             2 = "2 Died and month death missing"
             3 = "3 Died <=1 month after last interview"
             4 = "4 Died 12-13 months after last interview"
             7 = "7 Skipped 1 or more help questions" ;
    VALUE DMDEVUSE
     0   = '0 none or less than 1 year'
     997 = '997 since birth'
     -7  = '-7 RF'
     -8  = '-8 DK'
     -1  = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample'
    -9  = '-9 Missing';
    VALUE SPPB_MISSING
       -7 = '-7 RF'
   -8 = '-8 DK'
   -9 = '-9 Missing'
    -1="-1 Inapplicable"
    1="1 Proxy interview"
    2="2 Missing walk and repeat chair and balance"
    3="3 Missing walk and repeat chair"
    4="4 Missing walk and balance"
    5="5 Missing repeat chair and balance"
    6="6 Missing walk"
    7="7 Missing repeat chair"
    8="8 Missing balance"
    9="9 No space"
    10="10 No chair"
    11="11 No space walk and no chair"
    12="12 No space walk and non-safety missing"
    13="13 No chair and non-safety missing"
    14="14 Non-safety walk"
    15="15 Non-safety chair"
    16="16 Non-safety balance"
    17="17 Non-safety walk and chair"
    18="18 Non-safety walk and balance"
    19="19 Non-safety chair and balance"
    20="20 Non-safety walk and chair and balance";
  VALUE W700BC2W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Ineligible'
   -9 = '-9 Missing'
    1 = "1 Eligible and consented"
    2 = "2 Eligible and did not consent"
    3 = "3 Ineligible, proxy respondent";
run;
/* Section #2 - Input statement with variable name and location on the .txt file
                Reminder - change  to reflect your file locations       */
Data spfile;
INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS\NHATS_Round_7_SP_File.txt"
LRECL=4674 ;
INPUT @1 spid 8.
@9 r7dlmlint 2.
@11 r7dresid 2.
@13 r6dresid 2.
@15 r5dresid 2.
@17 r4dresid 2.
@19 r3dresid 2.
@21 r2dresid 2.
@23 r1dresid 2.
@25 r7dresidlml 2.
@27 r5dcontnew 2.
@29 r7breakoffst 8.
@37 r7breakoffqt $8.
@45 is7resptype 2.
@47 is7reasnprx1 2.
@49 is7reasnprx2 2.
@51 is7reasnprx3 2.
@53 is7reasnprx4 2.
@55 is7reasnprx5 2.
@57 is7reasnprx6 2.
@59 is7reasnprx7 2.
@61 is7reasnprx9 2.
@63 is7tempres 2.
@65 is7prxyrelat 2.
@67 is7prxygendr 2.
@69 is7famrrutin 2.
@71 is7proxlivsp 2.
@73 r5dgender 2.
@75 rl5dracehisp 2.
@77 r7d2intvrage 3.
@80 is7dproxyid $3.
@83 fl7spdied 2.
@85 re7spadrsnew 2.
@87 re7intplace 2.
@89 re7newstrct 2.
@91 re7newblgfl 2.
@93 re7mthmove 2.
@95 re7yearmove 4.
@99 re7placedec 2.
@101 re7alonedec 2.
@103 re7dresistrct 2.
@105 re7dbldg 2.
@107 re7dcensdiv 2.
@109 re7dresnew 2.
@111 fl7structure 2.
@113 fl7resnew 2.
@115 fl7facility 2.
@117 fl7hotype 2.
@119 fl7retirecom 2.
@121 pd7placedied 2.
@123 pd7homedied 2.
@125 pd7hospdied 2.
@127 pd7hospice1 2.
@129 pd7hospice2 2.
@131 pd7stayunit 2.
@133 pd7staydays 3.
@136 pd7staywks 2.
@138 pd7staymths 2.
@140 pd7stayyrs 2.
@142 pd7staymthpl 2.
@144 pd7placepre 2.
@146 pd7hospcelml 2.
@148 pd7alert 2.
@150 pd7outbed 2.
@152 r7d2deathage 3.
@155 fl7notalert 2.
@157 fl7notmobile 2.
@159 lm7pain 2.
@161 lm7painhlp 2.
@163 lm7painhlpam 2.
@165 lm7bre 2.
@167 lm7brehlp 2.
@169 lm7brehlpam 2.
@171 lm7sad 2.
@173 lm7sadhlp 2.
@175 lm7sadhlpam 2.
@177 lm7caredecis 2.
@179 lm7carenowan 2.
@181 lm7perscare 2.
@183 lm7respect 2.
@185 lm7informed 2.
@187 lm7doctor 2.
@189 lm7docclear 2.
@191 lm7relg 2.
@193 lm7relgamt 2.
@195 lm7ratecare 2.
@197 hc7health 2.
@199 hc7disescn1 2.
@201 hc7disescn2 2.
@203 hc7disescn3 2.
@205 hc7disescn4 2.
@207 hc7disescn5 2.
@209 hc7disescn6 2.
@211 hc7disescn7 2.
@213 hc7disescn8 2.
@215 hc7disescn9 2.
@217 hc7disescn10 2.
@219 hc7cancerty1 2.
@221 hc7brokebon1 2.
@223 hc7brokebon2 2.
@225 hc7hosptstay 2.
@227 hc7hosovrnht 3.
@230 hc7knesrgyr 2.
@232 hc7hipsrgyr 2.
@234 hc7catrsrgyr 2.
@236 hc7backsrgyr 2.
@238 hc7hartsrgyr 2.
@240 hc7fllsinmth 2.
@242 hc7worryfall 2.
@244 hc7worrylimt 2.
@246 hc7faleninyr 2.
@248 hc7multifall 2.
@250 hc7depresan1 2.
@252 hc7depresan2 2.
@254 hc7depresan3 2.
@256 hc7depresan4 2.
@258 hc7aslep30mn 2.
@260 hc7trbfalbck 2.
@262 hc7sleepmed 2.
@264 ht7placedesc 2.
@266 ht7retiresen 2.
@268 ht7diffareun 2.
@270 ht7helpmedbd 2.
@272 ht7meals 2.
@274 ht7spacename 2.
@276 se7servcoff1 2.
@278 se7servcoff2 2.
@280 se7servcoff3 2.
@282 se7servcoff4 2.
@284 se7servcoff5 2.
@286 se7servcoff6 2.
@288 se7servcoff7 2.
@290 se7servcoff10 2.
@292 se7servcoff11 2.
@294 se7servcoff8 2.
@296 se7servcoff9 2.
@298 se7servcoff12 2.
@300 se7servcoff13 2.
@302 se7servused1 2.
@304 se7servused2 2.
@306 se7servused3 2.
@308 se7servused4 2.
@310 se7servused5 2.
@312 se7servused6 2.
@314 se7servused7 2.
@316 se7servused10 2.
@318 se7servused11 2.
@320 se7servused8 2.
@322 se7servused9 2.
@324 se7servused12 2.
@326 se7servused13 2.
@328 se7payservi1 2.
@330 se7payservi2 2.
@332 se7payservi3 2.
@334 se7payservi4 2.
@336 se7payservi5 2.
@338 se7payservi6 2.
@340 se7payservi7 2.
@342 se7payservi10 2.
@344 se7payservi11 2.
@346 se7payservi8 2.
@348 se7payservi9 2.
@350 se7payservi12 2.
@352 se7payservi13 2.
@354 hh7marchange 2.
@356 hh7martlstat 2.
@358 hh7dmarstat 2.
@360 hh7yrendmarr 4.
@364 hh7newspoprt 2.
@366 hh7spgender 2.
@368 hh7dspageall 2.
@370 hh7spouseduc 2.
@372 hh7spoupchlp 2.
@374 hh7livwthspo 2.
@376 hh7placekind 2.
@381 hh7dlvngarrg 2.
@383 hh7dhshldnum 2.
@385 hh7dhshldchd 2.
@387 hh7dspouseid $3.
@390 cs7sistrsnum 2.
@392 cs7brthrsnum 2.
@394 cs7dnumchild 2.
@396 cs7dnmstpchd 2.
@398 cs7dnumdaugh 2.
@400 cs7dnumson 2.
@402 sn7dnumsn 2.
@404 fl7noonetalk 2.
@406 ho7entrstair 2.
@408 ho7entrccomn 2.
@410 ho7entrnramp 2.
@412 ho7bldgamen1 2.
@414 ho7bldgamen2 2.
@416 ho7bldgamen3 2.
@418 ho7bldgamen4 2.
@420 ho7levelsflr 2.
@422 ho7homeamen1 2.
@424 ho7homeamen2 2.
@426 ho7homeamen3 2.
@428 ho7bathprivt 2.
@430 ho7bathamen1 2.
@432 ho7bathamen2 2.
@434 ho7bathamen3 2.
@436 ho7bathamen4 2.
@438 ho7bathamen5 2.
@440 ho7bathamen6 2.
@442 ho7bathamen7 2.
@444 ho7kitchnprv 2.
@446 ho7kitchncom 2.
@448 ho7microwave 2.
@450 ho7dbldg1 2.
@452 ho7dbldg2 2.
@454 ho7dbldg3 2.
@456 ho7dbldg4 2.
@458 ho7dbathprvt 2.
@460 ho7dkitchnpr 2.
@462 ho7dkitchnco 2.
@464 fl7bathgrbbr 2.
@466 fl7bathseat 2.
@468 fl7raisedtlt 2.
@470 fl7tltgrbbr 2.
@472 em7modhere1 2.
@474 em7addlstyr1 2.
@476 em7addlstyr2 2.
@478 em7addlstyr3 2.
@480 em7addlstyr4 2.
@482 em7addlstyr5 2.
@484 em7addlstyr6 2.
@486 em7addlstyr7 2.
@488 em7payyufam1 2.
@490 em7payyufam2 2.
@492 em7payyufam3 2.
@494 em7payyufam4 2.
@496 em7payyufam5 2.
@498 em7payyufam6 2.
@500 em7payyufam7 2.
@502 em7paydevce1 2.
@504 em7paydevce2 2.
@506 em7paydevce3 2.
@508 em7paydevce4 2.
@510 em7paydevce5 2.
@512 em7paydevce6 2.
@514 em7paydevce7 2.
@516 em7paydevce8 2.
@518 em7paydevce9 2.
@520 em7payaltgth 2.
@522 em7morls1000 2.
@524 em7morls100 2.
@526 cm7knowwell 2.
@528 cm7willnghlp 2.
@530 cm7peoptrstd 2.
@532 te7cellphone 2.
@534 te7othrphone 2.
@536 te7computer 2.
@538 te7compoth 2.
@540 te7tablet 2.
@542 te7emailtext 2.
@544 te7oftnemail 2.
@546 te7online 2.
@548 te7shoponli1 2.
@550 te7shoponli2 2.
@552 te7shoponli3 2.
@554 te7socialnet 2.
@556 te7intrntmd1 2.
@558 te7intrntmd2 2.
@560 te7intrntmd3 2.
@562 md7canewlker 2.
@564 md7cane 2.
@566 md7walker 2.
@568 md7wheelchar 2.
@570 md7whelcrspc 2.
@572 md7scooter 2.
@574 md7scterinsp 2.
@576 fl7cane 2.
@578 fl7walker 2.
@580 fl7wheelchr 2.
@582 fl7whlchrhom 2.
@584 fl7scooter 2.
@586 fl7scooterhm 2.
@588 ss7heringaid 2.
@590 ss7hearphone 2.
@592 ss7convwradi 2.
@594 ss7convquiet 2.
@596 ss7glasseswr 2.
@598 ss7seewellst 2.
@600 ss7seestvgls 2.
@602 ss7glasscls 2.
@604 ss7othvisaid 2.
@606 ss7glrednewp 2.
@608 ss7probchswl 2.
@610 ss7probspeak 2.
@612 ss7painbothr 2.
@614 ss7painlimts 2.
@616 ss7painmedof 2.
@618 ss7painwhe1 2.
@620 ss7painwhe2 2.
@622 ss7painwhe3 2.
@624 ss7painwhe4 2.
@626 ss7painwhe5 2.
@628 ss7painwhe6 2.
@630 ss7painwhe7 2.
@632 ss7painwhe8 2.
@634 ss7painwhe9 2.
@636 ss7painwhe10 2.
@638 ss7painwhe11 2.
@640 ss7painwhe12 2.
@642 ss7painwhe13 2.
@644 ss7probbreat 2.
@646 ss7prbbrlimt 2.
@648 ss7strnglmup 2.
@650 ss7uplimtact 2.
@652 ss7lwrbodstr 2.
@654 ss7lwrbodimp 2.
@656 ss7lowenergy 2.
@658 ss7loenlmtat 2.
@660 ss7prbbalcrd 2.
@662 ss7prbbalcnt 2.
@664 fl7deaf 2.
@666 fl7blind 2.
@668 pc7walk6blks 2.
@670 pc7walk3blks 2.
@672 pc7up20stair 2.
@674 pc7up10stair 2.
@676 pc7car20pnds 2.
@678 pc7car10pnds 2.
@680 pc7geonknees 2.
@682 pc7bendover 2.
@684 pc7hvobovrhd 2.
@686 pc7rechovrhd 2.
@688 pc7opnjarwhd 2.
@690 pc7grspsmobj 2.
@692 cp7memrygood 2.
@694 cp7knownspyr 2.
@696 cp7chgthink1 2.
@698 cp7chgthink2 2.
@700 cp7chgthink3 2.
@702 cp7chgthink4 2.
@704 cp7chgthink5 2.
@706 cp7chgthink6 2.
@708 cp7chgthink7 2.
@710 cp7chgthink8 2.
@712 cp7memcogpr1 2.
@714 cp7memcogpr2 2.
@716 cp7memcogpr3 2.
@718 cp7memcogpr4 2.
@720 cp7dad8dem 2.
@722 cg7speaktosp 2.
@724 cg7quesremem 2.
@726 cg7reascano1 2.
@728 cg7reascano2 2.
@730 cg7reascano3 2.
@732 cg7reascano4 2.
@734 cg7reascano5 2.
@736 cg7reascano6 2.
@738 cg7reascano7 2.
@740 cg7reascano8 2.
@742 cg7reascano9 2.
@744 cg7ratememry 2.
@746 cg7ofmemprob 2.
@748 cg7memcom1yr 2.
@750 cg7todaydat1 2.
@752 cg7todaydat2 2.
@754 cg7todaydat3 2.
@756 cg7todaydat5 2.
@758 cg7todaydat4 2.
@760 cg7todaydat6 2.
@762 cg7prewrdrcl 2.
@764 cg7dwrdlstnm 2.
@766 cg7wrdsrcal1 2.
@768 cg7wrdsrcal2 2.
@770 cg7wrdsrcal3 2.
@772 cg7wrdsrcal4 2.
@774 cg7wrdsrcal5 2.
@776 cg7wrdsrcal6 2.
@778 cg7wrdsrcal7 2.
@780 cg7wrdsrcal8 2.
@782 cg7wrdsrcal9 2.
@784 cg7wrdsrcal10 2.
@786 cg7dwrdimmrc 2.
@788 cg7dwrdinone 2.
@790 cg7dwrdirref 2.
@792 cg7wrdsntlst 2.
@794 cg7numnotlst 2.
@796 cg7probreca1 2.
@798 cg7probreca2 2.
@800 cg7probreca3 2.
@802 cg7probreca4 2.
@804 cg7probreca5 2.
@806 cg7dclkdraw 2.
@808 cg7dclkimgcl 2.
@810 cg7atdrwclck 2.
@812 cg7presidna1 2.
@814 cg7presidna2 2.
@816 cg7presidna3 2.
@818 cg7presidna4 2.
@820 cg7vpname1 2.
@822 cg7vpname2 2.
@824 cg7vpname3 2.
@826 cg7vpname4 2.
@828 cg7wrdsdcal1 2.
@830 cg7wrdsdcal2 2.
@832 cg7wrdsdcal3 2.
@834 cg7wrdsdcal4 2.
@836 cg7wrdsdcal5 2.
@838 cg7wrdsdcal6 2.
@840 cg7wrdsdcal7 2.
@842 cg7wrdsdcal8 2.
@844 cg7wrdsdcal9 2.
@846 cg7wrdsdca10 2.
@848 cg7dwrddlyrc 2.
@850 cg7dwrddnone 2.
@852 cg7dwrddrref 2.
@854 cg7wrdnotlst 2.
@856 cg7numwrdnot 2.
@858 cg7dwrd1rcl 2.
@860 cg7dwrd2rcl 2.
@862 cg7dwrd3rcl 2.
@864 cg7dwrd4rcl 2.
@866 cg7dwrd5rcl 2.
@868 cg7dwrd6rcl 2.
@870 cg7dwrd7rcl 2.
@872 cg7dwrd8rcl 2.
@874 cg7dwrd9rcl 2.
@876 cg7dwrd10rcl 2.
@878 cg7dwrd1dly 2.
@880 cg7dwrd2dly 2.
@882 cg7dwrd3dly 2.
@884 cg7dwrd4dly 2.
@886 cg7dwrd5dly 2.
@888 cg7dwrd6dly 2.
@890 cg7dwrd7dly 2.
@892 cg7dwrd8dly 2.
@894 cg7dwrd9dly 2.
@896 cg7dwrd10dly 2.
@898 mo7outoft 2.
@900 mo7outcane 2.
@902 mo7outwalkr 2.
@904 mo7outwlchr 2.
@906 mo7outsctr 2.
@908 mo7outhlp 2.
@910 mo7outslf 2.
@912 mo7outdif 2.
@914 mo7outyrgo 2.
@916 mo7outwout 2.
@918 mo7oftgoarea 2.
@920 mo7oflvslepr 2.
@922 mo7insdcane 2.
@924 mo7insdwalkr 2.
@926 mo7insdwlchr 2.
@928 mo7insdsctr 2.
@930 mo7oftholdwl 2.
@932 mo7insdhlp 2.
@934 mo7insdslf 2.
@936 mo7insddif 2.
@938 mo7insdyrgo 2.
@940 mo7insdwout 2.
@942 mo7beddev 2.
@944 mo7bedhlp 2.
@946 mo7bedslf 2.
@948 mo7beddif 2.
@950 mo7bedwout 2.
@952 mo7doutsfdf 2.
@954 mo7doutdevi 2.
@956 mo7douthelp 2.
@958 mo7dinsdsfdf 2.
@960 mo7dinsddevi 2.
@962 mo7dinsdhelp 2.
@964 mo7dbedsfdf 2.
@966 mo7dbeddevi 2.
@968 mo7dbedhelp 2.
@970 fl7didntleav 2.
@972 fl7ntlvrmslp 2.
@974 dm7helpmobil 2.
@976 dm7helpstmo 2.
@978 dm7helpstyr 4.
@982 dm7helpendmo 2.
@984 dm7helpendyr 4.
@988 dm7nohelp 2.
@990 dm7nohelpmos 2.
@992 dm7lstyrcane 4.
@996 dm7devstmo 2.
@998 dm7devstyr 4.
@1002 dm7devendmo 2.
@1004 dm7devendyr 4.
@1008 dm7nodev 2.
@1010 dm7nodevmos 2.
@1012 dm7dmohlp 4.
@1016 dm7dmodev 4.
@1020 dm7dmohlpgr 4.
@1024 dm7dmodevgr 4.
@1028 dmds7dintvl 4.
@1032 dm7flag 2.
@1034 dt7driveyr 2.
@1036 dt7oftedrive 2.
@1038 dt7avoidriv1 2.
@1040 dt7avoidriv2 2.
@1042 dt7avoidriv3 2.
@1044 dt7avoidriv4 2.
@1046 dt7getoplcs1 2.
@1048 dt7getoplcs2 2.
@1050 dt7getoplcs3 2.
@1052 dt7getoplcs4 2.
@1054 dt7getoplcs5 2.
@1056 dt7getoplcs6 2.
@1058 dt7getoplcs7 2.
@1060 dt7otfrfamtk 2.
@1062 fl7drives 2.
@1064 fl7drvlstyr 2.
@1066 fl5dneverdrv 2.
@1068 ha7laun 2.
@1070 ha7launslf 2.
@1072 ha7whrmachi1 2.
@1074 ha7whrmachi2 2.
@1076 ha7whrmachi3 2.
@1078 ha7whrmachi4 2.
@1080 ha7whrmachi5 2.
@1082 ha7whrmachi6 2.
@1084 ha7dlaunreas 2.
@1086 ha7laundif 2.
@1088 ha7launoft 2.
@1090 ha7launwout 2.
@1092 ha7shop 2.
@1094 ha7shopslf 2.
@1096 ha7howpaygr1 2.
@1098 ha7howpaygr2 2.
@1100 ha7howpaygr3 2.
@1102 ha7howpaygr4 2.
@1104 ha7howpaygr5 2.
@1106 ha7howpaygr6 2.
@1108 ha7howpaygr7 2.
@1110 ha7howgtstr1 2.
@1112 ha7howgtstr2 2.
@1114 ha7howgtstr3 2.
@1116 ha7howgtstr4 2.
@1118 ha7howgtstr5 2.
@1120 ha7howgtstr6 2.
@1122 ha7howgtstr7 2.
@1124 ha7howgtstr8 2.
@1126 ha7shopcart 2.
@1128 ha7shoplean 2.
@1130 ha7dshopreas 2.
@1132 ha7shopdif 2.
@1134 ha7shopoft 2.
@1136 ha7shopwout 2.
@1138 ha7meal 2.
@1140 ha7mealslf 2.
@1142 ha7restamels 2.
@1144 ha7mealwheel 2.
@1146 ha7oftmicrow 2.
@1148 ha7dmealreas 2.
@1150 ha7mealdif 2.
@1152 ha7mealoft 2.
@1154 ha7mealwout 2.
@1156 ha7bank 2.
@1158 ha7bankslf 2.
@1160 ha7dbankreas 2.
@1162 ha7bankdif 2.
@1164 ha7bankoft 2.
@1166 ha7bankwout 2.
@1168 ha7money 2.
@1170 ha7moneyhlp 2.
@1172 ha7dlaunsfdf 2.
@1174 ha7dshopsfdf 2.
@1176 ha7dmealsfdf 2.
@1178 ha7dbanksfdf 2.
@1180 ha7dmealwhl 2.
@1182 ha7dmealtkot 2.
@1184 sc7eatdev 2.
@1186 sc7eatdevoft 2.
@1188 sc7eathlp 2.
@1190 sc7eatslfoft 2.
@1192 sc7eatslfdif 2.
@1194 sc7eatwout 2.
@1196 sc7showrbat1 2.
@1198 sc7showrbat2 2.
@1200 sc7showrbat3 2.
@1202 sc7bdevdec 2.
@1204 sc7prfrshbth 2.
@1206 sc7scusgrbrs 2.
@1208 sc7shtubseat 2.
@1210 sc7bathhlp 2.
@1212 sc7bathoft 2.
@1214 sc7bathdif 2.
@1216 sc7bathyrgo 2.
@1218 sc7bathwout 2.
@1220 sc7usvartoi1 2.
@1222 sc7usvartoi2 2.
@1224 sc7usvartoi3 2.
@1226 sc7usvartoi4 2.
@1228 sc7toilhlp 2.
@1230 sc7toiloft 2.
@1232 sc7toildif 2.
@1234 sc7toilwout 2.
@1236 sc7dresoft 2.
@1238 sc7dresdev 2.
@1240 sc7dreshlp 2.
@1242 sc7dresslf 2.
@1244 sc7dresdif 2.
@1246 sc7dresyrgo 2.
@1248 sc7dreswout 2.
@1250 sc7deatdevi 2.
@1252 sc7deathelp 2.
@1254 sc7deatsfdf 2.
@1256 sc7dbathdevi 2.
@1258 sc7dbathhelp 2.
@1260 sc7dbathsfdf 2.
@1262 sc7dtoildevi 2.
@1264 sc7dtoilhelp 2.
@1266 sc7dtoilsfdf 2.
@1268 sc7ddresdevi 2.
@1270 sc7ddreshelp 2.
@1272 sc7ddressfdf 2.
@1274 fl7showering 2.
@1276 fl7takingbth 2.
@1278 fl7washingup 2.
@1280 ds7gethlpeat 2.
@1282 ds7helpstmo 2.
@1284 ds7helpstyr 4.
@1288 ds7helpendmo 2.
@1290 ds7helpendyr 4.
@1294 ds7nohelp 2.
@1296 ds7nohelpmos 2.
@1298 ds7dschlp 4.
@1302 ds7dschlpgr 4.
@1306 ds7flag 2.
@1308 mc7meds 2.
@1310 mc7medstrk 2.
@1312 mc7medsslf 2.
@1314 mc7whrgtmed1 2.
@1316 mc7whrgtmed2 2.
@1318 mc7whrgtmed3 2.
@1320 mc7whrgtmed4 2.
@1322 mc7howpkupm1 2.
@1324 mc7howpkupm2 2.
@1326 mc7howpkupm3 2.
@1328 mc7medsrem 2.
@1330 mc7dmedsreas 2.
@1332 mc7medsdif 2.
@1334 mc7medsyrgo 2.
@1336 mc7medsmis 2.
@1338 mc7havregdoc 2.
@1340 mc7regdoclyr 2.
@1342 mc7hwgtregd1 2.
@1344 mc7hwgtregd2 2.
@1346 mc7hwgtregd3 2.
@1348 mc7hwgtregd4 2.
@1350 mc7hwgtregd5 2.
@1352 mc7hwgtregd6 2.
@1354 mc7hwgtregd7 2.
@1356 mc7hwgtregd8 2.
@1358 mc7hwgtregd9 2.
@1360 mc7ansitindr 2.
@1362 mc7tpersevr1 2.
@1364 mc7tpersevr2 2.
@1366 mc7tpersevr3 2.
@1368 mc7tpersevr4 2.
@1370 mc7chginspln 2.
@1372 mc7anhlpwdec 2.
@1374 mc7dmedssfdf 2.
@1376 pa7vistfrfam 2.
@1378 pa7hlkepfvst 2.
@1380 pa7trkpfrvis 2.
@1382 pa7impvstfam 2.
@1384 pa7attrelser 2.
@1386 pa7htkfrrlsr 2.
@1388 pa7trprrelsr 2.
@1390 pa7imprelser 2.
@1392 pa7clbmtgrac 2.
@1394 pa7hlkpfrclb 2.
@1396 pa7trprkpfgr 2.
@1398 pa7imparclub 2.
@1400 pa7outfrenjy 2.
@1402 pa7hlkpgoenj 2.
@1404 pa7trprgoout 2.
@1406 pa7impouteny 2.
@1408 pa7workfrpay 2.
@1410 pa7hlkpfrwrk 2.
@1412 pa7voltrwork 2.
@1414 pa7hlkpfrvol 2.
@1416 pa7prcranoth 2.
@1418 pa7evrgowalk 2.
@1420 pa7vigoractv 2.
@1422 pa7dofavact 2.
@1424 pa7fvactlimyr 2.
@1426 pa5dfavact 3.
@1429 rh7rehab 2.
@1431 rh7rehabmo 2.
@1433 rh7rehabweek 2.
@1435 rh7rehabsurg 2.
@1437 rh7surgcond 2.
@1439 rh7rehabcond 2.
@1441 rh7funcback 2.
@1443 rh7funchips 2.
@1445 rh7funcknees 2.
@1447 rh7funcfeet 2.
@1449 rh7funchands 2.
@1451 rh7funcwrist 2.
@1453 rh7funcshold 2.
@1455 rh7funchead 2.
@1457 rh7funcneck 2.
@1459 rh7funcarms 2.
@1461 rh7funclegs 2.
@1463 rh7funcstom 2.
@1465 rh7funcmouth 2.
@1467 rh7funcheart 2.
@1469 rh7funclung 2.
@1471 rh7funcos 2.
@1473 rh7funcnotsp 2.
@1475 rh7impchew 2.
@1477 rh7impspeak 2.
@1479 rh7impspain 2.
@1481 rh7impbreath 2.
@1483 rh7impweak 2.
@1485 rh7impmove 2.
@1487 rh7impenergy 2.
@1489 rh7impbal 2.
@1491 rh7impfall 2.
@1493 rh7impmemory 2.
@1495 rh7impnone 2.
@1497 rh7impbed 2.
@1499 rh7impwalk 2.
@1501 rh7impleave 2.
@1503 rh7impdistnc 2.
@1505 rh7impclimb 2.
@1507 rh7impdrive 2.
@1509 rh7imptransp 2.
@1511 rh7impnotths 2.
@1513 rh7impsc 2.
@1515 rh7imphh 2.
@1517 rh7impcomp 2.
@1519 rh7impwork 2.
@1521 rh7impcare 2.
@1523 rh7impactiv 2.
@1525 rh7impactnon 2.
@1527 rh7devcane 2.
@1529 rh7devwhlch 2.
@1531 rh7devramp 2.
@1533 rh7devstair 2.
@1535 rh7devtub 2.
@1537 rh7devtoil 2.
@1539 rh7deveat 2.
@1541 rh7devdres 2.
@1543 rh7devgrab 2.
@1545 rh7devcomp 2.
@1547 rh7devcar 2.
@1549 rh7devother 2.
@1551 rh7place1 2.
@1553 rh7place2 2.
@1555 rh7place3 2.
@1557 rh7place4 2.
@1559 rh7place5 2.
@1561 rh7placelast 2.
@1563 rh7ability 2.
@1565 rh7abilimp 2.
@1567 rh7abilworse 2.
@1569 rh7rehabnow 2.
@1571 rh7metgoals 2.
@1573 rh7metinsur 2.
@1575 rh7abilnow 2.
@1577 rh7nowimp 2.
@1579 rh7nowworse 2.
@1581 sd7smokesnow 2.
@1583 sd7numcigday 3.
@1586 pe7whhndsign 2.
@1588 pe7surghdwrt 2.
@1590 pe7surgyside 2.
@1592 pe7flruppain 2.
@1594 pe7sideflrup 2.
@1596 pe7surgarmsh 2.
@1598 pe7sidsurgar 2.
@1600 pe7surgyhips 2.
@1602 pe7sidhipsrg 2.
@1604 pe7stndwhold 2.
@1606 pe7upchbyslf 2.
@1608 pe7wlkdsself 2.
@1610 fl7lefthand 2.
@1612 fl7righthand 2.
@1614 fl7eiherhand 2.
@1616 fl7lftgrptst 2.
@1618 fl7rhtgrptst 2.
@1620 fl7charstnds 2.
@1622 fl7balstands 2.
@1624 fl7wlkingrse 2.
@1626 bc7dconsent 2.
@1628 ba7dblssadm 2.
@1630 ba7dblstadm 2.
@1632 ba7dblftadm 2.
@1634 ba7dblopadm 2.
@1636 ba7dblcladm 2.
@1638 wa7dwlkadm 2.
@1640 ch7dschradm 2.
@1642 ch7drchradm 2.
@1644 gr7dgripadm 2.
@1646 wc7dwaistadm 2.
@1648 pk7dpeakadm 2.
@1650 ab7datemonth 2.
@1652 ab7dateyear 4.
@1656 in7strtabhrs 4.
@1660 in7strtabmin 4.
@1664 in7strtmampm 2.
@1666 ba7sxsresult 2.
@1668 ba7blstdsecs 2.
@1670 ba7blstdhndr 2.
@1672 ba7rsn1ssstd 2.
@1674 ba7rsn2ssstd 2.
@1676 ba7rsn3ssstd 2.
@1678 ba7rsn4ssstd 2.
@1680 ba7rsn9ssstd 2.
@1682 ba7stdmreslt 2.
@1684 ba7stdmsecs 2.
@1686 ba7stdmhndr 2.
@1688 ba7rsn1ststd 2.
@1690 ba7rsn2ststd 2.
@1692 ba7rsn3ststd 2.
@1694 ba7rsn4ststd 2.
@1696 ba7rsn9ststd 2.
@1698 ba7ftdmreslt 2.
@1700 ba7ftdmsecs 2.
@1702 ba7ftdmhndr 2.
@1704 ba7rsn1ftstd 2.
@1706 ba7rsn2ftstd 2.
@1708 ba7rsn3ftstd 2.
@1710 ba7rsn4ftstd 2.
@1712 ba7rsn9ftstd 2.
@1714 ba71leoreslt 2.
@1716 ba71leosfsec 2.
@1718 ba71leohndr 2.
@1720 ba7rsn11leo 2.
@1722 ba7rsn21leo 2.
@1724 ba7rsn31leo 2.
@1726 ba7rsn41leo 2.
@1728 ba7rsn91leo 2.
@1730 ba71lecreslt 2.
@1732 ba71lecsfsec 2.
@1734 ba71lechndr 2.
@1736 ba7rsn11lec 2.
@1738 ba7rsn21lec 2.
@1740 ba7rsn31lec 2.
@1742 ba7rsn41lec 2.
@1744 ba7rsn91lec 2.
@1746 wa7wlkcorspc 2.
@1748 wa7wkaidused 2.
@1750 wa7wlkc1rslt 2.
@1752 wa7wlkc1secs 4.
@1756 wa7wlk1hndr 4.
@1760 wa7rsn11wkc 2.
@1762 wa7rsn21wkc 2.
@1764 wa7rsn31wkc 2.
@1766 wa7rsn41wkc 2.
@1768 wa7rsn51wkc 2.
@1770 wa7rsn91wkc 2.
@1772 wa7wkaidusc2 2.
@1774 wa7wlkc2rslt 2.
@1776 wa7wlkc2secs 4.
@1780 wa7wlk2hndr 4.
@1784 wa7rsn12wkc 2.
@1786 wa7rsn22wkc 2.
@1788 wa7rsn32wkc 2.
@1790 wa7rsn42wkc 2.
@1792 wa7rsn92wkc 2.
@1794 ch7chravail 2.
@1796 ch7chstcompl 2.
@1798 ch7chairheit 3.
@1801 ch7whlchrusd 2.
@1803 ch7sgchstres 2.
@1805 ch7armuse 2.
@1807 ch7rsn11chs 2.
@1809 ch7rsn21chs 2.
@1811 ch7rsn31chs 2.
@1813 ch7rsn41chs 2.
@1815 ch7rsn51chs 2.
@1817 ch7rsn91chs 2.
@1819 ch72chstrslt 2.
@1821 ch7chstndsec 2.
@1823 ch7chstdhndr 3.
@1826 ch7chstddone 2.
@1828 ch7chstntdn1 2.
@1830 ch7chstntdn2 2.
@1832 ch7chstntdn3 2.
@1834 ch7chstntdn4 2.
@1836 ch7chstntdn5 2.
@1838 ch7chstntdn9 2.
@1840 ch7chstntat1 2.
@1842 ch7chstntat2 2.
@1844 ch7chstntat3 2.
@1846 ch7chstntat4 2.
@1848 ch7chstntat9 2.
@1850 gr7handtstd1 2.
@1852 gr7adjgr1ps3 2.
@1854 gr7grp1reslt 2.
@1856 gr7grp1rdng 6.3
@1862 gr7grp1noat1 2.
@1864 gr7grp1noat2 2.
@1866 gr7grp1noat3 2.
@1868 gr7grp1noat4 2.
@1870 gr7grp1noat9 2.
@1872 gr7handtstd2 2.
@1874 gr7adjgr2ps3 2.
@1876 gr7grp2reslt 2.
@1878 gr7grp2rdng 6.3
@1884 gr7grp2noat1 2.
@1886 gr7grp2noat2 2.
@1888 gr7grp2noat3 2.
@1890 gr7grp2noat4 2.
@1892 gr7grp2noat9 2.
@1894 wc7measdiff1 2.
@1896 wc7measdiff2 2.
@1898 wc7measdiff3 2.
@1900 wc7measdiff4 2.
@1902 wc7measdiff5 2.
@1904 wc7measdiff6 2.
@1906 wc7measdiff9 2.
@1908 wc7waistrslt 4.
@1912 wc7wstmsrinc 4.
@1916 wc7wstmsrqrt 4.
@1920 wc7wstbulkcl 2.
@1922 wc7whomeasur 2.
@1924 wc7wstpostn 2.
@1926 wc7wstnotat1 2.
@1928 wc7wstnotat2 2.
@1930 wc7wstnotat3 2.
@1932 wc7wstnotat4 2.
@1934 wc7wstnotat5 2.
@1936 wc7wstnotat9 2.
@1938 pk7pkarf1pos 2.
@1940 pk7pkarfl1ef 2.
@1942 pk7pkarfl1rs 2.
@1944 pk7pkarfl1rd 3.
@1947 pk7pk1noatt1 2.
@1949 pk7pk1noatt2 2.
@1951 pk7pk1noatt3 2.
@1953 pk7pk1noatt4 2.
@1955 pk7pk1noatt9 2.
@1957 pk7paf2posit 2.
@1959 pk7pkarfl2ef 2.
@1961 pk7pkarfl2rs 2.
@1963 pk7pkarfl2rd 3.
@1966 pk7pk2noatt1 2.
@1968 pk7pk2noatt2 2.
@1970 pk7pk2noatt3 2.
@1972 pk7pk2noatt4 2.
@1974 pk7pk2noatt9 2.
@1976 cl7endtimhrs 2.
@1978 cl7endtimmin 4.
@1982 cl7endtmampm 2.
@1984 r7dnhatssppb 4.
@1988 r7dnhatsbasc 4.
@1992 r7dnhatswksc 4.
@1996 r7dnhatschsc 4.
@2000 r7dnhatsgrav 8.
@2008 r7dnhatsgrb 8.
@2016 r7dnhatspkav 8.
@2024 r7dnhatspkb 8.
@2032 r7dsppbmiss 2.
@2034 r7dorigsppb 2.
@2036 r7dorigbasc 2.
@2038 r7dorigwksc 2.
@2040 r7dorigchsc 2.
@2042 hw7currweigh 3.
@2045 hw7lst10pnds 2.
@2047 hw7trytolose 2.
@2049 hw7howtallft 2.
@2051 hw7howtallin 3.
@2054 el7mothalive 2.
@2056 el7fathalive 2.
@2058 wb7offelche1 2.
@2060 wb7offelche2 2.
@2062 wb7offelche3 2.
@2064 wb7offelche4 2.
@2066 wb7truestme1 2.
@2068 wb7truestme2 2.
@2070 wb7truestme3 2.
@2072 wb7truestme4 2.
@2074 wb7ageyofeel 3.
@2077 wb7agrwstmt1 2.
@2079 wb7agrwstmt2 2.
@2081 wb7agrwstmt3 2.
@2083 ip7covmedcad 2.
@2085 ip7otdrugcov 2.
@2087 ip7mgapmedsp 2.
@2089 ip7cmedicaid 2.
@2091 ip7covtricar 2.
@2093 ip7nginslast 2.
@2095 ip7nginsnurs 2.
@2097 ip7typcarco1 2.
@2099 ip7typcarco2 2.
@2101 ip7typcarco3 2.
@2103 ip7paypremms 8.
@2111 lf7workfpay 2.
@2113 lf7abstlstwk 2.
@2115 lf7wrkplstmn 2.
@2117 lf7mrthnonjb 2.
@2119 lf7hrswkwork 4.
@2123 lf7hrwrkltwk 4.
@2127 lf7hrwrklstw 4.
@2131 lf7oftpaid 2.
@2133 lf7doccup 4.
@2137 lf7huswifwrk 8.
@2145 hp7ownrentot 2.
@2147 hp7mrtpadoff 2.
@2149 hp7mthlymort 8.
@2157 hp7mortpaymt 8.
@2165 hp7whnpayoff 4.
@2169 hp7amtstlowe 8.
@2177 hp7amoutowed 8.
@2185 hp7homevalue 8.
@2193 hp7homvalamt 8.
@2201 hp7payrent 2.
@2203 hp7rentamt 8.
@2211 hp7rentamout 8.
@2219 hp7sec8pubsn 8.
@2227 ia7recsspa1 2.
@2229 ia7recsspa2 2.
@2231 ia7recsspa3 2.
@2233 ia7recssils1 2.
@2235 ia7recssils2 2.
@2237 ia7recssils3 2.
@2239 ia7rvapayls1 2.
@2241 ia7rvapayls2 2.
@2243 ia7rvapayls3 2.
@2245 ia7penjobou1 2.
@2247 ia7penjobou2 2.
@2249 ia7penjobou3 2.
@2251 ia7iraothac1 2.
@2253 ia7iraothac2 2.
@2255 ia7iraothac3 2.
@2257 ia7mutfdstk1 2.
@2259 ia7mutfdstk2 2.
@2261 ia7mutfdstk3 2.
@2263 ia7mutfdstk4 2.
@2265 ia7ownbond1 2.
@2267 ia7ownbond2 2.
@2269 ia7ownbond3 2.
@2271 ia7ownbond4 2.
@2273 ia7bnkacccd1 2.
@2275 ia7bnkacccd2 2.
@2277 ia7bnkacccd3 2.
@2279 ia7bnkacccd4 2.
@2281 ia7bnkacccd5 2.
@2283 ia7bnkacccd6 2.
@2285 ia7bnkacccd7 2.
@2287 ia7bnkacccd8 2.
@2289 ia7bnkacccd9 2.
@2291 ia7bnkaccc10 2.
@2293 ia7bnkaccc11 2.
@2295 ia7bnkaccc12 2.
@2297 ia7realestt1 2.
@2299 ia7realestt2 2.
@2301 ia7realestt3 2.
@2303 ia7realestt4 2.
@2305 ia7totinc 8.
@2313 ia7toincimf 2.
@2315 ia7toincim1 8.
@2323 ia7toincim2 8.
@2331 ia7toincim3 8.
@2339 ia7toincim4 8.
@2347 ia7toincim5 8.
@2355 ia7toincesjt 2.
@2357 ia7eincimjf 2.
@2359 ia7eincimj1 2.
@2361 ia7eincimj2 2.
@2363 ia7eincimj3 2.
@2365 ia7eincimj4 2.
@2367 ia7eincimj5 2.
@2369 ia7toincessg 2.
@2371 ia7eincimsf 2.
@2373 ia7eincims1 2.
@2375 ia7eincims2 2.
@2377 ia7eincims3 2.
@2379 ia7eincims4 2.
@2381 ia7eincims5 2.
@2383 ew7pycredbal 2.
@2385 ew7crecardeb 2.
@2387 ew7credcdmed 2.
@2389 ew7amtcrdmed 2.
@2391 ew7medpaovtm 2.
@2393 ew7ampadovrt 2.
@2395 ew7finhlpfam 2.
@2397 ew7whohelfi1 2.
@2399 ew7whohelfi2 2.
@2401 ew7atchhelyr 2.
@2403 ew7fingftfam 2.
@2405 ew7whregoth1 2.
@2407 ew7whregoth2 2.
@2409 ew7whregoth3 2.
@2411 ew7amthlpgiv 2.
@2413 ew7progneed1 2.
@2415 ew7progneed2 2.
@2417 ew7progneed3 2.
@2419 ew7mealskip1 2.
@2421 ew7mealskip2 2.
@2423 ew7nopayhous 2.
@2425 ew7nopayutil 2.
@2427 ew7nopaymed 2.
@2429 ir7intlang 2.
@2431 ir7spattitud 2.
@2433 ir7undrstand 2.
@2435 ir7sppresent 2.
@2437 ir7spnotprs1 2.
@2439 ir7spnotprs2 2.
@2441 ir7spnotprs3 2.
@2443 ir7spnotprs4 2.
@2445 ir7spnotprs5 2.
@2447 ir7spnotprs6 2.
@2449 ir7intvwhlp 2.
@2451 ir7prsnhlp1 2.
@2453 ir7prsnhlp2 2.
@2455 ir7prsnhlp3 2.
@2457 ir7prsnhlp4 2.
@2459 ir7prsnhlp5 2.
@2461 ir7prsnhlp6 2.
@2463 ir7prsnhlp91 2.
@2465 ir7demolang1 2.
@2467 ir7sessions 2.
@2469 ir7sessrsn1 2.
@2471 ir7sessrsn2 2.
@2473 ir7sessrsn3 2.
@2475 ir7sessrsn91 2.
@2477 ir7conhomapt 2.
@2479 ir7insidhome 2.
@2481 ir7condihom1 2.
@2483 ir7condihom2 2.
@2485 ir7condihom3 2.
@2487 ir7condihom4 2.
@2489 ir7condihom5 2.
@2491 ir7clutterr1 2.
@2493 ir7clutterr2 2.
@2495 ir7areacond1 2.
@2497 ir7areacond2 2.
@2499 ir7areacond3 2.
@2501 ir7condhome1 2.
@2503 ir7condhome2 2.
@2505 ir7condhome3 2.
@2507 ir7condhome4 2.
@2509 ir7condhome5 2.
@2511 ir7condhome6 2.
@2513 fq7dfacdescr 2.
@2515 fq7dosfacd 2.
@2517 fq7prtlivnam 2.
@2519 fq7dfacarea 2.
@2521 fq7dosfaca 2.
@2523 fq7assdnrsng 2.
@2525 fq7othrlevls 2.
@2527 fq7whotlevl1 2.
@2529 fq7whotlevl2 2.
@2531 fq7whotlevl3 2.
@2533 fq7whotlevl4 2.
@2535 fq7whotlevl5 2.
@2537 fq7servaval1 2.
@2539 fq7servaval2 2.
@2541 fq7servaval3 2.
@2543 fq7servaval4 2.
@2545 fq7servaval5 2.
@2547 fq7servaval6 2.
@2549 fq7servaval7 2.
@2551 fq7servaval10 2.
@2553 fq7servaval11 2.
@2555 fq7servaval8 2.
@2557 fq7servaval9 2.
@2559 fq7servaval12 2.
@2561 fq7servaval13 2.
@2563 fq7paysourc1 6.
@2569 fq7paysourc2 6.
@2575 fq7paysourc3 6.
@2581 fq7paysourc4 6.
@2587 fq7paysourc5 6.
@2593 fq7paysourc6 6.
@2599 fq7totalpaym 8.
@2607 fq7mnthlyamt 5.
@2612 fq7primpayer 2.
@2614 fq7govsource 2.
@2616 fq7dlocsp 2.
@2618 w7anfinwgt0 18.11
@2636 w7anfinwgt1 18.11
@2654 w7anfinwgt2 18.11
@2672 w7anfinwgt3 18.11
@2690 w7anfinwgt4 18.11
@2708 w7anfinwgt5 18.11
@2726 w7anfinwgt6 18.11
@2744 w7anfinwgt7 18.11
@2762 w7anfinwgt8 18.11
@2780 w7anfinwgt9 18.11
@2798 w7anfinwgt10 18.11
@2816 w7anfinwgt11 18.11
@2834 w7anfinwgt12 18.11
@2852 w7anfinwgt13 18.11
@2870 w7anfinwgt14 18.11
@2888 w7anfinwgt15 18.11
@2906 w7anfinwgt16 18.11
@2924 w7anfinwgt17 18.11
@2942 w7anfinwgt18 18.11
@2960 w7anfinwgt19 18.11
@2978 w7anfinwgt20 18.11
@2996 w7anfinwgt21 18.11
@3014 w7anfinwgt22 18.11
@3032 w7anfinwgt23 18.11
@3050 w7anfinwgt24 18.11
@3068 w7anfinwgt25 18.11
@3086 w7anfinwgt26 18.11
@3104 w7anfinwgt27 18.11
@3122 w7anfinwgt28 18.11
@3140 w7anfinwgt29 18.11
@3158 w7anfinwgt30 18.11
@3176 w7anfinwgt31 18.11
@3194 w7anfinwgt32 18.11
@3212 w7anfinwgt33 18.11
@3230 w7anfinwgt34 18.11
@3248 w7anfinwgt35 18.11
@3266 w7anfinwgt36 18.11
@3284 w7anfinwgt37 18.11
@3302 w7anfinwgt38 18.11
@3320 w7anfinwgt39 18.11
@3338 w7anfinwgt40 18.11
@3356 w7anfinwgt41 18.11
@3374 w7anfinwgt42 18.11
@3392 w7anfinwgt43 18.11
@3410 w7anfinwgt44 18.11
@3428 w7anfinwgt45 18.11
@3446 w7anfinwgt46 18.11
@3464 w7anfinwgt47 18.11
@3482 w7anfinwgt48 18.11
@3500 w7anfinwgt49 18.11
@3518 w7anfinwgt50 18.11
@3536 w7anfinwgt51 18.11
@3554 w7anfinwgt52 18.11
@3572 w7anfinwgt53 18.11
@3590 w7anfinwgt54 18.11
@3608 w7anfinwgt55 18.11
@3626 w7anfinwgt56 18.11
@3644 w7an2011wgt0 18.11
@3662 w7an2011wgt1 18.11
@3680 w7an2011wgt2 18.11
@3698 w7an2011wgt3 18.11
@3716 w7an2011wgt4 18.11
@3734 w7an2011wgt5 18.11
@3752 w7an2011wgt6 18.11
@3770 w7an2011wgt7 18.11
@3788 w7an2011wgt8 18.11
@3806 w7an2011wgt9 18.11
@3824 w7an2011wgt10 18.11
@3842 w7an2011wgt11 18.11
@3860 w7an2011wgt12 18.11
@3878 w7an2011wgt13 18.11
@3896 w7an2011wgt14 18.11
@3914 w7an2011wgt15 18.11
@3932 w7an2011wgt16 18.11
@3950 w7an2011wgt17 18.11
@3968 w7an2011wgt18 18.11
@3986 w7an2011wgt19 18.11
@4004 w7an2011wgt20 18.11
@4022 w7an2011wgt21 18.11
@4040 w7an2011wgt22 18.11
@4058 w7an2011wgt23 18.11
@4076 w7an2011wgt24 18.11
@4094 w7an2011wgt25 18.11
@4112 w7an2011wgt26 18.11
@4130 w7an2011wgt27 18.11
@4148 w7an2011wgt28 18.11
@4166 w7an2011wgt29 18.11
@4184 w7an2011wgt30 18.11
@4202 w7an2011wgt31 18.11
@4220 w7an2011wgt32 18.11
@4238 w7an2011wgt33 18.11
@4256 w7an2011wgt34 18.11
@4274 w7an2011wgt35 18.11
@4292 w7an2011wgt36 18.11
@4310 w7an2011wgt37 18.11
@4328 w7an2011wgt38 18.11
@4346 w7an2011wgt39 18.11
@4364 w7an2011wgt40 18.11
@4382 w7an2011wgt41 18.11
@4400 w7an2011wgt42 18.11
@4418 w7an2011wgt43 18.11
@4436 w7an2011wgt44 18.11
@4454 w7an2011wgt45 18.11
@4472 w7an2011wgt46 18.11
@4490 w7an2011wgt47 18.11
@4508 w7an2011wgt48 18.11
@4526 w7an2011wgt49 18.11
@4544 w7an2011wgt50 18.11
@4562 w7an2011wgt51 18.11
@4580 w7an2011wgt52 18.11
@4598 w7an2011wgt53 18.11
@4616 w7an2011wgt54 18.11
@4634 w7an2011wgt55 18.11
@4652 w7an2011wgt56 18.11
@4670 w7varstrat 2.
@4672 w7varunit 2.;


/* Section #3 - format assignment statement   */
format r5dcontnew Dcontnew.
r7dlmlint DLMLINT.
r7dresid f_dresid.
r6dresid f_dresid.
r5dresid f_dresid.
r4dresid f4dresid.
r3dresid f3dresid.
r2dresid f2dresid.
r1dresid R1DRESID.
r7dresidlml D_LMLLOC.
r7breakoffst RFDK_B.
r7breakoffqt $RFDK_C.
is7resptype W200030W.
is7reasnprx1 RFDK_YN.
is7reasnprx2 RFDK_YN.
is7reasnprx3 RFDK_YN.
is7reasnprx4 RFDK_YN.
is7reasnprx5 RFDK_YN.
is7reasnprx6 RFDK_YN.
is7reasnprx7 RFDK_YN.
is7reasnprx9 RFDK_YN.
is7tempres W200032W.
is7prxyrelat W200035W.
is7prxygendr w200002w.
is7famrrutin W200036W.
is7proxlivsp W200011W.
r5dgender w200002w.
rl5dracehisp RACEHISP.
r7d2intvrage D2INTVRA.
is7dproxyid $RFDK_C.
fl7spdied W200011W.
re7spadrsnew W200037W.
re7intplace W200011W.
re7newstrct W200018W.
re7newblgfl W200021W.
re7mthmove W200038W.
re7yearmove W200039W.
re7placedec W200011W.
re7alonedec W200011W.
re7dresistrct W200018W.
re7dbldg RE5BLDG.
re7dcensdiv CENDIV.
re7dresnew dresnew.
fl7structure W200020W.
fl7resnew W200011W.
fl7facility W200011W.
fl7hotype W200022W.
fl7retirecom W200011W.
pd7placedied W200041W.
pd7homedied W200042W.
pd7hospdied W200043W.
pd7hospice1 W200011W.
pd7hospice2 W200044W.
pd7stayunit W200045W.
pd7staydays RFDK_F.
pd7staywks RFDK_F.
pd7staymths RFDK_F.
pd7stayyrs RFDK_F.
pd7staymthpl W200011W.
pd7placepre SP30046W.
pd7hospcelml W200011W.
pd7alert W200047W.
pd7outbed W200047W.
r7d2deathage D2INTVRA.
fl7notalert W200011W.
fl7notmobile W200011W.
lm7pain W200011W.
lm7painhlp W200011W.
lm7painhlpam W200048W.
lm7bre W200011W.
lm7brehlp W200011W.
lm7brehlpam W200048W.
lm7sad W200011W.
lm7sadhlp W200011W.
lm7sadhlpam W200048W.
lm7caredecis W200049W.
lm7carenowan W200049W.
lm7perscare W200050W.
lm7respect W200050W.
lm7informed W200050W.
lm7doctor W200049W.
lm7docclear W200011W.
lm7relg W200049W.
lm7relgamt W200011W.
lm7ratecare SP30051W.
hc7health W200051W.
hc7disescn1 W200011W.
hc7disescn2 W200011W.
hc7disescn3 W200011W.
hc7disescn4 W200011W.
hc7disescn5 W200011W.
hc7disescn6 W200011W.
hc7disescn7 W200011W.
hc7disescn8 W200011W.
hc7disescn9 W200011W.
hc7disescn10 W200011W.
hc7cancerty1 RFDK_YN.
hc7brokebon1 W200011W.
hc7brokebon2 W200011W.
hc7hosptstay W200011W.
hc7hosovrnht RFDK_F.
hc7knesrgyr W200011W.
hc7hipsrgyr W200011W.
hc7catrsrgyr W200011W.
hc7backsrgyr W200011W.
hc7hartsrgyr W200011W.
hc7fllsinmth W200011W.
hc7worryfall W200011W.
hc7worrylimt W200011W.
hc7faleninyr W200011W.
hc7multifall W200011W.
hc7depresan1 W200052W.
hc7depresan2 W200052W.
hc7depresan3 W200052W.
hc7depresan4 W200052W.
hc7aslep30mn W200053W.
hc7trbfalbck W200054W.
hc7sleepmed W200053W.
ht7placedesc W200055W.
ht7retiresen W200011W.
ht7diffareun W200011W.
ht7helpmedbd W200011W.
ht7meals W200011W.
ht7spacename W200057W.
se7servcoff1 W200011W.
se7servcoff2 W200011W.
se7servcoff3 W200011W.
se7servcoff4 W200011W.
se7servcoff5 W200011W.
se7servcoff6 W200011W.
se7servcoff7 W200011W.
se7servcoff10 RFDK_YN.
se7servcoff11 RFDK_YN.
se7servcoff8 W200011W.
se7servcoff9 W200011W.
se7servcoff12 RFDK_YN.
se7servcoff13 RFDK_YN.
se7servused1 W200011W.
se7servused2 W200011W.
se7servused3 W200011W.
se7servused4 W200011W.
se7servused5 W200011W.
se7servused6 W200011W.
se7servused7 W200011W.
se7servused10 W200011W.
se7servused11 W200011W.
se7servused8 W200011W.
se7servused9 W200011W.
se7servused12 W200011W.
se7servused13 RFDK_YN.
se7payservi1 W200147W.
se7payservi2 W200147W.
se7payservi3 W200147W.
se7payservi4 W200147W.
se7payservi5 W200147W.
se7payservi6 W200147W.
se7payservi7 W200147W.
se7payservi10 W200147W.
se7payservi11 W200147W.
se7payservi8 W200147W.
se7payservi9 W200147W.
se7payservi12 W200147W.
se7payservi13 W200147W.
hh7marchange W200011W.
hh7martlstat W200010W.
hh7dmarstat dmarstat.
hh7yrendmarr RFDK_F.
hh7newspoprt W200058W.
hh7spgender W200002W.
hh7dspageall DSPSAGEC.
hh7spouseduc W200005W.
hh7spoupchlp W200011W.
hh7livwthspo W200011W.
hh7placekind W200060W.
hh7dlvngarrg LVGARRG.
hh7dhshldnum RFDK_F.
hh7dhshldchd RFDK_F.
hh7dspouseid $RFDK_F.
cs7sistrsnum RFDK_F.
cs7brthrsnum RFDK_F.
cs7dnumchild RFDK_F.
cs7dnmstpchd RFDK_F.
cs7dnumdaugh RFDK_F.
cs7dnumson RFDK_F.
sn7dnumsn RFDK_F.
fl7noonetalk W200011W.
ho7entrstair W200011W.
ho7entrccomn W200067W.
ho7entrnramp W200011W.
ho7bldgamen1 W200011W.
ho7bldgamen2 W200011W.
ho7bldgamen3 W200011W.
ho7bldgamen4 W200011W.
ho7levelsflr W200068W.
ho7homeamen1 W200011W.
ho7homeamen2 W200011W.
ho7homeamen3 W200011W.
ho7bathprivt W200011W.
ho7bathamen1 W200011W.
ho7bathamen2 W200011W.
ho7bathamen3 W200011W.
ho7bathamen4 W200011W.
ho7bathamen5 W200011W.
ho7bathamen6 W200011W.
ho7bathamen7 W200011W.
ho7kitchnprv W200011W.
ho7kitchncom W200011W.
ho7microwave W200011W.
ho7dbldg1 RFDK_YN.
ho7dbldg2 RFDK_YN.
ho7dbldg3 RFDK_YN.
ho7dbldg4 RFDK_YN.
ho7dbathprvt RFDK_YN.
ho7dkitchnpr RFDK_YN.
ho7dkitchnco RFDK_YN.
fl7bathgrbbr W200011W.
fl7bathseat W200011W.
fl7raisedtlt W200011W.
fl7tltgrbbr W200011W.
em7modhere1 W200069W.
em7addlstyr1 W200011W.
em7addlstyr2 W200011W.
em7addlstyr3 W200011W.
em7addlstyr4 W200011W.
em7addlstyr5 W200011W.
em7addlstyr6 W200011W.
em7addlstyr7 W200011W.
em7payyufam1 W200011W.
em7payyufam2 W200011W.
em7payyufam3 W200011W.
em7payyufam4 W200011W.
em7payyufam5 W200011W.
em7payyufam6 W200011W.
em7payyufam7 W200011W.
em7paydevce1 W200011W.
em7paydevce2 W200011W.
em7paydevce3 W200011W.
em7paydevce4 W200011W.
em7paydevce5 W200011W.
em7paydevce6 W200011W.
em7paydevce7 W200011W.
em7paydevce8 W200011W.
em7paydevce9 W200011W.
em7payaltgth W200070W.
em7morls1000 W200071W.
em7morls100 W200072W.
cm7knowwell W200126W.
cm7willnghlp W200126W.
cm7peoptrstd W200126W.
te7cellphone W200011W.
te7othrphone W200011W.
te7computer W200073W.
te7compoth W200011W.
te7tablet SP30076W.
te7emailtext W200011W.
te7oftnemail W200074W.
te7online W200011W.
te7shoponli1 W200011W.
te7shoponli2 W200011W.
te7shoponli3 W200011W.
te7socialnet W200011W.
te7intrntmd1 W200011W.
te7intrntmd2 W200011W.
te7intrntmd3 W200011W.
md7canewlker W200011W.
md7cane W200011W.
md7walker W200011W.
md7wheelchar W200011W.
md7whelcrspc W200011W.
md7scooter W200011W.
md7scterinsp W200011W.
fl7cane W200011W.
fl7walker W200011W.
fl7wheelchr W200011W.
fl7whlchrhom W200011W.
fl7scooter W200011W.
fl7scooterhm W200011W.
ss7heringaid W200076W.
ss7hearphone W200011W.
ss7convwradi W200011W.
ss7convquiet W200011W.
ss7glasseswr W200077W.
ss7seewellst W200011W.
ss7seestvgls W200011W.
ss7glasscls W200011W.
ss7othvisaid W200011W.
ss7glrednewp W200011W.
ss7probchswl W200011W.
ss7probspeak W200011W.
ss7painbothr W200011W.
ss7painlimts W200011W.
ss7painmedof W200078W.
ss7painwhe1 RFDK_YN.
ss7painwhe2 RFDK_YN.
ss7painwhe3 RFDK_YN.
ss7painwhe4 RFDK_YN.
ss7painwhe5 RFDK_YN.
ss7painwhe6 RFDK_YN.
ss7painwhe7 RFDK_YN.
ss7painwhe8 RFDK_YN.
ss7painwhe9 RFDK_YN.
ss7painwhe10 RFDK_YN.
ss7painwhe11 RFDK_YN.
ss7painwhe12 RFDK_YN.
ss7painwhe13 RFDK_YN.
ss7probbreat W200011W.
ss7prbbrlimt W200011W.
ss7strnglmup W200011W.
ss7uplimtact W200011W.
ss7lwrbodstr W200011W.
ss7lwrbodimp W200011W.
ss7lowenergy W200011W.
ss7loenlmtat W200011W.
ss7prbbalcrd W200011W.
ss7prbbalcnt W200011W.
fl7deaf W200011W.
fl7blind W200011W.
pc7walk6blks W200011W.
pc7walk3blks W200011W.
pc7up20stair W200011W.
pc7up10stair W200011W.
pc7car20pnds W200011W.
pc7car10pnds W200011W.
pc7geonknees W200011W.
pc7bendover W200011W.
pc7hvobovrhd W200011W.
pc7rechovrhd W200011W.
pc7opnjarwhd W200011W.
pc7grspsmobj W200011W.
cp7memrygood W200051W.
cp7knownspyr W200011W.
cp7chgthink1 W200080W.
cp7chgthink2 W200080W.
cp7chgthink3 W200080W.
cp7chgthink4 W200080W.
cp7chgthink5 W200080W.
cp7chgthink6 W200080W.
cp7chgthink7 W200080W.
cp7chgthink8 W200080W.
cp7memcogpr1 W200011W.
cp7memcogpr2 W200011W.
cp7memcogpr3 W200011W.
cp7memcogpr4 W200011W.
cp7dad8dem DAD8DEM.
cg7speaktosp W200011W.
cg7quesremem W200011W.
cg7reascano1 RFDK_YN.
cg7reascano2 RFDK_YN.
cg7reascano3 RFDK_YN.
cg7reascano4 RFDK_YN.
cg7reascano5 RFDK_YN.
cg7reascano6 RFDK_YN.
cg7reascano7 RFDK_YN.
cg7reascano8 RFDK_YN.
cg7reascano9 RFDK_YN.
cg7ratememry W200051W.
cg7ofmemprob W200078W.
cg7memcom1yr W200082W.
cg7todaydat1 W200083W.
cg7todaydat2 W200083W.
cg7todaydat3 W200083W.
cg7todaydat5 W200083W.
cg7todaydat4 W200083W.
cg7todaydat6 W200083W.
cg7prewrdrcl W200084W.
cg7dwrdlstnm WORDREC.
cg7wrdsrcal1 W200085W.
cg7wrdsrcal2 W200085W.
cg7wrdsrcal3 W200085W.
cg7wrdsrcal4 W200085W.
cg7wrdsrcal5 W200085W.
cg7wrdsrcal6 W200085W.
cg7wrdsrcal7 W200085W.
cg7wrdsrcal8 W200085W.
cg7wrdsrcal9 W200085W.
cg7wrdsrcal10 W200085W.
cg7dwrdimmrc WORDRE_N.
cg7dwrdinone DWRDINON.
cg7dwrdirref DWRDIRRE.
cg7wrdsntlst W200011W.
cg7numnotlst RFDK_F.
cg7probreca1 RFDK_YN.
cg7probreca2 RFDK_YN.
cg7probreca3 RFDK_YN.
cg7probreca4 RFDK_YN.
cg7probreca5 RFDK_YN.
cg7dclkdraw DCLCKSC.
cg7dclkimgcl DCLCKCL.
cg7atdrwclck W200087W.
cg7presidna1 RFDK_YN.
cg7presidna2 RFDK_YN.
cg7presidna3 RFDK_YN.
cg7presidna4 RFDK_YN.
cg7vpname1 RFDK_YN.
cg7vpname2 RFDK_YN.
cg7vpname3 RFDK_YN.
cg7vpname4 RFDK_YN.
cg7wrdsdcal1 W200085W.
cg7wrdsdcal2 W200085W.
cg7wrdsdcal3 W200085W.
cg7wrdsdcal4 W200085W.
cg7wrdsdcal5 W200085W.
cg7wrdsdcal6 W200085W.
cg7wrdsdcal7 W200085W.
cg7wrdsdcal8 W200085W.
cg7wrdsdcal9 W200085W.
cg7wrdsdca10 W200085W.
cg7dwrddlyrc WORDRE_N.
cg7dwrddnone DWRDINON.
cg7dwrddrref DWRDIRRE.
cg7wrdnotlst W200011W.
cg7numwrdnot RFDK_F.
cg7dwrd1rcl RFDK_YN.
cg7dwrd2rcl RFDK_YN.
cg7dwrd3rcl RFDK_YN.
cg7dwrd4rcl RFDK_YN.
cg7dwrd5rcl RFDK_YN.
cg7dwrd6rcl RFDK_YN.
cg7dwrd7rcl RFDK_YN.
cg7dwrd8rcl RFDK_YN.
cg7dwrd9rcl RFDK_YN.
cg7dwrd10rcl RFDK_YN.
cg7dwrd1dly RFDK_YN.
cg7dwrd2dly RFDK_YN.
cg7dwrd3dly RFDK_YN.
cg7dwrd4dly RFDK_YN.
cg7dwrd5dly RFDK_YN.
cg7dwrd6dly RFDK_YN.
cg7dwrd7dly RFDK_YN.
cg7dwrd8dly RFDK_YN.
cg7dwrd9dly RFDK_YN.
cg7dwrd10dly RFDK_YN.
mo7outoft W200089W.
mo7outcane W200090W.
mo7outwalkr W200090W.
mo7outwlchr W200090W.
mo7outsctr W200090W.
mo7outhlp W200011W.
mo7outslf W200092W.
mo7outdif W200093W.
mo7outyrgo W200094W.
mo7outwout W200011W.
mo7oftgoarea W200078W.
mo7oflvslepr W200078W.
mo7insdcane W200090W.
mo7insdwalkr W200090W.
mo7insdwlchr W200090W.
mo7insdsctr W200090W.
mo7oftholdwl W200090W.
mo7insdhlp W200011W.
mo7insdslf W200092W.
mo7insddif W200093W.
mo7insdyrgo W200094W.
mo7insdwout W200011W.
mo7beddev W200090W.
mo7bedhlp W200011W.
mo7bedslf W200092W.
mo7beddif W200093W.
mo7bedwout W200011W.
mo7doutsfdf DOUTSFDF.
mo7doutdevi DOUTDEVI.
mo7douthelp DOUTHELP.
mo7dinsdsfdf DINSDSFD.
mo7dinsddevi DINSDDEV.
mo7dinsdhelp DINSDHLP.
mo7dbedsfdf DBEDSFDF.
mo7dbeddevi DBEDDEVI.
mo7dbedhelp DBEDHELP.
fl7didntleav W200011W.
fl7ntlvrmslp W200011W.
dm7helpmobil W200011W.
dm7helpstmo W200095W.
dm7helpstyr RFDK_YN.
dm7helpendmo W200095W.
dm7helpendyr W200040W.
dm7nohelp W200096W.
dm7nohelpmos RFDK_F.
dm7lstyrcane W200011W.
dm7devstmo SP3019aW.
dm7devstyr RFDK_F.
dm7devendmo SP3019aW.
dm7devendyr RFDK_F.
dm7nodev W200096W.
dm7nodevmos RFDK_F.
dm7dmohlp NW_MTHS.
dm7dmodev NW_MTHS.
dm7dmohlpgr DMH_GRP.
dm7dmodevgr DMU_GRP.
dmds7dintvl NW_MTHS.
dm7flag DMDS5FLG.
dt7driveyr W200097W.
dt7oftedrive W200078W.
dt7avoidriv1 W200098W.
dt7avoidriv2 W200098W.
dt7avoidriv3 W200098W.
dt7avoidriv4 W200098W.
dt7getoplcs1 W200011W.
dt7getoplcs2 W200011W.
dt7getoplcs3 W200011W.
dt7getoplcs4 W200011W.
dt7getoplcs5 W200011W.
dt7getoplcs6 W200011W.
dt7getoplcs7 W200011W.
dt7otfrfamtk W200011W.
fl7drives W200011W.
fl7drvlstyr W200011W.
fl5dneverdrv RFDK_Y.
ha7laun W200099W.
ha7launslf W200011W.
ha7whrmachi1 RFDK_YN.
ha7whrmachi2 RFDK_YN.
ha7whrmachi3 RFDK_YN.
ha7whrmachi4 RFDK_YN.
ha7whrmachi5 RFDK_YN.
ha7whrmachi6 RFDK_YN.
ha7dlaunreas DLAUNREA.
ha7laundif W200093W.
ha7launoft W200094W.
ha7launwout W200011W.
ha7shop W200099W.
ha7shopslf W200011W.
ha7howpaygr1 RFDK_YN.
ha7howpaygr2 RFDK_YN.
ha7howpaygr3 RFDK_YN.
ha7howpaygr4 RFDK_YN.
ha7howpaygr5 RFDK_YN.
ha7howpaygr6 RFDK_YN.
ha7howpaygr7 RFDK_YN.
ha7howgtstr1 RFDK_YN.
ha7howgtstr2 RFDK_YN.
ha7howgtstr3 RFDK_YN.
ha7howgtstr4 RFDK_YN.
ha7howgtstr5 RFDK_YN.
ha7howgtstr6 RFDK_YN.
ha7howgtstr7 RFDK_YN.
ha7howgtstr8 RFDK_YN.
ha7shopcart W200011W.
ha7shoplean W200011W.
ha7dshopreas DSHOPREA.
ha7shopdif W200093W.
ha7shopoft W200102W.
ha7shopwout W200011W.
ha7meal W200099W.
ha7mealslf W200011W.
ha7restamels W200090W.
ha7mealwheel W200090W.
ha7oftmicrow W200090W.
ha7dmealreas DMEALREA.
ha7mealdif W200093W.
ha7mealoft W200102W.
ha7mealwout W200011W.
ha7bank W200099W.
ha7bankslf W200011W.
ha7dbankreas DBANKREA.
ha7bankdif W200093W.
ha7bankoft W200102W.
ha7bankwout W200011W.
ha7money W200011W.
ha7moneyhlp W200011W.
ha7dlaunsfdf DLAUNSFD.
ha7dshopsfdf DSHOPSFD.
ha7dmealsfdf DMEALSFD.
ha7dbanksfdf DBANKSFD.
ha7dmealwhl HA5DWHL.
ha7dmealtkot HA5DTKO.
sc7eatdev W200106W.
sc7eatdevoft W200107W.
sc7eathlp W200011W.
sc7eatslfoft W200092W.
sc7eatslfdif W200093W.
sc7eatwout W200011W.
sc7showrbat1 RFDK_YN.
sc7showrbat2 RFDK_YN.
sc7showrbat3 RFDK_YN.
sc7bdevdec W200011W.
sc7prfrshbth W200109W.
sc7scusgrbrs W200090W.
sc7shtubseat W200090W.
sc7bathhlp W200011W.
sc7bathoft W200092W.
sc7bathdif W200093W.
sc7bathyrgo W200102W.
sc7bathwout W200011W.
sc7usvartoi1 W200011W.
sc7usvartoi2 RFDK_YN.
sc7usvartoi3 RFDK_YN.
sc7usvartoi4 RFDK_YN.
sc7toilhlp W200011W.
sc7toiloft W200092W.
sc7toildif W200093W.
sc7toilwout W200011W.
sc7dresoft W200078W.
sc7dresdev W200011W.
sc7dreshlp RFDK_YN.
sc7dresslf W200092W.
sc7dresdif W200093W.
sc7dresyrgo W200102W.
sc7dreswout W200011W.
sc7deatdevi DEATDEVI.
sc7deathelp DEATHELP.
sc7deatsfdf DEATSFDF.
sc7dbathdevi DBATHDEV.
sc7dbathhelp DBATHHEL.
sc7dbathsfdf DBATHSFD.
sc7dtoildevi DTOILDEV.
sc7dtoilhelp DTOILHEL.
sc7dtoilsfdf DTOILSFD.
sc7ddresdevi DDRESDEV.
sc7ddreshelp DDRESHEL.
sc7ddressfdf DDRESSFD.
fl7showering W200011W.
fl7takingbth W200011W.
fl7washingup W200011W.
ds7gethlpeat W200011W.
ds7helpstmo W200095W.
ds7helpstyr W200040W.
ds7helpendmo W200095W.
ds7helpendyr W200040W.
ds7nohelp W200096W.
ds7nohelpmos RFDK_F.
ds7dschlp NW_MTHS.
ds7dschlpgr DS_GRP.
ds7flag DMDS5FLG.
mc7meds W200011W.
mc7medstrk W200099W.
mc7medsslf W200011W.
mc7whrgtmed1 RFDK_YN.
mc7whrgtmed2 RFDK_YN.
mc7whrgtmed3 RFDK_YN.
mc7whrgtmed4 RFDK_YN.
mc7howpkupm1 RFDK_YN.
mc7howpkupm2 RFDK_YN.
mc7howpkupm3 RFDK_YN.
mc7medsrem W200090W.
mc7dmedsreas dmedsrea.
mc7medsdif W200093W.
mc7medsyrgo W200102W.
mc7medsmis RFDK_YN.
mc7havregdoc W200011W.
mc7regdoclyr W200011W.
mc7hwgtregd1 RFDK_YN.
mc7hwgtregd2 RFDK_YN.
mc7hwgtregd3 RFDK_YN.
mc7hwgtregd4 RFDK_YN.
mc7hwgtregd5 RFDK_YN.
mc7hwgtregd6 RFDK_YN.
mc7hwgtregd7 RFDK_YN.
mc7hwgtregd8 RFDK_YN.
mc7hwgtregd9 RFDK_YN.
mc7ansitindr RFDK_YN.
mc7tpersevr1 RFDK_YN.
mc7tpersevr2 RFDK_YN.
mc7tpersevr3 RFDK_YN.
mc7tpersevr4 RFDK_YN.
mc7chginspln W200011W.
mc7anhlpwdec W200011W.
mc7dmedssfdf DMEDSSFD.
pa7vistfrfam W200011W.
pa7hlkepfvst W200011W.
pa7trkpfrvis W200011W.
pa7impvstfam W200114W.
pa7attrelser W200011W.
pa7htkfrrlsr W200011W.
pa7trprrelsr W200011W.
pa7imprelser W200114W.
pa7clbmtgrac W200011W.
pa7hlkpfrclb W200011W.
pa7trprkpfgr W200011W.
pa7imparclub W200114W.
pa7outfrenjy W200011W.
pa7hlkpgoenj W200011W.
pa7trprgoout W200011W.
pa7impouteny W200114W.
pa7workfrpay RFDK_YN.
pa7hlkpfrwrk W200011W.
pa7voltrwork W200011W.
pa7hlkpfrvol RFDK_YN.
pa7prcranoth RFDK_YN.
pa7evrgowalk W200011W.
pa7vigoractv W200011W.
pa7dofavact W200115W.
pa7fvactlimyr RFDK_YN.
pa5dfavact PA25FMT.
rh7rehab RFDK_YN.
rh7rehabmo W500124W.
rh7rehabweek W500125W.
rh7rehabsurg RFDK_YN.
rh7surgcond W500126W.
rh7rehabcond W500126W.
rh7funcback RFDK_YN.
rh7funchips RFDK_YN.
rh7funcknees RFDK_YN.
rh7funcfeet RFDK_YN.
rh7funchands RFDK_YN.
rh7funcwrist RFDK_YN.
rh7funcshold RFDK_YN.
rh7funchead RFDK_YN.
rh7funcneck RFDK_YN.
rh7funcarms RFDK_YN.
rh7funclegs RFDK_YN.
rh7funcstom RFDK_YN.
rh7funcmouth RFDK_YN.
rh7funcheart RFDK_YN.
rh7funclung RFDK_YN.
rh7funcos RFDK_YN.
rh7funcnotsp RFDK_YN.
rh7impchew RFDK_YN.
rh7impspeak RFDK_YN.
rh7impspain RFDK_YN.
rh7impbreath RFDK_YN.
rh7impweak RFDK_YN.
rh7impmove RFDK_YN.
rh7impenergy RFDK_YN.
rh7impbal RFDK_YN.
rh7impfall RFDK_YN.
rh7impmemory RFDK_YN.
rh7impnone RFDK_YN.
rh7impbed RFDK_YN.
rh7impwalk RFDK_YN.
rh7impleave RFDK_YN.
rh7impdistnc RFDK_YN.
rh7impclimb RFDK_YN.
rh7impdrive RFDK_YN.
rh7imptransp RFDK_YN.
rh7impnotths RFDK_YN.
rh7impsc RFDK_YN.
rh7imphh RFDK_YN.
rh7impcomp RFDK_YN.
rh7impwork RFDK_YN.
rh7impcare RFDK_YN.
rh7impactiv RFDK_YN.
rh7impactnon RFDK_YN.
rh7devcane RFDK_YN.
rh7devwhlch RFDK_YN.
rh7devramp RFDK_YN.
rh7devstair RFDK_YN.
rh7devtub RFDK_YN.
rh7devtoil RFDK_YN.
rh7deveat RFDK_YN.
rh7devdres RFDK_YN.
rh7devgrab RFDK_YN.
rh7devcomp RFDK_YN.
rh7devcar RFDK_YN.
rh7devother RFDK_YN.
rh7place1 RFDK_YN.
rh7place2 RFDK_YN.
rh7place3 RFDK_YN.
rh7place4 RFDK_YN.
rh7place5 SP5RH7W.
rh7placelast W500131W.
rh7ability W500132W.
rh7abilimp W500133W.
rh7abilworse W500133W.
rh7rehabnow RFDK_YN.
rh7metgoals RFDK_YN.
rh7metinsur RFDK_YN.
rh7abilnow W500132W.
rh7nowimp W500133W.
rh7nowworse W500133W.
sd7smokesnow W200011W.
sd7numcigday NUMCIGS.
pe7whhndsign W200116W.
pe7surghdwrt W200011W.
pe7surgyside W200117W.
pe7flruppain W200011W.
pe7sideflrup W200117W.
pe7surgarmsh W200011W.
pe7sidsurgar W200117W.
pe7surgyhips W200011W.
pe7sidhipsrg W200118W.
pe7stndwhold W200011W.
pe7upchbyslf W200011W.
pe7wlkdsself W200011W.
fl7lefthand W200011W.
fl7righthand W200011W.
fl7eiherhand W200011W.
fl7lftgrptst W200011W.
fl7rhtgrptst W200011W.
fl7charstnds W200011W.
fl7balstands W200011W.
fl7wlkingrse W200011W.
bc7dconsent W700BC2W.
ba7dblssadm BA1SS.
ba7dblstadm BA1STAN.
ba7dblftadm BA1TAN.
ba7dblopadm BA1OP.
ba7dblcladm BA1CL.
wa7dwlkadm WA1WLK.
ch7dschradm CH1SCH.
ch7drchradm CH1RSH.
gr7dgripadm GR1GRIP.
wc7dwaistadm WC1WAIST.
pk7dpeakadm PK1PEAK.
ab7datemonth W200038W.
ab7dateyear RFDK_F.
in7strtabhrs RFDK_F.
in7strtabmin RFDK_F.
in7strtmampm A0001AB.
ba7sxsresult PE_RSLT.
ba7blstdsecs RFDK_F.
ba7blstdhndr RFDK_F.
ba7rsn1ssstd RFDK_YN.
ba7rsn2ssstd RFDK_YN.
ba7rsn3ssstd RFDK_YN.
ba7rsn4ssstd RFDK_YN.
ba7rsn9ssstd RFDK_YN.
ba7stdmreslt PE_RSLT.
ba7stdmsecs RFDK_F.
ba7stdmhndr RFDK_F.
ba7rsn1ststd RFDK_YN.
ba7rsn2ststd RFDK_YN.
ba7rsn3ststd RFDK_YN.
ba7rsn4ststd RFDK_YN.
ba7rsn9ststd RFDK_YN.
ba7ftdmreslt PE_RSLT.
ba7ftdmsecs RFDK_F.
ba7ftdmhndr RFDK_F.
ba7rsn1ftstd RFDK_YN.
ba7rsn2ftstd RFDK_YN.
ba7rsn3ftstd RFDK_YN.
ba7rsn4ftstd RFDK_YN.
ba7rsn9ftstd RFDK_YN.
ba71leoreslt PE_RSLT.
ba71leosfsec RFDK_F.
ba71leohndr RFDK_F.
ba7rsn11leo RFDK_YN.
ba7rsn21leo RFDK_YN.
ba7rsn31leo RFDK_YN.
ba7rsn41leo RFDK_YN.
ba7rsn91leo RFDK_YN.
ba71lecreslt PE_RSLT.
ba71lecsfsec RFDK_F.
ba71lechndr RFDK_F.
ba7rsn11lec RFDK_YN.
ba7rsn21lec RFDK_YN.
ba7rsn31lec RFDK_YN.
ba7rsn41lec RFDK_YN.
ba7rsn91lec RFDK_YN.
wa7wlkcorspc A0002WA.
wa7wkaidused A0004WA.
wa7wlkc1rslt PE_RSLT.
wa7wlkc1secs RFDK_F.
wa7wlk1hndr RFDK_F.
wa7rsn11wkc RFDK_YN.
wa7rsn21wkc RFDK_YN.
wa7rsn31wkc RFDK_YN.
wa7rsn41wkc RFDK_YN.
wa7rsn51wkc RFDK_YN.
wa7rsn91wkc RFDK_YN.
wa7wkaidusc2 A0004WA.
wa7wlkc2rslt PE_RSLT.
wa7wlkc2secs RFDK_F.
wa7wlk2hndr RFDK_F.
wa7rsn12wkc RFDK_YN.
wa7rsn22wkc RFDK_YN.
wa7rsn32wkc RFDK_YN.
wa7rsn42wkc RFDK_YN.
wa7rsn92wkc RFDK_YN.
ch7chravail RFDK_YN.
ch7chstcompl A0004CH.
ch7chairheit RFDK_F.
ch7whlchrusd RFDK_YN.
ch7sgchstres PE_RSLT.
ch7armuse A0008CH.
ch7rsn11chs RFDK_YN.
ch7rsn21chs RFDK_YN.
ch7rsn31chs RFDK_YN.
ch7rsn41chs RFDK_YN.
ch7rsn51chs RFDK_YN.
ch7rsn91chs RFDK_YN.
ch72chstrslt PE_RSLT.
ch7chstndsec RFDK_F.
ch7chstdhndr RFDK_F.
ch7chstddone A0014CH.
ch7chstntdn1 RFDK_YN.
ch7chstntdn2 RFDK_YN.
ch7chstntdn3 RFDK_YN.
ch7chstntdn4 RFDK_YN.
ch7chstntdn5 RFDK_YN.
ch7chstntdn9 RFDK_YN.
ch7chstntat1 RFDK_YN.
ch7chstntat2 RFDK_YN.
ch7chstntat3 RFDK_YN.
ch7chstntat4 RFDK_YN.
ch7chstntat9 RFDK_YN.
gr7handtstd1 RGT_LFT.
gr7adjgr1ps3 RFDK_YN.
gr7grp1reslt PE_RSLT.
gr7grp1rdng RFDK_F.
gr7grp1noat1 RFDK_YN.
gr7grp1noat2 RFDK_YN.
gr7grp1noat3 RFDK_YN.
gr7grp1noat4 RFDK_YN.
gr7grp1noat9 RFDK_YN.
gr7handtstd2 RGT_LFT.
gr7adjgr2ps3 RFDK_YN.
gr7grp2reslt PE_RSLT.
gr7grp2rdng RFDK_F.
gr7grp2noat1 RFDK_YN.
gr7grp2noat2 RFDK_YN.
gr7grp2noat3 RFDK_YN.
gr7grp2noat4 RFDK_YN.
gr7grp2noat9 RFDK_YN.
wc7measdiff1 RFDK_YN.
wc7measdiff2 RFDK_YN.
wc7measdiff3 RFDK_YN.
wc7measdiff4 RFDK_YN.
wc7measdiff5 RFDK_YN.
wc7measdiff6 RFDK_YN.
wc7measdiff9 RFDK_YN.
wc7waistrslt PE_RSLT.
wc7wstmsrinc RFDK_F.
wc7wstmsrqrt RFDK_F.
wc7wstbulkcl RFDK_Y.
wc7whomeasur PERSON.
wc7wstpostn STAND.
wc7wstnotat1 RFDK_YN.
wc7wstnotat2 RFDK_YN.
wc7wstnotat3 RFDK_YN.
wc7wstnotat4 RFDK_YN.
wc7wstnotat5 RFDK_YN.
wc7wstnotat9 RFDK_YN.
pk7pkarf1pos STAND.
pk7pkarfl1ef EFFORT.
pk7pkarfl1rs PE_RSLT.
pk7pkarfl1rd RFDK_F.
pk7pk1noatt1 RFDK_YN.
pk7pk1noatt2 RFDK_YN.
pk7pk1noatt3 RFDK_YN.
pk7pk1noatt4 RFDK_YN.
pk7pk1noatt9 RFDK_YN.
pk7paf2posit STAND.
pk7pkarfl2ef EFFORT.
pk7pkarfl2rs PE_RSLT.
pk7pkarfl2rd RFDK_F.
pk7pk2noatt1 RFDK_YN.
pk7pk2noatt2 RFDK_YN.
pk7pk2noatt3 RFDK_YN.
pk7pk2noatt4 RFDK_YN.
pk7pk2noatt9 RFDK_YN.
cl7endtimhrs RFDK_F.
cl7endtimmin RFDK_F.
cl7endtmampm A0001AB.
r7dnhatssppb SPPB.
r7dnhatsbasc QUARTILE.
r7dnhatswksc QUARTILE.
r7dnhatschsc QUARTILE.
r7dnhatsgrav QUARTILE.
r7dnhatsgrb QUARTILE.
r7dnhatspkav QUARTILE.
r7dnhatspkb QUARTILE.
r7dsppbmiss SPPB_MIS.
r7dorigsppb RFDK_F.
r7dorigbasc RFDK_F.
r7dorigwksc RFDK_F.
r7dorigchsc RFDK_F.
hw7currweigh RFDK_F.
hw7lst10pnds RFDK_YN.
hw7trytolose W200011W.
hw7howtallft RFDK_F.
hw7howtallin RFDK_F.
el7mothalive W200011W.
el7fathalive W200011W.
wb7offelche1 W200078W.
wb7offelche2 W200078W.
wb7offelche3 W200078W.
wb7offelche4 W200078W.
wb7truestme1 W200127W.
wb7truestme2 W200127W.
wb7truestme3 W200127W.
wb7truestme4 W200127W.
wb7ageyofeel RFDK_F.
wb7agrwstmt1 W200127W.
wb7agrwstmt2 W200127W.
wb7agrwstmt3 W200127W.
ip7covmedcad W200011W.
ip7otdrugcov W200011W.
ip7mgapmedsp W200011W.
ip7cmedicaid W200011W.
ip7covtricar W200011W.
ip7nginslast W200096W.
ip7nginsnurs W200011W.
ip7typcarco1 RFDK_YN.
ip7typcarco2 RFDK_YN.
ip7typcarco3 RFDK_YN.
ip7paypremms W200129W.
lf7workfpay W200131W.
lf7abstlstwk W200131W.
lf7wrkplstmn W200011W.
lf7mrthnonjb W200011W.
lf7hrswkwork SP5LF5W.
lf7hrwrkltwk RFDK_F.
lf7hrwrklstw RFDK_F.
lf7oftpaid W200132W.
lf7doccup OCC_CODE.
lf7huswifwrk W200011W.
hp7ownrentot W200133W.
hp7mrtpadoff W200134W.
hp7mthlymort RFDK_F.
hp7mortpaymt W500135W.
hp7whnpayoff W200136W.
hp7amtstlowe RFDK_F.
hp7amoutowed W200137W.
hp7homevalue RFDK_F.
hp7homvalamt W200138W.
hp7payrent W200011W.
hp7rentamt RFDK_F.
hp7rentamout W500135W.
hp7sec8pubsn W200011W.
ew7pycredbal W200139W.
ew7crecardeb W200140W.
ew7credcdmed W200011W.
ew7amtcrdmed W200141W.
ew7medpaovtm W200011W.
ew7ampadovrt W200142W.
ew7finhlpfam W200011W.
ew7whohelfi1 RFDK_YN.
ew7whohelfi2 RFDK_YN.
ew7atchhelyr W200142W.
ew7fingftfam W200011W.
ew7whregoth1 RFDK_YN.
ew7whregoth2 RFDK_YN.
ew7whregoth3 RFDK_YN.
ew7amthlpgiv W200142W.
ew7progneed1 W200011W.
ew7progneed2 W200011W.
ew7progneed3 W200011W.
ew7mealskip1 RFDK_YN.
ew7mealskip2 W200146W.
ew7nopayhous W200011W.
ew7nopayutil W200011W.
ew7nopaymed W200011W.
ia7recsspa1 RFDK_YN.
ia7recsspa2 RFDK_YN.
ia7recsspa3 RFDK_YN.
ia7recssils1 RFDK_YN.
ia7recssils2 RFDK_YN.
ia7recssils3 RFDK_YN.
ia7rvapayls1 RFDK_YN.
ia7rvapayls2 RFDK_YN.
ia7rvapayls3 RFDK_YN.
ia7penjobou1 RFDK_YN.
ia7penjobou2 RFDK_YN.
ia7penjobou3 RFDK_YN.
ia7iraothac1 RFDK_YN.
ia7iraothac2 RFDK_YN.
ia7iraothac3 RFDK_YN.
ia7mutfdstk1 RFDK_YN.
ia7mutfdstk2 RFDK_YN.
ia7mutfdstk3 RFDK_YN.
ia7mutfdstk4 RFDK_YN.
ia7ownbond1 RFDK_YN.
ia7ownbond2 RFDK_YN.
ia7ownbond3 RFDK_YN.
ia7ownbond4 RFDK_YN.
ia7bnkacccd1 RFDK_YN.
ia7bnkacccd2 RFDK_YN.
ia7bnkacccd3 RFDK_YN.
ia7bnkacccd4 RFDK_YN.
ia7bnkacccd5 RFDK_YN.
ia7bnkacccd6 RFDK_YN.
ia7bnkacccd7 RFDK_YN.
ia7bnkacccd8 RFDK_YN.
ia7bnkacccd9 RFDK_YN.
ia7bnkaccc10 RFDK_YN.
ia7bnkaccc11 RFDK_YN.
ia7bnkaccc12 RFDK_YN.
ia7realestt1 RFDK_YN.
ia7realestt2 RFDK_YN.
ia7realestt3 RFDK_YN.
ia7realestt4 RFDK_YN.
ia7totinc RFDK_F.
ia7toincim1 RFDK_F.
ia7toincim2 RFDK_F.
ia7toincim3 RFDK_F.
ia7toincim4 RFDK_F.
ia7toincim5 RFDK_F.
ia7toincesjt W500194W.
ia7eincimj1 W500194W.
ia7eincimj2 W500194W.
ia7eincimj3 W500194W.
ia7eincimj4 W500194W.
ia7eincimj5 W500194W.
ia7toincessg W500195W.
ia7eincims1 W500195W.
ia7eincims2 W500195W.
ia7eincims3 W500195W.
ia7eincims4 W500195W.
ia7eincims5 W500195W.
ia7toincimf RFDK_I.
ia7eincimjf RFDK_I.
ia7eincimsf RFDK_I.
ir7intlang I200003W.
ir7spattitud I200005W.
ir7undrstand I200006W.
ir7sppresent I200008W.
ir7spnotprs1 RFDK_YN.
ir7spnotprs2 RFDK_YN.
ir7spnotprs3 RFDK_YN.
ir7spnotprs4 RFDK_YN.
ir7spnotprs5 RFDK_YN.
ir7spnotprs6 RFDK_YN.
ir7intvwhlp I200010W.
ir7prsnhlp1 RFDK_YN.
ir7prsnhlp2 RFDK_YN.
ir7prsnhlp3 RFDK_YN.
ir7prsnhlp4 RFDK_YN.
ir7prsnhlp5 RFDK_YN.
ir7prsnhlp6 RFDK_YN.
ir7prsnhlp91 RFDK_YN.
ir7demolang1 I200013W.
ir7sessions I200002W.
ir7sessrsn1 RFDK_YN.
ir7sessrsn2 RFDK_YN.
ir7sessrsn3 RFDK_YN.
ir7sessrsn91 RFDK_YN.
ir7conhomapt I200016W.
ir7insidhome I200002W.
ir7condihom1 I200002W.
ir7condihom2 I200002W.
ir7condihom3 I200002W.
ir7condihom4 I200002W.
ir7condihom5 I200002W.
ir7clutterr1 I200017W.
ir7clutterr2 I200017W.
ir7areacond1 I200018W.
ir7areacond2 I200018W.
ir7areacond3 I200018W.
ir7condhome1 I200019W.
ir7condhome2 I200019W.
ir7condhome3 I200019W.
ir7condhome4 I200019W.
ir7condhome5 I200019W.
ir7condhome6 I200019W.
fq7dfacdescr F200006W.
fq7dosfacd dosfacd.
fq7prtlivnam F200007W.
fq7dfacarea F200008W.
fq7dosfaca dosfaca.
fq7assdnrsng F200009W.
fq7othrlevls F200007W.
fq7whotlevl1 RFDK_YN.
fq7whotlevl2 RFDK_YN.
fq7whotlevl3 RFDK_YN.
fq7whotlevl4 RFDK_YN.
fq7whotlevl5 RFDK_YN.
fq7servaval1 F200011W.
fq7servaval2 F200011W.
fq7servaval3 F200011W.
fq7servaval4 F200011W.
fq7servaval5 F200011W.
fq7servaval6 F200011W.
fq7servaval7 F200011W.
fq7servaval10 F200011W.
fq7servaval11 F200011W.
fq7servaval8 F200011W.
fq7servaval9 F200011W.
fq7servaval12 F200011W.
fq7servaval13 F200011W.
fq7paysourc1 RFDK_F.
fq7paysourc2 RFDK_F.
fq7paysourc3 RFDK_F.
fq7paysourc4 RFDK_F.
fq7paysourc5 RFDK_F.
fq7paysourc6 RFDK_F.
fq7totalpaym F200007W.
fq7mnthlyamt RFDK_F.
fq7primpayer F200012W.
fq7govsource F200007W.
fq7dlocsp D_LOCSP.
;

/* Section #4 - Label assignment statement   */
label spid="NHATS SAMPLED PERSON ID"
r7dlmlint="R7 D LAST MTH LIFE INTVW DONE"
r7dresid="R7 D RESIDENTIAL CARE STATUS"
r6dresid="R6 D RESIDENTIAL CARE STATUS"
r5dresid="R5 D RESIDENTIAL CARE STATUS"
r4dresid="R4 D RESIDENTIAL CARE STATUS"
r3dresid="R3 D RESIDENTIAL CARE STATUS"
r2dresid="R2 D RESIDENTIAL CARE STATUS"
r1dresid="R1 D RESIDENTIAL CARE STATUS"
r7dresidlml="R7 D LAST MTH LIFE RESIDNCE"
r5dcontnew="R5 D CONTINUING OR NEW SAMPLE IN R5"
r7breakoffst="R7 CASE BREAKOFF STATUS"
r7breakoffqt="R7 CASE BREAKOFF QUESTION"
is7resptype="R7 IS2 TYPE OF RESPONDENT"
is7reasnprx1="R7 IS2A PROXY REAS SP DEMENTIA"
is7reasnprx2="R7 IS2A PROXY REAS SP ILL"
is7reasnprx3="R7 IS2A PRXY REAS SP SPCH IMPAIR"
is7reasnprx4="R7 IS2A PRXY REAS SP HEAR IMPAIR"
is7reasnprx5="R7 IS2A PROXY REAS LANG BARRIER"
is7reasnprx6="R7 IS2A PROXY REAS TEMP UNAVAIL"
is7reasnprx7="R7 IS2A PROXY REAS DECEASED"
is7reasnprx9="R7 IS2A PROXY REAS OTHER"
is7tempres="R7 IS2B2 TEMPORARY RESIDENCE"
is7prxyrelat="R7 IS9 PROXY RELATIONSHIP TO SP"
is7prxygendr="R7 IS10 PROXY GENDER"
is7famrrutin="R7 IS11 FAMILRTY SP DAILY ROUTIN"
is7proxlivsp="R7 IS11A PROXY LIVES W SP"
r5dgender="R5 D GENDER OF SP"
rl5dracehisp="R5 D RACE AND HISPANIC ETHNICITY"
r7d2intvrage="R7 D SP CAT AGE AT INTVW"
is7dproxyid="R7 D PROXY OPID"
fl7spdied="R7 F SP DIED PRIOR TO R7  "
re7spadrsnew="R7 RE4F SP ADDRESS SAME OR DIFF"
re7intplace="R7 RE7 SP INT AT PLACE OF RES"
re7newstrct="R7 RE8 NEW RESID PHYS STRUC IN R7"
re7newblgfl="R7 RE9 NEW RESID BLDG FLOORS IN R7 "
re7mthmove="R7 RE10 MONTH MOVED NEW ADDRESS "
re7yearmove="R7 RE10B YEAR MOVED NEW ADDRESS "
re7placedec="R7 RE11 CARE AT NEW RESID PLACE SP DIED"
re7alonedec="R7 RE12 LIVED ALONE AT DEATH"
re7dresistrct="R7 D RESIDNCE PHYSICAL STRCTUR"
re7dbldg="R7 D SP BLDG MORE THAN ONE FLOOR"
re7dcensdiv="R7 D SP CENSUS DIVISION"
re7dresnew="R7 D NEW RESIDENCE SINCE LAST INT"
fl7structure="R7 F RE STRUCTURE OF SP DWELLING"
fl7resnew="R7 F RE NEW RESIDENCE ROUTING FLAG"
fl7facility="R7 F RE ROUTING FLAG FROM RE4f HT3 5 6 7"
fl7hotype="R7 F RE HT TYPE OF HOME"
fl7retirecom="R7 F RE HT SP LIVES IN RETIREMT COM"
pd7placedied="R7 PD3 PLACE OF DEATH"
pd7homedied="R7 PD3B SP OR OTHER HOME DIED"
pd7hospdied="R7 PD3C HOSPITAL UNIT DIED"
pd7hospice1="R7 PD3D HOSPICE AT NURSING HOME"
pd7hospice2="R7 PD3E HOSPICE OTHER PLACE"
pd7stayunit="R7 PD4 LENGTH OF STAY UNIT"
pd7staydays="R7 PD4A LENGTH OF STAY DAYS"
pd7staywks="R7 PD4B LENGTH OF STAY WEEKS"
pd7staymths="R7 PD4C LENGTH OF STAY MONTHS"
pd7stayyrs="R7 PD4D LENGTH OF STAY YEARS"
pd7staymthpl="R7 PD4E LENGTH OF STAY MTH PLUS"
pd7placepre="R7 PD5 PLACE PRE HOSP HOSPICE NH"
pd7hospcelml="R7 PD5B HOSPICE CARE IN LAST MTH"
pd7alert="R7 PD6 ALERT IN LAST MONTH"
pd7outbed="R7 PD7 GET OUT OF BED IN LST MTH"
r7d2deathage="R7 D SP CAT AGE AT DEATH"
fl7notalert="R7 F LML NOT ALERT"
fl7notmobile="R7 F LML NOT MOBILE"
lm7pain="R7 LM1 PAIN IN LAST MONTH"
lm7painhlp="R7 LM1A GET HELP WITH PAIN"
lm7painhlpam="R7 LM1B PAIN HELP AMOUNT"
lm7bre="R7 LM2 BREATHING TROUBLE"
lm7brehlp="R7 LM2A GET HELP WITH BREATHING"
lm7brehlpam="R7 LM2B BREATHING HELP AMOUNT"
lm7sad="R7 LM3 ANXIOUS OR SAD LAST MONTH"
lm7sadhlp="R7 LM3A ANXIOUS SAD GET HELP FOR"
lm7sadhlpam="R7 LM3B ANXIOUS SAD HELP AMOUNT"
lm7caredecis="R7 LM4 DEC ABOUT CARE WO INPUT"
lm7carenowan="R7 LM5 DEC ABOUT CARE NOT WANTED"
lm7perscare="R7 LM6 PERSONAL CARE NEEDS MET"
lm7respect="R7 LM7 TREATED WITH RESPECT"
lm7informed="R7 LM8 INFORMED ABOUT CONDITION"
lm7doctor="R7 LM9 MORE THAN ONE DOCTOR"
lm7docclear="R7 LM9A CLEAR DOCTOR IN CHARGE"
lm7relg="R7 LM10 TALK RELIGIOUS BELIEFS"
lm7relgamt="R7 LM10A RELIGIOUS BLIEF CONTACT"
lm7ratecare="R7 LM11 HOW RATE CARE"
hc7health="R7 HC1 OVERALL HEALTH CONDITION"
hc7disescn1="R7 HC2 SP HAD HEART ATTACK"
hc7disescn2="R7 HC2 SP HAS HEART DISEASE"
hc7disescn3="R7 HC2 SP HAS HIGH BLOOD PRESS"
hc7disescn4="R7 HC2 SP HAS ARTHRITIS"
hc7disescn5="R7 HC2 SP HAS OSTEOPOROSIS"
hc7disescn6="R7 HC2 SP HAS DIABETES"
hc7disescn7="R7 HC2 SP HAS LUNG DISEASE"
hc7disescn8="R7 HC2 SP HAD STROKE"
hc7disescn9="R7 HC2 SP HAS DEMENTIA OR ALZH"
hc7disescn10="R7 HC2 SP HAS CANCER"
hc7cancerty1="R7 HC3 SP HAD SKIN CANCER"
hc7brokebon1="R7 HC5A SP BROKEN OR FRACT HIP"
hc7brokebon2="R7 HC5B SP OTHR BRKN FRACT BONE"
hc7hosptstay="R7 HC7 SP HOSP STAY LAST 12MOS "
hc7hosovrnht="R7 HC8 SP NUM OF HOSP STAYS"
hc7knesrgyr="R7 HC9B KNEE SURGERY IN 12 MNTHS"
hc7hipsrgyr="R7 HC10B HIP SURG IN 12 MNTHS"
hc7catrsrgyr="R7 HC11B CATER SURG IN 12 MNTHS"
hc7backsrgyr="R7 HC12B BCK SPNE SURGR 12 MNTHS"
hc7hartsrgyr="R7 HC13B HEART SURGERY 12 MONTHS"
hc7fllsinmth="R7 HC14 FALL DOWN IN LAST MONTH"
hc7worryfall="R7 HC15 WORRIED ABOT FALLNG DOWN"
hc7worrylimt="R7 HC16 WORRY EVR LIMT ACTIVTIES"
hc7faleninyr="R7 HC17 FALLEN DOWN IN 12 MONTHS"
hc7multifall="R7 HC18 FALLEN DWN MORE THN ONCE"
hc7depresan1="R7 HC19A SP LITTLE INTERST PLEAS"
hc7depresan2="R7 HC19B SP DOWN DEPRES HOPELESS"
hc7depresan3="R7 HC19C SP NERVOUS ANXIOUS"
hc7depresan4="R7 HC19D SP UNABLE TO STOP WORRY"
hc7aslep30mn="R7 HC20 OVER 30 MIN FALL ASLEEP"
hc7trbfalbck="R7 HC21 TROBLE FALLNG BCK ASLEEP"
hc7sleepmed="R7 HC22 OFTN MEDICATE HELP SLEEP"
ht7placedesc="R7 HT3 PLACE BEST DESCRIPTION"
ht7retiresen="R7 HT4 RETIRMNT CMMTY SEN HOUSIN"
ht7diffareun="R7 HT5 DIFF AREAS UNITS TO MOVE"
ht7helpmedbd="R7 HT6 HELP W MEDS BATH DRESSING"
ht7meals="R7 HT7 MEALS FOR RESIDENTS"
ht7spacename="R7 HT10 NAME OF LIVING SPACE"
fl7facility="R7 F RE ROUTING FLAG FROM RE4f HT3 5 6 7"
fl7hotype="R7 F RE HT TYPE OF HOME"
fl7retirecom="R7 F RE HT SP LIVES IN RETIREMT COM"
se7servcoff1="R7 SE1 FAC SERVICES MEALS"
se7servcoff2="R7 SE1 FAC SERVICES HELP W RX"
se7servcoff3="R7 SE1 FAC SERV HELP BATH DRESS"
se7servcoff4="R7 SE1 FAC SERVICES LAUNDRY"
se7servcoff5="R7 SE1 FAC SERVICES HOUSEKEEP"
se7servcoff6="R7 SE1 FAC SERV VAN TO DOCTOR"
se7servcoff7="R7 SE1 FAC SRV VAN TO STORE EVNT"
se7servcoff10="R7 SE1 FAC SERV FITNESS CTR"
se7servcoff11="R7 SE1 FAC SERV WALKING AREA"
se7servcoff8="R7 SE1 FAC SERV RECREATIONAL FAC"
se7servcoff9="R7 SE1 FAC SERV SOCIAL EVENTS"
se7servcoff12="R7 SE1 FAC SERV ONSITE HEALTH"
se7servcoff13="R7 SE1 FAC SERV MED EMERGENCY SYSTEM"
se7servused1="R7 SE2 SERVS USED MEALS"
se7servused2="R7 SE2 SERVS USED HELP W RX"
se7servused3="R7 SE2 SERVS USED HLP BATH DRESS"
se7servused4="R7 SE2 SERVS USED LAUNDRY"
se7servused5="R7 SE2 SERVS USED HOUSEKEEPING"
se7servused6="R7 SE2 SERVS USED VAN TO DOCTOR"
se7servused7="R7 SE2 SERVS USED VAN TO STORE"
se7servused10="R7 SE2 SERVS USED FITNESS CTR"
se7servused11="R7 SE2 SERVS USED WALKING AREA"
se7servused8="R7 SE2 SERVS USED RECREATION FAC"
se7servused9="R7 SE2 SERVS USED SOCIAL EVENTS"
se7servused12="R7 SE2 SERVS USED ONSITE HEALTH"
se7servused13="R7 SE2 SERVS USED MED EMERGENCY SYSTEM"
se7payservi1="R7 SE3 PAYMENT FOR SERV MEALS"
se7payservi2="R7 SE3 PAYMENT FOR SERV HLP W RX"
se7payservi3="R7 SE3 PAY FR SERV HLP BATH DRSS"
se7payservi4="R7 SE3 PAYMENT FOR SERV LAUNDRY"
se7payservi5="R7 SE3 PAYMNT FOR SERV HOUSEKEEP"
se7payservi6="R7 SE3 PAYMNT FR SERV VAN TO DOC"
se7payservi7="R7 SE3 PAY FOR SERV VAN TO STORE"
se7payservi10="R7 SE3 PAY FOR SERV FITNESS CTR"
se7payservi11="R7 SE3 PAY FOR SERV WALKING AREA"
se7payservi8="R7 SE3 PAY FOR SERV RECREATION"
se7payservi9="R7 SE3 PAY FOR SERV SOCIAL EVNTS"
se7payservi12="R7 SE3 PAY FOR SERV ONSITE HEALTH"
se7payservi13="R7 SE3 PAY FOR SERV MED EMERGENCY SYSTEM"
hh7marchange="R7 HH1A MARITAL STATUS CHANGE"
hh7martlstat="R7 HH1 MARITAL STATUS CHANGE OR NEW"
hh7dmarstat="R7 D MARITAL STATUS AT R7"
hh7yrendmarr="R7 HH2C YR MARR END OR SPS PASS"
hh7newspoprt="R7 HH4A1 SPOUSE PRTNR SAME OR DIFF"
hh7spgender="R7 HH5 NEW R7 SPOU PART GENDER"
hh7dspageall="R7 D SPOU PAR AGE UPDATE AND NEW"
hh7spouseduc="R7 HH9 NEW R7 SPOU PART HIGH EDUC"
hh7spoupchlp="R7 HH10 SPOUS NEED PERS CARE HLP"
hh7livwthspo="R7 HH11 LIVE WITH SPOUSE PARTNER"
hh7placekind="R7 HH12 KIND OF PLACE LIVE IN"
hh7dmarstat="R7 D MARITAL STATUS AT R7"
hh7dlvngarrg="R7 D LIVING ARRANGEMENT"
hh7dhshldnum="R7 D TOTAL NUMBER IN HOUSEHOLD"
hh7dhshldchd="R7 D TOTAL CHILDREN IN HOUSEHOLD"
hh7dspouseid="R7 D SPOUSE ID"
cs7sistrsnum="R7 CS14 NUMBER OF LIVING SISTERS"
cs7brthrsnum="R7 CS15 NUMBER OF LIVNG BROTHERS"
cs7dnumchild="R7 D NUMBER OF CHILDREN"
cs7dnmstpchd="R7 D NUMBER OF STEP CHILDREN"
cs7dnumdaugh="R7 D NUMBER OF DAUGHTERS"
cs7dnumson="R7 D NUMBER OF SONS"
sn7dnumsn="R7 D NUMBER IN SOCIAL NETWORK"
fl7noonetalk="R7 F SN SP HAS NO ONE TO TALK TO"
ho7entrstair="R7 HO1 ENTRANCE STAIRS OUTSIDE"
ho7entrccomn="R7 HO2 ENTRANCE COMMON OR PRIVAT"
ho7entrnramp="R7 HO3 RAMP AT ENTRANCE"
ho7bldgamen1="R7 HO4A NEW RES BLDG HAS ELEVATOR"
ho7bldgamen2="R7 HO4B NEW RES BLDG STAIR LIFT GLIDE"
ho7bldgamen3="R7 HO4C NEW RES BLDG COMMN SPACE MEALS"
ho7bldgamen4="R7 HO4D NEW RES BLDG SPACE SOCIAL EVT"
ho7levelsflr="R7 HO5 NUMBR OF LEVELS OR FLOORS"
ho7homeamen1="R7 HO8A BED KITCHN BATH SAME FLR"
ho7homeamen2="R7 HO8B HOME HAS ELEVATOR"
ho7homeamen3="R7 HO8C HOME HAS STAIR LFT GLIDE"
ho7bathprivt="R7 HO10 NEW FAC RES PRIV BATH"
ho7bathamen1="R7 HO11A BATH HAS BATHTUB"
ho7bathamen2="R7 HO11B BATH HAS SHOWER STALL"
ho7bathamen3="R7 HO11C BATH GRAB BAR IN SHOWER"
ho7bathamen4="R7 HO11D BATH SEAT FR SHOWER TUB"
ho7bathamen5="R7 HO11E BATH RAISED TOILET SEAT"
ho7bathamen6="R7 HO11F BATH GRAB BARS TOILET"
ho7bathamen7="R7 HO11G BATH MED EMERGNCY SYSTM"
ho7kitchnprv="R7 HO12 NEW FAC RES PRIV KITCHEN"
ho7kitchncom="R7 HO13 NEW FAC RES COMMON KITCHEN"
ho7microwave="R7 HO14 USE OF MICROWAVE"
ho7dbldg1="R7 D BLDG HAS ELEVATOR"
ho7dbldg2="R7 D BLDG HAS STAIR LIFT GLIDE"
ho7dbldg3="R7 D BLDG HAS COMMN SPACE MEALS"
ho7dbldg4="R7 D BLDG HAS SPACE SOCIAL EVENT"
ho7dbathprvt="R7 D FAC HAS PRIVATE BATH"
ho7dkitchnpr="R7 D FAC HAS PRIV KITCHEN"
ho7dkitchnco="R7 D FAC HAS COMMON KITCHEN"
fl7bathgrbbr="R7 F HO SPS BATH HAS GRAB BARS"
fl7bathseat="R7 F HO SPS BATH HAS SEAT"
fl7raisedtlt="R7 F HO SP HAS RAISED TOILET"
fl7tltgrbbr="R7 F HO SP TOILET HAS GRAB BARS"
em7modhere1="R7 EM1 NEW RES ALL ITEMS HERE"
em7addlstyr1="R7 EM2A RAMP ADDED"
em7addlstyr2="R7 EM2B ELEVATOR ADDED"
em7addlstyr3="R7 EM2C STR LIFT ADDED"
em7addlstyr4="R7 EM2D SHWR GRABBAR ADDED"
em7addlstyr5="R7 EM2E BATHSEAT ADDED"
em7addlstyr6="R7 EM2F TOILETSEAT ADDED"
em7addlstyr7="R7 EM2G TOILET GRABBARS ADDED"
em7payyufam1="R7 EM3A SP PAID FOR RAMP"
em7payyufam2="R7 EM3B SP PAID FOR ELEVATOR"
em7payyufam3="R7 EM3C SP PAID STAIR LFT GLIDE"
em7payyufam4="R7 EM3D SP PAID SHOWER GRABBAR"
em7payyufam5="R7 EM3E SP PAID SHOWER SEAT"
em7payyufam6="R7 EM3F SP PAID RAISD TOILT SEAT"
em7payyufam7="R7 EM3G SP PAID TOILET GRABBARS"
em7paydevce1="R7 EM4A SP PAID FOR VISION AIDS"
em7paydevce2="R7 EM4B SP PAID FOR HEARING AID"
em7paydevce3="R7 EM4C SP PAID FOR CANE"
em7paydevce4="R7 EM4D SP PAID FOR WALKER"
em7paydevce5="R7 EM4E SP PAID FOR WHEELCHAIR"
em7paydevce6="R7 EM4F SP PAID FOR SCOOTER"
em7paydevce7="R7 EM4G SP PAID FOR GRABBER"
em7paydevce8="R7 EM4H SP PD SPECIAL DRESS ITM"
em7paydevce9="R7 EM4I SP PAID ADAPTED UTENSILS"
em7payaltgth="R7 EM5 PAY FOR THESE ALTOGETHER"
em7morls1000="R7 EM6 MORE LESS OR ABOUT $1000"
em7morls100="R7 EM7 MORE LESS OR ABOUT $100"
cm7knowwell="R7 CM1 PEOPL KNOW EACH OTHR WELL"
cm7willnghlp="R7 CM2 PEOPL WILLG HLP EACH OTHR"
cm7peoptrstd="R7 CM4 PEOPLE CAN BE TRUSTED"
te7cellphone="R7 TE1 WORKING CELL PHONE"
te7othrphone="R7 TE3 ONE PHONE OTHER THAN CELL"
te7computer="R7 TE6 HAS A WORKING COMPUTER"
te7compoth="R7 TE8 USED COMPUTER ANYWHRE ELS"
te7tablet="R7 TE8A SP HAS A TABLET COMPUTER"
te7emailtext="R7 TE9 EMAIL OR TEXTING"
te7oftnemail="R7 TE10 EMAIL OR TEXTING OFTEN"
te7online="R7 TE11 ONLINE COMPUTER USE"
te7shoponli1="R7 TE12A INTERNET SHOP GROCERY"
te7shoponli2="R7 TE12B INTERNET BANKING"
te7shoponli3="R7 TE12C INTERNET ORDR REFLL RX "
te7socialnet="R7 TE12D SOCIAL NETWORK SITES"
te7intrntmd1="R7 TE13A INTERNET MEDICAL PROVDR"
te7intrntmd2="R7 TE13B INTERNET INSURANCE INFO"
te7intrntmd3="R7 TE13C INTERNET HEALTH CONDS"
md7canewlker="R7 MD1 USED CANE WALKER WHLCHAIR"
md7cane="R7 MD2 USED A CANE"
md7walker="R7 MD3 USED A WALKER"
md7wheelchar="R7 MD4 USED A WHEELCHAIR"
md7whelcrspc="R7 MD4A WHELCHAIR IN LIVNG SPACE"
md7scooter="R7 MD5 USE A SCOOTER"
md7scterinsp="R7 MD5A SCOOTER IN LIVING SPACE"
fl7cane="R7 F MD SP USES CANE"
fl7walker="R7 F MD SP USES WALKER"
fl7wheelchr="R7 F MD SP USES WHEELCHAIR"
fl7whlchrhom="R7 F MD SP HAS WHEELCHR AT HOME"
fl7scooter="R7 F MD SP USES SCOOTER"
fl7scooterhm="R7 F MD SP HAS SCOOTER AT HOME"
ss7heringaid="R7 SS3 HEARING AID USED"
ss7hearphone="R7 SS4A SP CAN USE TELEPHONE"
ss7convwradi="R7 SS4B CONVERSATIN WTH TV RADIO"
ss7convquiet="R7 SS4C CONVERS IN QUIET ROOM"
ss7glasseswr="R7 SS7 WEARS GLASSES CONTCTS"
ss7seewellst="R7 SS8A SEES ACROSS THE STREET"
ss7seestvgls="R7 SS8B TV ACROSS ROOM W GLASSES"
ss7glasscls="R7 SS10 WEAR GLS CONTCS SEE CLOS"
ss7othvisaid="R7 SS11 USED OTHER VISION AIDS"
ss7glrednewp="R7 SS12 CAN READ NEWSPAPER PRINT"
ss7probchswl="R7 SS13 PROBLEMS CHEW OR SWALLOW"
ss7probspeak="R7 SS14 PROBLEMS SPEAKING"
ss7painbothr="R7 SS15 BOTHERED BY PAIN"
ss7painlimts="R7 SS17 PAIN EVER LIMTS ACTIVIT"
ss7painmedof="R7 SS18A LST MNTH OFTEN PAIN MED"
ss7painwhe1="R7 SS18B BACK PAIN IN LAST MNTH"
ss7painwhe2="R7 SS18B HIP PAIN IN LAST MONTH"
ss7painwhe3="R7 SS18B KNEE PAIN IN LAST MNTH"
ss7painwhe4="R7 SS18B FOOT PAIN IN LAST MNTH"
ss7painwhe5="R7 SS18B HAND PAIN IN LAST MNTH"
ss7painwhe6="R7 SS18B WRIST PAIN IN LAST MNTH"
ss7painwhe7="R7 SS18B SHOULDR PAIN LST MNTH"
ss7painwhe8="R7 SS18B HEAD PAIN IN LAST MNTH"
ss7painwhe9="R7 SS18B NECK PAIN IN LAST MNTH"
ss7painwhe10="R7 SS18B ARM PAIN IN LAST MNTH"
ss7painwhe11="R7 SS18B LEG PAIN IN LAST MNTH"
ss7painwhe12="R7 SS18B STOMACH PAIN LAST MNTH"
ss7painwhe13="R7 SS18B OTHR SPCFY PAIN LST MO"
ss7probbreat="R7 SS19 BREATHING PROBLEMS"
ss7prbbrlimt="R7 SS20 BREATH PROBLS LIMT ACTIV"
ss7strnglmup="R7 SS21 UPPER BOD STRENGTH LIMIT"
ss7uplimtact="R7 SS22 UP BOD STRNGTH LIMT ACT"
ss7lwrbodstr="R7 SS23 LOWER BODY STRNGTH LIMIT"
ss7lwrbodimp="R7 SS24 LWER BOD STRNGTH IMT ACT"
ss7lowenergy="R7 SS25 LOW ENERGY IN LAST MONTH"
ss7loenlmtat="R7 SS26 LOW ENERGY EVER LIM ACT"
ss7prbbalcrd="R7 SS27 BALANCE OR COORD PROBS"
ss7prbbalcnt="R7 SS28 BAL COORD PROB LIMIT ACT"
fl7deaf="R7 F SS DEAF CURRENT ROUND "
fl7blind="R7 F SS BLIND CURRENT ROUND "
pc7walk6blks="R7 PC1 ABLE TO WALK 6 BLOCKS"
pc7walk3blks="R7 PC2 ABLE TO WALK 3 BLOCKS"
pc7up20stair="R7 PC3 ABLE TO WALK UP 20 STAIRS"
pc7up10stair="R7 PC4 ABLE TO WALK UP 10 STAIRS"
pc7car20pnds="R7 PC5 ABLE TO CARRY 20 POUNDS"
pc7car10pnds="R7 PC6 ABLE TO CARRY 10 POUNDS"
pc7geonknees="R7 PC7 ABLE TO GET DOWN ON KNEES"
pc7bendover="R7 PC8 ABLE TO BEND OVER"
pc7hvobovrhd="R7 PC9 HEAVY OBJECT ABOVE HEAD"
pc7rechovrhd="R7 PC10 ABLE TO REACH OVERHEAD"
pc7opnjarwhd="R7 PC11 OPEN SEALED JAR W HANDS"
pc7grspsmobj="R7 PC12 ABLE GRASP SMALL OBJECTS"
cp7memrygood="R7 CP1 HOW GOOD MEMRY AT PRESNT"
cp7knownspyr="R7 CP2 KNOWN SP 4 AT LEAST A YR"
cp7chgthink1="R7 CP3A SP DIFF REMEMBER DATE"
cp7chgthink2="R7 CP3B SP REPEATS SELF"
cp7chgthink3="R7 CP3C SP DIFF REMEMBER APPT"
cp7chgthink4="R7 CP3D SP CHNG INTRST ACT HOB"
cp7chgthink5="R7 CP3E SP DIFF WITH MONEY MGMT"
cp7chgthink6="R7 CP3F SP DIFF LEARNG USE TOOL"
cp7chgthink7="R7 CP3G SP PRBLMS WITH JDGMNT"
cp7chgthink8="R7 CP3H SP DLY PRBLMS W THNK MEM"
cp7memcogpr1="R7 CP4A LOST IN FAMILIAR ENVIRON"
cp7memcogpr2="R7 CP4B SP WANDERD OFF NO RETRN"
cp7memcogpr3="R7 CP4C SP ABLE LEFT ALONE 1 HR"
cp7memcogpr4="R7 CP4D SP HEARS SEES THNGS"
cp7dad8dem="R7 D DEMENTIA REPORTED IN PRIOR AD8"
cg7speaktosp="R7 CG1A MAY SPEAK TO SP ASK QUES"
cg7quesremem="R7 CG1C START W QUES ABOUT MEMRY"
cg7reascano1="R7 CG1D SP CANT ANS DEMENTIA"
cg7reascano2="R7 CG1D SP CANT ANS UNABLE SPEAK"
cg7reascano3="R7 CG1D SP CANT ANS UNABLE HEAR"
cg7reascano4="R7 CG1D SP CANT ANS SP REFUSED"
cg7reascano5="R7 CG1D SP CANT ANS PROXY REFUSD"
cg7reascano6="R7 CG1D SP CANT ANS NOT PRESENT"
cg7reascano7="R7 CG1D SP CANT ANS SP TOO ILL"
cg7reascano8="R7 CG1D SP CANT ANS LANG BARRIER"
cg7reascano9="R7 CG1D SP CANT ANS OTHR SPECIFY"
cg7ratememry="R7 CG2 RATE YOUR MEMORY"
cg7ofmemprob="R7 CG3 OFTN MEMRY PROBS INTERFER"
cg7memcom1yr="R7 CG4 MEMRY COMPARD TO 1 YR AGO"
cg7todaydat1="R7 CG6Aa TODAY'S DATE CORRCT MNTH"
cg7todaydat2="R7 CG6Ab TODAY'S DATE CORRECT DAY"
cg7todaydat3="R7 CG6Ac TODAY'S DATE CORRECT YR"
cg7todaydat5="R7 CG6Ad USED AID FOR MTH DAY YEAR"
cg7todaydat4="R7 CG6Ba TODAY'S DATE CORRCT DOW"
cg7todaydat6="R7 CG6Bb USED AID FOR DAY OF WEEK"
cg7prewrdrcl="R7 CG7PRE INTRO TO WORD RECALL"
cg7dwrdlstnm="R7 D WHICH WORD LIST ASSIGNED"
cg7wrdsrcal1="R7 CG8 1 TELL WORDS U CAN RECALL"
cg7wrdsrcal2="R7 CG8 2 TELL WORDS U CAN RECALL"
cg7wrdsrcal3="R7 CG8 3 TELL WORDS U CAN RECALL"
cg7wrdsrcal4="R7 CG8 4 TELL WORDS U CAN RECALL"
cg7wrdsrcal5="R7 CG8 5 TELL WORDS U CAN RECALL"
cg7wrdsrcal6="R7 CG8 6 TELL WORDS U CAN RECALL"
cg7wrdsrcal7="R7 CG8 7 TELL WORDS U CAN RECALL"
cg7wrdsrcal8="R7 CG8 8 TELL WORDS U CAN RECALL"
cg7wrdsrcal9="R7 CG8 9 TELL WORDS U CAN RECALL"
cg7wrdsrcal10="R7 CG8 10 TELLWORDS U CAN RECALL"
cg7dwrdimmrc="R7 D SCORE IMMEDIATE WORD RECALL"
cg7dwrdinone="R7 D IMMEDIATE RECALL NONE"
cg7dwrdirref="R7 D IMMEDIATE RECALL REFUSED"
cg7wrdsntlst="R7 CG8A WORDS NOT ON LIST"
cg7numnotlst="R7 CG8B NUM WORDS NOT ON LIST"
cg7probreca1="R7 CG9 SP HAD DIFF HEARING WORDS"
cg7probreca2="R7 CG9 INTERRUPTION AS LIST READ"
cg7probreca3="R7 CG9 PROB WORD RECALL SPECIFY"
cg7probreca4="R7 CG9 WD RECALL NO PROB OCCURRD"
cg7probreca5="R7 CG9 SP REFUSED WORD RECALL"
cg7dclkdraw="R7 D SCORE OF CLOCK DRAWING TEST"
cg7dclkimgcl="R7 D IMAGE CLARITY CLOCK DRAWING"
cg7atdrwclck="R7 CG10A SP ATTEMPT CLOCK DRAWIG"
cg7presidna1="R7 CG13A PRES LAST NAME CORRECT"
cg7presidna2="R7 CG13B PRES LAST NAME INCORRCT"
cg7presidna3="R7 CG13C PRES FIRST NAME CORRCT"
cg7presidna4="R7 CG13D PRES FIRST NAME INCORR"
cg7vpname1="R7 CG14A VP LAST NAME CORRECT"
cg7vpname2="R7 CG14B VP LAST NAME INCORRECT"
cg7vpname3="R7 CG14C VP FIRST NAME CORRECT"
cg7vpname4="R7 CG14D VP FIRST NAME INCORRECT"
cg7wrdsdcal1="R7 CG15 1 DELAYED WORD RECALL"
cg7wrdsdcal2="R7 CG15 2 DELAYED WORD RECALL"
cg7wrdsdcal3="R7 CG15 3 DELAYED WORD RECALL"
cg7wrdsdcal4="R7 CG15 4 DELAYED WORD RECALL"
cg7wrdsdcal5="R7 CG15 5 DELAYED WORD RECALL"
cg7wrdsdcal6="R7 CG15 6 DELAYED WORD RECALL"
cg7wrdsdcal7="R7 CG15 7 DELAYED WORD RECALL"
cg7wrdsdcal8="R7 CG15 8 DELAYED WORD RECALL"
cg7wrdsdcal9="R7 CG15 9 DELAYED WORD RECALL"
cg7wrdsdca10="R7 CG15 10 DELAYED WORD RECALL"
cg7dwrddlyrc="R7 D SCORE DELAYED WORD RECALL"
cg7dwrddnone="R7 D DELAYED RECALL NONE"
cg7dwrddrref="R7 D DELAYED RECALL REFUSED"
cg7wrdnotlst="R7 CG16 WORDS NOT ON LIST"
cg7numwrdnot="R7 CG17 NUM OF WORDS NOT ON LIST"
cg7dwrd1rcl="R7 D WORD1 IMMEDIATE RECALL"
cg7dwrd2rcl="R7 D WORD2 IMMEDIATE RECALL"
cg7dwrd3rcl="R7 D WORD3 IMMEDIATE RECALL"
cg7dwrd4rcl="R7 D WORD4 IMMEDIATE RECALL"
cg7dwrd5rcl="R7 D WORD5 IMMEDIATE RECALL"
cg7dwrd6rcl="R7 D WORD6 IMMEDIATE RECALL"
cg7dwrd7rcl="R7 D WORD7 IMMEDIATE RECALL"
cg7dwrd8rcl="R7 D WORD8 IMMEDIATE RECALL"
cg7dwrd9rcl="R7 D WORD9 IMMEDIATE RECALL"
cg7dwrd10rcl="R7 D WORD10 IMMEDIATE RECALL"
cg7dwrd1dly="R7 D WORD1 DELAYED RECALL"
cg7dwrd2dly="R7 D WORD2 DELAYED RECALL"
cg7dwrd3dly="R7 D WORD3 DELAYED RECALL"
cg7dwrd4dly="R7 D WORD4 DELAYED RECALL"
cg7dwrd5dly="R7 D WORD5 DELAYED RECALL"
cg7dwrd6dly="R7 D WORD6 DELAYED RECALL"
cg7dwrd7dly="R7 D WORD7 DELAYED RECALL"
cg7dwrd8dly="R7 D WORD8 DELAYED RECALL"
cg7dwrd9dly="R7 D WORD9 DELAYED RECALL"
cg7dwrd10dly="R7 D WORD10 DELAYED RECALL"
mo7outoft="R7 MO1 OFTEN GO OUTSIDE"
mo7outcane="R7 MO2 CANE USED OUTSIDE"
mo7outwalkr="R7 MO3 WALKER USED OUTSIDE"
mo7outwlchr="R7 MO4 WHEELCHAIR USED OUTSIDE"
mo7outsctr="R7 MO5 SCOOTER USED OUTSIDE"
mo7outhlp="R7 MO6 HELP GO OUTSIDE"
mo7outslf="R7 MO7 LEFT BY YOURSELF"
mo7outdif="R7 MO8 HOW DIFFICULT"
mo7outyrgo="R7 MO9 HOW OFTEN LEAVE"
mo7outwout="R7 MO10 STAYED IN NO HELP"
mo7oftgoarea="R7 MO11 HOW OFTEN GO OTHER AREAS"
mo7oflvslepr="R7 MO12 HOW OFTN LEAVE BEDROOM"
mo7insdcane="R7 MO13 OFTEN USED CANE INSIDE"
mo7insdwalkr="R7 MO14 OFTEN USED WALKER INSIDE"
mo7insdwlchr="R7 MO15 OFT USD WHEELCHAR INSIDE"
mo7insdsctr="R7 MO16 OFTEN USD SCOOTER INSIDE"
mo7oftholdwl="R7 MO17 OFTEN HOLD WALLS INSIDE"
mo7insdhlp="R7 MO18 GOT HELP INSIDE"
mo7insdslf="R7 MO20 HOW OFTEN BY YOURSELF"
mo7insddif="R7 MO21 HOW DIFF GET ARD W DEVCE"
mo7insdyrgo="R7 MO22 HOW OFTEN COMPRED YR AGO"
mo7insdwout="R7 MO23 PLACES INSIDE DID NOT GO"
mo7beddev="R7 MO24 OUT OF BED USED DEVICE"
mo7bedhlp="R7 MO25 GOT HELP OUT OF BED"
mo7bedslf="R7 MO26 OFT GOT OUT BED BY SLF"
mo7beddif="R7 MO27 DIFF GET OUT BED BY SELF"
mo7bedwout="R7 MO28 OFTEN HAD TO STAY IN BED"
mo7doutsfdf="R7 D GO OUTSIDE SELF "
mo7doutdevi="R7 D GO OUTSIDE USING DEVICES"
mo7douthelp="R7 D GO OUTSIDE USING HELP"
mo7dinsdsfdf="R7 D MOVE INSIDE SELF"
mo7dinsddevi="R7 D MOVE INSIDE WITH DEVICES"
mo7dinsdhelp="R7 D MOVE INSIDE WITH HELP"
mo7dbedsfdf="R7 D GET OUT OF BED"
mo7dbeddevi="R7 D DEVICE USE 2 GET OUT OF BED"
mo7dbedhelp="R7 D HELP TO GET OUT OF BED"
fl7didntleav="R7 F MO SP DID NOT LEAVE HOME"
fl7ntlvrmslp="R7 F MO SP DID NOT LEAVE BEDROOM"
dm7helpmobil="R7 DM1 GET HELP WITH MOBILITY"
dm7helpstmo="R7 DM3C MONTH MOBIL HELP STARTED"
dm7helpstyr="R7 DM3C1 YEAR MOBIL HELP STARTED"
dm7helpendmo="R7 DM3D MONTH MOBIL HELP ENDED"
dm7helpendyr="R7 DM3D1 YEAR MOBIL HELP ENDED"
dm7nohelp="R7 DM3E NO MOBIl HELP MTH PLUS"
dm7nohelpmos="R7 DM3F MONTHS OF NO MOBIl HELP"
dm7lstyrcane="R7 DM4 IN LST YR USE CANE WALKER"
dm7devstmo="R7 DM6C MONTH DEVICE USE STARTED"
dm7devstyr="R7 DM6C1 YEAR DEVICE USE STARTED"
dm7devendmo="R7 DM6D MONTH DEVICE USE ENDED"
dm7devendyr="R7 DM6D1 YEAR DEVICE USE ENDED"
dm7nodev="R7 DM6E NO DEVICE MONTH PLUS"
dm7nodevmos="R7 DM6F MONTHS OF NO DEVICE"
dm7dmohlp="R7 D MONTHS OF MOBILITY HELP"
dm7dmodev="R7 D MONTHS OF MOBILITY DEVICE HELP"
dm7dmohlpgr="R7 D MOBILITY HELP GROUP"
dm7dmodevgr="R7 D MOBILITY DEVICE GROUP"
dmds7dintvl="R7 D MONTHS BETWEEN LAST INT AND EITHER CURRENT INT OR DATE OF DEATH"
dm7flag="R7 D SPECIAL CASES DM SECTION ROUTE"
dt7driveyr="R7 DT1A DRIVE IN LAST YEAR"
dt7oftedrive="R7 DT1 HOW OFTEN DRIVE PLACES"
dt7avoidriv1="R7 DT3A AVOID DRIVING AT NIGHT"
dt7avoidriv2="R7 DT3A AVOID DRIVING ALONE"
dt7avoidriv3="R7 DT3A AVOID DRIVING HIGHWAYS"
dt7avoidriv4="R7 DT3A AVOID DRIVING BAD WEATHER"
dt7getoplcs1="R7 DT4A SP WALKED GOT PLACES"
dt7getoplcs2="R7 DT4B GOT RIDE FAM FRIEND PD"
dt7getoplcs3="R7 DT4C VANSHUTTLE PROV BY PLACE"
dt7getoplcs4="R7 DT4D VAN SHUTTLE FOR SENIORS"
dt7getoplcs5="R7 DT4E SP TOOK PUBLIC TRANSPRT"
dt7getoplcs6="R7 DT4F SP TOOK TAXI GOT PLACES"
dt7getoplcs7="R7 DT4G GOT PLACES OTHR SPECIFY"
dt7otfrfamtk="R7 DT6 ANTH FND FAM MEM TOOK YOU"
fl7drives="R7 F DT SP DRIVES CAR"
fl7drvlstyr="R7 F DT SP DROVE CAR IN PAST YR"
fl5dneverdrv="R5 F DT SP NEVER DROVE WHEN ADDED"
ha7laun="R7 HA1 HOW LAUNDRY GOT DONE"
ha7launslf="R7 HA1A DO LAUNDRY YOURSELF"
ha7whrmachi1="R7 HA2 WASH MACHINE IN HOME"
ha7whrmachi2="R7 HA2 WASH MACHIN IN BUILDING"
ha7whrmachi3="R7 HA2 WASH MACHIN LAUNDROMAT"
ha7whrmachi4="R7 HA2 WASH MACHIN SINK IN HOME"
ha7whrmachi5="R7 HA2 WASH MACH SINK IN BUILDNG"
ha7whrmachi6="R7 HA2 WASH MACHIN OTHR SPECIFY"
ha7dlaunreas="R7 D LAUNDRY REASN WITH BY OTHERS"
ha7laundif="R7 HA5 DIFF DOING LAUNDY BY SELF"
ha7launoft="R7 HA6 HOW OFTEN DO LAUNDRY"
ha7launwout="R7 HA7 EVER GO WOUT CLEAN LAUNDR"
ha7shop="R7 HA20 HOW YOUR SHOPPING DONE"
ha7shopslf="R7 HA20A EVER SHOP BY YOURSELF"
ha7howpaygr1="R7 HA22 PAY GROC PERS ITMS CASH"
ha7howpaygr2="R7 HA22 PAY GROC PERS ITMS CHCK"
ha7howpaygr3="R7 HA22 PAY GROC PERS ITMS DEBIT"
ha7howpaygr4="R7 HA22 PAY GROC PERS CREDIT"
ha7howpaygr5="R7 HA22 PAY GROC PERS FOOD STMP"
ha7howpaygr6="R7 HA22 PAY GROC PERS SMON ELS"
ha7howpaygr7="R7 HA22 PAY GROC PERS OTHR SPEC"
ha7howgtstr1="R7 HA23 DROVE TO THE STORE"
ha7howgtstr2="R7 HA23 FAM FRND PD HLP DROVE"
ha7howgtstr3="R7 HA23 VAN PLACE SP LIVES DROVE"
ha7howgtstr4="R7 HA23 VAN 4 DIS SENIORS DROVE"
ha7howgtstr5="R7 HA23 PUBLIC TRANSPORT 2 STORE"
ha7howgtstr6="R7 HA23 SP TOOK TAXI 2 THE STORE"
ha7howgtstr7="R7 HA23 SP WALKED TO THE STORE"
ha7howgtstr8="R7 HA23 OTHR SPECIFY TO STORE"
ha7shopcart="R7 HA24A EVER USE MOTORIZED CART"
ha7shoplean="R7 HA24B EVER LEAN ON SHOP CART"
ha7dshopreas="R7 D SHOP REASN WITH BY OTHERS "
ha7shopdif="R7 HA27 DIFF SHOPPING BY SELF"
ha7shopoft="R7 HA28 HOW OFT SHOP GROCERIES"
ha7shopwout="R7 HA29 EVER GO WITHOUT GROCRIES"
ha7meal="R7 HA30 HOW HOT MEALS GET MADE"
ha7mealslf="R7 HA30A MAKE HOT MEALS YOURSELF"
ha7restamels="R7 HA30B OFTN HAV RESTARNT MEALS"
ha7mealwheel="R7 HA30C OFTN GET MEALS ON WHEEL"
ha7oftmicrow="R7 HA31 OFTEN USE THE MICROWAVE"
ha7dmealreas="R7 D MEALS REASN WITH BY OTHERS"
ha7mealdif="R7 HA34 DIFICULTY MAK MEALS SELF"
ha7mealoft="R7 HA35 HOW OFTEN MAKE HOT MEALS"
ha7mealwout="R7 HA36 EVER GO WITHOUT HOT MEAL"
ha7bank="R7 HA40 HOW BILLS BANKIN HANDLED"
ha7bankslf="R7 HA40A HNDL BILLS BNKING YRSLF"
ha7dbankreas="R7 D BANK BILL REASN WITH BY OTH"
ha7bankdif="R7 HA44 DIF HNDL BLLS BNKING SLF"
ha7bankoft="R7 HA45 HOW OFTEN YOU PAY BILLS"
ha7bankwout="R7 HA46 EVER GO WOUT PAYIN BILLS"
ha7money="R7 HA50 MONEY MATTERS TO HANDLE"
ha7moneyhlp="R7 HA51 ANYONE HLP W MONY MATTRS"
ha7dlaunsfdf="R7 D LAUNDRY SELF AND DIFF LEVEL"
ha7dshopsfdf="R7 D SLF SHOPPING AND DIFF LEVEL"
ha7dmealsfdf="R7 D SELF MEALS AND DIFF LEVEL"
ha7dbanksfdf="R7 D SELF BANKS AND DIFF LEVEL"
ha7dmealwhl="R7 D HELPER IS MEALS ON WHEELS"
ha7dmealtkot="R7 D HELPER IS RESTAURNT TAKEOUT"
sc7eatdev="R7 SC1 EVER USE ADAPTED UTENSILS"
sc7eatdevoft="R7 SC2 OFTEN USE ADAPTED UTENSLS"
sc7eathlp="R7 SC3 DID ANYONE HELP YOU EAT"
sc7eatslfoft="R7 SC4 HOW OFTEN EAT BY YOURSELF"
sc7eatslfdif="R7 SC5 DIFFICULTY EATING BY SELF"
sc7eatwout="R7 SC6 GO WOUT EAT BECSE NO HELP"
sc7showrbat1="R7 SC7 SP SHOWERED"
sc7showrbat2="R7 SC7 SP TOOK BATHS IN A TUB"
sc7showrbat3="R7 SC7 SP WASHED SOME OTHR WAY"
sc7bdevdec="R7 SC7A USE BATH DEVICE IN LML"
sc7prfrshbth="R7 SC8 PREFER SHOWR BATH OR OTHR"
sc7scusgrbrs="R7 SC9 HOW OFTEN USE GRAB BARS"
sc7shtubseat="R7 SC10 OFTN USE SHOWR TUB SEAT"
sc7bathhlp="R7 SC11 ANYN HLP SHOWR BATH OTHR"
sc7bathoft="R7 SC12 HOW OFTEN BATHE YOURSELF"
sc7bathdif="R7 SC13 DIFF USING BARS OR SEATS"
sc7bathyrgo="R7 SC14 BATHE MRE OFT THN YR AGO"
sc7bathwout="R7 SC15 EVER GO WITHOUT WASHING"
sc7usvartoi1="R7 SC16 SP USED PORTABLE COMMODE"
sc7usvartoi2="R7 SC16 SP USED PADS UNDERGMT"
sc7usvartoi3="R7 SC16 USED GRABBARS FR TOILET"
sc7usvartoi4="R7 SC16 USED RAISED TOILET SEAT"
sc7toilhlp="R7 SC17 ANYON HLP YOU USE TOILET"
sc7toiloft="R7 SC18 OFTEN USE TOILET BY SELF"
sc7toildif="R7 SC19 DIFFICUTY TOILETING SELF"
sc7toilwout="R7 SC20 ACCIDENT WET SOIL CLTHES"
sc7dresoft="R7 SC21 OFTEN YOU GET DRESSED"
sc7dresdev="R7 SC22 USE SPECL ITEMS TO DRESS"
sc7dreshlp="R7 SC23 ANYONE HELP GET DRESSED"
sc7dresslf="R7 SC24 OFTEN YOU DRESS YOURSELF"
sc7dresdif="R7 SC25 DIF WHN US SP ITMS YRSLF"
sc7dresyrgo="R7 SC26 HOW OFTN YOU GET DRESSED"
sc7dreswout="R7 SC27 GO WITHOUT GTTNG DRESSED"
sc7deatdevi="R7 D USES DEVICES WHILE EATING"
sc7deathelp="R7 D HAS HELP EATING"
sc7deatsfdf="R7 D DIFF EATING BY SELF WO HELP"
sc7dbathdevi="R7 D USES DEVICES WHILE BATHING"
sc7dbathhelp="R7 D HAS HELP WHILE BATHING"
sc7dbathsfdf="R7 D DIFF BATHING SELF NO HELP"
sc7dtoildevi="R7 D USES DEVICE WHILE TOILETING"
sc7dtoilhelp="R7 D HAS HELP WHILE TOILETING"
sc7dtoilsfdf="R7 D DIFF LEVEL TOILETING SELF"
sc7ddresdevi="R7 D USES DEVICES WHILE DRESSING"
sc7ddreshelp="R7 D HAS HELP WHILE DRESSING"
sc7ddressfdf="R7 D DIFF LEVEL DRESSING SELF"
fl7showering="R7 F SC SP USES SHOWER"
fl7takingbth="R7 F SC SP TAKES BATHS"
fl7washingup="R7 F SC SP WASHES OTHER WAY"
ds7gethlpeat="R7 DS1 GET HELP WITH EATING, ETC"
ds7helpstmo="R7 DS3C MONTH SELF CARE HLP START"
ds7helpstyr="R7 DS3C1 YEAR SELF CARE HELP STARTED"
ds7helpendmo="R7 DS3D MONTH SELF CARE HELP ENDED"
ds7helpendyr="R7 DS3D1 YEAR SELF CARE HELP ENDED"
ds7nohelp="R7 DS3E NO SELF CARE HELP MTH PLUS"
ds7nohelpmos="R7 DS3F MONTHS OF NO SELF CARE HELP"
ds7dschlp="R7 D MONTHS OF SELF CARE HELP"
ds7dschlpgr="R7 D SELF CARE HELP GROUP"
ds7flag="R7 D SPECIAL CASES DS SECTION ROUTE"
mc7meds="R7 MC1 IN MNTH TKE MEDS PRESCRBD"
mc7medstrk="R7 MC2 KEEP TRCK PRESCRIED MEDS"
mc7medsslf="R7 MC2A LAST MNTH KEEP TRACK SLF"
mc7whrgtmed1="R7 MC3 SP GOT MEDS LOCAL STORE"
mc7whrgtmed2="R7 MC3 SP GOT MEDS BY MAIL"
mc7whrgtmed3="R7 MC3 SP GOT MEDS HC PRVDR HSP"
mc7whrgtmed4="R7 MC3 SP GOT MEDS OTHR SPECIFY"
mc7howpkupm1="R7 MC3B SP PICKD UP MEDS BY SELF"
mc7howpkupm2="R7 MC3B SP HAD MEDS DELIVERED"
mc7howpkupm3="R7 MC3B SMEON ELSE PICKD UP MEDS"
mc7medsrem="R7 MC4 USE REMNDERS TO KEEP TRCK"
mc7dmedsreas="R7 D MEDS REASN BY WITH OTHERS "
mc7medsdif="R7 MC7 HOW DIFFIC KEEP TRACK MED"
mc7medsyrgo="R7 MC8 COMPAR YR AGO HW KEP TRCK"
mc7medsmis="R7 MC9 MAKE MISTAKE TAKING MEDS"
mc7havregdoc="R7 MC10 YOU HAVE REGULAR DOCTOR"
mc7regdoclyr="R7 MC12 SEEN REG DOC WTHN LST YR"
mc7hwgtregd1="R7 MC15 SP DROVE SELF TO REG DOC"
mc7hwgtregd2="R7 MC15 FAM PD HLP DRVE REG DOC"
mc7hwgtregd3="R7 MC15 VAN PLCE SP LIVE REG DOC"
mc7hwgtregd4="R7 MC15 VAN FR DIS SENIOR REG DC"
mc7hwgtregd5="R7 MC15 PUBLIC TRANSPORT REG DOC"
mc7hwgtregd6="R7 MC15 SP TOOK TAXI TO REG DOC"
mc7hwgtregd7="R7 MC15 SP WALKED TO REG DOC"
mc7hwgtregd8="R7 MC15 REG DOC WAS HOME VISIT"
mc7hwgtregd9="R7 MC15 OTHR SPECIFY REG DOC"
mc7ansitindr="R7 MC16 ANONE SIT IN W YOU AT DR"
mc7tpersevr1="R7 MC19 HLP UPTO EXAM TBL DRESS"
mc7tpersevr2="R7 MC19 REMND SP OF QSTNS FR DOC"
mc7tpersevr3="R7 MC19 ASK TELL DOC THINGS 4 SP"
mc7tpersevr4="R7 MC19 HLP SP UNDERSTAND DOC"
mc7chginspln="R7 MC20 CHGD ADD INS OR DRUG PLN"
mc7anhlpwdec="R7 MC21 ANYONE HELP W DECISION"
mc7dmedssfdf="R7 D DIFF LEVEL MEDICATIONS SELF"
pa7vistfrfam="R7 PA1 EVER VISIT FRIENDS FAMILY"
pa7hlkepfvst="R7 PA2 HLTH KP FR VIST FAM FRNDS"
pa7trkpfrvis="R7 PA3 TRAN PRB KP FR VST FRNDS"
pa7impvstfam="R7 PA4 IMPRTNT VISIT FRNDS FAMLY"
pa7attrelser="R7 PA5 EVER ATTEND RELIG SERVCES"
pa7htkfrrlsr="R7 PA6 HEALTH KEEP FRM RELI SERV"
pa7trprrelsr="R7 PA7 TRAN PRO KEEP FM RELG SER"
pa7imprelser="R7 PA8 HW IMPORT ARE RELIG SERVS"
pa7clbmtgrac="R7 PA9 CLUB MEETINGS GRP ACTIVES"
pa7hlkpfrclb="R7 PA10 HELTH KEP FRM CLB MTINGS"
pa7trprkpfgr="R7 PA11 TRANS PROB KEEP FM GROPS"
pa7imparclub="R7 PA12 IMPORT PARTIC CLUBS GRUP"
pa7outfrenjy="R7 PA13 EVER GO OUT FOR ENJOYMNT"
pa7hlkpgoenj="R7 PA14 HLTH KP GO OUT FOR ENJOY"
pa7trprgoout="R7 PA15 TRANSPROB KEEP FM GO OUT"
pa7impouteny="R7 PA16 IMPORT GO OUT FOR ENJOYT"
pa7workfrpay="R7 PA17 EVER WORK FOR PAY"
pa7hlkpfrwrk="R7 PA18 HEALTH KEEP YOU FRM WORK"
pa7voltrwork="R7 PA19 EVER DO VOLUNTEER WORK"
pa7hlkpfrvol="R7 PA20 HELTH KEEP FM VOLUNTRING"
pa7prcranoth="R7 PA21 PROVIDE CARE ANTHER PERS"
pa7evrgowalk="R7 PA23 EVER GO WALKING"
pa7vigoractv="R7 PA24 EVER VIGOROUS ACTIVITIES"
pa7dofavact="R7 PA25A GET TO DO FAV ACT LST YR"
pa7fvactlimyr="R7 PA26 HEALTH LIMIT FAV ACTIVITY YEAR"
pa5dfavact="R5 D FAVORITE ACTIVITY AT R5"
rh7rehab="R7 RH1 RECEIVED REHAB IN LAST YEAR"
rh7rehabmo="R7 RH1A MONTHS OF REHAB"
rh7rehabweek="R7 RH1B WEEKS OF REHAB"
rh7rehabsurg="R7 RH2 REHAB POST SURGERY"
rh7surgcond="R7 RH3 MAIN MED CONDITION FOR SURGERY"
rh7rehabcond="R7 RH4 MAIN MED CONDITION FOR REHAB"
rh7funcback="R7 RH5 IMPROVE FUNCTION IN BACK"
rh7funchips="R7 RH5 IMPROVE FUNCTION IN HIPS"
rh7funcknees="R7 RH5 IMPROVE FUNCTION IN KNEES"
rh7funcfeet="R7 RH5 IMPROVE FUNCTION IN FEET"
rh7funchands="R7 RH5 IMPROVE FUNCTION IN HANDS"
rh7funcwrist="R7 RH5 IMPROVE FUNCTION IN WRIST"
rh7funcshold="R7 RH5 IMPROVE FUNCTION IN SHOULDERS"
rh7funchead="R7 RH5 IMPROVE FUNCTION IN HEAD"
rh7funcneck="R7 RH5 IMPROVE FUNCTION IN NECK"
rh7funcarms="R7 RH5 IMPROVE FUNCTION IN ARMS"
rh7funclegs="R7 RH5 IMPROVE FUNCTION IN LEGS"
rh7funcstom="R7 RH5 IMPROVE FUNCTION IN STOMACH"
rh7funcmouth="R7 RH5 IMPROVE FUNCTION IN MOUTH"
rh7funcheart="R7 RH5 IMPROVE FUNCTION IN HEART"
rh7funclung="R7 RH5 IMPROVE FUNCTION IN LUNGS"
rh7funcos="R7 RH5 IMPROVE FUNCTION OTHER SPECIFY"
rh7funcnotsp="R7 RH5 IMPROVE FUNCTION NO SPECIFIC PLACE"
rh7impchew="R7 RH6 IMPROVE CHEWING SWALLOWING"
rh7impspeak="R7 RH6 IMPROVE SPEAKING BEING UNDERSTOOD"
rh7impspain="R7 RH6 IMPROVE PAIN LEVEL"
rh7impbreath="R7 RH6 IMPROVE BREATHING"
rh7impweak="R7 RH6 IMPROVE STRENGTH"
rh7impmove="R7 RH6 IMPROVE MOVEMENT RANGE OF MOTION"
rh7impenergy="R7 RH6 IMPROVE ENERGY LEVEL"
rh7impbal="R7 RH6 IMPROVE BALANCE COORDINATION"
rh7impfall="R7 RH6 IMPROVE PROBLEMS WITH FALLS"
rh7impmemory="R7 RH6 IMPROVE MEMORY"
rh7impnone="R7 RH6 IMPROVE NONE OF THESE PROBLEMS"
rh7impbed="R7 RH6B IMPROVE GETTING OUT OF BED"
rh7impwalk="R7 RH6B IMPROVE WALKING INSIDE HOME"
rh7impleave="R7 RH6B IMPROVE LEAVING HOME OUTSIDE"
rh7impdistnc="R7 RH6B IMPROVE WALKING DISTANCES OUTSIDE"
rh7impclimb="R7 RH6B IMPROVE CLIMBING STAIRS"
rh7impdrive="R7 RH6B IMPROVE DRIVING"
rh7imptransp="R7 RH6B IMPROVE USING OTHER TRANSPORTATION"
rh7impnotths="R7 RH6B IMPROVE NONE OF THESE MOBIL ACT"
rh7impsc="R7 RH6C IMPROVE CARING FOR SELF"
rh7imphh="R7 RH6C IMPROVE HOUSEHOLD ACTIVITIES"
rh7impcomp="R7 RH6C IMPROVE USING COMPUTER TABLET"
rh7impwork="R7 RH6C IMPROVE WORKING VOLUNTEERING"
rh7impcare="R7 RH6C IMPROVE PROVIDING CARE"
rh7impactiv="R7 RH6C IMPROVE PARTICIPATING ACTIVITIES"
rh7impactnon="R7 RH6C IMPROVE NONE OF THESE ACTIVITIES"
rh7devcane="R7 RH6D THERAPIST RECOMMEND CANE WALKER"
rh7devwhlch="R7 RH6D THERAPIST RECOMMEND WHEELCHR SCOOTER"
rh7devramp="R7 RH6D THERAPIST RECOMMEND ENTRANCE RAMP"
rh7devstair="R7 RH6D THERAPIST RECOMMEND STAIR LIFT GLIDE"
rh7devtub="R7 RH6D THERAPIST RECOMMEND GRABBAR TUB SEAT"
rh7devtoil="R7 RH6D THERAPIST RECOMMEND GRABBAR TOIL SEAT"
rh7deveat="R7 RH6D THERAPIST RECOMMEND ADAPTED UTENSIL"
rh7devdres="R7 RH6D THERAPIST RECOMMEND DRESSING DEV"
rh7devgrab="R7 RH6D THERAPIST RECOMMEND REACHER GRABBER"
rh7devcomp="R7 RH6D THERAPIST RECOMMEND COMPUTER DEVICE"
rh7devcar="R7 RH6D THERAPIST RECOMMEND CAR DEVICE"
rh7devother="R7 RH6D THERAPIST RECOMMEND OTHER CHANGES"
rh7place1="R7 RH7A RECEIVE REHAB OVERNIGHT HOSP NH REHAB"
rh7place2="R7 RH7B RECEIVE REHAB OUTPATIENT"
rh7place3="R7 RH7C RECEIVE REHAB HOME"
rh7place4="R7 RH7D RECEIVE REHAB SOMEWHERE ELSE"
rh7place5="R7 RH7E RECEIVE REHAB OTHER SPECIFY PLACE TYPE"
rh7placelast="R7 RH8 PLACE LAST RECEIVED REHAB"
rh7ability="R7 RH9 FUNCTIONING IMPROVE IN REHAB"
rh7abilimp="R7 RH9A HOW MUCH FUNCTIONING IMPROVE IN REHAB"
rh7abilworse="R7 RH9B HOW MUCH FUNCTIONING WORSE IN REHAB"
rh7rehabnow="R7 RH10 STILL RECEIVING REHAB"
rh7metgoals="R7 RH11 MET GOALS WHEN REHAB ENDED"
rh7metinsur="R7 RH12 MET INSURANCE LIMIT WHEN REHAB ENDED"
rh7abilnow="R7 RH13 FUNCTIONING IMPROVE WHEN REHAB ENDED"
rh7nowimp="R7 RH14 HOW MUCH FUNCTION IMPROVE AFTER REHAB"
rh7nowworse="R7 RH15 HOW MUCH FUNCTION WORSE AFTER REHAB"
sd7smokesnow="R7 SD2 SMOKES NOW"
sd7numcigday="R7 SD3 NUM OF CIGARETTES PER DAY"
pe7whhndsign="R7 PE1 HAND USE TO SIGN YOR NAME"
pe7surghdwrt="R7 PE2 HAVE SURGRY TO HAND WRIST"
pe7surgyside="R7 PE3 WHICH SIDE WAS SURGERY"
pe7flruppain="R7 PE4 EXPER FLARE UP PAIN HAND"
pe7sideflrup="R7 PE5 SIDE CURRNT FLARE UP PAIN"
pe7surgarmsh="R7 PE6 SURGERY ARM OR SHOULDER"
pe7sidsurgar="R7 PE7 SIDE SURGERY ARM OR SHLDR"
pe7surgyhips="R7 PE8 SURG HIPS INCLUD REPLCMNT"
pe7sidhipsrg="R7 PE9 SIDE WAS HIP SURGERY ON"
pe7stndwhold="R7 PE11 STAND WITHOUT HOLDING ON"
pe7upchbyslf="R7 PE12 GET UP OUT CHAIR BY SELF"
pe7wlkdsself="R7 PE13 WALK SHORT DIST BY SELF"
fl7lefthand="R7 F PE CAN SP DO LEFT HAND TEST"
fl7righthand="R7 F PE CAN SP DO RGT HAND TEST"
fl7eiherhand="R7 F PE CAN SP DO EITHR HAND TST"
fl7lftgrptst="R7 F PE CAN SP DO LFT GRIP TEST"
fl7rhtgrptst="R7 F PE CAN SP DO RIGHT GRIP TST"
fl7charstnds="R7 F PE CAN SP DO CHAIR STANDS"
fl7balstands="R7 F PE CAN SP DO BALANCE STANDS"
fl7wlkingrse="R7 F PE CAN SP DO WALKING COURSE"
bc7dconsent="R7 D BC2 SP CONSENT BLOOD SPOT COLLECTION"
ba7dblssadm="R7 D BALANCE SIDE BY SIDE ADMIN"
ba7dblstadm="R7 D BALANCE SEMI TANDEM ADMIN"
ba7dblftadm="R7 D BALANCE FULL TANDEM ADMIN"
ba7dblopadm="R7 D BALANCE 1 LEG OP EYE ADMIN"
ba7dblcladm="R7 D BALANCE 1 LEG CLS EYE ADMIN"
wa7dwlkadm="R7 D WALKING COURSE ADMIN"
ch7dschradm="R7 D SINGLE CHAIR ADMIN"
ch7drchradm="R7 D REPEAT CHAIR ADMIN"
gr7dgripadm="R7 D GRIP STRENGTH ADMIN"
wc7dwaistadm="R7 D WAIST CIRCUMFERENCE ADMIN"
pk7dpeakadm="R7 D PEAK AIR FLOW ADMIN"
ab7datemonth="R7 AB COVER DATE MONTH"
ab7dateyear="R7 AB COVER DATE YEAR"
in7strtabhrs="R7 IN8 START TIME HOURS"
in7strtabmin="R7 IN8 START TIME MINUTES"
in7strtmampm="R7 IN8 START TIME AM OR PM"
ba7sxsresult="R7 BA3 SIDE BY SIDE STAND RESULT"
ba7blstdsecs="R7 BA4A SECS SIDE BY SIDE STAND"
ba7blstdhndr="R7 BA4B HNRDS SIDE BY SIDE STND"
ba7rsn1ssstd="R7 BA5 1 NO STAND SP FELT UNSAFE"
ba7rsn2ssstd="R7 BA5 2 NO STAND PRXY FELT UNSF"
ba7rsn3ssstd="R7 BA5 3 NO STND INTWR FELT UNSF"
ba7rsn4ssstd="R7 BA5 4NO STND SP UNABL2UNDRSTD"
ba7rsn9ssstd="R7 BA5 9 NO STAND OTHER SPECIFY"
ba7stdmreslt="R7 BA7 SEMI TANDEM STAND RESULT"
ba7stdmsecs="R7 BA8A SECS HELD SEMI TANDM STD"
ba7stdmhndr="R7 BA8B HNRDS HLD SEMI TANDM STD"
ba7rsn1ststd="R7 BA9 1 NO STNDM SP FELT UNSAFE"
ba7rsn2ststd="R7 BA9 2NO STNDM PRXY FELT UNSAF"
ba7rsn3ststd="R7 BA9 3 NO STNDM INTR FELT UNSF"
ba7rsn4ststd="R7 BA9 4NO STNDM SP UNABL2UNDSTD"
ba7rsn9ststd="R7 BA9 9 NO STNDM OTHER SPECIFY"
ba7ftdmreslt="R7 BA11 FULL TANDEM STAND RESULT"
ba7ftdmsecs="R7 BA12A SECS HLD FULL TANDM STD"
ba7ftdmhndr="R7 BA12B HNRDS HLD FLL TANDM STD"
ba7rsn1ftstd="R7 BA13 1 NO FTNDM SP FLT UNSAFE"
ba7rsn2ftstd="R7 BA13 2NO FTNDM PRXY FLT UNSAF"
ba7rsn3ftstd="R7 BA13 3 NO FTNDM INTR FLT UNSF"
ba7rsn4ftstd="R7 BA13 4NO FTNDM SP UNABL2UNDST"
ba7rsn9ftstd="R7 BA13 9 NO FTNDM OTHER SPECIFY"
ba71leoreslt="R7 BA15 ONE LEG STAND EYES OPEN"
ba71leosfsec="R7 BA16A SECS HLD 1LEG EYES OPEN"
ba71leohndr="R7 BA16B HNRDS HLD 1LEG EYE OPEN"
ba7rsn11leo="R7 BA17 1 NO1LEGEO SP FLT UNSAFE"
ba7rsn21leo="R7 BA17 2NO1LEGEO PRXY FLT UNSAF"
ba7rsn31leo="R7 BA17 3 NO1LEGEO INTR FLT UNSF"
ba7rsn41leo="R7 BA17 4NO1LEGEO SP UNABL2UNDST"
ba7rsn91leo="R7 BA17 9NO1LEGEO OTHER SPECIFY"
ba71lecreslt="R7 BA19 ONE LEG STAND EYES CLOS"
ba71lecsfsec="R7 BA20A SECS HLD 1LEG EYES CLOS"
ba71lechndr="R7 BA20B HNRDS HLD 1LEG EYE CLOS"
ba7rsn11lec="R7 BA21 1 NO1LEGEC SP FLT UNSAFE"
ba7rsn21lec="R7 BA21 2NO1LEGEC PRXY FLT UNSAF"
ba7rsn31lec="R7 BA21 3 NO1LEGEC INTR FLT UNSF"
ba7rsn41lec="R7 BA21 4NO1LEGEC SP UNABL2UNDST"
ba7rsn91lec="R7 BA21 9NO1LEGEC OTHER SPECIFY"
wa7wlkcorspc="R7 WA2 WALKING COURSE SPACE"
wa7wkaidused="R7 WA4 WALKING AID USED COURSE 1"
wa7wlkc1rslt="R7 WA5 WALKING COURSE 1 RESULT"
wa7wlkc1secs="R7 WA6A SECS HLD WALKNG COURSE1"
wa7wlk1hndr="R7 WA6B HNRDS HLD WALKNG COURSE1"
wa7rsn11wkc="R7 WA7 1 WLKCOURS1 SP FLT UNSAFE"
wa7rsn21wkc="R7 WA7 2WLKCOURS1 PRXY FLT UNSAF"
wa7rsn31wkc="R7 WA7 3WLKCOURS1 INTR FLT UNSF"
wa7rsn41wkc="R7 WA7 4WLKCOURS1 SP UNABL2UNDST"
wa7rsn51wkc="R7 WA7 5WLKCOURS1 NOT APPR SPACE"
wa7rsn91wkc="R7 WA7 9WLKCOURS1 OTHER SPECIFY"
wa7wkaidusc2="R7 WA8 WALKING AID USED COURSE 2"
wa7wlkc2rslt="R7 WA9 WALKING COURSE 2 RESULT"
wa7wlkc2secs="R7 WA10A SECS HLD WALKNG COURSE2"
wa7wlk2hndr="R7 WA10B HNRDS HLD WALKNG COURS2"
wa7rsn12wkc="R7 WA11 1 WKCOURS2 SP FLT UNSAFE"
wa7rsn22wkc="R7 WA11 2WKCOURS2 PRXY FLT UNSAF"
wa7rsn32wkc="R7 WA11 3WKCOURS2 INTR FLT UNSF"
wa7rsn42wkc="R7 WA11 4WKCOURS2 SP UNABL2UNDST"
wa7rsn92wkc="R7 WA11 9WKCOURS2 OTHER SPECIFY"
ch7chravail="R7 CH2 APPROPRIATE CHAIR AVAIL"
ch7chstcompl="R7 CH4 CHAIR STND COMPLETED TRY1"
ch7chairheit="R7 CH5 CHAIR HEIGHT(INCHES)"
ch7whlchrusd="R7 CH6 WHEELCHAIR USED"
ch7sgchstres="R7 CH7 SINGLE CHAIR STAND RESLT"
ch7armuse="R7 CH8 CHAIR STAND ARM USE"
ch7rsn11chs="R7 CH9 1CH STAND1 SP FLT UNSAFE"
ch7rsn21chs="R7 CH9 2CH STAND1 PRXY FLT UNSAF"
ch7rsn31chs="R7 CH9 3CH STAND1 INTR FLT UNSF"
ch7rsn41chs="R7 CH9 4CH STAND1 SP UNABL2UNDST"
ch7rsn51chs="R7 CH9 5CH STAND1 NOT APPR CHAIR"
ch7rsn91chs="R7 CH9 9CH STAND1 OTHER SPECIFY"
ch72chstrslt="R7 CH12 REPEAT CHAIR STAND RSLTS"
ch7chstndsec="R7 CH13A TIME REPEAT CH STD SECS"
ch7chstdhndr="R7 CH13B TIME RPEAT CH STD HNRDS"
ch7chstddone="R7 CH14 NUMBER CHAIR STANDS DONE"
ch7chstntdn1="R7 CH15 1 CH STD SP TIRED"
ch7chstntdn2="R7 CH15 2 CH STD SP USED ARMS"
ch7chstntdn3="R7 CH15 3 CH STD OVER 1 MIN"
ch7chstntdn4="R7 CH15 4 CH STD CNCRN SP SAFETY"
ch7chstntdn5="R7 CH15 5 CH STD SP STOPPED"
ch7chstntdn9="R7 CH15 9 CH STD OTHERSPECIFY"
ch7chstntat1="R7 CH16 1 NO CH ST SP UNSAFE"
ch7chstntat2="R7 CH16 2 NO CH ST PRXY UNSAFE"
ch7chstntat3="R7 CH16 3 NO CH ST INTV UNSAFE"
ch7chstntat4="R7 CH16 4 NO CH ST SP UNAB2UNDST"
ch7chstntat9="R7 CH16 9 NO CH ST OTHER SPEC"
gr7handtstd1="R7 GR3 GRIP1 TEST WHICH HAND"
gr7adjgr1ps3="R7 GR4 GRIP1POSITION ADJUST TO 3"
gr7grp1reslt="R7 GR5 GRIP STRENGTH 1 RESULT"
gr7grp1rdng="R7 GR6 GRP1 DISPLAY READING"
gr7grp1noat1="R7 GR7 1 SP FELT UNSAFE"
gr7grp1noat2="R7 GR7 2 PROXY FELT UNSAFE"
gr7grp1noat3="R7 GR7 3 INTERVIEWR FELT UNSAFE"
gr7grp1noat4="R7 GR7 4 SP UNABLE 2 UNDERSTAND"
gr7grp1noat9="R7 GR7 9 OTHER SPECIFY"
gr7handtstd2="R7 GR8 GRIP2 TEST WHICH HAND"
gr7adjgr2ps3="R7 GR9 GRIP2POSITION ADJUST TO 3"
gr7grp2reslt="R7 GR10GRIP STRENGTH 2 RESULT"
gr7grp2rdng="R7 GR11GRP2 DISPLAY READING"
gr7grp2noat1="R7 GR12 1 SP FELT UNSAFE"
gr7grp2noat2="R7 GR12 2 PROXY FELT UNSAFE"
gr7grp2noat3="R7 GR12 3 INTERVIEWR FELT UNSAFE"
gr7grp2noat4="R7 GR12 4 SP UNABLE 2 UNDERSTAND"
gr7grp2noat9="R7 GR12 9 OTHER SPECIFY"
wc7measdiff1="R7 WC2 1 MEAS DIFF NONE"
wc7measdiff2="R7 WC2 2 MEAS DIFF DIFF BREATH"
wc7measdiff3="R7 WC2 3 MEAS DIFF NOHOLD BREATH"
wc7measdiff4="R7 WC2 4 MEAS DIFF EFFORT PAIN"
wc7measdiff5="R7 WC2 5 MEAS DIFF EFFORT OTHER"
wc7measdiff6="R7 WC2 6 MEAS DIFF LOCATE NAVEL"
wc7measdiff9="R7 WC2 9 MEAS DIFF OTHER SPECIFY"
wc7waistrslt="R7 W3 WAIST CIRCUMFRNC RESULTS"
wc7wstmsrinc="R7 W4A WAIST MEASURE INCHES"
wc7wstmsrqrt="R7 W4B WAIST MEASURE QTR INCHES"
wc7wstbulkcl="R7 WC5 BULKY CLOTHING WORN"
wc7whomeasur="R7 WC6 WHO MEASURED"
wc7wstpostn="R7 WC7 POSITION 4 WAIST MEASURE"
wc7wstnotat1="R7 WC8 1 NO WC SP FELT UNSAFE"
wc7wstnotat2="R7 WC8 2 NO WC PROXY UNSAFE"
wc7wstnotat3="R7 WC8 3 NO WC INTERVIEWR UNSAFE"
wc7wstnotat4="R7 WC8 4 NO WC SP UNABLE2UNDRSTD"
wc7wstnotat5="R7 WC8 5 NO WC SP REFUSED"
wc7wstnotat9="R7 WC8 9 NO WC OTHER SPECIFY"
pk7pkarf1pos="R7 PK2 PEAK AIR FLOW 1 POSITION"
pk7pkarfl1ef="R7 PK3 PK AIR FLW 1 EFFORT GIVEN"
pk7pkarfl1rs="R7 PK4 PEAK AIR FLOW 1 RESULT"
pk7pkarfl1rd="R7 PK5 PEAK AIR FLOW 1 READING"
pk7pk1noatt1="R7 PK6 1 PEAK NO SP FELT UNSAFE"
pk7pk1noatt2="R7 PK6 2 PEAK NO PROXY UNSAFE"
pk7pk1noatt3="R7 PK6 3 PEAK NO INTERVWR UNSAFE"
pk7pk1noatt4="R7 PK6 4 PEAK NO SP UNABL2UNDSTD"
pk7pk1noatt9="R7 PK6 9 PEAK NO OTHER SPECIFY"
pk7paf2posit="R7 PK7 PEAK AIR FLOW 2 POSITION"
pk7pkarfl2ef="R7 PK8 PEAK AIR FLW 2 EFFRT GIVN"
pk7pkarfl2rs="R7 PK9 PEAK AIR FLOW 2 RESULT"
pk7pkarfl2rd="R7 PK10 PEAK AIR FLOW 2 READING"
pk7pk2noatt1="R7 PK11 1 PEAK NO SP FELT UNSAFE"
pk7pk2noatt2="R7 PK11 2 PEAK NO PROXY UNSAFE"
pk7pk2noatt3="R7 PK11 3 PEAK NO INTRVWR UNSAFE"
pk7pk2noatt4="R7 PK11 4 PEAK NO SP UNABL2UNDST"
pk7pk2noatt9="R7 PK11 9 PEAK NO OTHER SPECIFY"
cl7endtimhrs="R7 CL1 HRS END TIME HOURS"
cl7endtimmin="R7 CL1 MINS END TIME MINUTES"
cl7endtmampm="R7 CL1 AMPM END TIME AM OR PM"
r7dnhatssppb="R7 D NHATS SPPB SCORE"
r7dnhatsbasc="R7 D NHATS BALANCE SCORE"
r7dnhatswksc="R7 D NHATS WALK SCORE"
r7dnhatschsc="R7 D NHATS REPEAT CHAIR SCORE"
r7dnhatsgrav="R7 D NHATS AVG GRIP SCORE"
r7dnhatsgrb="R7 D NHATS BEST GRIP SCORE"
r7dnhatspkav="R7 D NHATS AVG AIR FLOW SCORE"
r7dnhatspkb="R7 D NHATS BEST AIR FLOW SCORE"
r7dsppbmiss="R7 D REASON MISSING SPPB"
r7dorigsppb="R7 D ORIGINAL SPPB SCORE"
r7dorigbasc="R7 D ORIGINAL BALNCE SCORE"
r7dorigwksc="R7 D ORIGINAL WALK SCORE"
r7dorigchsc="R7 D ORIGINAL REPEAT CHAIR SCORE"
hw7currweigh="R7 HW2 YOU CURRENTLY WEIGH"
hw7lst10pnds="R7 HW4 LOST 10 POUNDS IN LAST YR"
hw7trytolose="R7 HW5 WERE YOU TRYNG LOSE WEGHT"
hw7howtallft="R7 HW7 HOW TALL ARE YOU FEET"
hw7howtallin="R7 HW8 HOW TALL ARE YOU INCHES"
el7mothalive="R7 EL11 YOUR MOTHER STILL LIVING"
el7fathalive="R7 EL12 YOUR FATHER STILL LIVING"
wb7offelche1="R7 WB1 OFTEN YOU FEEL CHEERFUL"
wb7offelche2="R7 WB1 OFTEN YOU FEEL BORED"
wb7offelche3="R7 WB1 OFTEN YOU FEEL FULLOFLIFE"
wb7offelche4="R7 WB1 OFTEN YOU FEEL UPSET"
wb7truestme1="R7 WB2 SP LIFE HAS MEANING PURPS"
wb7truestme2="R7 WB2 SP FEELS CONFIDENT"
wb7truestme3="R7 WB2 SP GAVE UP IMPROVING LIFE"
wb7truestme4="R7 WB2 SP LIKES LIVING SITUATION"
wb7ageyofeel="R7 WB3 AGE YOU FEEL MOST OF TIME"
wb7agrwstmt1="R7 WB4 SP SELF DETERMINATION"
wb7agrwstmt2="R7 WB4 SP WANTS-FINDS WAY TO DO"
wb7agrwstmt3="R7 WB4 SP ADJUSTS TO CHANGE"
ip7covmedcad="R7 IP1 COVERD BY MEDICARE PART D"
ip7otdrugcov="R7 IP2 DRUG COVERG SOME OTHR WAY"
ip7mgapmedsp="R7 IP3 MEDIGAP OR MEDICARE SUPP"
ip7cmedicaid="R7 IP4 COV BY STATE MEDICAID PRG"
ip7covtricar="R7 IP5 COVERED BY TRICARE"
ip7nginslast="R7 IP5A HAVE LTC INS FROM LAST INT"
ip7nginsnurs="R7 IP6 NONGOV INSR FOR NURS HOME"
ip7typcarco1="R7 IP7 LTC INS NURSNG HOME COVD"
ip7typcarco2="R7 IP7 LTC INS ASSISTD LVNG COVD"
ip7typcarco3="R7 IP7 LTC INS HOME HEALTH COVD"
ip7paypremms="R7 IP8 HOW MUCH PAY IN PREMIUMS"
lf7workfpay="R7 LF1 WORKED FOR PAY RECENTLY"
lf7abstlstwk="R7 LF2 ABSENT FRM JOB LAST WEEK"
lf7wrkplstmn="R7 LF3 WORK FOR PAY IN LST MONTH"
lf7mrthnonjb="R7 LF4 MOR THN ONE JOB LAST WEEK"
lf7hrswkwork="R7 LF5 HRS PR WEEK WORK MAIN JOB"
lf7hrwrkltwk="R7 LF6 HOURS WORK LAST WEEK"
lf7hrwrklstw="R7 LF7 HOW MNY HOURS DID YOU WRK"
lf7oftpaid="R7 LF8 HOW OFTN PAID ON MAIN JOB"
lf7doccup="R7 D CURRENT OCCUPATION CATEGORY  "
lf7huswifwrk="R7 LF13 HUSB WIFE PARTN PAY WORK"
hp7ownrentot="R7 HP1 OWN RENT OR OTHER"
hp7mrtpadoff="R7 HP2 MORTGAGE PAID OFF"
hp7mthlymort="R7 HP3 MORTGAGE PAYMNT EACH MNTH"
hp7mortpaymt="R7 HP3A MORTGAGE PAYMENT AMOUNT"
hp7whnpayoff="R7 HP3B WHEN EXPCT PAY OFF MORTG"
hp7amtstlowe="R7 HP3C HOW MUCH STILL OWE"
hp7amoutowed="R7 HP3D THE AMOUNT OWED IS"
hp7homevalue="R7 HP4 PRESENT VALUE OF HOME"
hp7homvalamt="R7 HP4A HOME VALUE AMOUNT"
hp7payrent="R7 HP5 DO YOU PAY RENT"
hp7rentamt="R7 HP6 RENT PAID EACH MONTH"
hp7rentamout="R7 HP6A RENT AMOUNT"
hp7sec8pubsn="R7 HP7 HME SEC 8 PUBL SENOR HOUS"
ia7recsspa1="R7 IA1 SP REC SOCIAL SECURITY"
ia7recsspa2="R7 IA1 SPOUSE PART REC SOC SEC"
ia7recsspa3="R7 IA1 NO SOC SECURTY PAYMNT REC"
ia7recssils1="R7 IA4 SP RECEIVD SSI LAST MONTH"
ia7recssils2="R7 IA4 SPOUSE PRT REC SSI LST MO"
ia7recssils3="R7 IA4 NO SSI RECEIVD LAST MONTH"
ia7rvapayls1="R7 IA5 SP REC PAY FRM VA LAST MO"
ia7rvapayls2="R7 IA5 SPOUS PA REC VA PAY LSTMO"
ia7rvapayls3="R7 IA5 NO VA PAY REC LAST MONTH"
ia7penjobou1="R7 IA6 SP HAS PENSION PLAN"
ia7penjobou2="R7 IA6 SPOUSE HAS PENSION PLAN"
ia7penjobou3="R7 IA6 NO PENSION PLAN"
ia7iraothac1="R7 IA7 SP HAS IRA OTH RETIRE ACC"
ia7iraothac2="R7 IA7 SPOUSE HAS IRA OTHR ACC"
ia7iraothac3="R7 IA7 NO IRA OTHR RETIRE ACCT "
ia7mutfdstk1="R7 IA8 SP OWNS MUTUAL FUND STOCK"
ia7mutfdstk2="R7 IA8 SPOUSE OWNS FUNDS STOCK"
ia7mutfdstk3="R7 IA8 SP SPOUSE OWN FUNDS STOCK"
ia7mutfdstk4="R7 IA8 NO FUNDS OR STOCK OWNED"
ia7ownbond1="R7 IA9 SP OWNS BONDS"
ia7ownbond2="R7 IA9 SPOUSE OWNS BONDS"
ia7ownbond3="R7 IA9 SP SPOUSE OWN BONDS"
ia7ownbond4="R7 IA9 NO BONDS OWNED"
ia7bnkacccd1="R7 IA10 SP OWNS CHECK ACCT "
ia7bnkacccd2="R7 IA10 SPOUSE OWNS CHECK ACCT"
ia7bnkacccd3="R7 IA10 SP SPOUSE OWN CHECK ACCT"
ia7bnkacccd4="R7 IA10 NO CHECK ACCT OWNED"
ia7bnkacccd5="R7 IA10 SP OWNS SAVINGS ACCT "
ia7bnkacccd6="R7 IA10 SPOUSE OWNS SAVING ACCT"
ia7bnkacccd7="R7 IA10 SP SPOUSE OWN SAVNG ACT"
ia7bnkacccd8="R7 IA10 NO SAVINGS ACCT OWNED"
ia7bnkacccd9="R7 IA10 SP OWNS CDS "
ia7bnkaccc10="R7 IA10 SPOUSE OWNS CDS"
ia7bnkaccc11="R7 IA10 SP SPOUSE OWN CDS"
ia7bnkaccc12="R7 IA10 NO CDS OWNED"
ia7realestt1="R7 IA13 SP OWNS REAL ESTATE"
ia7realestt2="R7 IA13 SPOUSE OWNS REAL ESTATE"
ia7realestt3="R7 IA13 SP SPOUSE OWN REAL ESTTE"
ia7realestt4="R7 IA13 NO REAL ESTATE OWNED"
ia7totinc="R7 IA50 TOTAL INCOME"
ia7toincimf="R7 F IMPUTED TOTAL INC FLG"
ia7toincim1="R7 IA50 IMPUTED TOTAL INC1"
ia7toincim2="R7 IA50 IMPUTED TOTAL INC2"
ia7toincim3="R7 IA50 IMPUTED TOTAL INC3"
ia7toincim4="R7 IA50 IMPUTED TOTAL INC4"
ia7toincim5="R7 IA50 IMPUTED TOTAL INC5"
ia7toincesjt="R7 IA51A JOINT EST TOT INCOME"
ia7eincimjf="R7 F IMPTD JOINT EST TOT INC FLG"
ia7eincimj1="R7 IA51A IMP EST JOINT TOT INC1"
ia7eincimj2="R7 IA51A IMP EST JOINT TOT INC2"
ia7eincimj3="R7 IA51A IMP EST JOINT TOT INC3"
ia7eincimj4="R7 IA51A IMP EST JOINT TOT INC4"
ia7eincimj5="R7 IA51A IMP EST JOINT TOT INC5"
ia7toincessg="R7 IA51B SNGLE EST TOT INC "
ia7eincimsf="R7 F IMPUTED SGL EST TOT INC FLG"
ia7eincims1="R7 IA51B IMP EST SP SGL TOT INC1"
ia7eincims2="R7 IA51B IMP EST SP SGL TOT INC2"
ia7eincims3="R7 IA51B IMP EST SP SGL TOT INC3"
ia7eincims4="R7 IA51B IMP EST SP SGL TOT INC4"
ia7eincims5="R7 IA51B IMP EST SP SGL TOT INC5"
ew7pycredbal="R7 EW1 PAY OFF CREDIT CARD BALAN"
ew7crecardeb="R7 EW2 TOTAL CREDIT CARD DEBT"
ew7credcdmed="R7 EW3 CREDIT CARD MEDICAL CARE"
ew7amtcrdmed="R7 EW4 AMT ON CARDS FOR MED CARE"
ew7medpaovtm="R7 EW5 MED BILLS PAID OVERTIME"
ew7ampadovrt="R7 EW6 AMT FOR MED BILL OVR TIME"
ew7finhlpfam="R7 EW7 FINANCIAL HELP FRM FAMILY"
ew7whohelfi1="R7 EW8 CHILD HELPED FINANCIALLY"
ew7whohelfi2="R7 EW8 OTHER HELPED FINANCIALLY"
ew7atchhelyr="R7 EW10 AMT FROM CHILDR LST YR"
ew7fingftfam="R7 EW11 FINANCIAL GIFTS TO FAMLY"
ew7whregoth1="R7 EW12 SP GAVE CHILD FINCL HLP"
ew7whregoth2="R7 EW12 SP GAVE GRANDCHD FIN HLP"
ew7whregoth3="R7 EW12 SP GAVE OTHR FINANCL HLP"
ew7amthlpgiv="R7 EW14 AMOUNT OF HELP GIVEN"
ew7progneed1="R7 EW15 SP RECEIVD FOOD STAMPS"
ew7progneed2="R7 EW15 SP REC OTHR FOOD ASST"
ew7progneed3="R7 EW15 SP REC GAS ENERGY ASST"
ew7mealskip1="R7 EW16 SKIP MEALS NO MONEY"
ew7mealskip2="R7 EW17 SKIP MEALS HOW OFTEN"
ew7nopayhous="R7 EW18 NO MONEY FOR HOUSING"
ew7nopayutil="R7 EW18 NO MONEY FOR UTILITIES"
ew7nopaymed="R7 EW18 NO MONEY FOR MEDICAL"
ir7intlang="R7 IR1A1 INTERVIEW LANGUAGE"
ir7spattitud="R7 IR2 SP ATTITUDE TOWARD INTVW"
ir7undrstand="R7 IR3 SP UNDERSTAND QUESTION"
ir7sppresent="R7 IR4 AMT OF INTERVIW SP PRESNT"
ir7spnotprs1="R7 IR5 REASON SP NOT PRESENT_SLEEP "
ir7spnotprs2="R7 IR5 REASON SP NOT PRESENT_2ILL "
ir7spnotprs3="R7 IR5 REASON SP NOT PRESENT_ALZH "
ir7spnotprs4="R7 IR5 REASON SP NOT PRESENT_PRXYREQ "
ir7spnotprs5="R7 IR5 REASON SP NOT PRESENT_INFCLTY "
ir7spnotprs6="R7 IR5 REASON SP NOT PRESENT_OTHSPFY "
ir7intvwhlp="R7 IR6 ANYONE HELP WITH INTVW"
ir7prsnhlp1="R7 IR6A SPOUSE HELPED WITH INTVW"
ir7prsnhlp2="R7 IR6A CHILD HELPED WITH INTVW"
ir7prsnhlp3="R7 IR6A RELATIVE HELP WITH INTVW"
ir7prsnhlp4="R7 IR6A FRIEND HELPED WITH INTVW"
ir7prsnhlp5="R7 IR6A STAFF HELPED WITH INTVW"
ir7prsnhlp6="R7 IR6A AIDE HELPED WITH INTVW"
ir7prsnhlp91="R7 IR6A OTHER HELPED WITH INTVW"
ir7demolang1="R7 IR10B PHYS ACT DEMO SAFETY TRANS"
ir7sessions="R7 IR12 MORE ONE INTVW SESSION"
ir7sessrsn1="R7 IR12A MORE 1 SESSION SP TIRED"
ir7sessrsn2="R7 IR12A MORE 1 SESSION SP ILL"
ir7sessrsn3="R7 IR12A MORE 1 SESSION SCHEDULE"
ir7sessrsn91="R7 IR12A MORE 1 SESSION OTHER"
ir7conhomapt="R7 IR12C INTRV CONDTD AT HME/APT"
ir7insidhome="R7 IR12E GO INSIDE HOME/APT/UNIT"
ir7condihom1="R7 IR13 PAINT PEELING IN SP HOME"
ir7condihom2="R7 IR13 PESTS IN SP HOME"
ir7condihom3="R7 IR13 BROKN FURNITURE SP HOME"
ir7condihom4="R7 IR13 FLOORING NEEDS REPAIR"
ir7condihom5="R7 IR13 HOME OTHR TRIPPING HAZRD"
ir7clutterr1="R7 IR14 CLUTTR IN INTERVIEW ROOM"
ir7clutterr2="R7 IR14 CLUTTR IN OTHR SP ROOMS"
ir7areacond1="R7 IR15 LITTER GLASS ON SDWLK ST"
ir7areacond2="R7 IR15 GRAFFITI ON BUILDG WALLS"
ir7areacond3="R7 IR15 VACANT HOUSES OR STORES"
ir7condhome1="R7 IR16 BROKEN WINDOWS IN HOME"
ir7condhome2="R7 IR16 CRUMBLNG FOUNDTN IN HOME"
ir7condhome3="R7 IR16 MISSNG BRCKS SIDNG IN HM"
ir7condhome4="R7 IR16 ROOF PROBLEM IN HOME"
ir7condhome5="R7 IR16 BROKEN STEPS TO HOME"
ir7condhome6="R7 IR16 CONTINUOUS SIDEWALKS"
fq7dfacdescr="R7 FQ6 FACILITY TYPE"
fq7dosfacd="R7 FQ6A OTHER SPECIFY FAC TYPE"
fq7prtlivnam="R7 FQ8 FAC NM DIFF4PLC SP LIVES"
fq7dfacarea="R7 FQ10 FACILITY AREA SP LIVES"
fq7dosfaca="R7 FQ10A OTHER SPECIFY FAC AREA"
fq7assdnrsng="R7 FQ11 ASSIST LIV OR NURSG HOME"
fq7othrlevls="R7 FQ12 OTH LEVELS OF CARE AVAIL"
fq7whotlevl1="R7 FQ13 INDEPNDNT LIV CARE AVAIL"
fq7whotlevl2="R7 FQ13 ASSISTED LVNG CARE AVAIL"
fq7whotlevl3="R7 FQ13 ALZHEIMER CARE AVAIL"
fq7whotlevl4="R7 FQ13 NURSING HOME CARE AVAIL"
fq7whotlevl5="R7 FQ13 OTHR SPECIFY CARE AVAIL"
fq7servaval1="R7 FQ15 MEALS AVAIL"
fq7servaval2="R7 FQ15 HELP WITH MEDS AVAIL"
fq7servaval3="R7 FQ15 HELP W BATH DRESS AVAIL"
fq7servaval4="R7 FQ15 LAUNDRY SERVCS AVAIL"
fq7servaval5="R7 FQ15 HOUSEKEEPING SERV AVAIL"
fq7servaval6="R7 FQ15 TRANSPRT MED CARE PROV"
fq7servaval7="R7 FQ15 TRANSPRT TO STORE EVENT"
fq7servaval10="R7 FQ15 FITNESS CENTER AVAIL"
fq7servaval11="R7 FQ15 WALKING AREA AVAIL"
fq7servaval8="R7 FQ15 RECREATIONAL FAC AVAIL"
fq7servaval9="R7 FQ15 SOCIAL EVENTS AVAIL"
fq7servaval12="R7 FQ15 ONSITE HEALTH AVAIL"
fq7servaval13="R7 FQ15 MED EMERGENCY SYSTEM AVAIL"
fq7paysourc1="R7 FQ16 SP OR SP FAMILY PAYMENT"
fq7paysourc2="R7 FQ16 SOC SEC SSI PAYMENT"
fq7paysourc3="R7 FQ16 MEDICAID PAYMENT"
fq7paysourc4="R7 FQ16 MEDICARE PAYMENT"
fq7paysourc5="R7 FQ16 PRIVATE INSURANCE PAYMNT"
fq7paysourc6="R7 FQ16 OTHR GOVT PAYMENT"
fq7totalpaym="R7 FQ17 TOTAL PAYMENT FOR CARE"
fq7mnthlyamt="R7 FQ18 TOT MTHLY AMT FOR CARE"
fq7primpayer="R7 FQ19 PRIMARY PAYER FOR CARE"
fq7govsource="R7 FQ20 GOVERNMENT SOURCE"
fq7dlocsp="R7 D FQ6 6A 10 10A FOR SAMP WGT "
w7anfinwgt0="R7 FINAL ANALYTIC WGT FULL SAMP"
w7anfinwgt1="R7 FINAL ANALYTIC WGT REP 1"
w7anfinwgt2="R7 FINAL ANALYTIC WGT REP 2"
w7anfinwgt3="R7 FINAL ANALYTIC WGT REP 3"
w7anfinwgt4="R7 FINAL ANALYTIC WGT REP 4"
w7anfinwgt5="R7 FINAL ANALYTIC WGT REP 5"
w7anfinwgt6="R7 FINAL ANALYTIC WGT REP 6"
w7anfinwgt7="R7 FINAL ANALYTIC WGT REP 7"
w7anfinwgt8="R7 FINAL ANALYTIC WGT REP 8"
w7anfinwgt9="R7 FINAL ANALYTIC WGT REP 9"
w7anfinwgt10="R7 FINAL ANALYTIC WGT REP 10"
w7anfinwgt11="R7 FINAL ANALYTIC WGT REP 11"
w7anfinwgt12="R7 FINAL ANALYTIC WGT REP 12"
w7anfinwgt13="R7 FINAL ANALYTIC WGT REP 13"
w7anfinwgt14="R7 FINAL ANALYTIC WGT REP 14"
w7anfinwgt15="R7 FINAL ANALYTIC WGT REP 15"
w7anfinwgt16="R7 FINAL ANALYTIC WGT REP 16"
w7anfinwgt17="R7 FINAL ANALYTIC WGT REP 17"
w7anfinwgt18="R7 FINAL ANALYTIC WGT REP 18"
w7anfinwgt19="R7 FINAL ANALYTIC WGT REP 19"
w7anfinwgt20="R7 FINAL ANALYTIC WGT REP 20"
w7anfinwgt21="R7 FINAL ANALYTIC WGT REP 21"
w7anfinwgt22="R7 FINAL ANALYTIC WGT REP 22"
w7anfinwgt23="R7 FINAL ANALYTIC WGT REP 23"
w7anfinwgt24="R7 FINAL ANALYTIC WGT REP 24"
w7anfinwgt25="R7 FINAL ANALYTIC WGT REP 25"
w7anfinwgt26="R7 FINAL ANALYTIC WGT REP 26"
w7anfinwgt27="R7 FINAL ANALYTIC WGT REP 27"
w7anfinwgt28="R7 FINAL ANALYTIC WGT REP 28"
w7anfinwgt29="R7 FINAL ANALYTIC WGT REP 29"
w7anfinwgt30="R7 FINAL ANALYTIC WGT REP 30"
w7anfinwgt31="R7 FINAL ANALYTIC WGT REP 31"
w7anfinwgt32="R7 FINAL ANALYTIC WGT REP 32"
w7anfinwgt33="R7 FINAL ANALYTIC WGT REP 33"
w7anfinwgt34="R7 FINAL ANALYTIC WGT REP 34"
w7anfinwgt35="R7 FINAL ANALYTIC WGT REP 35"
w7anfinwgt36="R7 FINAL ANALYTIC WGT REP 36"
w7anfinwgt37="R7 FINAL ANALYTIC WGT REP 37"
w7anfinwgt38="R7 FINAL ANALYTIC WGT REP 38"
w7anfinwgt39="R7 FINAL ANALYTIC WGT REP 39"
w7anfinwgt40="R7 FINAL ANALYTIC WGT REP 40"
w7anfinwgt41="R7 FINAL ANALYTIC WGT REP 41"
w7anfinwgt42="R7 FINAL ANALYTIC WGT REP 42"
w7anfinwgt43="R7 FINAL ANALYTIC WGT REP 43"
w7anfinwgt44="R7 FINAL ANALYTIC WGT REP 44"
w7anfinwgt45="R7 FINAL ANALYTIC WGT REP 45"
w7anfinwgt46="R7 FINAL ANALYTIC WGT REP 46"
w7anfinwgt47="R7 FINAL ANALYTIC WGT REP 47"
w7anfinwgt48="R7 FINAL ANALYTIC WGT REP 48"
w7anfinwgt49="R7 FINAL ANALYTIC WGT REP 49"
w7anfinwgt50="R7 FINAL ANALYTIC WGT REP 50"
w7anfinwgt51="R7 FINAL ANALYTIC WGT REP 51"
w7anfinwgt52="R7 FINAL ANALYTIC WGT REP 52"
w7anfinwgt53="R7 FINAL ANALYTIC WGT REP 53"
w7anfinwgt54="R7 FINAL ANALYTIC WGT REP 54"
w7anfinwgt55="R7 FINAL ANALYTIC WGT REP 55"
w7anfinwgt56="R7 FINAL ANALYTIC WGT REP 56"
w7an2011wgt0="R7 FINAL ANALYTIC WGT 2011 COHORT"
w7an2011wgt1="R7 FINAL ANALYTIC WGT 2011 COHORT REP 1"
w7an2011wgt2="R7 FINAL ANALYTIC WGT 2011 COHORT REP 2"
w7an2011wgt3="R7 FINAL ANALYTIC WGT 2011 COHORT REP 3"
w7an2011wgt4="R7 FINAL ANALYTIC WGT 2011 COHORT REP 4"
w7an2011wgt5="R7 FINAL ANALYTIC WGT 2011 COHORT REP 5"
w7an2011wgt6="R7 FINAL ANALYTIC WGT 2011 COHORT REP 6"
w7an2011wgt7="R7 FINAL ANALYTIC WGT 2011 COHORT REP 7"
w7an2011wgt8="R7 FINAL ANALYTIC WGT 2011 COHORT REP 8"
w7an2011wgt9="R7 FINAL ANALYTIC WGT 2011 COHORT REP 9"
w7an2011wgt10="R7 FINAL ANALYTIC WGT 2011 COHORT REP 10"
w7an2011wgt11="R7 FINAL ANALYTIC WGT 2011 COHORT REP 11"
w7an2011wgt12="R7 FINAL ANALYTIC WGT 2011 COHORT REP 12"
w7an2011wgt13="R7 FINAL ANALYTIC WGT 2011 COHORT REP 13"
w7an2011wgt14="R7 FINAL ANALYTIC WGT 2011 COHORT REP 14"
w7an2011wgt15="R7 FINAL ANALYTIC WGT 2011 COHORT REP 15"
w7an2011wgt16="R7 FINAL ANALYTIC WGT 2011 COHORT REP 16"
w7an2011wgt17="R7 FINAL ANALYTIC WGT 2011 COHORT REP 17"
w7an2011wgt18="R7 FINAL ANALYTIC WGT 2011 COHORT REP 18"
w7an2011wgt19="R7 FINAL ANALYTIC WGT 2011 COHORT REP 19"
w7an2011wgt20="R7 FINAL ANALYTIC WGT 2011 COHORT REP 20"
w7an2011wgt21="R7 FINAL ANALYTIC WGT 2011 COHORT REP 21"
w7an2011wgt22="R7 FINAL ANALYTIC WGT 2011 COHORT REP 22"
w7an2011wgt23="R7 FINAL ANALYTIC WGT 2011 COHORT REP 23"
w7an2011wgt24="R7 FINAL ANALYTIC WGT 2011 COHORT REP 24"
w7an2011wgt25="R7 FINAL ANALYTIC WGT 2011 COHORT REP 25"
w7an2011wgt26="R7 FINAL ANALYTIC WGT 2011 COHORT REP 26"
w7an2011wgt27="R7 FINAL ANALYTIC WGT 2011 COHORT REP 27"
w7an2011wgt28="R7 FINAL ANALYTIC WGT 2011 COHORT REP 28"
w7an2011wgt29="R7 FINAL ANALYTIC WGT 2011 COHORT REP 29"
w7an2011wgt30="R7 FINAL ANALYTIC WGT 2011 COHORT REP 30"
w7an2011wgt31="R7 FINAL ANALYTIC WGT 2011 COHORT REP 31"
w7an2011wgt32="R7 FINAL ANALYTIC WGT 2011 COHORT REP 32"
w7an2011wgt33="R7 FINAL ANALYTIC WGT 2011 COHORT REP 33"
w7an2011wgt34="R7 FINAL ANALYTIC WGT 2011 COHORT REP 34"
w7an2011wgt35="R7 FINAL ANALYTIC WGT 2011 COHORT REP 35"
w7an2011wgt36="R7 FINAL ANALYTIC WGT 2011 COHORT REP 36"
w7an2011wgt37="R7 FINAL ANALYTIC WGT 2011 COHORT REP 37"
w7an2011wgt38="R7 FINAL ANALYTIC WGT 2011 COHORT REP 38"
w7an2011wgt39="R7 FINAL ANALYTIC WGT 2011 COHORT REP 39"
w7an2011wgt40="R7 FINAL ANALYTIC WGT 2011 COHORT REP 40"
w7an2011wgt41="R7 FINAL ANALYTIC WGT 2011 COHORT REP 41"
w7an2011wgt42="R7 FINAL ANALYTIC WGT 2011 COHORT REP 42"
w7an2011wgt43="R7 FINAL ANALYTIC WGT 2011 COHORT REP 43"
w7an2011wgt44="R7 FINAL ANALYTIC WGT 2011 COHORT REP 44"
w7an2011wgt45="R7 FINAL ANALYTIC WGT 2011 COHORT REP 45"
w7an2011wgt46="R7 FINAL ANALYTIC WGT 2011 COHORT REP 46"
w7an2011wgt47="R7 FINAL ANALYTIC WGT 2011 COHORT REP 47"
w7an2011wgt48="R7 FINAL ANALYTIC WGT 2011 COHORT REP 48"
w7an2011wgt49="R7 FINAL ANALYTIC WGT 2011 COHORT REP 49"
w7an2011wgt50="R7 FINAL ANALYTIC WGT 2011 COHORT REP 50"
w7an2011wgt51="R7 FINAL ANALYTIC WGT 2011 COHORT REP 51"
w7an2011wgt52="R7 FINAL ANALYTIC WGT 2011 COHORT REP 52"
w7an2011wgt53="R7 FINAL ANALYTIC WGT 2011 COHORT REP 53"
w7an2011wgt54="R7 FINAL ANALYTIC WGT 2011 COHORT REP 54"
w7an2011wgt55="R7 FINAL ANALYTIC WGT 2011 COHORT REP 55"
w7an2011wgt56="R7 FINAL ANALYTIC WGT 2011 COHORT REP 56"
w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER";
run;

data nhats_sp;
set spfile;
run;

*strata var= w7varstrat;

*cluster var= w7varunit ;

*weight var= For Round 7, the final tracker replicate weights are provided in the variables:
w7trfinwgt1-w7trfinwgt56 for the 2015 Cohort,
w7tr2011wgt1- w7tr2011wgt56 for the 2011 Cohort

The analytic replicate weights are provided in the variables:
w7anfinwgt1-w7anfinwgt56 for the 2015 Cohort,
w7an2011wgt1-w7an2011wgt56 for the 2011 Cohort;

*full sample weight for 2015 cohort- w7anfinwgt0 - use with Taylor Series Estimation;

**************DEMOGRAPHIC DATA;

*not adjusted for complex design;
*age;
proc freq data=nhats_sp;
tables r7d2intvrage;
run;

data nhats_sp_2;
set nhats_sp;
where r7d2intvrage ne -1;
run;

proc surveyfreq data=nhats_sp_2;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage ;
run ;
*same data produced as Freedman, V. A., & Kasper, J. D. (2019). Cohort Profile: The National Health and Aging Trends Study (NHATS).
International journal of epidemiology, 48(4), 1044–1045g. https://doi.org/10.1093/ije/dyz109 ;



********************************MERGE ALL DATASET - NHATS_DEM, NHATS_DBS, NHAT_TRACKER, NHATS_SP  ;

*w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP"
NHATS SAMPLED PERSON ID ;


*sort all datasets by NHATS sample person ID - spid;
proc sort data=nhats_dbs; by spid ; run;
proc sort data=nhats_dem; by spid; run;
proc sort data=nhats_sp; by spid; run;
proc sort data=nhats_tracker; by spid; run;


*merge all datasets by spid;
data nhats_master;
merge nhats_dem (in=a) nhats_dbs (in=b) nhats_sp (in=c) nhats_tracker (in=d);
by spid;
if a=1 and b=1 and c=1 and d=1;
run;

*filter to only those with dbs data (n=4648);
data nhats_master_;
set nhats_master;
where dbs7danyassay=1;
run;

************************************************demographics;
*mean age;
proc surveymeans data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var r7dintvwrage;
run;
*same as methods paper;

*age category;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage ;
run ;
*same as methods paper;

*gender;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender ;
run ;
*same as methods paper;

*race/ethnicity;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp ;
run ;
*****adjust race cat;
data nhats_master_b;
set nhats_master_;
if (rl5dracehisp=6 or rl5dracehisp=5) then rl5dracehisp_new=.;
else rl5dracehisp_new = rl5dracehisp ;
run;

proc surveyfreq data=nhats_master_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new ;
run ;
*same as methods paper;

*income;
proc surveymeans data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var ia7totinc;
run;

proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables ia7totinc ia7toincesjt ia7toincessg;
run ;

data nhats_master_c;
set nhats_master_b;
if (ia7totinc=-8 or ia7totinc=-7) then ia7totinc=.;
if (ia7toincim1=-8 or ia7toincim1=-7) then ia7toincim1=.;
if (ia7toincim2=-8 or ia7toincim2=-7) then ia7toincim2=.;
if (ia7toincim3=-8 or ia7toincim3=-7) then ia7toincim3=.;
if (ia7toincim4=-8 or ia7toincim4=-7) then ia7toincim4=.;
if (ia7toincim5=-8 or ia7toincim5=-7) then ia7toincim5=.;

if 0 le ia7totinc lt 15000 then income_cat=0;
if 15000 le ia7totinc lt 30000 then income_cat=1;
if 30000 le ia7totinc lt 60000 then income_cat=2;
if ia7totinc ge 60000 then income_cat=3;

if 0 le ia7toincim1 lt 15000 then income_cat_b=0;
if 15000 le ia7toincim1 lt 30000 then income_cat_b=1;
if 30000 le ia7toincim1 lt 60000 then income_cat_b=2;
if ia7toincim1 ge 60000 then income_cat_b=3;

if 0 le ia7toincim2 lt 15000 then income_cat_c=0;
if 15000 le ia7toincim2 lt 30000 then income_cat_c=1;
if 30000 le ia7toincim2 lt 60000 then income_cat_c=2;
if ia7toincim2 ge 60000 then income_cat_c=3;

if 0 le ia7toincim3 lt 15000 then income_cat_d=0;
if 15000 le ia7toincim3 lt 30000 then income_cat_d=1;
if 30000 le ia7toincim3 lt 60000 then income_cat_d=2;
if ia7toincim3 ge 60000 then income_cat_d=3;

if 0 le ia7toincim4 lt 15000 then income_cat_e=0;
if 15000 le ia7toincim4 lt 30000 then income_cat_e=1;
if 30000 le ia7toincim4 lt 60000 then income_cat_e=2;
if ia7toincim4 ge 60000 then income_cat_e=3;

if 0 le ia7toincim5 lt 15000 then income_cat_f=0;
if 15000 le ia7toincim5 lt 30000 then income_cat_f=1;
if 30000 le ia7toincim5 lt 60000 then income_cat_f=2;
if ia7toincim5 ge 60000 then income_cat_f=3;

run;

proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat income_cat_b income_cat_c income_cat_d income_cat_e income_cat_f ;
run ;
*use income cat b - based off of imputation variable 1;
proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat_b ;
run ;


***********************************************covariates / risk factors of interest;

*Ever smoked? ;
proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables sd7smokesnow;
run ;
*same as methods paper - but the q is do you smoke cigs now;

*BMI;
*
hw7currweigh = weight in pounds
hw7howtallft = height in feet
hw7howtallin = height in inches;
proc freq data=nhats_master_d;
tables hw7howtallin hw7howtallft hw7currweigh;
run;

data nhats_master_d;
set nhats_master_c ;
if hw7howtallin lt 0 then hw7howtallin=.;
if hw7howtallft lt 0 then hw7howtallft=.;
if hw7currweigh lt 0 then hw7currweigh=.;

height_sq = ((hw7howtallft*12) +  hw7howtallin)**2;
BMI = (hw7currweigh / height_sq * 703);
run;

proc surveymeans data=nhats_master_d;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var BMI;
run;
*same as methods paper, but SE=0.12 instead of 0.11;


*# of chronic conditions;
proc surveyfreq data=nhats_master_d;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7disescn1 hc7disescn2 hc7disescn3 hc7disescn4 hc7disescn5 hc7disescn6 hc7disescn7 hc7disescn8 hc7disescn9 hc7disescn10;
run;


data nhats_master_e;
set nhats_master_d;
if (hc7disescn1=1 or hc7disescn1=7)  then heart_attack=1;
else heart_attack=0;
if (hc7disescn2=1 or hc7disescn2=7) then heart_disease=1;
else heart_disease=0;
if (hc7disescn3=1 or hc7disescn3=7) then blood_press=1;
else blood_press=0;
if (hc7disescn4=1 or hc7disescn4=7) then arthritis=1;
else arthritis=0;
if (hc7disescn5=1 or hc7disescn5=7) then osteoporosis=1;
else osteoporosis=0;
if (hc7disescn6=1 or hc7disescn6=7) then diabetes=1;
else diabetes=0;
if (hc7disescn7=1 or hc7disescn7=7) then lung_disease=1;
else lung_disease=0;
if (hc7disescn8=1 or hc7disescn8=7) then stroke=1;
else stroke=0;
if (hc7disescn9=1 or hc7disescn9=7) then dementia=1;
else dementia=0;
if (hc7disescn10=1 or hc7disescn10=7) then cancer=1;
else cancer=0;
chron_conditions = heart_attack + heart_disease + blood_press + arthritis + osteoporosis + diabetes + lung_disease + stroke + cancer;
if 0 le chron_conditions le 1 then chron_cat=0;
else if 2 le chron_conditions le 3 then chron_cat=1;
else if chron_conditions gt 3 then chron_cat=2;

run;
*Comorbidities include heart attack, heart disease, hypertension, arthritis, osteoporosis, diabetes, lung disease, stroke, and cancer;

proc surveyfreq data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7disescn1 heart_attack hc7disescn2 heart_disease hc7disescn3 blood_press hc7disescn4 arthritis hc7disescn5 osteoporosis hc7disescn6 diabetes
hc7disescn7 lung_disease hc7disescn8 stroke hc7disescn9 dementia hc7disescn10 cancer;
run;

proc surveymeans data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var chron_conditions ;
run;

proc surveyfreq data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables chron_cat ;
run;
*same as methods paper so must be different variable;


*Dementia;
*SAS code from NHATS;
proc format;
value demclas
 1="1:Probable dementia"
 2="2:Possible dementia"
 3="3:No dementia"
 -1="-1:Deceased or nursing home resident in initial round"
 -9="-9:Missing"
 ;
value ad8dem
 1="1:Meets dementia criteria"
 2="2:Does not meet dementia criteria"
 ;
value domain_l
0="0:Does not meet criteria"
1="1:Meets criteria"
;
value domain65_l
0="0 Not impaired"
1="Impaired in 1 domain"
2="Impaired in 2 domains"
3="Impaired in 3 domains"
;
run;


*************************** SKIP THIS SECTION TO BOTTOM OF MACRO ******************************************;


libname demclas "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis";


%macro dementia1to12(rd, path, dataname, formatfile);


libname nhatsr&rd "&path";
%include "&path\&formatfile..sas";

data demclas.Round&rd;
set nhatsr&rd..&dataname;

** DATE STEP CODE FOR CREATING DEMENTIA CLASSIFICATION VARIABLE **;
length r&rd.demclas
 r&rd.ad8_dem r&rd.ad8_1-r&rd.ad8_8 r&rd.ad8miss_1-r&rd.ad8miss_8 r&rd.ad8_score r&rd.ad8_miss
 r&rd.date_mon r&rd.date_day r&rd.date_yr r&rd.date_dow r&rd.date_sum r&rd.date_sumr
 r&rd.preslast r&rd.presfirst r&rd.vplast r&rd.vpfirst r&rd.presvp r&rd.presvpr r&rd.date_prvp
 r&rd.clock_scorer r&rd.irecall r&rd.drecall r&rd.wordrecall0_20
 r&rd.clock65 r&rd.word65 r&rd.datena65 r&rd.domain65
 3;
label r&rd.demclas="R&rd. NHATS Dementia Classification";

%if &rd = 2 %then %do;
      if cg2dwrdimmrc = 10 and cg2dwrddlyrc = -3  then  cg2dwrdimmrc = -3; **USE THIS LINE TO FIX A CODING ERROR IN ROUND 2 ONLY**;
%end;

%if &rd = 1 %then %do;
** 1) SET MISSING (RESIDENTIAL CARE FQ ONLY) AND N.A. (NURSING HOME RESIDENTS) **;
      if r1dresid=3 then r1demclas=-9 ;
      if r1dresid=4 then r1demclas=-1 ;
%end;

%if &rd ne 1 %then %do;
** 1) SET MISSING (RESIDENTIAL CARE FQ ONLY) AND N.A. (NURSING HOME RESIDENTS, DECEASED) **;
      if r&rd.dresid in (3,5,7) then r&rd.demclas=-9;
      if r&rd.dresid in (6,8) then r&rd.demclas=-1;
%end;

** 2) CODE PROBABLE IF DEMENTIA DIAGNOSIS REPORTED BY SELF OR PROXY **;
if hc&rd.disescn9 in (1,7) and is&rd.resptype in (1,2) then r&rd.demclas=1;

** 3a) CODE AD8_SCORE **;
array r&rd.think {*} cp&rd.chgthink1-cp&rd.chgthink8; ** QUESTIONNAIRE ITEMS **;
array r&rd.ad8item {*} r&rd.ad8_1-r&rd.ad8_8;
array r&rd.ad8miss {*} r&rd.ad8miss_1-r&rd.ad8miss_8;
 r&rd.ad8_score =-1;
 r&rd.ad8_miss =-1;

 do i=1 to dim(r&rd.ad8item);
 ** INITIALIZE COUNTS TO NOT APPLICABLE**;
 r&rd.ad8item{i}=-1;
 r&rd.ad8miss{i}=-1;
 ** ASSIGN VALUES TO AD8 ITEMS IF PROXY AND DEMENTIA CLASS NOT ALREADY ASSIGNED BY
REPORTED DIAGNOSIS **;
 if is&rd.resptype=2 and r&rd.demclas=. then do;
 r&rd.ad8item{i}=.;
 if r&rd.think{i} in (1,3) then r&rd.ad8item{i}=1; ** PROXY REPORTS A CHANGE OR ALZ/DEMENTIA **;
 else if r&rd.think{i}=2 then r&rd.ad8item{i}=0; ** PROXY REPORTS NO CHANGE **;
 r&rd.ad8_score=sum(of r&rd.ad8item{*}); ** COUNT AD8 ITEMS **;

 if r&rd.ad8item{i} in (0,1) then r&rd.ad8miss{i}=0;
 else if r&rd.ad8item{i}=. then r&rd.ad8miss{i}=1;
 r&rd.ad8_miss=sum(of r&rd.ad8miss{*}); ** COUNT MISSING AD8 ITEMS **;
 end;
 end;
** 3b) CODE AD8 DEMENTIA CLASS **;

%if &rd ne 1 %then %do;
if cp&rd.dad8dem=1 and is&rd.resptype=2 and r&rd.demclas=. then r&rd.ad8_score=8;
%end;

**USE THIS LINE FOR ROUNDS 4-9 ONLY**;
%if &rd = 4 or &rd = 5 or &rd = 6  or &rd = 7  or &rd = 8 or &rd = 9 %then %do;
if is&rd.resptype=2 and cp&rd.dad8dem=-1 and cp&rd.chgthink1=-1 and r&rd.demclas=. then r&rd.ad8_score=8;
%end;

if r&rd.ad8_score>=2 then r&rd.ad8_dem=1 ; ** IF SCORE >=2 THEN MEETS AD8 CRITERION **;
if (r&rd.ad8_score in (0,1) or r&rd.ad8_miss=8) and r&rd.ad8_dem=. then r&rd.ad8_dem=2; ** IF SCORE IS 0 OR 1 OR ALL ITEMS MISSING THEN DOES NOT MEET AD8 CRITERION **;
** 4) UPDATE DEMENTIA CLASSIFICATION VARIABLE WITH AD8 CLASS **;
if r&rd.demclas=. then do;
 if r&rd.ad8_dem=1 then r&rd.demclas=1; ** PROBABLE BASED ON AD8 SCORE **;
 if r&rd.ad8_dem=2 and cg&rd.speaktosp=2 then r&rd.demclas=3; ** NO DIAGNOSIS, DOES NOT MEET AD8
CRITERION, AND PROXY SAYS CANNOT ASK SP COGNITIVE ITEMS **;
end;
** 5) CODE DATE ITEMS AND COUNT **;

%if &rd ne 4 %then %do;
array cg&rd.date {*} cg&rd.todaydat1-cg&rd.todaydat4; **USE THIS LINE FOR ROUNDS 1-3 and 5-11**;
%end;

array r&rd.date_item {*} r&rd.date_mon r&rd.date_day r&rd.date_yr r&rd.date_dow;


do i=1 to dim(r&rd.date_item);
 if cg&rd.date{i} > 0 then r&rd.date_item{i}=cg&rd.date{i}; *** CODE ONLY YES/NO RESPONSES: MISSING/N.A.
CODES -1,-9 LEFT MISSING **;
 if cg&rd.date{i} in (-7,2) then r&rd.date_item{i}=0; ** 2:NO/DK OR -7:REFUSED RECODED TO 0:NO/DK/RF
**;
 r&rd.date_sum=sum(of r&rd.date_item{*}); ** COUNT CORRECT DATE ITEMS
**;
end;

if r&rd.date_sum=. then do;
 if cg&rd.speaktosp=2 then r&rd.date_sum=-2; ** PROXY SAYS CAN'T SPEAK TO SP
**;
 else if cg&rd.speaktosp=1 and max(of cg&rd.date{*})=-1 then r&rd.date_sum=-3; ** PROXY SAYS CAN SPEAK TO
SP BUT SP UNABLE TO ANSWER **;
end;

r&rd.date_sumr=r&rd.date_sum;
if r&rd.date_sum=-2 then r&rd.date_sumr=.; ** MISSING IF PROXY SAYS CAN'T SPEAK TO SP
**;
else if r&rd.date_sum=-3 then r&rd.date_sumr=0; ** 0 IF SP UNABLE TO ANSWER **;
** 6) PRESIDENT AND VICE PRESIDENT NAME ITEMS AND COUNT **;
array cg&rd.pres {*} cg&rd.presidna1 cg&rd.presidna3 cg&rd.vpname1 cg&rd.vpname3;
array r&rd.pres_item {*} r&rd.preslast r&rd.presfirst r&rd.vplast r&rd.vpfirst;
do i=1 to dim(r&rd.pres_item);
 if cg&rd.pres{i} > 0 then r&rd.pres_item{i}=cg&rd.pres{i}; ** CODE ONLY YES/NO RESPONSES: MISSING/N.A. CODES
-1,-9 LEFT MISSING **;
 if cg&rd.pres{i} in (-7,2) then r&rd.pres_item{i}=0; ** 2:NO/DK OR -7:REFUSED RECODED TO 0:NO/DK/RF
**;
 r&rd.presvp=sum(of r&rd.pres_item{*}); ** COUNT CORRECT PRESIDENT/VEEP NAME ITEMS
**;
end;
if r&rd.presvp=. then do;
 if cg&rd.speaktosp=2 then r&rd.presvp=-2; ** PROXY SAYS CAN'T SPEAK TO SP
**;
 else if cg&rd.speaktosp=1 and max(of cg&rd.pres{*})=-1 then r&rd.presvp=-3; ** PROXY SAYS CAN SPEAK TO SP
BUT SP UNABLE TO ANSWER **;
end;
r&rd.presvpr=r&rd.presvp;
if r&rd.presvp=-2 then r&rd.presvpr=.; ** MISSING IF PROXY SAYS CAN'T SPEAK TO SP **;
else if r&rd.presvp=-3 then r&rd.presvpr=0; ** 0 IF SP UNABLE TO ANSWER **;
** 7) ORIENTATION DOMAIN: SUM OF DATE RECALL AND PRESIDENT NAMING **;
r&rd.date_prvp=sum(r&rd.date_sumr,r&rd.presvpr);

** 8) EXECUTIVE FUNCTION DOMAIN: CLOCK DRAWING SCORE **;
*RECODE CLOCK DRAWING SCORE TO ALIGN WITH MISSING VALUES IN PREVIOUS ROUNDS (ROUNDS 11 AND FORWARD ONLY)*;
%if &rd = 11 or &rd = 12 %then %do;
      if cg&rd.speaktosp=2 and cg&rd.dclkdraw=-9 then cg&rd.dclkdraw=-2;
      if cg&rd.speaktosp=1 and cg&rd.quesremem in (2, -7, -8) and cg&rd.dclkdraw=-9 then cg&rd.dclkdraw=-3;
%end;

%if &rd = 10 %then %do;
      if cg10speaktosp=2 and cg10dclkdraw=-9 then cg10dclkdraw=-2;
      if cg10speaktosp=1 and cg10quesremem in (2, -7, -8) and cg10dclkdraw=-9 then cg10dclkdraw=-3;
      if cg10atdrwclck=2  and cg10dclkdraw=-9 then cg10dclkdraw=-4;
      if cg10atdrwclck=97 and cg10dclkdraw=-9 then cg10dclkdraw=-7;
%end;

r&rd.clock_scorer=cg&rd.dclkdraw;
if cg&rd.dclkdraw in (-2,-9) then r&rd.clock_scorer=.;
if cg&rd.dclkdraw in (-3,-4,-7) then r&rd.clock_scorer=0;

** IMPUTE MEAN SCORE TO PERSONS MISSING A CLOCK **;
if cg&rd.dclkdraw=-9 and cg&rd.speaktosp=1 then r&rd.clock_scorer=2; ** IF PROXY SAID CAN ASK SP **;
if cg&rd.dclkdraw=-9 and cg&rd.speaktosp=-1 then r&rd.clock_scorer=3; ** IF SELF RESPONDENT **;


** 9) MEMORY DOMAIN: IMMEDIATE AND DELAYED WORD RECALL **;
array cg&rd.recall {*} cg&rd.dwrdimmrc cg&rd.dwrddlyrc;
array r&rd.word_recall {*} r&rd.irecall r&rd.drecall;
do i=1 to dim(r&rd.word_recall);
 r&rd.word_recall{i}=cg&rd.recall{i};
 if cg&rd.recall{i} in (-2,-1) then r&rd.word_recall{i}=.;
 if cg&rd.recall{i} in (-7,-3) then r&rd.word_recall{i}=0;

**SET CASES WITH MISSING WORD LIST AND NOT PREVIOUSLY ASSIGNED TO MISSING (ROUND 5 ONLY)**;
%if &rd = 5 %then %do;
      if cg5dwrdimmrc=-9 then r5word_recall{i}=.;
%end;

 r&rd.wordrecall0_20=sum(of r&rd.word_recall{*});
end;

** 10) CREATE COGNITIVE DOMAINS FOR ALL ELIGIBLE **;
** I.E. PROXY BUT PROXY SAYS CAN ASK SP, NOT FQ ONLY, NOT NH **;
if 1 < r&rd.clock_scorer <=5 then r&rd.clock65=0;
if 0 <= r&rd.clock_scorer <=1 then r&rd.clock65=1;
if 3 < r&rd.wordrecall0_20 <=20 then r&rd.word65=0;
if 0 <= r&rd.wordrecall0_20 <=3 then r&rd.word65=1;
if 3 < r&rd.date_prvp <= 8 then r&rd.datena65=0;
if 0 <= r&rd.date_prvp <= 3 then r&rd.datena65=1;
** 10) CREATE COGNITIVE DOMAIN SCORE **;
array r&rd.domains {*} r&rd.clock65 r&rd.word65 r&rd.datena65;
do i=1 to dim(r&rd.domains);
 r&rd.domain65=r&rd.clock65 + r&rd.word65 + r&rd.datena65;
end;


**SET CASES WITH MISSING WORD LIST AND NOT PREVIOUSLY ASSIGNED TO MISSING (ROUND 5 ONLY)**;
%if &rd = 5 %then %do;
      if cg5dwrdlstnm=-9 and r5demclas=. then r5demclas=-9;
%end;

** 11) UPDATE COGNITIVE CLASSIFICATION **;
if r&rd.demclas=. and cg&rd.speaktosp in (-1,1) then do;
if 2 <= r&rd.domain65 <=3 then r&rd.demclas=1; ** PROBABLE DEMENTIA **;
if r&rd.domain65 =1 then r&rd.demclas=2; ** POSSIBLE DEMENTIA **;
if r&rd.domain65 =0 then r&rd.demclas=3; ** NO DEMENTIA **;
end;



*KEEP DEMENTIA CLASSIFICATION AND COMPONENTS*;
keep spid r&rd.demclas r&rd.domain65 r&rd.ad8_dem r&rd.clock65 r&rd.word65 r&rd.datena65;

format
r&rd.demclas demclas.
r&rd.ad8_dem  ad8dem.
r&rd.clock65 r&rd.word65 r&rd.datena65 domain_l.
r&rd.domain65 domain65_l.;


run;


proc freq data = demclas.Round&rd;
table  r&rd.demclas ;
run;


%mend;


%dementia1to12(1,
[LOCATION WHERE ROUND 1 DATA IS SAVED],
NHATS_Round_1_SP_File,
Proc Format)


%dementia1to12(2,
[LOCATION WHERE ROUND 2 DATA IS SAVED],
NHATS_Round_2_SP_File_v2,
NHATS_Round_2_Combined_PROC_FORMAT_Statement_v2)

%dementia1to12(3,
[LOCATION WHERE ROUND 3 DATA IS SAVED],
NHATS_Round_3_SP_File,
NHATS_Round_3_Combined_PROC_FORMAT_Statement)

%dementia1to12(4,
[LOCATION WHERE ROUND 4 DATA IS SAVED],
NHATS_Round_4_SP_File,
NHATS_Round_4_Combined_PROC_FORMAT_Statement)

%dementia1to12(5,
[LOCATION WHERE ROUND 5 DATA IS SAVED],
NHATS_Round_5_SP_File_v2,
NHATS_Round_5_Combined_PROC_FORMAT_Statement_V2)


%dementia1to12(6,
[LOCATION WHERE ROUND 6 DATA IS SAVED],
NHATS_Round_6_SP_File_V2,
NHATS_Round_6_Combined_PROC_FORMAT_Statement_V2)


%dementia1to12(7,
U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS,
NHATS_Round_7_SP_File,
NHATS_Round_7_Combined_PROC_FORMAT_Statement)

%dementia1to12(8,
[LOCATION WHERE ROUND 8 DATA IS SAVED],
NHATS_Round_8_SP_File,
NHATS_Round_8_Combined_PROC_FORMAT_Statement)


%dementia1to12(9,
[LOCATION WHERE ROUND 9 DATA IS SAVED],
NHATS_Round_9_SP_File,
NHATS_Round_9_Combined_PROC_FORMAT_Statement)


%dementia1to12(10,
[LOCATION WHERE ROUND 10 DATA IS SAVED],
NHATS_Round_10_SP_File,
NHATS_Round_10_Combined_PROC_FORMAT_Statement)


%dementia1to12(11,
[LOCATION WHERE ROUND 11 DATA IS SAVED],
NHATS_Round_11_SP_File,
NHATS_Round_11_Combined_PROC_FORMAT_Statement)

%dementia1to12(12,
[LOCATION WHERE ROUND 12 DATA IS SAVED],
NHATS_Round_12B_SP_File,
NHATS_Round_12B_Combined_PROC_FORMAT_Statement)


************************************************************************* START CODE BACK AT THIS POINT TO IMPORT FILE WITH DEMENTIA CLASS **********;


libname dementia 'U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis';

data work.dementia;
set dementia.Nhats_round_7_sp_file;
run;

data dementia_b;
set dementia (keep=spid r7demclas);
run;

*merge dementia_b dataset with nhats_master_e file;
proc sort data=dementia_b; by spid; run;
proc sort data=nhats_master_e; by spid; run;

data nhats_master_e_;
merge nhats_master_e (in=a) dementia_b (in=b) ;
by spid;
if a=1 and b=1;
run;

proc surveyfreq data=nhats_master_e_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7demclas;
run;

data nhats_master_e_b;
set nhats_master_e_;
if  r7demclas=1 then dementia=1;
else dementia=0;
run;

proc surveyfreq data=nhats_master_e_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dementia;
run;

*Depression (PHQ-2);
proc surveyfreq data=nhats_master_e_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7depresan1 hc7depresan2;
run;
*recode -8 for 1st item to missing and -7 or -8 on second item to missing, also change scoring to be 0-3 instead of 1-4;
data nhats_master_f;
set nhats_master_e_b;
if hc7depresan1=-8 then hc7depresan1=.;
if (hc7depresan2=-7 or hc7depresan2=-8) then hc7depresan2=.;
hc7depresan1_ = hc7depresan1 - 1;
hc7depresan2_ = hc7depresan2 - 1;
phq_2_ = hc7depresan1_ + hc7depresan2_ ;
if 0 le phq_2_ lt 3 then depression=0;
else if phq_2_ ge 3 then depression=1;
run;

proc surveyfreq data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7depresan1_ hc7depresan2_ phq_2_ depression;
run;

proc surveymeans data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var phq_2_;
run;
                                                                                                                                                                                                                                                                                                                   ;

*Walking for exercise;
proc surveyfreq data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
run;
data nhats_master_g;
set nhats_master_f;
if Pa7evrgowalk = -8 then Pa7evrgowalk =.;
run;

proc surveyfreq data=nhats_master_g;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
run;

*Community network;
proc surveyfreq data=nhats_master_g;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell cm7willnghlp cm7peoptrstd;
run;

data nhats_master_h;
set nhats_master_g;
if (cm7knowwell=-7 or cm7knowwell=-8) then cm7knowwell=.;
if (cm7willnghlp=-7 or cm7willnghlp=-8) then cm7willnghlp=.;
if (cm7peoptrstd=-7 or cm7peoptrstd=-8) then cm7peoptrstd=.;
comm_net = cm7knowwell + cm7willnghlp + cm7peoptrstd;
run;

proc surveyfreq data=nhats_master_h;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell cm7willnghlp cm7peoptrstd;
run;

proc surveymeans data=nhats_master_h;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var comm_net;
run;

data nhats_master_i;
set nhats_master_h;
if cm7knowwell=3 then cm7knowwell_b = 0;
if cm7knowwell=2 then cm7knowwell_b = 1;
if cm7knowwell=1 then cm7knowwell_b = 2;
if cm7willnghlp=3 then cm7willnghlp_b = 0;
if cm7willnghlp=2 then cm7willnghlp_b = 1;
if cm7willnghlp=1 then cm7willnghlp_b = 2;
if cm7peoptrstd=3 then cm7peoptrstd_b = 0;
if cm7peoptrstd=2 then cm7peoptrstd_b = 1;
if cm7peoptrstd=1 then cm7peoptrstd_b = 2;
comm_net_b = cm7knowwell_b + cm7willnghlp_b + cm7peoptrstd_b ;
run;

proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell_b cm7willnghlp_b cm7peoptrstd_b;
run;

proc surveymeans data=nhats_master_i percentile=(15,25,50,75,90,95);
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var comm_net_b;
run;


*IL-6;
proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7directil6;
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7directil6;
run;
proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7peil6;
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7peil6 ;
run;
data nhats_master_j;
set nhats_master_i;
if dbs7peil6=-9 then dbs7peil6=.;
log_dbs_IL6_ = log(dbs7peil6);
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7dfillil6 ;
run;

proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7peil6 ;
run;
proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_ ;
run;

*CRP;
proc surveyfreq data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7pehscrp;
run;
proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7directhscrp dbs7pehscrp ;
run;

data nhats_master_k;
set nhats_master_j;
if dbs7pehscrp=-9 then dbs7pehscrp=.;
log_dbs_crp_ = log(dbs7pehscrp);
run;

proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7pehscrp ;
run;
proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_ ;
run;

*Frailty - use definition provided here: Bandeen-Roche, K., Seplaki, C. L., Huang, J., Buta, B., Kalyani, R. R., Varadhan, R., Xue, Q. L., Walston, J. D., & Kasper, J. D. (2015).
Frailty in Older Adults: A Nationally Representative Profile in the United States. The journals of gerontology. Series A, Biological sciences and medical sciences, 70(11),
 1427–1434. https://doi.org/10.1093/gerona/glv133;

*Weakness = Grip strength (kg) by BMI by gender;
grip stregnth results 1 = gr7grp1rdng
grip stregnth results 2 = gr7grp2rdng
proc surveyfreq data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables gr7grp1reslt gr7grp2reslt gr7grp1noat1 gr7grp1noat3 gr7grp1noat4 gr7grp1noat9   ;
run;
proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var gr7grp1rdng gr7grp2rdng;
run;

*create avg grip stregnth from 2 tests;
data nhats_master_l;
set nhats_master_k;
if gr7grp1reslt ne 1 then gr7grp1rdng =.;
if gr7grp2reslt ne 1 then gr7grp2rdng =.;
grip_avg = max(of gr7grp1rdng gr7grp2rdng);
run;

data grip_check;
set nhats_master_l (keep= gr7grp1rdng gr7grp2rdng grip_avg);
run;

proc surveyfreq data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables gr7grp1reslt gr7grp2reslt;
run;
proc surveymeans data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var gr7grp1rdng gr7grp2rdng grip_avg;
run;

*gender = r5dgender ;
proc surveyfreq data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender;
run;
*1=male, 2=female;

*define weakness;
data nhats_master_m;
set nhats_master_l;
if (gr7grp1reslt=-1 or gr7grp2reslt=-1 or gr7grp1reslt=3 or gr7grp2reslt=2 or gr7grp2reslt=3 or gr7grp1noat1=1) then weakness=1;
else if r5dgender =1 and (0 le BMI lt 18.5 and 0 le grip_avg le 5.52) then weakness = 1;
else if r5dgender =1 and (0 le BMI lt 18.5 and grip_avg gt 5.52) then weakness = 0;

else if r5dgender =1 and (18.5 le BMI lt 25 and 0 le grip_avg le 22.75) then weakness = 1;
else if r5dgender =1 and (18.5 le BMI lt 25 and grip_avg gt 22.75) then weakness = 0;

else if r5dgender =1 and (25 le BMI lt 30 and 0 le grip_avg le 25.59) then weakness = 1;
else if r5dgender =1 and (25 le BMI lt 30 and grip_avg gt 25.59) then weakness = 0;

else if r5dgender =1 and (BMI ge 30 and 0 le grip_avg le 25.96) then weakness = 1;
else if r5dgender =1 and (BMI ge 30 and grip_avg gt 25.96) then weakness = 0;

else if r5dgender =2 and (0 le BMI lt 18.5 and 0 le grip_avg le 9.21) then weakness = 1;
else if r5dgender =2 and (0 le BMI lt 18.5 and grip_avg gt 9.21) then weakness = 0;

else if r5dgender =2 and (18.5 le BMI lt 25 and 0 le grip_avg le 12.66) then weakness = 1;
else if r5dgender =2 and (18.5 le BMI lt 25 and grip_avg gt 12.66) then weakness = 0;

else if r5dgender =2 and (25 le BMI lt 30 and 0 le grip_avg le 12.92) then weakness = 1;
else if r5dgender =2 and (25 le BMI lt 30 and grip_avg gt 12.92) then weakness = 0;

else if r5dgender =2 and (BMI ge 30 and 0 le grip_avg le 12.23) then weakness = 1;
else if r5dgender =2 and (BMI ge 30 and grip_avg gt 12.23) then weakness = 0;

else weakness=.;
run;

proc surveyfreq data=nhats_master_m;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables weakness;
run;

*Slowness = Gait speed m/s by height (cm) by gender;
*create height in cm from height in feet and inches;
data nhats_master_n;
set nhats_master_m;
height_in = ((hw7howtallft*12) +  hw7howtallin);
height_cm = height_in * 2.54;
run;

*Gait speed variable = wa7wlkc2secs ;
*Walking course completed = wa7wlkc2rslt ;
proc surveyfreq data=nhats_master_n;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables wa7wlkc2rslt wa7wlkc1rslt wa7wkaidused;
run;
proc surveymeans data=nhats_master_n;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var wa7wlkc2secs wa7wlkc1secs;
run;

data nhats_master_o;
set nhats_master_n;

walk_speed_avg = (4.8768 / wa7wlkc1secs) ;
run;

proc surveyfreq data=nhats_master_o;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender ;
run;

proc surveymeans data=nhats_master_o;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var walk_speed_avg;
domain r5dgender;
run;

data nhats_master_o_;
set nhats_master_o;
if (wa7wlkc2rslt=-1 or wa7wlkc1rslt=-1 or wa7wlkc2rslt=3 or wa7wlkc1rslt=2 or wa7wlkc1rslt=3 or
wa7wkaidused=2 or wa7wkaidused=3 or gr7grp2noat1=1) then slowness=1;

else if r5dgender =1 and (0 le height_cm le 175 and 0 le walk_speed_avg le 0.50) then slowness=1;
else if r5dgender =1 and (0 le height_cm le 175 and walk_speed_avg gt 0.50) then slowness=0;

else if r5dgender =1 and (height_cm gt 175 and 0 le walk_speed_avg le 0.58) then slowness=1;
else if r5dgender =1 and (height_cm gt 175 and walk_speed_avg gt 0.58) then slowness=0;

else if r5dgender =2 and (0 le height_cm le 159 and 0 le walk_speed_avg le 0.35) then slowness=1;
else if r5dgender =2 and (0 le height_cm le 159 and walk_speed_avg gt 0.35) then slowness=0;

else if r5dgender =2 and (height_cm gt 159 and 0 le walk_speed_avg le 0.45) then slowness=1;
else if r5dgender =2 and (height_cm gt 159 and walk_speed_avg gt 0.45) then slowness=0;

*count missing as 0;
run;

proc surveyfreq data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables wa7wlkc2rslt wa7wlkc1rslt slowness;
run;
proc surveymeans data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var wa7wlkc2secs wa7wlkc1secs walk_speed_avg;
run;


*Shrinking = wt loss of >= 10lbs in last year or BMI < 18.5;
proc surveyfreq data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hw7lst10pnds hw7trytolose;
run;

data nhats_master_p;
set nhats_master_o_;
if ((hw7lst10pnds=1 and hw7trytolose=2) or (0 le BMI lt 18.5)) then shrinking=1;
else if (hw7lst10pnds =. or hw7trytolose =. or BMI =.) then shrinking=.;
else shrinking=0;
run;

proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables shrinking;
run;

*Exhaustion = Self-report of low energy or ease of exhaustion to limit activities;
proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables ss7loenlmtat ss7lowenergy;
run;

data nhats_master_p_;
set nhats_master_p;
if ss7loenlmtat=1 then low_energ_exhaust=1;
else if (ss7loenlmtat=-8 or ss7lowenergy=-8) then low_energ_exhaust=.;
else low_energ_exhaust=0;
run;

proc surveyfreq data=nhats_master_p_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_energ_exhaust;
run;


*Low physical activity = Never walked for exercise or engaged in vigorous activity in the last month;
proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk pa7vigoractv ;
run;

data nhats_master_q;
set nhats_master_p_;
if (Pa7evrgowalk=2 and pa7vigoractv=2) then low_phys_act=1;
else if (Pa7evrgowalk=. or pa7vigoractv=.) then low_phys_act=.;
else low_phys_act=0;
run;

proc surveyfreq data=nhats_master_q;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_phys_act ;
run;

*Defining frailty;
proc surveyfreq data=nhats_master_q;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables weakness slowness shrinking low_energ_exhaust low_phys_act ;
run;

*0 criteria=robust, 1-2 criteria=pre-frail, 3-5=frail;
proc format;
value frailty
0='robust'
1='pre-frail'
2='frail'
;
run;

data nhats_master_r;
set nhats_master_q;
nmiss = nmiss(of weakness slowness shrinking low_energ_exhaust low_phys_act);
if (0 le nmiss le 2 and weakness=.) then weakness=0;
if (0 le nmiss le 2 and slowness=.) then slowness=0;
if (0 le nmiss le 2 and shrinking=.) then shrinking=0;
if (0 le nmiss le 2 and low_energ_exhaust=.) then low_energ_exhaust=0;
if (0 le nmiss le 2 and low_phys_act=.) then low_phys_act=0;

frail_index = weakness + slowness + shrinking + low_energ_exhaust + low_phys_act;
if frail_index=0 then frailty=0;
else if 1 le frail_index le 2 then frailty=1;
else if 3 le frail_index le 5 then frailty=2;
run;

proc surveyfreq data=nhats_master_r;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables nmiss frail_index frailty;
format frailty frailty.;
run;

proc surveyfreq data=nhats_master_r;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_cohesion;
*format frailty frailty.;
run;


********************************************* analysis;

*association between covariates and social cohesion;
*age;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model comm_net_b= r7dintvwrage / solution;
run ;

*age category;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model comm_net_b= r7d2intvrage  / solution;
run ;

*gender;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model comm_net_b= r5dgender  / solution;
run ;

*race/ethncity;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new ;
model comm_net_b= rl5dracehisp_new / solution;
run ;

*income;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class income_cat_b ;
model comm_net_b= income_cat_b / solution;
run ;

*smoking;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= sd7smokesnow / solution;
run ;

*bmi;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= BMI / solution;
run ;

*chronic conditions;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= chron_cat / solution;
run ;

*dementia;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= dementia / solution;
run ;

*frailty;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= frailty / solution;
run ;

*depression;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= phq_2_  / solution;
run ;

proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= depression  / solution;
run ;

*walking for exercise;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= Pa7evrgowalk  / solution;
run ;


****** cronbach's alpha comm_net_b ******;
proc corr data=nhats_master_r nomiss alpha plots=matrix;
   var cm7knowwell_b cm7willnghlp_b cm7peoptrstd_b;
run;

proc corr data=nhats_master_r nomiss pearson spearman;
   var dbs7pehscrp dbs7peil6 ;
run;


**************** CRP *************************;

*unadjusted/model 1;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty/ clparm solution;
run ;


************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b  / clparm solution;
run ;

*model 2;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;

*re-catorize based on a value of 2 or less indicating low social cohesion;
data nhats_master_s;
set nhats_master_r;
if 0 le comm_net_b le 2 then low_cohesion=1;
else if comm_net_b gt 2 then low_cohesion=0;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_cohesion;
run;


****** BELOW IS SUBSTITUTING LOW SOCIAL COHESION FOR SOCIAL COHESION CONTINUOUS VARIABLE ****;
**** What is the association between crp & IL-6?;
proc surveyreg data = nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = log_dbs_crp_ / clparm solution;
run;
proc surveyreg data = nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = log_dbs_IL6_ / clparm solution;
run;

*export dataset to run correlation in R;
proc export data=nhats_master_s
  outfile='U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis.csv'
  dbms=csv
  replace;
run;

**************** CRP *************************;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty/ clparm solution;
*output out=outdiag p=phat r=resid ;
run ;

proc reg data=nhats_master_s ;
weight w7anfinwgt0 ;
*class sd7smokesnow ;
model log_dbs_crp_= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty;
plot r.*nqq.
r.*p. ;
output out=outdiag_ p=phat r=resid ;
run ;

proc univariate data=outdiag_ noprint ;
var resid ;
histogram resid / cfill=grey normal ;
run ;

proc gplot data=outdiag ;
title "Residual by low cohesion " ;
plot resid*low_cohesion ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by age " ;
plot resid*r7d2intvrage ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by gender " ;
plot resid*r5dgender ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by ethnicity " ;
plot resid*rl5dracehisp_new ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by income " ;
plot resid*income_cat_b ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by smoking stat " ;
plot resid*sd7smokesnow ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by bmi " ;
plot resid*BMI ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by comorb " ;
plot resid*chron_cat ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by dementia " ;
plot resid*dementia ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by depression " ;
plot resid*depression ;
run ;
quit ;
proc gplot data=outdiag ;
title "Residual by frailty " ;
plot resid*frailty ;
run ;
quit ;

proc sort data=nhats_master_s;
by low_cohesion;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_;
by low_cohesion;
run;

*non transformed;
proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7pehscrp;
by low_cohesion;
run;


************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = low_cohesion  / clparm solution;
run ;

*model 2;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
*output out=outdiag2 p=phat r=resid ;
run ;

proc reg data=nhats_master_s ;
weight w7anfinwgt0 ;
*class sd7smokesnow ;
model log_dbs_IL6_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty ;
plot r.*nqq.
r.*p. ;
output out=outdiag2_ p=phat r=resid ;
run ;

proc univariate data=outdiag2_ noprint ;
var resid ;
histogram resid / cfill=grey normal ;
run ;


proc gplot data=outdiag2 ;
title "Residual by low cohesion " ;
plot resid*low_cohesion ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by age " ;
plot resid*r7d2intvrage ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by gender " ;
plot resid*r5dgender ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by ethnicity " ;
plot resid*rl5dracehisp_new ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by income " ;
plot resid*income_cat_b ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by smoking stat " ;
plot resid*sd7smokesnow ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by bmi " ;
plot resid*BMI ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by comorb " ;
plot resid*chron_cat ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by dementia " ;
plot resid*dementia ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by depression " ;
plot resid*depression ;
run ;
quit ;
proc gplot data=outdiag2 ;
title "Residual by frailty " ;
plot resid*frailty ;
run ;
quit ;

proc sort data=nhats_master_s;
by low_cohesion;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_;
by low_cohesion;
run;

*non transformed;
proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7peil6;
by low_cohesion;
run;


*association between covariates and low social cohesion;
*age;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model low_cohesion = r7dintvwrage ;
run ;

proc surveymeans data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
var r7dintvwrage ;
domain low_cohesion ;
run ;

*age category;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model low_cohesion= r7d2intvrage  ;
run ;

proc sort datan=nhats_master_s;
by low_cohesion;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage;
by low_cohesion;
run;

*gender;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model low_cohesion= r5dgender  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender;
by low_cohesion;
run;

*race/ethncity;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new ;
model low_cohesion= rl5dracehisp_new ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new;
by low_cohesion;
run;

*income;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class income_cat_b ;
model low_cohesion= income_cat_b ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat_b ;
by low_cohesion;
run;

*smoking;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= sd7smokesnow ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables sd7smokesnow ;
by low_cohesion;
run;

*bmi;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= BMI ;
run ;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var BMI ;
by low_cohesion;
run;

*chronic conditions;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= chron_cat ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables chron_cat ;
by low_cohesion;
run;

*dementia;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= dementia ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dementia ;
by low_cohesion;
run;

*frailty;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= frailty ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables frailty ;
by low_cohesion;
run;

*depression;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= phq_2_  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables depression ;
by low_cohesion;
run;

proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= depression  ;
run ;

*walking for exercise;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= Pa7evrgowalk  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
by low_cohesion;
run;


********** ASSOCIATION BETWEEN COVARIATES OF INTEREST AND OUR OUTCOMES ***********;

*age;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model log_dbs_IL6_ = r7dintvwrage ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model log_dbs_crp_ = r7dintvwrage ;
run ;

*age category;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  r7d2intvrage ;
model log_dbs_IL6_ = r7d2intvrage / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  r7d2intvrage ;
model log_dbs_crp_ = r7d2intvrage / solution ;
run ;

*gender;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_= r5dgender  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_= r5dgender  ;
run ;

*race/ethncity;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new (ref='1');
model log_dbs_IL6_ = rl5dracehisp_new /solution;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  rl5dracehisp_new (ref='1') ;
model log_dbs_crp_ = rl5dracehisp_new /solution;
run ;

*income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class income_cat_b ;
model log_dbs_IL6_ = income_cat_b /solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class income_cat_b ;
model log_dbs_crp_ = income_cat_b /solution ;
run ;

*smoking;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class sd7smokesnow ;
model log_dbs_IL6_ = sd7smokesnow / solution;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class sd7smokesnow ;
model log_dbs_crp_ = sd7smokesnow / solution;
run ;

*bmi;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_= BMI ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_= BMI ;
run ;

*chronic conditions;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class chron_cat ;
model log_dbs_IL6_ = chron_cat / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class chron_cat ;
model log_dbs_crp_ = chron_cat / solution ;
run ;

*dementia;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = dementia / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = dementia / solution ;
run ;

*frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class frailty ;
model log_dbs_IL6_ = frailty / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class frailty ;
model log_dbs_crp_ = frailty / solution ;
run ;

*depression;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = phq_2_  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = phq_2_  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = depression  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = depression  ;
run ;

*walking for exercise;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = Pa7evrgowalk  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = Pa7evrgowalk  ;
run ;


***** DO CONFOUNDERS ALTER THE ESTIMATE BY AT LEAST 10% ************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;

***** DO CONFOUNDERS ALTER THE ESTIMATE BY AT LEAST 10% ************* CRP ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_ = low_cohesion dementia / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;


************ BELOW IS ONLY ADJUSTING FOR FACTORS DETERMINED TO BE CONFOUNDING FACTORS *********;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion rl5dracehisp_new income_cat_b
BMI chron_cat depression frailty Pa7evrgowalk/ clparm solution;
run ;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion rl5dracehisp_new / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion rl5dracehisp_new
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
run ;









************************* NHATS_Round_7_DBS_Read SAS FILE*****************************************;



proc format;

VALUE f_dresid
        -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R5 (FQ only)'
        8 = '8 Nursing home in R1 and R5 (FQ only)' ;

VALUE DBS001F
0 = '0 Cards Obtained'
1 = '1 Card Obtained'
2 = '2 Cards Obtained'
-1 = '-1 Inapplicable';

VALUE RFDK_YN
1 = ' 1 Yes'
2 = ' 2 No'
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBSF0MTH
1 = '1 January'
2 = '2 February'
3 = '3 March'
4 = '4 April'
5 = '5 May'
6 = '6 June'
7 = '7 July'
8 = '8 August'
9 = '9 September'
10 = '10 October'
11 = '11 November'
12 = '12 December'
-7 = '-7 RF'
-8 = '-8 DK'
 -1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBS002F
.338-10.000 = 'Values of direct_IL6 assay result reported to three decimals .338-10.000'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS003F
.853-116.000 = 'Values of pe_IL6 assay result reported to three decimals .853-116.000'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS004F
1 = '1 Value assigned to minimum or maximum'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBSF0YR
2018 = '2018'
2019 = '2019'
-7 = '-7 RF'
-8 = '-8 DK'
 -1 = '-1 Inapplicable'
-9 = '-9 Missing';

VALUE DBS005F
1 = '1 Card 1'
2 = '2 Card 2'
3 = '3 Card 1 and Card 2'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS006F
4.2-13.4 = 'Values of Direct_A1c assay result reported to one decimal 4.2-13.4'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS007F
4.1-15.9 = 'Values of PE_A1c assay result reported to one decimal 4.1-15.9'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS012F
-1 = '-1 Inapplicable'
1 = '1 Batch 1'
2 = '2 Batch 2'
;
VALUE DBS016F
20-1585= 'Values of Direct_CMV assay result reported in whole numbers (no decimal) 20-1585'
-1 = '-1 Inapplicable'
-9 = '-9 No result';
VALUE DBS017F
43-2290= 'Values of PE_CMV assay result reported in whole numbers (no decimal) 43-2290'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS021F
0.075-4.998= 'Values of Direct_CRP assay result reported to three decimals 0.075-4.998'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS022F
0.106-19.662= 'Values of PE_CRP assay result reported to three decimals 0.106-19.662'
-1 = '-1 Inapplicable'
-9 = '-9 No result';

VALUE DBS026F
-1 = '-1 Inapplicable'
1 = '1 Yes'
2 = '2 Consented and no assay result obtained';

VALUE DBS027F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Below lower limit of detection (LLoD)'
3 = '3 Above analytical measurement range (AMR)'
;
VALUE DBS028F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Below lower limit of detection (LLoD)'
3 = '3 Above analytical measurement range (AMR)'
4 = '4 Issue during assay, no result'
;
VALUE DBS029F
-1 = '-1 Inapplicable'
1 = '1 Yes'
;
VALUE DBS040F
-1 ='-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Interfering peak, no result'
3 = '3 No A1c peak, no result'
4 = '4 %HbA1c adjusted due to false low level of HbS'
5 = '5 Bad chromatogram: area <1.5M, no result'
6 = '6 Bad chromatogram: aberrant A1c integration, no result'
7 = '7 HPLC instrument error, no result'
8 = '8 Non-A hemoglobin variant >60%; no result'
;
VALUE DBS061F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Above analytical measurement range (AMR), no result'
3 = '3 Equivocal, no result'
4 = '4 Negative, no result'
;
VALUE DBS074F
-1 = '-1 Inapplicable'
1 = '1 Blank punch, no result'
2 = '2 Issue during assay, no result'
3 = '3 Below lower limit of detection (LLoD), no result'
4 = '4 Below limit of quantification (LoQ); CV>20%'
5 = '5 Above analytical measurement range (AMR), no result'
6 = '6 Punch did not elute, no result'
;

VALUE DBS075F
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Ineligible'
-9 = '-9 Missing'
1 = "1 Eligible and consented"
2 = "2 Eligible and did not consent"
3 = "3 Ineligible, proxy respondent";

  VALUE DBS076F
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing'
1 = "1 SAMPLE PERSON (SP)"
2 = "2 PROXY"  ;

run;
Data NHATS_Round_7_DBS_File;


INFILE   "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\DBS\NHATS_Round_7_DBS_File.txt"
LRECL=1249 ;
inPUT
@1 spid 8.
@9 r7dresid 2.
@11 bc7dconsent 2.
@13 dbs7danyassay 2.
@15 dbs7dnumcards 2.
@17 dbs7card1mt 2.
@19 dbs7card2mt 2.
@21 dbs7directil6 6.3
@27 dbs7peil6 8.3
@35 dbs7dfillil6 2.
@37 dbs7cardrdil6 2.
@39 dbs7readdtmtil6 2.
@41 dbs7readdtyril6 4.
@45 dbs7directa1c 4.1
@49 dbs7pea1c 4.1
@53 dbs7cardrda1c 2.
@55 dbs7readdtmta1c 2.
@57 dbs7readdtyra1c 4.
@61 dbs7dbatcha1c 2.
@63 dbs7directcmv 4.
@67 dbs7pecmv 4.
@71 dbs7cardrdcmv 2.
@73 dbs7readdtmtcmv 2.
@75 dbs7readdtyrcmv 4.
@79 dbs7directhscrp 6.3
@85 dbs7pehscrp 6.3
@91 dbs7cardrdhscrp 2.
@93 dbs7readdtmthscrp 2.
@95 dbs7readdtyrhscrp 4.
@99 dbs7rnoteil6 2.
@101 dbs7anoteil6 2.
@103 dbs7blankil6 2.
@105 dbs7mdropsil6 2.
@107 dbs7smearil6 2.
@109 dbs7smallil6 2.
@111 dbs7notcircil6 2.
@113 dbs7overlapil6 2.
@115 dbs7contamil6 2.
@117 dbs7abcoloril6 2.
@119 dbs7qualityil6 2.
@121 dbs7outsideil6 2.
@123 dbs7noremil6 2.
@125 dbs7rnotea1c 2.
@127 dbs7intpeaka1c 2.
@129 dbs7nopeaka1c 2.
@131 dbs7adjusta1c 2.
@133 dbs7badinta1c 2.
@135 dbs7smareaa1c 2.
@137 dbs7aberranta1c 2.
@139 dbs7rampinga1c 2.
@141 dbs7instrmnta1c 2.
@143 dbs7nonhgvara1c 2.
@145 dbs7blanka1c 2.
@147 dbs7mdropsa1c 2.
@149 dbs7smeara1c 2.
@151 dbs7smalla1c 2.
@153 dbs7notcirca1c 2.
@155 dbs7overlapa1c 2.
@157 dbs7damagea1c 2.
@159 dbs7abcolora1c 2.
@161 dbs7qualitya1c 2.
@163 dbs7outsidea1c 2.
@165 dbs7norema1c 2.
@167 dbs7rnotecmv 2.
@169 dbs7anotecmv 2.
@171 dbs7blankcmv 2.
@173 dbs7mdropscmv 2.
@175 dbs7smearcmv 2.
@177 dbs7smallcmv 2.
@179 dbs7notcirccmv 2.
@181 dbs7overlapcmv 2.
@183 dbs7damagecmv 2.
@185 dbs7abcolorcmv 2.
@187 dbs7qualitycmv 2.
@189 dbs7outsidecmv 2.
@191 dbs7noremcmv 2.
@193 dbs7rnotehscrp 2.
@195 dbs7anotehscrp 2.
@197 dbs7blankhscrp 2.
@199 dbs7mdropshscrp 2.
@201 dbs7smearhscrp 2.
@203 dbs7smallhscrp 2.
@205 dbs7notcirchscrp 2.
@207 dbs7overlaphscrp 2.
@209 dbs7damagehscrp 2.
@211 dbs7abcolorhscrp 2.
@213 dbs7qualityhscrp 2.
@215 dbs7outsidehscrp 2.
@217 dbs7noremhscrp 2.

@219 w7varstrat 2.
@221 w7varunit 2.
@223 w7dbsfinwgt0 18.11
@241 w7dbsfinwgt1 18.11
@259 w7dbsfinwgt2 18.11
@277 w7dbsfinwgt3 18.11
@295 w7dbsfinwgt4 18.11
@313 w7dbsfinwgt5 18.11
@331 w7dbsfinwgt6 18.11
@349 w7dbsfinwgt7 18.11
@367 w7dbsfinwgt8 18.11
@385 w7dbsfinwgt9 18.11
@403 w7dbsfinwgt10 18.11
@421 w7dbsfinwgt11 18.11
@439 w7dbsfinwgt12 18.11
@457 w7dbsfinwgt13 18.11
@475 w7dbsfinwgt14 18.11
@493 w7dbsfinwgt15 18.11
@511 w7dbsfinwgt16 18.11
@529 w7dbsfinwgt17 18.11
@547 w7dbsfinwgt18 18.11
@565 w7dbsfinwgt19 18.11
@583 w7dbsfinwgt20 18.11
@601 w7dbsfinwgt21 18.11
@619 w7dbsfinwgt22 18.11
@637 w7dbsfinwgt23 18.11
@655 w7dbsfinwgt24 18.11
@673 w7dbsfinwgt25 18.11
@691 w7dbsfinwgt26 18.11
@709 w7dbsfinwgt27 18.11
@727 w7dbsfinwgt28 18.11
@745 w7dbsfinwgt29 18.11
@763 w7dbsfinwgt30 18.11
@781 w7dbsfinwgt31 18.11
@799 w7dbsfinwgt32 18.11
@817 w7dbsfinwgt33 18.11
@835 w7dbsfinwgt34 18.11
@853 w7dbsfinwgt35 18.11
@871 w7dbsfinwgt36 18.11
@889 w7dbsfinwgt37 18.11
@907 w7dbsfinwgt38 18.11
@925 w7dbsfinwgt39 18.11
@943 w7dbsfinwgt40 18.11
@961 w7dbsfinwgt41 18.11
@979 w7dbsfinwgt42 18.11
@997 w7dbsfinwgt43 18.11
@1015 w7dbsfinwgt44 18.11
@1033 w7dbsfinwgt45 18.11
@1051 w7dbsfinwgt46 18.11
@1069 w7dbsfinwgt47 18.11
@1087 w7dbsfinwgt48 18.11
@1105 w7dbsfinwgt49 18.11
@1123 w7dbsfinwgt50 18.11
@1141 w7dbsfinwgt51 18.11
@1159 w7dbsfinwgt52 18.11
@1177 w7dbsfinwgt53 18.11
@1195 w7dbsfinwgt54 18.11
@1213 w7dbsfinwgt55 18.11
@1231 w7dbsfinwgt56 18.11




 ;
format
           dbs7card1mt dbs7card2mt dbs7readdtmtil6 dbs7readdtmta1c dbs7readdtmtcmv dbs7readdtmthscrp DBSF0MTH.
           dbs7readdtyril6 dbs7readdtyra1c dbs7readdtyrcmv dbs7readdtyrhscrp DBSF0YR.
           dbs7dnumcards DBS001F.
           dbs7directil6 DBS002F.
           dbs7peil6 DBS003F.
           dbs7dfillil6 DBS004F.

           dbs7cardrdil6 dbs7cardrda1c dbs7cardrdcmv dbs7cardrdhscrp DBS005F.
           dbs7directa1c DBS006F.
           dbs7pea1c DBS007F.
           dbs7dbatcha1c DBS012F.
           dbs7directcmv DBS016F.
           dbs7pecmv  DBS017F.
           dbs7directhscrp DBS021F.
           dbs7pehscrp DBS022F.
           dbs7danyassay DBS026F.
           dbs7rnoteil6 DBS028F.
           dbs7anoteil6 DBS028F.
           dbs7blankil6 DBS029F.
           dbs7mdropsil6 DBS029F.
           dbs7smearil6 DBS029F.
           dbs7smallil6 DBS029F.
           dbs7notcircil6 DBS029F.
           dbs7overlapil6 DBS029F.
           dbs7contamil6 DBS029F.
           dbs7abcoloril6 DBS029F.
           dbs7qualityil6 DBS029F.
           dbs7outsideil6 DBS029F.
           dbs7noremil6 DBS029F.
           dbs7rnotea1c DBS040F.
           dbs7intpeaka1c DBS029F.
           dbs7nopeaka1c DBS029F.
           dbs7adjusta1c DBS029F.
           dbs7badinta1c DBS029F.
           dbs7smareaa1c DBS029F.
           dbs7aberranta1c DBS029F.
           dbs7rampinga1c DBS029F.
           dbs7instrmnta1c dbs7nonhgvara1c dbs7blanka1c dbs7mdropsa1c dbs7smeara1c dbs7smalla1c dbs7notcirca1c dbs7overlapa1c dbs7damagea1c DBS029F.
           dbs7abcolora1c dbs7qualitya1c dbs7outsidea1c dbs7norema1c dbs7blankcmv dbs7mdropscmv dbs7smearcmv dbs7smallcmv dbs7notcirccmv dbs7overlapcmv DBS029F.
           dbs7damagecmv dbs7abcolorcmv dbs7qualitycmv dbs7outsidecmv dbs7noremcmv dbs7blankhscrp dbs7mdropshscrp dbs7smearhscrp dbs7smallhscrp dbs7notcirchscrp dbs7overlaphscrp dbs7damagehscrp DBS029F.
           dbs7abcolorhscrp dbs7qualityhscrp dbs7outsidehscrp dbs7noremhscrp DBS029F.
           dbs7rnotecmv dbs7anotecmv DBS061F.
           dbs7rnotehscrp dbs7anotehscrp DBS074F.
           bc7dconsent DBS075F.
          r7dresid f_dresid.

;
label
spid="NHATS SAMPLED PERSON ID"
r7dresid="R7 D RESIDENTIAL CARE STATUS"
bc7dconsent="R7 D BC2 SP CONSENT BLOOD SPOT COLLECTION"
dbs7dnumcards="R7 D DBS NUMBER OF DBS CARDS OBTAINED"
dbs7card1mt = "R7 DBS MONTH DBS CARD 1 OBTAINED"
dbs7card2mt = "R7 DBS MONTH DBS CARD 2 OBTAINED"
dbs7directil6="R7 DBS DIRECT IL6 ANALYTE CONCENTRATION FROM DBS"
dbs7peil6    ="R7 DBS PLASMA-EQUIVALENT IL6 ANALYTE CONCENTRATION"
dbs7dfillil6 ="R7 D DBS VALUES ASSIGNED IL6"
dbs7readdtmtil6="R7 DBS READ DATE MONTH IL6"
dbs7readdtyril6="R7 DBS READ DATE YEAR IL6"
dbs7cardrdil6 ="R7 DBS CARD USED FOR ASSAY IL6"

dbs7directa1c ="R7 DBS DIRECT A1C ANALYTE CONCENTRATION FROM DBS"
dbs7pea1c     ="R7 DBS PLASMA-EQUIVALENT A1C ANALYTE CONCENTRATION"
dbs7dbatcha1c ="R7 D DBS BATCH 1 OR 2 A1C"
dbs7readdtmta1c="R7 DBS READ DATE MONTH A1C"
dbs7readdtyra1c="R7 DBS READ DATE YEAR A1C"
/*15*/
dbs7cardrda1c="R7 DBS CARD USED FOR ASSAY A1C"
dbs7directcmv="R7 DBS DIRECT CMV ANALYTE CONCENTRATION FROM DBS"
dbs7pecmv="R7 DBS PLASMA-EQUIVALENT CMV ANALYTE CONCENTRATION"
dbs7readdtmtcmv="R7 DBS READ DATE MONTH CMV"
dbs7readdtyrcmv="R7 DBS READ DATE YEAR CMV"
dbs7cardrdcmv="R7 DBS CARD USED FOR ASSAY CMV"
dbs7directhscrp="R7 DBS DIRECT HSCRP ANALYTE CONCENTRATION FROM DBS"
dbs7pehscrp ="R7 DBS PLASMA-EQUIVALENT HSCRP ANALYTE CONCENTRATION"
dbs7readdtmthscrp="R7 DBS READ DATE MONTH HSCRP"
dbs7readdtyrhscrp="R7 DBS READ DATE YEAR HSCRP"
/*25*/
dbs7cardrdhscrp="R7 DBS CARD USED FOR ASSAY HSCRP"
dbs7danyassay="R7 D DBS ANY ASSAY RESULT OBTAINED"
dbs7rnoteil6="R7 DBS RESULT NOTE IL6"
dbs7anoteil6="R7 DBS ASSAY NOTE IL6"
dbs7blankil6="R7 DBS BLANK PUNCH IL6"
dbs7mdropsil6="R7 DBS MULTIPLE DROPS IN DBS CIRCLE IL6"
dbs7smearil6="R7 DBS SMEARED DROPS IL6"
dbs7smallil6="R7 DBS SMALL SPOT, <80% IL6"
dbs7notcircil6="R7 DBS NON-CIRCULAR DBS IL6"
dbs7overlapil6="R7 DBS OVERLAPPING BLOOD SPOTS IL6"
/*35*/
dbs7contamil6="R7 DBS CONTAMINATED SAMPLE IL6"
dbs7abcoloril6="R7 DBS ABNORMAL COLOR IL6"
dbs7qualityil6="R7 DBS DOES NOT MEET QUALITY CRITERIA IL6"
dbs7outsideil6="R7 DBS DROP OUTSIDE PRINTED CIRCLE IL6"
dbs7noremil6="R7 DBS NO DBS REMAINS IL6"
dbs7rnotea1c="R7 DBS RESULT NOTE A1C"
dbs7intpeaka1c="R7 DBS INTERFERING PEAK A1C, NO RESULT"
dbs7nopeaka1c="R7 DBS NO A1C PEAK, NO RESULT"
dbs7adjusta1c='R7 DBS %HBA1C ADJUSTED DUE TO FALSE LOW LEVEL OF HBS'
dbs7badinta1c="R7 DBS BAD CHROMATOGRAM INTEGRATION >1.8MIN A1C"
/*45*/
dbs7smareaa1c="R7 DBS BAD CHROMATOGRAM AREA <1.5M A1C, NO RESULT"
dbs7aberranta1c="R7 DBS BAD CHROMAT ABERRANT A1C INTEGRATION, NO RESULT"
dbs7rampinga1c="R7 DBS RAMPING BASELINE A1C"
dbs7instrmnta1c="R7 DBS HPLC INSTRUMENT ERROR A1C, NO RESULT"
dbs7nonhgvara1c="R7 DBS NON-A HEMOGLOBIN VARIANT >60% A1C, NO RESULT"
dbs7blanka1c="R7 DBS BLANK PUNCH A1C"
dbs7mdropsa1c="R7 DBS MULTIPLE DROPS IN DBS CIRCLE A1C"
dbs7smeara1c="R7 DBS SMEARED DROPS A1C"
dbs7smalla1c="R7 DBS SMALL SPOT, <80% A1C"
dbs7notcirca1c="R7 DBS NON-CIRCULAR DBS A1C"
dbs7overlapa1c="R7 DBS OVERLAPPING BLOOD SPOTS A1C"
dbs7damagea1c="R7 DBS PHYSICAL DAMAGE TO SAMPLE A1C"
dbs7abcolora1c="R7 DBS ABNORMAL COLOR A1C"
dbs7qualitya1c="R7 DBS DOES NOT MEET QUALITY CRITERIA A1C, NO RESULT"
dbs7outsidea1c="R7 DBS DROP OUTSIDE PRINTED CIRCLE A1C"
dbs7norema1c="R7 DBS NO DBS REMAINS A1C"
/*61*/
dbs7rnotecmv="R7 DBS RESULT NOTE CMV"
dbs7anotecmv="R7 DBS ASSAY NOTE CMV"
dbs7blankcmv="R7 DBS BLANK PUNCH CMV"
dbs7mdropscmv="R7 DBS MULTIPLE DROPS IN DBS CIRCLE CMV"
dbs7smearcmv="R7 DBS SMEARED DROPS CMV"
dbs7smallcmv="R7 DBS SMALL SPOT, <80% CMV"
dbs7notcirccmv="R7 DBS NON-CIRCULAR DBS CMV"
dbs7overlapcmv="R7 DBS OVERLAPPING BLOOD SPOTS CMV"
dbs7damagecmv="R7 DBS PHYSICAL DAMAGE TO SAMPLE CMV"
dbs7abcolorcmv="R7 DBS ABNORMAL COLOR CMV"
dbs7qualitycmv="R7 DBS DOES NOT MEET QUALITY CRITERIA CMV"
dbs7outsidecmv="R7 DBS DROP OUTSIDE PRINTED CIRCLE CMV"
dbs7noremcmv="R7 DBS NO DBS REMAINS CMV"
dbs7rnotehscrp="R7 DBS RESULT NOTE HSCRP"
dbs7anotehscrp="R7 DBS ASSAY NOTE HSCRP"
/*76*/
dbs7blankhscrp="R7 DBS BLANK PUNCH HSCRP"
dbs7mdropshscrp="R7 DBS MULTIPLE DROPS IN DBS CIRCLE HSCRP"
dbs7smearhscrp="R7 DBS SMEARED DROPS HSCRP"
dbs7smallhscrp="R7 DBS SMALL SPOT, <80% HSCRP"
dbs7notcirchscrp="R7 DBS NON-CIRCULAR DBS HSCRP"
dbs7overlaphscrp="R7 DBS OVERLAPPING BLOOD SPOTS HSCRP"
dbs7damagehscrp="R7 DBS PHYSICAL DAMAGE TO SAMPLE HSCRP"
dbs7abcolorhscrp="R7 DBS ABNORMAL COLOR HSCRP"
dbs7qualityhscrp="R7 DBS DOES NOT MEET QUALITY CRITERIA HSCRP"
dbs7outsidehscrp="R7 DBS DROP OUTSIDE PRINTED CIRCLE HSCRP"
dbs7noremhscrp="R7 DBS NO DBS REMAINS HSCRP"


w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP"
w7dbsfinwgt1="R7 DBS FINAL WGT REP 1"
w7dbsfinwgt2="R7 DBS FINAL WGT REP 2"
w7dbsfinwgt3="R7 DBS FINAL WGT REP 3"
w7dbsfinwgt4="R7 DBS FINAL WGT REP 4"
w7dbsfinwgt5="R7 DBS FINAL WGT REP 5"
w7dbsfinwgt6="R7 DBS FINAL WGT REP 6"
w7dbsfinwgt7="R7 DBS FINAL WGT REP 7"
w7dbsfinwgt8="R7 DBS FINAL WGT REP 8"
w7dbsfinwgt9="R7 DBS FINAL WGT REP 9"
w7dbsfinwgt10="R7 DBS FINAL WGT REP 10"
w7dbsfinwgt11="R7 DBS FINAL WGT REP 11"
w7dbsfinwgt12="R7 DBS FINAL WGT REP 12"
w7dbsfinwgt13="R7 DBS FINAL WGT REP 13"
w7dbsfinwgt14="R7 DBS FINAL WGT REP 14"
w7dbsfinwgt15="R7 DBS FINAL WGT REP 15"
w7dbsfinwgt16="R7 DBS FINAL WGT REP 16"
w7dbsfinwgt17="R7 DBS FINAL WGT REP 17"
w7dbsfinwgt18="R7 DBS FINAL WGT REP 18"
w7dbsfinwgt19="R7 DBS FINAL WGT REP 19"
w7dbsfinwgt20="R7 DBS FINAL WGT REP 20"
w7dbsfinwgt21="R7 DBS FINAL WGT REP 21"
w7dbsfinwgt22="R7 DBS FINAL WGT REP 22"
w7dbsfinwgt23="R7 DBS FINAL WGT REP 23"
w7dbsfinwgt24="R7 DBS FINAL WGT REP 24"
w7dbsfinwgt25="R7 DBS FINAL WGT REP 25"
w7dbsfinwgt26="R7 DBS FINAL WGT REP 26"
w7dbsfinwgt27="R7 DBS FINAL WGT REP 27"
w7dbsfinwgt28="R7 DBS FINAL WGT REP 28"
w7dbsfinwgt29="R7 DBS FINAL WGT REP 29"
w7dbsfinwgt30="R7 DBS FINAL WGT REP 30"
w7dbsfinwgt31="R7 DBS FINAL WGT REP 31"
w7dbsfinwgt32="R7 DBS FINAL WGT REP 32"
w7dbsfinwgt33="R7 DBS FINAL WGT REP 33"
w7dbsfinwgt34="R7 DBS FINAL WGT REP 34"
w7dbsfinwgt35="R7 DBS FINAL WGT REP 35"
w7dbsfinwgt36="R7 DBS FINAL WGT REP 36"
w7dbsfinwgt37="R7 DBS FINAL WGT REP 37"
w7dbsfinwgt38="R7 DBS FINAL WGT REP 38"
w7dbsfinwgt39="R7 DBS FINAL WGT REP 39"
w7dbsfinwgt40="R7 DBS FINAL WGT REP 40"
w7dbsfinwgt41="R7 DBS FINAL WGT REP 41"
w7dbsfinwgt42="R7 DBS FINAL WGT REP 42"
w7dbsfinwgt43="R7 DBS FINAL WGT REP 43"
w7dbsfinwgt44="R7 DBS FINAL WGT REP 44"
w7dbsfinwgt45="R7 DBS FINAL WGT REP 45"
w7dbsfinwgt46="R7 DBS FINAL WGT REP 46"
w7dbsfinwgt47="R7 DBS FINAL WGT REP 47"
w7dbsfinwgt48="R7 DBS FINAL WGT REP 48"
w7dbsfinwgt49="R7 DBS FINAL WGT REP 49"
w7dbsfinwgt50="R7 DBS FINAL WGT REP 50"
w7dbsfinwgt51="R7 DBS FINAL WGT REP 51"
w7dbsfinwgt52="R7 DBS FINAL WGT REP 52"
w7dbsfinwgt53="R7 DBS FINAL WGT REP 53"
w7dbsfinwgt54="R7 DBS FINAL WGT REP 54"
w7dbsfinwgt55="R7 DBS FINAL WGT REP 55"
w7dbsfinwgt56="R7 DBS FINAL WGT REP 56"


;


run;

*w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP" ;

data nhats_dbs;
set nhats_round_7_dbs_file;
run;

proc freq data=nhats_dbs;
tables dbs7danyassay;
run;
*n=4648 with results obtained;



********************************************************  NHATS_Round_7_SP_Sen_Dem_Read SAS FILE *****************************************;

/* NHATS_Round_7_SP_Sen_Dem_Read.SAS */

/* Section #1 - Creating the Formats */


PROC FORMAT ;
    VALUE RFDK_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
    VALUE RFDK_F
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
          VALUE W200038W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"  ;
          VALUE SP50139S
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 WHITE/CAUCASIAN"
    2 = "2 BLACK/AFRICAN AMERICAN"
    3 = "3 AMERICAN INDIAN"
    4 = "4 ALASKA NATIVE"
    5 = "5 ASIAN"
    6 = "6 NATIVE HAWAIIAN"
    7 = "7 PACIFIC ISLANDER"
    8 = "8 OTHER (SPECIFY)"  ;
           Value dcontnew
         1 = "1 Continuing sample from R1"
         2 = "2 New sample in R5"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';
run;
/* Section #2 - Input statement with variable name and location on the .txt file
                Reminder - change [PATH] to reflect your file locations       */
Data SP_SENS;
INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\SP\NHATS_Round_7_SP_Sen_Dem_File.txt"
LRECL=58 ;
INPUT   @1 spid 8.
@9 r5dbirthmth 2.
@11 r5dbirthyr 4.
@15 r7dintvwrage 3.
@18 pd7mthdied 2.
@20 pd7yrdied 4.
@24 r7ddeathage 3.
@27 hc7cancerty2 2.
@29 hc7cancerty3 2.
@31 hc7cancerty4 2.
@33 hc7cancerty5 2.
@35 hc7cancerty6 2.
@37 hc7cancerty7 2.
@39 hc7cancerty8 2.
@41 hh7mthendmar 2.
@43 hh7modob 2.
@45 hh7dmodoball 2.
@47 hh7yrdob 4.
@51 hh7dyrdoball 4.
@55 hh7spageall 4.;


/* Section #3 - format assignment statement   */
        format  r5dbirthyr r7dintvwrage pd7yrdied r7ddeathage hh7yrdob hh7dyrdoball  hh7spageall  RFDK_F.
                        hc7cancerty2 hc7cancerty3 hc7cancerty4 hc7cancerty5 hc7cancerty6 hc7cancerty7 hc7cancerty8 RFDK_YN.
                        r5dbirthmth pd7mthdied hh7mthendmar hh7modob hh7dmodoball W200038W.;

/* Section #4 - Label assignment statement   */
label spid="NHATS SAMPLED PERSON ID"
r5dbirthmth="R5 D BIRTH MONTH OF SP"
r5dbirthyr="R5 D BIRTH YEAR OF SP"
r7dintvwrage="R7 D AGE OF SP AT INTERVIEW"
pd7mthdied="R7 PD2A MONTH DIED"
pd7yrdied="R7 PD2B YEAR DIED"
r7ddeathage="R7 D AGE OF SP AT DEATH"
hc7cancerty2="R7 HC3 SP HAD BREAST CANCER"
hc7cancerty3="R7 HC3 SP HAD PROSTATE CANCER"
hc7cancerty4="R7 HC3 SP HAD BLADDER CANCER"
hc7cancerty5="R7 HC3 SP HAD CRV OVRN UTRN CNCR "
hc7cancerty6="R7 HC3 SP HAD COLON CANCER"
hc7cancerty7="R7 HC3 SP HAD KIDNEY CANCER"
hc7cancerty8="R7 HC3 SP HAD OTHER CANCER"
hh7mthendmar="R7 HH2A MTH MARR END OR SPS PASS"
hh7modob="R7 HH6A NEW R7 SPOU PART MO DOB"
hh7dmodoball="R7 D MONTH DOB OF SPOU PAR UPDATE AND NEW"
hh7yrdob="R7 HH6C NEW R7 SPOU PART YR DOB"
hh7dyrdoball="R7 D YEAR DOB OF SPOU PAR UPDATE AND NEW"
hh7spageall="R7 SPOU PAR AGE UPDATE AND NEW";

run;


data nhats_dem;
set sp_sens;
run;





********************************* NSOC_R7_Crss_SP_Tracker_Read SAS FILE **********************************************************;

PROC FORMAT;

 VALUE RFDK_F
     -2 = '-2 Helped last month, SP alive'
     -3 = '-3 Helped last month of life, SP deceased'
     -4 = '-4 Did not help last month or in last month of life'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
 ;

VALUE W000057W
    1 = '1 SP interview at 2017 NHATS & alive at NSOC'
    2 = '2 SP 2016 LML'
    3 = '3 SP 2017 LML'
    4 = '4 SP interview at 2017 & deceased at NSOC'
    5 = '5 SP interview at 2017 & more than 1 caregiver & at least 1 caregiver reports SP deceased at NSOC'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
;


 VALUE W000058W
         1 = '1 SP has eligible caregiver'
         -7 = '-7 RF'
         -8 = '-8 DK'
         -1 = '-1 Inapplicable'
         -9 = '-9 Missing'
 ;
 VALUE W000064W
 1 = '1 SP eligible for cross-sectional NSOC'
 -1 = '-1 Ineligible'
;
    run;

Data NSOC_R7_Crss_SP_Tracker_File;

INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS_sensitive\Cross-sectional\NSOC_R7_Crss_SP_Tracker_File.txt"

LRECL=19 ;
INPUT
@1 spid 8.
@9 fl7dnsoc 2.
@11 fl7dnsoccnt 2.
@13 fl7dcgcontactinfo 2.
@15 fl7dnsoccomp 2.
@17 fl7dtrackspstat 2.
;


    Label
spid       = "NHATS SAMPLED PERSON ID"
fl7dnsoc   = "R7 F CC SP IS ELIGIBLE FOR NSOC"
fl7dnsoccnt= "R7 F CC CNT HLPRS ELG FOR NSOC"
fl7dcgcontactinfo='R7 F CC HLPRS SP GAVE CONTACT INFO'
fl7dnsoccomp= "R7 D CC CNT HLPRS WITH NSOC COMP"
fl7dtrackspstat="R7 F D SP VITAL STATUS AT INTERVIEW"
;

format
spid 8.
fl7dnsoccnt fl7dnsoccomp fl7dcgcontactinfo RFDK_F.
fl7dtrackspstat W000057W.
fl7dnsoc W000064W.
;
run;

data nhats_tracker;
set NSOC_R7_Crss_SP_Tracker_File;
run;

proc freq data=nhats_tracker;
tables fl7dnsoc fl7dnsoccnt fl7dcgcontactinfo fl7dnsoccomp fl7dtrackspstat;
run;


*********************************************** NHATS_Round_7_SP_edited SAS FILE *******************************************;

/* NHATS_Round_7_SP_Read.SAS - General File */

/* Section #1 - Creating the Formats */


PROC FORMAT ;


    VALUE release
           -1 = '-1 Inapplicable'
        1 = '1 Main Sample'
        2 = '2 Reserve Sample'
        9 = '9 New Release Sample';

    VALUE STAT_DTa
          4 = " 4 April"
          5 = " 5 May"
          6 = " 6 June"
          7 = " 7 July"
          8 = " 8 August"
          9 = " 9 September"
         10 = "10 October"
         11 = "11 November"
         99 = "99 Prior to start of field work"
         -1 = '-1 Inapplicable';

    VALUE $DISP
          '10' = "10 Not Available "
          '11' = "11 Ready"
          '12' = "12 Started "
          '20' = "20 Final "
          '24' = "24 Not Required "
          '60' = "60 Complete "
          '61' = "61 Complete, NH facility"
          '62' = "62 Complete SP Deceased, Proxy Intv"
          '63' = "63 Complete SP, FQ not complete"
          '64' = "64 Complete FQ, SP not complete"
          '75' = "75 Physically/mentally unable to participate, no proxy"
          '76' = "76 Too ill to participate, no proxy"
          '77' = "77 Refusal, SP"
          '78' = "78 Language barrier"
          '79' = "79 Unable to locate"
          '80' = "80 Unavailable during field period"
          '82' = "82 Outside of PSU"
          '83' = "83 Ineligible"
          '85' = "85 Refusal, facility"
          '86' = "86 Deceased"
          '87' = "87 Refusal, proxy"
          '88' = "88 Work stopped"    ;

VALUE DISP_a
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required"
          60 = "60 Complete"
          61 = "61 Complete, NH facility"
          62 = "62 Complete SP Deceased, Proxy Intv"
          63 = "63 Complete SP, FQ not complete"
          64 = "64 Complete FQ, SP not complete "
          75 = "75 Physically/mentally unable to participate, no proxy"
          76 = "76 Too ill to participate, no proxy"
          77 = "77 Refusal, SP"
          78 = "78 Language barrier"
          79 = "79 Unable to locate"
          80 = "80 Unavailable during field period"
          82 = "82 Outside of PSU"
          83 = "83 Ineligible"
          85 = "85 Refusal, facility"
          86 = "86 Deceased"
          87 = "87 Refusal, proxy"
          88 = "88 Work stopped"    ;

    VALUE DISP_
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required";
    VALUE DISP_F
     -1 = '-1 Inapplicable'
          10 = "10 Not Available"
          11 = "11 Ready"
          12 = "12 Started"
          20 = "20 Final"
          24 = "24 Not Required"
          60 = "60 Complete"
          61 = "61 Complete, NH facility"
          62 = "62 Complete SP Deceased, Proxy Intv"
          63 = "63 Complete SP, FQ not complete"
          64 = "64 Complete FQ, SP not complete "
          75 = "75 Physically/mentally unable to participate, no proxy"
          76 = "76 Too ill to participate, no proxy"
          77 = "77 Refusal, SP"
          78 = "78 Language barrier"
          79 = "79 Unable to locate"
          80 = "80 Unavailable during field period"
                  81 = "81 Final deceased, new sample only"
          82 = "82 Outside of PSU"
          83 = "83 Ineligible"
          85 = "85 Refusal, facility"
          86 = "86 Deceased"
          87 = "87 Refusal, proxy"
          88 = "88 Work stopped"
          89 = "89 Final, Other Specify";

    VALUE RFDK
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE $RFDK_F
    '-7' = '-7 RF'
    '-8' = '-8 DK'
    '-1' = '-1 Inapplicable'
    '-9' = '-9 Missing';

    VALUE RFDK_F
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE RFDK_B
    -1 = '-1 Inapplicable'
    1 = '1 Yes-Breakoff';

VALUE $RFDK_C
    '-1' = '-1 Inapplicable'
    'CL' ='CL - Closing'
    'EW' ='EW - Economic Well-Being'
    'FQ' ='FQ - Facility Questionnaire'
    'HL' ='HL - Helper'
    'HW' ='HW - Height and Weight'
    'IP' ='IP - Insurance Plans'
    'LF' ='LF - Labor Force'
    'PA' ='PA - Participation'
    'PE' ='PE - Performance'
    'WB' ='WB - Well-being' ;

VALUE $RFDK_2C
    '-1' = '-1 Inapplicable'
    '-7' = '-7 RF'
    '-8' = '-8 DK'
    '-9' = '-9 Missing';

    VALUE RFDK_Y
     1 = ' 1 Yes'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE RFDK_I
     0 = ' 0 No'
     1 = ' 1 Yes'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE RFDK_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE DSTRP_G
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
    1 =  '1 X condition and word color condition accuracy below threshold (less than .42)'
    2 =  '2 word condition only below threshold (less than .42)'
    3 =  '3 X condition and word color condition meet criteria for accuracy'
    4 =  '4 fewer than 50% of X and word color condition trials answered'
    999 = '999 X condition only below threshold (less than .42)';

    VALUE DSTRP_R
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -999 = '-999 Inapplicable'
    other = 'Values ranging between -.353 and 1.115';

    VALUE DSTRP_M
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -999 = '-999 Inapplicable'
    other = 'Values ranging between -544.732 and 924.863';

VALUE FQ_4F
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
          1='1 YES'
          2='2 NO';

  VALUE CHILDDEC
    1 =  '1 CHILD DECEASED'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE W200001W
    12 = "12 STARTED"
    20 = "20 COMPLETE"
    21 = "21 INELIGIBLE - NOT 65+"   ;

  VALUE W200008x
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 UNDER 20"
    2 = "2 20-24"
    3 = "3 25-29"
    4 = "4 30-34"
    5 = "5 35-39"
    6 = "6 40-44"
    7 = "7 45-49"
    8 = "8 50-54"
    9 = "9 55-59"
    10 = "10 60-64"
    11 = "11 65-69"
    12 = "12 70-74"
    13 = "13 75-79"
    14 = "14 80-84"
    15 = "15 85-89"
    16 = "16 90 +";

  VALUE W200009W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SAMPLE PERSON"
    2 = "2 SPOUSE/ PARTNER"
    3 = "3 DAUGHTER"
    4 = "4 SON"
    5 = "5 DAUGHTER-IN-LAW"
    6 = "6 SON-IN-LAW"
    7 = "7 STEPDAUGHTER"
    8 = "8 STEPSON"
    9 = "9 SISTER"
    10 = "10 BROTHER"
    11 = "11 SISTER-IN-LAW"
    12 = "12 BROTHER-IN-LAW"
    13 = "13 MOTHER"
    14 = "14 STEPMOTHER"
    15 = "15 MOTHER-IN-LAW"
    16 = "16 FATHER"
    17 = "17 STEPFATHER"
    18 = "18 FATHER-IN-LAW"
    19 = "19 GRANDDAUGHTER"
    20 = "20 GRANDSON"
    21 = "21 NIECE"
    22 = "22 NEPHEW"
    23 = "23 AUNT"
    24 = "24 UNCLE"
    25 = "25 COUSIN"
    26 = "26 STEPDAUGHTER'S SON/ DAUGHTER"
    27 = "27 STEPSON'S SON/ DAUGHTER"
    28 = "28 DAUGHTER-IN-LAW'S SON/ DAUGHTER"
    29 = "29 SON-IN-LAW'S SON/ DAUGHTER"
    30 = "30 BOARDER/RENTER"
    31 = "31 PAID AIDE/ HOUSEKEEPER/ EMPLOYEE"
    32 = "32 ROOMMATE"
    33 = "33 EX-WIFE/ EX-HUSBAND"
    34 = "34 BOYFRIEND/ GIRLFRIEND"
    35 = "35 NEIGHBOR"
    36 = "36 FRIEND"
    37 = "37 SOMEONE/SERVICE AT THE PLACE SP LIVES/LIVED"
    38 = "38 CO-WORKER"
    39 = "39 MINISTER, PRIEST, OR OTHER CLERGY"
    40 = "40 PSYCHIATRIST, PSYCHOLOGIST, COUNSELOR, OR THERAPIST"
    41 = "41 DECEASED SPOUSE/PARTNER"
    91 = "91 OTHER RELATIVE"
    92 = "92 OTHER NONRELATIVE"   ;

   VALUE W200002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MALE"
    2 = "2 FEMALE";

   VALUE W200005W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NO SCHOOLING COMPLETED"
    2 = "2 1ST-8TH GRADE"
    3 = "3 9TH-12TH GRADE (NO DIPLOMA)"
    4 = "4 HIGH SCHOOL GRADUATE (HIGH SCHOOL DIPLOMA OR EQUIVALENT)"
    5 = "5 VOCATIONAL, TECHNICAL, BUSINESS, OR TRADE SCHOOL CERTIFICATE OR DIPLOMA (BEYOND HIGH SCHOOL LEVEL)"
    6 = "6 SOME COLLEGE BUT NO DEGREE"
    7 = "7 ASSOCIATE'S DEGREE"
    8 = "8 BACHELOR'S DEGREE"
    9 = "9 MASTER'S, PROFESSIONAL, OR DOCTORAL DEGREE"  ;

  VALUE W200010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MARRIED"
    2 = "2 LIVING WITH A PARTNER"
    3 = "3 SEPARATED"
    4 = "4 DIVORCED"
    5 = "5 WIDOWED"
    6 = "6 NEVER MARRIED";

  VALUE W200011W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 PREVIOUSLY REPORTED"  ;
VALUE W200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 REGULAR"
    2 = "2 VARIED"  ;

   VALUE W200013W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP AND/OR FAMILY"
    2 = "2 GOVERNMENT PROGRAM"
    3 = "3 INSURANCE"
    91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200015W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1='1 HOURLY'
    2='2 WEEKLY'
    3='3 MONTHLY'
    4='4 DID NOT PAY IN LAST MONTH'
        91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MEDICAID"
    2 = "2 MEDICARE"
    3 = "3 STATE PROGRAM"
    91 = "91 OTHER (SPECIFY)"   ;

  VALUE W200018W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE-STANDING (DETACHED) SINGLE HOUSE"
    2 = "2 SINGLE HOUSE BUT ATTACHED TO OTHERS (ROW HOUSE, TOWNHOUSE, DUPLEX, TRIPLEX, OR TRIPLE DECKER)"
    3 = "3 MOBILE HOME OR TRAILER"
    4 = "4 MULTI-UNIT (2+) BUILDING"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200020W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOME"
    2 = "2 MULTI-UNIT"
    3 = "3 OTHER"  ;

  VALUE W200021W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 BUILDING HAS ONE FLOOR"
    2 = "2 BUILDING HAS MULTIPLE FLOORS"   ;

  VALUE W200022W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOME"
    2 = "2 APARTMENT"
    3 = "3 ROOM"
    4 = "4 UNIT"
    5 = "5 SUITE"
    6 = "6 SOMETHING ELSE (SPECIFY)"  ;

  VALUE W200030W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SAMPLE PERSON (SP)"
    2 = "2 PROXY"  ;

  VALUE W200032W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOSPITAL"
    2 = "2 NURSING HOME/REHAB CENTER"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200035W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SELF"
    2 = "2 SPOUSE/ PARTNER"
    3 = "3 DAUGHTER"
    4 = "4 SON"
    5 = "5 DAUGHTER-IN-LAW"
    6 = "6 SON-IN-LAW"
    7 = "7 STEPDAUGHTER"
    8 = "8 STEPSON"
    9 = "9 SISTER"
    10 = "10 BROTHER"
    11 = "11 SISTER-IN-LAW"
    12 = "12 BROTHER-IN-LAW"
    13 = "13 MOTHER"
    14 = "14 STEPMOTHER"
    15 = "15 MOTHER-IN-LAW"
    16 = "16 FATHER"
    17 = "17 STEPFATHER"
    18 = "18 FATHER-IN-LAW"
    19 = "19 GRANDDAUGHTER"
    20 = "20 GRANDSON"
    21 = "21 NIECE"
    22 = "22 NEPHEW"
    23 = "23 AUNT"
    24 = "24 UNCLE"
    25 = "25 COUSIN"
    26 = "26 STEPDAUGHTER'S SON/ DAUGHTER"
    27 = "27 STEPSON'S SON/ DAUGHTER"
    28 = "28 DAUGHTER-IN-LAW'S SON/ DAUGHTER"
    29 = "29 SON-IN-LAW'S SON/ DAUGHTER"
    30 = "30 BOARDER/RENTER"
    31 = "31 PAID AIDE/ HOUSEKEEPER/ EMPLOYEE"
    32 = "32 ROOMMATE"
    33 = "33 EX-WIFE/ EX-HUSBAND"
    34 = "34 BOYFRIEND/ GIRLFRIEND"
    35 = "35 NEIGHBOR"
    36 = "36 FRIEND"
    37 = "37 SOMEONE/SERVICE FROM THE PLACE SP LIVES/DIED"
    38 = "38 CO-WORKER"
    39 = "39 MINISTER, PRIEST, OR OTHER CLERGY"
    40 = "40 PSYCHIATRIST, PSYCHOLOGIST, COUNSELOR, OR THERAPIST"
    91 = "91 OTHER RELATIVE"
    92 = "92 OTHER NONRELATIVE"  ;

  VALUE W200036W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY FAMILIAR"
    2 = "2 SOMEWHAT FAMILIAR"
    3 = "3 A LITTLE FAMILIAR"
    4 = "4 NOT AT ALL FAMILIAR"  ;

  VALUE W200037W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, SAME ADDRESS"
    2 = "2 NO, DIFFERENT ADDRESS"
    3 = "3 YES, SAME ADDRESS WITH MINOR CORRECTIONS"  ;

  VALUE W200038W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"  ;

  VALUE W200039W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 2011"
    2 = "2 2012"
    3 = "3 YEAR2013"
    4 = "4 YEAR2014"
    5 = "5 YEAR2015"
    6 = "6 YEAR2016"
    7 = "7 YEAR2017"
    8 = "8 YEAR2018"
    9 = "9 YEAR2019"
    10 = "10 YEAR2020"  ;

  VALUE W200040W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 2011"
    2 = "2 2012"  ;

  VALUE W200041W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AT SPS OR SOMEONE ELSES HOME"
    2 = "2 IN A HOSPITAL"
    3 = "3 IN A NURSING HOME"
    4 = "4 IN A HOSPICE RESIDENCE"
    5 = "5 IN TRANSIT (AMBULANCE TO HOSPITAL)"
    91 = "91 SOMEWHERE ELSE (SPECIFY)";

  VALUE W200042W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP'S HOME"
    2 = "2 SOMEONE ELSE'S HOME"  ;

  VALUE W200043W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INTENSIVE CARE UNIT"
    2 = "2 PALLIATIVE CARE UNIT"
    3 = "3 INPATIENT HOSPICE UNIT"
    4 = "4 EMERGENCY ROOM"
    5 = "5 ANOTHER KIND OF UNIT"  ;

  VALUE W200044W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HOSPICE AT A HOSPITAL"
    2 = "2 HOSPICE AT A NURSING HOME"
    3 = "3 RESIDENTIAL HOSPICE"
    4 = "4 OTHER HOSPICE"  ;

  VALUE W200045W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 DAYS"
    2 = "2 WEEKS"
    3 = "3 MONTHS"
    4 = "4 YEARS"  ;

  VALUE W200046W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AT SP'S HOME"
    2 = "2 IN A HOSPITAL"
    3 = "3 IN A NURSING HOME"
    4 = "4 IN A HOSPICE RESIDENCE"
    91 = "91 SOMEWHERE ELSE (SPECIFY)"  ;

  VALUE W200047W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY"
    2 = "2 MOST DAYS"
    3 = "3 SOME DAYS"
    4 = "4 RARELY"
    5 = "5 NOT AT ALL"  ;

  VALUE W200048W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN WAS NEEDED"
    2 = "2 MORE THAN WAS NEEDED"
    3 = "3 ABOUT RIGHT AMOUNT"  ;

  VALUE W200049W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"  ;

  VALUE W200050W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALWAYS"
    2 = "2 USUALLY"
    3 = "3 SOMETIMES"
    4 = "4 NEVER"
    5 = "5 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"  ;

  VALUE W200051W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EXCELLENT"
    2 = "2 VERY GOOD"
    3 = "3 GOOD"
    4 = "4 FAIR"
    5 = "5 POOR"  ;

  VALUE W200052W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NOT AT ALL"
    2 = "2 SEVERAL DAYS"
    3 = "3 MORE THAN HALF THE DAYS"
    4 = "4 NEARLY EVERY DAY"  ;

  VALUE W200053W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY NIGHT (7 NIGHTS A WEEK)"
    2 = "2 MOST NIGHTS (5-6 NIGHTS A WEEK)"
    3 = "3 SOME NIGHTS (2-4 NIGHTS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200054W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY NIGHT (7 NIGHTS A WEEK)"
    2 = "2 MOST NIGHTS (5-6 NIGHTS A WEEK)"
    3 = "3 SOME NIGHTS (2-4 NIGHTS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"
    7 = "7 DON'T WAKE UP/NOT A PROBLEM"  ;

  VALUE W200055W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PRIVATE RESIDENCE"
    2 = "2 A GROUP HOME, BOARD AND CARE, OR SUPERVISED HOUSING"
    3 = "3 ASSISTED LIVING FACILITY OR CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    4 = "4 RELIGIOUS GROUP QUARTERS"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200056W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 PLACE DOES NOT HAVE A NAME"  ;

  VALUE W200057W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 APARTMENT"
    2 = "2 ROOM"
    3 = "3 UNIT"
    4 = "4 SUITE"
    91 = "91 SOMETHING ELSE (SPECIFY)"  ;

  VALUE W200058W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO, DIFFERENT PERSON"
    3 = "3 NO, NAME MISSPELLED"  ;

   VALUE W200060W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PRIVATE RESIDENCE"
    2 = "2 A GROUP HOME, BOARD AND CARE, OR SUPERVISED HOUSING"
    3 = "3 ASSISTED LIVING FACILITY OR CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    5 = "5 NURSING HOME"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200061W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SEPARATION OR DIVORCE"
    2 = "2 DECEASED"
    3 = "3 MOVED ELSEWHERE"
    5 = "5 LAST INTERVIEW INFORMATION INCORRECT"
    8 = "8 OTHER REASON"   ;

  VALUE W200067W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 COMMON OR SHARED ENTRANCE"
    2 = "2 ENTRANCE DIRECTLY INTO HOME"  ;

  VALUE W200068W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1"
    2 = "2"
    3 = "3"
    4 = "4+"  ;

  VALUE W200069W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALL ITEMS HERE"
    2 = "2 ADDED ONE OR MORE ITEMS"  ;

  VALUE W200070W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $500"
    2 = "2 LESS THAN $500"
    3 = "3 JUST ABOUT $500"  ;

  VALUE W200071W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $1,000"
    2 = "2 LESS THAN $1,000"
    3 = "3 JUST ABOUT $1,000"  ;

  VALUE W200072W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE THAN $100"
    2 = "2 LESS THAN $100"
    3 = "3 JUST ABOUT $100"  ;

  VALUE W200073W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 YES, DOESNT KNOW HOW TO USE A COMPUTER"  ;

  VALUE W200074W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST DAYS"
    2 = "2 SOME DAYS"
    3 = "3 RARELY"  ;

  VALUE W200076W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 DEAF"  ;

  VALUE W200077W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 BLIND"  ;

  VALUE W200078W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY (7 DAYS A WEEK)"
    2 = "2 MOST DAYS (5-6 DAYS A WEEK)"
    3 = "3 SOME DAYS (2-4 DAYS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200080W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, A CHANGE"
    2 = "2 NO, NO CHANGE"
    3 = "3 DEMENTIA/ALZHEIMER'S REPORTED BY PROXY"  ;

  VALUE W200081W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP HAS DEMENTIA/ALZHEIMER'S/ NOT ABLE"
    2 = "2 SP IS UNABLE TO SPEAK"
    3 = "3 SP IS UNABLE TO HEAR"
    4 = "4 SP REFUSED"
    5 = "5 PROXY REFUSED"
    6 = "6 SP NOT PRESENT"
    7 = "7 SP TOO ILL"
    8 = "8 SP LANGUAGE BARRIER"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE W200082W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MUCH BETTER"
    2 = "2 BETTER"
    3 = "3 SAME"
    4 = "4 WORSE"
    5 = "5 MUCH WORSE"  ;

  VALUE W200083W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO/DON'T KNOW"  ;

  VALUE W200084W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 CONTINUE WITH ACTIVITY"
    2 = "2 SP REFUSES ACTIVITY"  ;

  VALUE W200085W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "Word[1]"
    2 = "Word[2]"
    3 = "Word[3]"
    4 = "Word[4]"
    5 = "Word[5]"
    6 = "Word[6]"
    7 = "Word[7]"
    8 = "Word[8]"
    9 = "Word[9]"
    10 = "Word[10]"
    91 = "91 NO WORDS REMEMBERED"
    92 = "92 REFUSED"  ;

  VALUE W200086W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 DIFFICULTY HEARING ANY OF THE WORDS"
    2 = "2 INTERRUPTION OCCURRED WHILE LIST WAS BEING READ"
    91 = "91 OTHER PROBLEM (SPECIFY)"
    92 = "92 NO PROBLEMS OCCURRED"
    97 = "97 SP REFUSED WORD RECALL TASK"  ;

  VALUE W200087W
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP ATTEMPTED CLOCK DRAWING"
    2 = "2 SP DID NOT ATTEMPT CLOCK DRAWING"
    97 = "3 SP REFUSED CLOCK DRAWING"  ;

  VALUE W200089W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY DAY (7 DAYS A WEEK)"
    2 = "2 MOST DAYS (5-6 DAYS A WEEK)"
    3 = "3 SOME DAYS (2-4 DAYS A WEEK)"
    4 = "4 RARELY (ONCE A WEEK OR LESS)"
    5 = "5 NEVER"  ;

  VALUE W200090W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY TIME"
    2 = "2 MOST TIMES"
    3 = "3 SOMETIMES"
    4 = "4 RARELY"
    5 = "5 NEVER"  ;

  VALUE W200092W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST TIMES"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"  ;

  VALUE W200093W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NONE"
    2 = "2 A LITTLE"
    3 = "3 SOME"
    4 = "4 A LOT"  ;

  VALUE W200094W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE OFTEN"
    2 = "2 LESS OFTEN"
    3 = "3 ABOUT THE SAME"  ;

  VALUE W200095W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"  ;

  VALUE W200096W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"  ;

  VALUE W200097W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO / NO LONGER DRIVE"  ;

  VALUE W200098W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 NO, NO RAIN OR BAD WEATHER"  ;

  VALUE W200099W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ALWAYS DID IT BY SELF"
    2 = "2 ALWAYS DID IT TOGETHER WITH SOMEONE ELSE"
    3 = "3 SOMEONE ELSE ALWAYS DID IT"
    4 = "4 IT VARIED (MORE THAN ONE WAY)"
    5 = "5 NOT DONE IN LAST MONTH"  ;

  VALUE W200102W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MORE OFTEN"
    2 = "2 LESS OFTEN"
    3 = "3 SAME"  ;

  VALUE W200106W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    7 = "7 ALWAYS FED THROUGH IV OR TUBE"  ;

  VALUE W200107W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY TIME"
    2 = "2 MOST TIMES"
    3 = "3 SOMETIMES"
    4 = "4 RARELY"  ;

  VALUE W200109W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SHOWERING"
    2 = "2 TAKING BATHS"
    3 = "3 WASHING UP SOME OTHER WAY"  ;


  VALUE W200114W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY IMPORTANT"
    2 = "2 SOMEWHAT IMPORTANT"
    3 = "3 NOT SO IMPORTANT"  ;

  VALUE W200115W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    95 = "95 NO ACTIVITY LISTED"  ;

  VALUE W200116W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LEFT"
    2 = "2 RIGHT"
    3 = "3 BOTH"  ;

  VALUE W200117W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LEFT SIDE"
    2 = "2 RIGHT SIDE"
    3 = "3 BOTH SIDES"  ;

  VALUE W200118W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ONE SIDE"
    2 = "2 BOTH SIDES"  ;

  VALUE W200119W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 RECEIVE ALL TREATMENTS"
    2 = "2 STOP/REJECT ALL TREATMENTS"  ;

  VALUE W200120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LIVING IN THEIR OWN HOME WITH HELP FROM FRIENDS AND FAMILY"
    2 = "2 LIVING IN THEIR OWN HOME WITH HELP FROM SOMEONE PAID TO COME IN"
    3 = "3 LIVING WITH AN ADULT CHILD"
    4 = "4 LIVING IN AN ASSISTED LIVING FACILITY OR CONTINUING CARE RESIDENCE"
    5 = "5 LIVING IN A NURSING HOME"  ;

  VALUE W200121W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 DOESNT HAVE ANY MONEY TO PAY A CAREGIVER"
    4 = "4 WOULD NOT USE A PAID CAREGIVER"  ;

  VALUE W200122W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MAKE DECISIONS WITHOUT MUCH ADVICE FROM THEM"
    2 = "2 GET THEIR ADVICE AND THEN MAKE DECISIONS"
    3 = "3 MAKE DECISIONS TOGETHER"
    4 = "4 LEAVE DECISIONS UP TO THEM"  ;

  VALUE W200123W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 HANDLE MOSTLY BY SELF"
    2 = "2 HANDLE TOGETHER WITH FAMILY OR CLOSE FRIENDS"
    3 = "3 FAMILY OR CLOSE FRIENDS MOSTLY HANDLE THESE THINGS"
    4 = "4 IT VARIES"  ;

  VALUE W200124W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NEVER"
    2 = "2 RARELY"
    3 = "3 SOMETIMES"
    4 = "4 OFTEN"  ;

  VALUE W200126W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AGREE A LOT"
    2 = "2 AGREE A LITTLE"
    3 = "3 DO NOT AGREE"  ;

  VALUE W200127W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 AGREE A LOT"
    2 = "2 AGREE A LITTLE"
    3 = "3 AGREE NOT AT ALL"  ;

  VALUE W200129W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $1,000,"
    2 = "2 $1,000 to less than $2,000,"
    3 = "3 $2,000 to less than $3,000,"
    4 = "4 $3,000 to less than $5,000, or"
    5 = "5 $5,000 or more?"  ;

  VALUE W200131W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 RETIRED/DON'T WORK ANYMORE"  ;

  VALUE W200132W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EVERY WEEK"
    2 = "2 EVERY TWO WEEKS"
    3 = "3 TWO TIMES A MONTH"
    4 = "4 ONCE A MONTH"
    5 = "5 DAILY"
    91 = "91 OTHER SCHEDULE (SPECIFY)"  ;

  VALUE W200133W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OWN"
    2 = "2 RENT"
    3 = "3 SOME OTHER ARRANGEMENT"  ;

  VALUE W200134W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PAID OFF"
    2 = "2 STILL MAKE PAYMENTS"
    3 = "3 REVERSE MORTGAGE"  ;

  VALUE W200135W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $250,"
    2 = "2 $250-$499,"
    3 = "3 $500-$999, or"
    4 = "4 $1,000 or more?"  ;
  VALUE W500135W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $250"
    2 = "2 $250 to less than $500"
    3 = "3 $500 to less than $1,000"
    4 = "4 $1,000 to less than $3,000"
        5 = "5 $3,000 to less than $5,000"
        6 = "6 $5,000 or more?"  ;
  VALUE W200136W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 5 YEARS"
    2 = "2 10 YEARS"
    3 = "3 LONGER THAN 10 YEARS"  ;

  VALUE W200137W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $50,000,"
    2 = "2 between $50,000 and $100,000, or"
    3 = "3 over $100,000?"  ;

  VALUE W200138W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $50,000,"
    2 = "2 $50,000-$74,999,"
    3 = "3 $75,000-$99,999,"
    4 = "4 $100,000-$199,999,"
    5 = "5 $200,000-$299,999,"
    6 = "6 $300,000-$499,999,"
    7 = "7 $500,000-$749,999, or"
    8 = "8 $750,000 or more?"  ;

  VALUE W200139W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 PAY OFF BALANCE"
    2 = "2 PAY MINIMUM"
    3 = "3 PAY MORE THAN MINIMUM, BUT NOT ENTIRE BALANCE"
    4 = "4 DON'T HAVE ANY CREDIT CARDS"  ;

  VALUE W200140W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $1,000,"
    2 = "2 $1,000 - $1,999,"
    3 = "3 $2,000 - $3,999,"
    4 = "4 $4,000 - $5,999,"
    5 = "5 $6,000 - $9,999,"
    6 = "6 $10,000 - $19,999, or"
    7 = "7 $20,000 or more?"  ;

  VALUE W200141W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MOST"
    2 = "2 SOME"
    3 = "3 A LITTLE"  ;

  VALUE W200142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 less than $500,"
    2 = "2 $500 - $999,"
    3 = "3 $1,000 - $1,999,"
    4 = "4 $2,000 - $3,999,"
    5 = "5 $4,000 - $5,999,"
    6 = "6 $6,000 - $9,999,"
    7 = "7 $10,000 - $19,999, or"
    8 = "8 $20,000 or more?"  ;

  VALUE W200146W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 NEARLY EVERY DAY"
    2 = "2 MORE THAN HALF THE DAYS"
    3 = "3 SEVERAL DAYS (LESS THAN HALF)"
    4 = "4 A FEW DAYS"  ;

  VALUE W200147W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INCLUDED"
    2 = "2 EXTRA CHARGE"  ;

  VALUE W200148W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"  ;

VALUE F200006W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE STANDING NURSING HOME"
    2 = "2 FREE STANDING ASSISTED LIVING FACILITY"
    3 = "3 NURSING HOME AND ASSISTED LIVING FACILITY"
    4 = "4 CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
    5 = "5 ADULT FAMILY CARE HOME"
    6 = "6 GROUP HOME"
    7 = "7 BOARD AND CARE HOME"
    8 = "8 RETIREMENT COMMUNITY OR SENIOR HOUSING (NOT CCRC)"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE F200007W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"  ;

  VALUE F200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 INDEPENDENT LIVING"
    2 = "2 ASSISTED LIVING"
    3 = "3 SPECIAL CARE, MEMORY CARE, OR ALZHEIMER'S UNIT"
    4 = "4 NURSING HOME"
    91 = "91 OTHER (SPECIFY)"  ;

  VALUE F200009W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ASSISTED LIVING"
    2 = "2 NURSING HOME"  ;

  VALUE F200011W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES, SERVICE PROVIDED AS PART OF PACKAGE"
    2 = "2 YES, SERVICE PROVIDED AT AN EXTRA CHARGE"
    3 = "3 NO, SERVICE NOT PROVIDED"  ;

  VALUE F200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SP/FAMILY"
    2 = "2 SOCIAL SECURITY/SSI"
    3 = "3 MEDICAID"
    4 = "4 MEDICARE"
    5 = "5 OTHER SOURCE"  ;

  VALUE I200002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"  ;

  VALUE I200003W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 English"
    2 = "2 Spanish"
    3 = "3 Other (specify)"  ;

  VALUE I200005W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Friendly and interested"
    2 = "2 Cooperative but not particularly interested"
    3 = "3 Impatient and restless"
    4 = "4 Hostile"  ;

  VALUE I200006W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Good"
    2 = "2 Fair"
    3 = "3 Poor"  ;

  VALUE I200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 All of the time"
    2 = "2 Most of the time"
    3 = "3 Some of the time"
    4 = "4 Only for the cognition and/or performance parts"
    5 = "5 None of the time"  ;

   VALUE I200010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Interview was conducted by telephone"  ;

  VALUE I200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Not Administered"  ;

  VALUE I200013W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"  ;

  VALUE I200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    3 = "3 Entire interview conducted by telephone"  ;

  VALUE I200017W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Not at all cluttered"
    2 = "2 Somewhat cluttered"
    3 = "3 Very cluttered"
    4 = "4 Could not see other rooms"  ;

  VALUE I200018W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 None"
    2 = "2 A little"
    3 = "3 Some"
    4 = "4 A lot"
    5 = "5 Could not observe"  ;

  VALUE I200019W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No"
    7 = "7 Could not observe"  ;


/* DERIVED VARIABLE FORMATS */
  VALUE LVGARRG
    1 = '1 Alone'
    2 = '2 With spouse/partner only (spouse/partner in household)'
    3 = '3 With spouse/partner and with others'
    4 = '4 With others only'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DOUTSFDF
    8 = '8 Not done in last month'
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE DOUTDEVI
    8 = '8 Not done in last month'
    1 = '1 No use of devices to go outside in last month'
    2 = '2 Use of devices to go outside in last month'
    3 = '3 DKRF If used devices to go outside in last month'
    4 = '4 DKRF If used devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DOUTHELP
    8 = '8 Not done in last month'
    1 = '1 No help to go outside in last month'
    2 = '2 Had help to go outside in last month'
    3 = '3 DKRF If had help to go outside in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DINSDSFD
    8 = '8 Not done in last month'
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE DINSDDEV
    8 = '8 Not done in last month'
    1 = '1 No use of devices inside in last month'
    2 = '2 Use of devices inside in last month'
    3 = '3 DKRF If used devices inside in last month'
    4 = '4 DKRF On use of devices'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dinsdhlp
    8 = '8 Not done in last month'
    1 = '1 No help to go around inside in last month'
    2 = '2 Had help to go around inside in last month'
    3 = '3 DKRF If had help to go around inside in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbedsfdf
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

   VALUE dbeddevi
    1 = '1 No use of cane or walker to get out of bed in last month'
    2 = '2 Use of cane or walker to get out of bed in last month'
    3 = '3 DKRF If Used cane or walker to get out of bed in last month'
    4 = '4 DKRF If used cane or walker in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbedhelp
    1 = '1 No help to get out of bed in last month'
    2 = '2 Had help to get out of bed in last month'
    3 = '3 DKRF If had help to get out of bed in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';


  VALUE dlaunsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';



  VALUE dlaunrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dshopsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dshoprea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmealsfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE dmealrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbanksfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbankrea
    1= '1 Health/functioning reason only'
    2= '2 Other reason only'
    3= '3 Both health/functioning and other'
    4= '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deatdevi
    1 = '1 No use of adapted utensils in last month'
    2 = '2 Use of adapted utensils in last month'
    8 = '8 Not done in last month'
    3 = '3 DKRF If used adapted utensils in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deathelp
    1 = '1 No help eating in last month'
    2 = '2 Had help eating in last month'
    3 = '3 DKRF If had help eating in last month'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE deatsfdf
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using utensils)'
    3 = '3 Difficulty by self (and when using utensils)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathdev
    1 = '1 No use of grab bars or bath seats in last month'
    2 = '2 Use of grab bars or bath seats in last month'
    3 = '3 DKRF If use of grab bars or bath seats in last month'
    4 = '4 DKRF If had grab bars or bath seats in last month'
    9 = '9 No bars/seats/shower/tub or washes up other way'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathhel
    1 = '1 No help bathing in last month'
    2 = '2 Had help bathing in last month'
    3 = '3 DKRF If had help bathing in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dbathsfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using grab bars or tub seat)'
    3 = '3 Difficulty by self (and when using grab bars or tub seat)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoildev
    1 = '1 No use of toileting devices in last month'
    2 = '2 Use of toileting devices in last month'
    3 = '3 DKRF of some and no use of other toileting devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoilhel
    1 = '1 No help toileting in last month'
    2 = '2 Had help toileting in last month'
    3 = '3 DKRF If had help toileting in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dtoilsfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using toileting devices)'
    3 = '3 Difficulty by self (and when using toileting devices)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddresdev
    8 = '8 Not done in last month'
    9 = '9 DKRF If dressed in last month'
    2 = '2 Use of dressing devices in last month'
    1 = '1 No use of dressing devices in last month'
    3 = '3 DKRF If use of dressing devices in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddreshel
    8 = '8 Not done in last month'
    9 = '9 DKRF If dressed in last month'
    1 = '1 No help dressing in last month'
    2 = '2 Had help dressing in last month'
    3 = '3 DKRF If had help dressing in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE ddressfd
    1 = '1 Did not do by self in last month'
    2 = '2 No Difficulty by self (and when using dressing devices)'
    3 = '3 Difficulty by self (and when using dressing devices)'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
  VALUE dmedssfd
    1 = '1 Did not do by self in last month'
    2 = '2 Did by self in last month/No Difficulty'
    3 = '3 Did by self in last month/Difficulty'
    4 = '4 DKRF Did by self in last month/No Difficulty'
    5 = '5 DKRF Did by self in last month/Difficulty'
    6 = '6 Did by self in last month/DKRF Difficulty'
    7 = '7 DKRF Did by self in last month/DKRF Difficulty'
    8 = '8 Not done in last month'
    9 = '9 No or DKRF if medications taken in last month'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmedsrea
    1 = '1 Health/functioning reason only'
    2 = '2 Other reason only'
    3 = '3 Both heath/functioning and other'
    4 = '4 Service/someone from the place SP lives'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

  VALUE dmarstat
    1 = '1 Married'
    2 = '2 Living with a partner'
    3 = '3 Separated'
    4 = '4 Divorced'
    5 = '5 Widowed'
    6 = '6 Never married'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
  VALUE DSPSAGEC
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
      1 = " 1 UNDER 50"
      2 = " 2 50-54"
      3 = " 3 55-59"
      4 = " 4 60-64"
      5 = " 5 65-69"
      6 = " 6 70-74"
      7 = " 7 75-79"
      8 = " 8 80-84"
      9 = " 9 85-89"
     10 = "10 90 +"    ;

    VALUE dresid
                -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential Care Resident not nursing home (SP interview complete)'
        3 = '3 Residential Care Resident not nursing home (FQ only)'
        4 = '4 Nursing Home Resident';
    VALUE f_dresid
                -1 = '-1 Inapplicable'
        1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R5 (FQ only)'
        8 = '8 Nursing home in R1 and R5 (FQ only)' ;
    VALUE f2dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R2 (FQ only)'
        8 = '8 Nursing home in R1 and R2 (FQ only)' ;
    VALUE f3dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R3 (FQ only)'
        8 = '8 Nursing home in R1 and R3 (FQ only)' ;
    VALUE f4dresid
                -1='-1 Inapplicable'
                1 = '1 Community '
        2 = '2 Residential care not nursing home (SP interview)'
        3 = '3 Residential care not nursing home (FQ only)'
        4 = '4 Nursing home (SP interview)'
        5 = '5 Nursing home (FQ only)'
        6 = '6 Deceased'
        7 = '7 Residential care not nursing home in R1 and R4 (FQ only)'
        8 = '8 Nursing home in R1 and R4 (FQ only)' ;


VALUE QUARTILE
-9="-9 Missing"
-1="-1 Inapplicable";

VALUE SPPB
-9="-9 Missing"
-1="-1 Inapplicable";

    VALUE DCLCKSC
      0 = "0 Not recognizable as a clock"
      1 = "1 Severely distorted depiction of a clock"
      2 = "2 Moderately distorted depiction of a clock"
      3 = "3 Mildly distorted depiction of a clock"
      4 = "4 Reasonably accurate depiction of a clock"
      5 = "5 Accurate depiction of a clock (circular or square)"
    -7 = "-7 SP refused to draw clock"
    -8 = "-8 DK"
    -1 = "-1 Inapplicable"
    -2 = "-2 Proxy says cannot ask SP"
    -3 = "-3 Proxy says can ask SP but SP unable to answer"
    -4 = "-4 SP did not attempt to draw clock"
    -9 = "-9 Missing";

    VALUE DCLCKCL
      1 = '1 Very clear'
      2 = '2 Somewhat clear'
      3 = '3 Somewhat unclear'
      4 = '4 Very unclear'
      5 = '5 Blank'
    -7 = '-7 SP refused to draw clock'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -2 = '-2 Proxy says cannot ask SP'
    -3 = '-3 Proxy says can ask SP but SP unable to answer'
    -4 = '-4 SP did not attempt to draw clock'
    -9 = '-9 Missing';

VALUE RESULT
    -9='-9: MISSING'
    1='1: COMPLETED W RESULTS'
    2='2: COMPLETED MISSING RESULTS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    7='7: NO CHAIR/NO SPACE'
    9='9: NOT ATTEMPTED/MISSING';

    VALUE RESULT_SCH
    -9='-9: MISSING'
    1='1: COMPLETED W/OUT ARMS'
    2='2: COMPLETED W ARMS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    7='7: NO CHAIR/SAFETY REASON'
    8='8: NO CHAIR/NOT SAFETY REAS'
    9='9: NOT ATTEMPTED/MISSING'
    10='10: CH4=1 SINGLE CHAIR NOT COMPL';

    VALUE RESULT_RCH
    -9='-9: MISSING'
    1='1: COMPLETED W/OUT ARMS'
    2='2: COMPLETED MISSING RESULTS'
    3='3: ATTEMPTED W RESULTS'
    4='4: ATTEMPTED MISSING RESULTS'
    5='5: NOT ATTEMPTED SAFETY'
    6='6: NOT ATTEMPTED NOT SAFETY REASON'
    9='9: NO CHAIR OR NOT ATTEMPTED/MISSING';

    VALUE ZEROSCORE
    1="1: NOT ELIGIBLE DUE TO EXCLUSION CRITERIA"
    2="2: NOT ATTEMPTED FOR SAFETY REASON"
    3="3: ATTEMPTED CHAIR STANDS/NOT ATTEMPTED FOR SAFETY"
    4="4: ATTEMPTED"
    5="5: NEW WALKING EXCLUSION"
    9="9: NOT ASSIGNED A ZERO SCORE";

   VALUE D_LMLLOC
    1 = '1 Community'
    2 = '2 Residential Care'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

      VALUE D_LOCSP
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
        1 = "1 Independent Living/Housing/Retirement"
        2 = "2 Assisted Living/Personal Care"
        3 = "3 Special Care, Memory or Alzheimer's Unit"
        4 = "4 Nursing Home"
        8 = "8 Not Reported" ;

        VALUE PA25FMT
    -1 = '-1 Inapplicable'
        -8 = '-8 DK'
    -9 = '-9 Missing'
    111= '111 Sleeping Napping'
    131= '131 Eating'
    132= '132 Going out to eat'
    199= '199 Other self care activities'
    211= '211 Work and work-related activities'
    221= '221 Other income generating activities'
    241= '241 Volunteering'
    299= '299 Other productive activities'
    321= '321 Shopping for non-durable goods'
    399= '399 Other shopping'
    411= '411 Food and drink preparation'
    434= '434 Outdoor Maintenance'
    439= '439 Household chores (cannot tell if indoor/outdoor)'
    441= '441 Animal and pet care'
    442= '442 Walking and exercising pets'
    449= '449 Other animal and pet care'
    451= '451 Vehicle maintenance and repair'
    471= '471 Financial management'
    499= '499 Other household activities'
    511= '511 Physical care and assistance to others'
    599= '599 Other physical care'
    611= '611 Socializing with others in person'
    612= '612 Socializing with others on the phone'
    616= '616 Socializing and communicating on the computer'
    621= '621 Watching TV and movies'
    631= '631 Doing puzzles or games not on computer or online'
    632= '632 Gambling not online or at a casino'
    636= '636 Doing puzzles or games on a computer or online'
    641= '641 Arts and crafts or hobbies'
    642= '642 Reading'
    643= '643 Writing'
    644= '644 Listening to music'
    646= '646 Computer or online leisure activities'
    651= '651 Smoking or other tobacco use'
    652= '652 Drinking alcohol'
    661= '661 Doing nothing/relaxing'
    669= '669 No activity'
    699= '699 Other non active leisure'
    711= '711 Playing sports'
    712= '712 Walking or jogging'
    713= '713 Other outdoor recreating activities'
    714= '714 Attending sporting events'
    715= '715 Other physical activity, exercise, yoga, swimming, working out, dancing'
    718= '718 Watching sporting events'
    721= '721 Attending arts  including plays and concerts'
    723= '723 Attending movies'
    724= '724 Attending casinos'
    737= '737 Travel for leisure'
    799= '799 Other active leisure'
    811= '811 Attending religious activities'
    812= '812 Other religious and spirtual activities'
    821= '821 Attending meetings or events'
    899= '899 Other organizational activity'
    991= '991 Other miscellaneous'
    992= '992 No favorite activity'
    997= '997 Refused'
    998= '998 Dont Know'
    999= '999 Not Codeable';

          VALUE OCC_CODE
1   ='1 Management Occupations: 0010-0430'
2   ='2 Business and Financial Operations Occupations:  0500-0950'
3   ='3 Computer and mathematical occupations:  1000-1240'
4   ='4 Architecture and Engineering Occupations:   1300-1560'
5   ='5 Life, Physical, and Social Science Occupations: 1600-1965'
6   ='6 Community and Social Service Occupations:   2000-2060'
7   ='7 Legal Occupations:  2100-2160'
8   ='8 Education, Training, and Library Occupations:   2200-2550'
9   ='9 Arts, Design, Entertainment, Sports, and Media Occupations: 2600-2960'
10  ='10 Healthcare Practitioners and Technical Occupations:    3000-3540'
11  ='11 Healthcare Support Occupations:    3600-3655'
12  ='12 Protective Service Occupations:    3700-3955'
13  ='13 Food Preparation and Serving Related Occupations:  4000-4160'
14  ='14 Building and Grounds Cleaning and Maintenance Occupations: 4200-4250'
15  ='15 Personal Care and Service Occupations: 4300-4650'
16  ='16 Sales and Related Occupations: 4700-4965'
17  ='17 Office and Administrative Support Occupations: 5000-5940'
18  ='18 Farming, Fishing, and Forestry Occupations:    6000-6130'
19  ='19 Construction and Extraction Occupations:   6200-6940'
20  ='20 Installation, Maintenance, and Repair Occupations: 7000-7630'
21  ='21 Production Occupations:    7700-8965'
22  ='22 Transportation and Material Moving Occupations:    9000-9750'
23  ='23 Military Specific Occupations: 9800-9830'
24  ='24 No current occ (Unemployed, no work in the last 5 years, never worked):  9920'
25 = '25 Blank field'
26 = '26 Code did not match'
94 = '94 Uncodable'
95 = '95 Never Worked Entire Life'
96 = '96 Homemaker/Raised Children'
-7 = '-7 RF'
-8 = '-8 DK'
-1 = '-1 Inapplicable'
-9 = '-9 Missing';

    Value fl_Dfac
1 = '1 Should have routed as facility but did not'
2 = '2 Routed as facility but determined not facility resident'
-1 = '-1 Inapplicable';
VALUE PE_RSLT
    -9='-9 Missing'
    -1 = '-1 Inapplicable'
    1='1 Completed'
    2='2 Attempted'
    3='3 Not attempted' ;
VALUE dosfacd /* FOR FQ2dosfacd  */
        -9= "-9 Missing"
       -8 = "-8 DK"
       -1 = "-1 INAPPLICABLE"
        1 = " 1 FREE STANDING NURSING HOME"
        2 = " 2 FREE STANDING ASSISTED LIVING FACILITY / RESIDENTIAL CARE FACILITY"
        3 = " 3 NURSING HOME AND ASSISTED LIVING FACILITY"
        4 = " 4 CONTINUING CARE RETIREMENT COMMUNITY (CCRC)"
        5 = " 5 ADULT FAMILY CARE HOME"
        6 = " 6 GROUP HOME"
        7 = " 7 BOARD AND CARE HOME / PERSONAL CARE HOME"
        8 = " 8 RETIREMENT COMMUNITY OR SENIOR HOUSING (NOT CCRC)"
        9 = " 9 INDEPENDENT LIVING"
       10 = " 10 ASSISTED AND INDEPENDENT/RETIREMENT (NO NURSING HOME)"
       11 = " 11 HOUSING (APT, CONDO, ETC.)";
        ;
    VALUE dosfaca /* FOR FQ2dosfaca */
        -9= "-9 Missing"
       -8 = "-8 DK"
       -1 = "-1 INAPPLICABLE"
        1 = " 1 INDEPENDENT LIVING / HOUSING / RETIREMENT "
        2 = " 2 ASSISTED LIVING / PERSONAL CARE"
        3 = " 3 SPECIAL CARE, MEMORY CARE, OR ALZHEIMER'S UNIT"
        4 = " 4 NURSING HOME"   ;

VALUE INAP_YN
     1 = ' 1 Yes'
     2 = ' 2 No'
    -1 = '-1 Inapplicable' ;
VALUE CENDIV /* RE1DCENSDIV - Updated for R2 - Re-Release */
    1 =  '1 Northeast Region: New England Division (ME, NH, VT, MA, RI, CT)'
    2 =  '2 Northeast Region: Middle Atlantic Division (NY, NJ, PA)'
    3 =  '3 Midwest Region: East North Central Division (OH, IN, IL, MI, WI)'
    4 =  '4 Midwest Region: West North Central Division (MN, IA, MO, ND, SD, NE, KS)'
    5 =  '5 South Region: South Atlantic Division (DE, MD, DC, VA, WV, NC, SC, GA, FL)'
    6 =  '6 South Region: East South Central Division (KY, TN, AL, MS)'
    7 =  '7 South Region: West South Central Division (AR, LA, OK, TX)'
    8 =  '8 West Region: Mountain Division (MT, ID, WY, CO, NM, AZ, UT, NV)'
    9 =  '9 West Region: Pacific Division (WA, OR, CA, AK, HI)'
    -9 = '-9 Missing';

    VALUE W000002W
      -7 = '-7 RF'
      -8 = '-8 DK'
      -1 = '-1 Inapplicable'
      -9 = '-9 Missing'
       1 = "1 MALE"
       2 = "2 FEMALE"  ;

    VALUE W000005W
     1 = ' 1 Yes'
     2 = ' 2 No'
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

    VALUE R1DRESID
        -1 = '-1 Inapplicable'
     1 = '1 Community '
     2 = '2 Residential Care Resident not nursing home (SP interview complete)'
     3 = '3 Residential Care Resident not nursing home (FQ only)'
     4 = '4 Nursing Home Resident';

  VALUE W200016W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 MEDICAID"
    2 = "2 MEDICARE"
    3 = "3 STATE PROGRAM"
    91 = "91 OTHER (SPECIFY)"   ;

    VALUE W200012W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 REGULAR"
    2 = "2 VARIED"  ;

  VALUE W200061W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 SEPARATION OR DIVORCE"
    2 = "2 DECEASED"
    3 = "3 MOVED ELSEWHERE"
    5 = "5 LAST INTERVIEW INFORMATION INCORRECT"
    8 = "8 OTHER REASON"   ;

  VALUE d2hrsmth
    -13= '-13 Deceased '
    -12= '-12 Zero days/wk'
    -11= '-11 Hours missing'
    -10= '-10 Days missing'
    -9 = ' -9 Days and hrs missing'
    -1 = ' -1 Inapplicable'
    -7 = ' -7 RF'
    -8 = ' -8 DK'
     0-<1  ='<1'
     1-<10 =' 1-<10'
    10-<20 ='10-<20'
    20-<30 ='20-<30'
    30-<40 ='30-<40'
    40-<60 ='40-<60'
    60-<120 ='60-<120'
    120-<180='120-<180'
    180-744='180-744 (24/7)'
     9999='9999 Not codeable, <1 hour/day' ;

  VALUE dhrsmth
    -11= '-11:hours missing'
    -10= '-10:days missing'
    -9 = '-9:days and hrs missing'
    -1 = '-1 Inapplicable'
    -7 = '-7 RF'
    -8 = '-8 DK'
     0-<1  ='<1'
     1-<10 =' 1-<10'
    10-<20 ='10-<20'
    20-<30 ='20-<30'
    30-<40 ='30-<40'
    40-<60 ='40-<60'
    60-<120 ='60-<120'
    120-<180='120-<180'
    180-744='180-744 (24/7)'
     9999='9999 Not codeable, <1 hour/day' ;

 Value dmissadd
-1='-1 Inapplicable'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section';

Value d2mssadd
-1='-1 Inapplicable'
 0='0 no flags and added at undetermined section'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section'
12='12 no flags and added at CS section'
13='13 no flags and added at HH section'
14='14 no flags and added at IS section';

Value dopage3c
 -9='-9 Missing'
 -8='-8 RF'
 -7='-7 DK'
 -1='-1 Inapplicable'
  1='1 UNDER 30'
  2='2 30-39'
  3='3 40-49'
  4='4 50-59'
  5='5 60-69'
  6='6 70-79'
  7='7 80-89'
  8='8 90 +';

 Value dopagect
-9='-9 Missing'
-8='-8 DK'
-7='-7 RF'
-1='-1 Inapplicable'
 1='1 UNDER 20'
 2='2 20-24'
 3='3 25-29'
 4='4 30-34'
 5='5 35-39'
 6='6 40-44'
 7='7 45-49'
 8='8 50-54'
 9='9 55-59'
10='10 60-64'
11='11 65-69'
12='12 70-74'
13='13 75-79'
14='14 80-84'
15='15 85-89'
16='16 90 +';


  VALUE W200008W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 UNDER 20"
    2 = "2 20-24"
    3 = "3 25-29"
    4 = "4 30-34"
    5 = "5 35-39"
    6 = "6 40-44"
    7 = "7 45-49"
    8 = "8 50-54"
    9 = "9 55-59"
    10 = "10 60-65"
    11 = "11 66-69"
    12 = "12 70-74"
    13 = "13 75-79"
    14 = "14 80-85"
    15 = "15 86-89"
    16 = "16 90-94"
    17 = "17 95-99"
    18 = "18 100 +"
  ;
    VALUE NumCigs
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing'
    999 = '999 SP smokes less than 1 cigarette / day';


  VALUE dlmlint
    1 = '1 Last month of life interview'
   -1 = '-1 Inapplicable'     ;

  VALUE d2intvra
     1 = '1 65 to 69'
     2 = '2 70 to 74'
     3 = '3 75 to 79'
     4 = '4 80 to 84'
     5 = '5 85 to 89'
     6 = '6 90+'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'     ;

  VALUE dad8dem
    1 = '1 DEMENTIA RESPONSE TO ANY AD8 ITEMS IN PRIOR ROUNDS'
   -1 = '-1 Inapplicable'    ;

  VALUE dwrdinon
  1 = '1 No words remembered'
   -1 = '-1 Inapplicable'
     -9 = '-9 Missing'     ;

  VALUE dwrdirre
    1 = '1 Refused word recall task'
   -1 = '-1 Inapplicable'
      -9 = '-9 Missing'     ;

 VALUE A0001AB
      1 = "1 AM"
      2 = "2 PM"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0002WA
      1 = "1 Yes, there is space to set up the walking course"
      2 = "2 No, there is not space to set up the walking course"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0004WA
      1 = "1 None"
      2 = "2 Cane"
      3 = "3 Walker or rollator"
      9 = "9 Other, specify"
     -1 = '-1 Inapplicable'
     -7 = '-7 RF'
     -8 = '-8 DK'
     -9 = '-9 Missing';

 VALUE A0004CH
      1 = "1 No, chair stand not completed"
      2 = "2 Yes, chair stand completed"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0008CH
      1 = "1 With arms"
      2 = "2 Without arms"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

 VALUE A0014CH
      1 = "1 1 Chair stand completed"
      2 = "2 2 Chair stands completed"
      3 = "3 3 Chair stands completed"
      4 = "4 4 Chair stands completed"
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';

VALUE BA1SS
    1 = '1 Eligible and recorded result for SxS Balance'
    2 = '2 Eligible and no recorded result for SxS Balance'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1STAN
    1 = '1 Eligible and recorded result for Semi Tandem Balance'
    2 = '2 Eligible and no recorded result for Semi Tandem Balance'
    3 = '3 Not administered because did not complete prior balance test'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1TAN
    1 = '1 Eligible and recorded result for full tandem balance'
    2 = '2 Eligible and no recorded result for full tandem balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1OP
    1 = '1 Eligible and recorded result for one leg eyes open balance'
    2 = '2 Eligible and no recorded result for one leg eyes open balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE BA1CL
    1 = '1 Eligible and recorded result for one leg eyes closed balance'
    2 = '2 Eligible and no recorded result for one leg eyes closed balance'
    3 = '3 Not administered because did not complete prior balance tests'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE WA1WLK
    1 = '1 Eligible and recorded result for walking course'
    2 = '2 Eligible and no recorded result for walking course'
    4 = '4 Not Eligible due to exclusion criteria'
    5 = '5 Not Eligible on exclusion criteria but recorded result (SP changed mind)'
    -1 = '-1 Inapplicable '
    -9 = '-9 Missing';

VALUE CH1SCH
    1 = '1 Eligible and recorded result for single chair stand'
    2 = '2 Eligible and no recorded result for single chair stand'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE CH1RSH
    1 = '1 Eligible and recorded result for repeated chair stand'
    2 = '2 Eligible and no recorded result for repeated chair stand'
    3 = '3 Not administered because did not complete single chair stand w/o arms'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE GR1GRIP
    1 = '1 Eligible and recorded result for grip strength'
    2 = '2 Eligible and no recorded result for grip strength'
    4 = '4 Not Eligible due to exclusion criteria'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE WC1WAIST
    1 = '1 Eligible and recorded result for waist circumference'
    2 = '2 Eligible and no recorded result for waist circumference'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

VALUE PK1PEAK
    1 = '1 Eligible and recorded result for peak air flow'
    2 = '2 Eligible and no recorded result for peak air flow'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

 VALUE RGT_LFT
   1 = '1 Right'
   2 = '2 Left'
  -1 = '-1 Inapplicable'
  -9 = '-9 Missing';

 VALUE PERSON
    1 = '1 Interviewer'
    2 = '2 Sample person'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing';

 VALUE STAND
     1 = '1 Standing'
     2 = '2 Sitting'
     3 = '3 Lying down'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';

 VALUE EFFORT
      1 = '1 Full effort'
      2 = '2 Less effort for health reason'
      3 = '3 Less effort for other reason'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing';
    VALUE WORDREC
        1 = ' 1 LIST 1'
        2 = ' 2 LIST 2'
        3 = ' 3 LIST 3'
       -1 = '-1 Inapplicable '
       -9 = '-9 Missing';
    VALUE WORDRE_N
        -1 = '-1 Inapplicable'
        -2 = '-2 Proxy says cannot ask SP'
        -3 = '-3 Proxy says can ask SP but SP unable to answer'
        -7 = '-7 SP refused activity'
        -9 = '-9 Missing';


                VALUE SP30051W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 EXCELLENT"
    2 = "2 VERY GOOD"
    3 = "3 GOOD"
    4 = "4 FAIR"
    5 = "5 POOR"
    6 = "6 DOES NOT APPLY/NO CARE IN LAST MONTH OF LIFE"
  ;
    VALUE SP3019aW
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 JANUARY"
    2 = "2 FEBRUARY"
    3 = "3 MARCH"
    4 = "4 APRIL"
    5 = "5 MAY"
    6 = "6 JUNE"
    7 = "7 JULY"
    8 = "8 AUGUST"
    9 = "9 SEPTEMBER"
    10 = "10 OCTOBER"
    11 = "11 NOVEMBER"
    12 = "12 DECEMBER"
    90 = "90 LAST INTERVIEW INFORMATION INCORRECT"
  ;
  VALUE RACEHISP
        1 = ' 1 White, non-hispanic'
        2 = ' 2 Black, non-hispanic'
        3 = ' 3 Other (Am Indian/Asian/Native Hawaiian/Pacific Islander/other specify), non-Hispanic'
        4 = ' 4 Hispanic'
        5 = ' 5 More than one DKRF primary'
        6 = ' 6 DKRF'
       -9 = '-9 Missing';

    VALUE SPPB_MIS
       -7 = '-7 RF'
   -8 = '-8 DK'
   -9 = '-9 Missing'
    -1="-1 Inapplicable"
    1="1 Proxy interview"
    2="2 Missing walk and repeat chair and balance"
    3="3 Missing walk and repeat chair"
    4="4 Missing walk and balance"
    5="5 Missing repeat chair and balance"
    6="6 Missing walk"
    7="7 Missing repeat chair"
    8="8 Missing balance"
    9="9 No space"
    10="10 No chair"
    11="11 No space walk and no chair"
    12="12 No space walk and non-safety missing"
    13="13 No chair and non-safety missing"
    14="14 Non-safety walk"
    15="15 Non-safety chair"
    16="16 Non-safety balance"
    17="17 Non-safety walk and chair"
    18="18 Non-safety walk and balance"
    19="19 Non-safety chair and balance"
    20="20 Non-safety walk and chair and balance";

    VALUE QUARTILES
-9="-9 Missing"
-1="-1 Inapplicable"
;
  VALUE SP30025W
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 FREE-STANDING (DETACHED) SINGLE HOUSE"
    2 = "2 SINGLE HOUSE BUT ATTACHED TO OTHERS (ROW HOUSE, TOWNHOUSE, DUPLEX, TRIPLEX, OR TRIPLE DECKER)"
    3 = "3 MOBILE HOME OR TRAILER"
    4 = "4 MULTI-UNIT (2+) BUILDING"
    91 = "91 OTHER (SPECIFY)"
  ;
    VALUE SP30046W
        -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
     1 = "1 AT SP'S HOME"
      2 = "2 IN A HOSPITAL"
      3 = "3 IN A NURSING HOME"
      4 = "4 IN A HOSPICE RESIDENCE"
      5 = "5 AT SOMEONE ELSE'S HOME"
      91 = "91 SOMEWHERE ELSE (SPECIFY)"
  ;
    VALUE SP30076W
       -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
      1 = "1 YES"
      2 = "2 NO"
      7 = "7 YES, DOESNT KNOW HOW TO USE"
  ;
    VALUE W300151W
     -7 = '-7 RF'
     -8 = '-8 DK'
     -1 = '-1 Inapplicable'
     -9 = '-9 Missing'
      1 = "1 VERY GOOD"
      2 = "2 GOOD"
      3 = "3 FAIR"
      4 = "4 POOR"
    5 = "5 VERY POOR"  ;

      VALUE SP30076H
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
    95 = "95 NO USUAL NUMBER OF HOURS OR DIFFERENT FROM DAY TO DAY"  ;
      VALUE SP30076G
       -7 = '-7 RF'
       -8 = '-8 DK'
       -1 = '-1 Inapplicable'
       -9 = '-9 Missing'
    95 = "95 NO USUAL TIME OR DIFFERENT FROM DAY TO DAY"  ;
          VALUE SP30076I
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
        95 = "95 NO USUAL NUMBER OF HOURS OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30076J
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
        95 = "95 NO USUAL TIME OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30076K
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
                   0 = "0 LESS THAN AN HOUR"
        90 = "90 FELL ASLEEP RIGHT AWAY"
        95 = "95 NO USUAL AMOUNT OF TIME TO FALL ASLEEP OR DIFFERENT FROM NIGHT TO NIGHT"  ;
          VALUE SP30155W
           -7 = '-7 RF'
           -8 = '-8 DK'
           -1 = '-1 Inapplicable'
           -9 = '-9 Missing'
            1 = "1 NAPS PLANNED"
            2 = "2 FELL ASLEEP WITHOUT MEANING TO"
            3 = "3 BOTH (SOME PLANNED/SOME NOT)"  ;
  VALUE SP30120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OFTEN"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"  ;
Value HOURSF
 -13='-13 SP deceased/section not administered'
 -12='-12 Valid skip/staff'
 -11='-11 Hours missing'
 -10='-10 Days missing'
  -9='-9 Days and hrs missing'
  -1='-1 Inapplicable'
 0-  1='0-<1'
 1.01- 10='1-<10'
10.01- 20='10-<20'
20.01- 30='20-<30'
30.01-40='30-<40'
40.01-60='40-<60'
60.01-120='60-<120'
120.01-180='120-<180'
180.01-744='180-744 (24/7)'
9999='9999 Not codeable, <1 hour/day';
  VALUE SP30120W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 OFTEN"
    2 = "2 SOMETIMES"
    3 = "3 RARELY"
    4 = "4 NEVER"
  ;
  VALUE SP30118W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A LOT"
    2 = "2 SOME"
    3 = "3 A LITTLE"
    4 = "4 NOT AT ALL"  ;
  VALUE SP30141W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "less than $27,600,"
    2 = "$27,600-$41,999,"
    3 = "$42,000-$63,999,"
    4 = "$64,000-$107,999, or"
    5 = "$108,000 or more?"  ;
  VALUE SP30142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "less than $14,000,"
    2 = "$14,000-$21,999,"
    3 = "$22,000-$35,999,"
    4 = "$36,000-$48,999, or"
    5 = "$49,000 or more?"  ;
  VALUE INVENT
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
                104="104-Arthritis"
                107="107-Lung Disease"
                109="109-Dementia or Alzheimer's disease"
                110="110-Cancer"
                113="113-Other serious disease, illness, health problem"
                114="114-Knee surgery/problem"
                115="115-Hip repair or replacement/problem"
                117="117-Back or Spine Surgery/problem"
                121="121-Sleep Problems"
                201="201-Hearing problems"
                202="202-Sight problems"
                205="205-Pain"
                301="301-Breathing problems"
                302="302-Upper body strength movement"
                303="303-Lower body strength movement"
                304="304-Low energy"
                305="305-Balance or coordination problems"
                306="306-Walking distances"
                307="307-Climbing stairs"
                308="308-Lifting and carrying items"
                309="309-Kneeling"
                310="310-Bending"
                311="311-Reaching"
                312="312-Opening Jars"
                313="313-Grasping"
                401="401-Memory"
                501="501-Getting out of bed"
                502="502-Getting around inside"
                503="503-Getting outside"
                504="504-Travel/transportation"
                601="601-Eating"
                602="602-Washing"
                603="603-Toileting"
                604="604-Dressing"
                605="605-Grooming"
                701="701-Laundry"
                702="702-Shopping"
                703="703-Cooking"
                705="705-Money matters"
                706="706-Indoor cleaning and maintenance"
                707="707-Outdoor cleaning and maintenance"
                801="801-Medications"
                802="802-Doctor visits"
                804="804-Other medical self-care"
                1211="1211-Working"
                1442="1442-Walking/exercising pets"
                1451="1451-Vehicle repair and maintenance"
                1461="1461-Appliance tool, and toy use, set-up, repair, & maintenance"
                1462="1462-Computer use, set-up, repair, maintenance, and education"
                1473="1473-Household organization"
                1512="1512-Looking after someone else"
                1611="1611-Socializing and communicating with others-in person"
                1612="1612-Socializing and communication with others by talking on telephone"
                1613="1613-Attending or hosting party, wedding or social occasions"
                1614="1614-Reading and sorting through the mail"
                1621="1621-Watch television and movies"
                1631="1631-Games & puzzles"
                1641="1641-Arts and crafts, collecting, and hobbies, making music"
                1642="1642-Reading"
                1643="1642-Writing (personal, not on computer)"
                1644="1644-Listening to recorded music or radio"
                1711="1711-Playing/practicing sports or taking physical activity class/lessons"
                1712="1712-Walking/jogging for exercise or pleasure or working out"
                1713="1713-Other outdoor recreation activities"
                1813="1813-Religious & spiritual volunteer activities"
                1901="1901-Other, no existing code"
                1998="1998-Don't know"
                1999="1999-Refused/blank";
VALUE W500058W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MONTHS"
    2 = "2 YEARS"  ;
VALUE W500103W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 YES, A YEAR OR MORE"
    2 = "2 NO, LESS THAN A YEAR"  ;
  VALUE W500105W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MONTH AND YEAR"
    2 = "2 NUMBER OF MONTHS AGO"
    3 = "3 NUMBER OF YEARS AGO"
    4 = "4 AGE WHEN LAST DROVE"
    7 = "7 NEVER DROVE"  ;
VALUE W500123W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 STILL FAVORITE ACTIVITY"
    2 = "2 HAS A NEW FAVORITE ACTIVITY"
    95 = "95 NO FAVORITE ACTIVITY"   ;
VALUE W500124W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN 1 MONTH"
    2 = "2 1 TO 3 MONTHS"
    3 = "3 4 TO 5 MONTHS"
    4 = "4 6 OR MORE MONTHS" ;
  VALUE W500125W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN 1 WEEK"
    2 = "2 1 TO 2 WEEKS"
    3 = "3 3 TO 4 WEEKS"  ;
  VALUE W500126W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 A FRACTURE, SPRAIN, OR INJURY"
    2 = "2 A HIP, KNEE, OR OTHER JOINT REPLACEMENT"
    3 = "3 ANOTHER MUSCULOSKELETAL CONDITION"
    4 = "4 A STROKE OR TIA"
    5 = "5 A HEART ATTACK"
    6 = "6 ANOTHER HEART CONDITION OR VASCULAR DISEASE"
    7 = "7 A BREATHING CONDITION"
    8 = "8 A NEUROLOGICAL CONDITION LIKE MS OR PARKINSONS"
    9 = "9 CANCER"
    94 = "94 ANOTHER CONDITION (SPECIFY)"
    95 = "95 NO MEDICAL CONDITION (IF VOLUNTEERED)" ;
  VALUE W500128W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 DIFFICULTY CHEWING OR SWALLOWING"
    2 = "2 DIFFICULTY SPEAKING OR BEING UNDERSTOOD"
    3 = "3 PAIN LEVEL"
    4 = "4 PROBLEM WITH BREATHING"
    5 = "5 PROBLEM WITH STRENGTH (MUSCLE WEAKNESS)"
    6 = "6 PROBLEM WITH MOVEMENT (RANGE OF MOTION)"
    7 = "7 LOW ENERGY LEVEL"
    8 = "8 PROBLEM WITH BALANCE OR COORDINATION"
    9 = "9 PROBLEM WITH FALLS"
    10 = "10 PROBLEM WITH MEMORY"
    95 = "95 NONE OF THESE PROBLEMS"  ;
  VALUE W500131W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 AS AN OVERNIGHT PATIENT IN A HOSPITAL, NURSING HOME OR REHAD FACILITY"
    2 = "2 AT AN OUTPATIENT CENTER, CLINIC, DRs OR THERAPISTs OFFICE"
    3 = "3 HOME"
    4 = "4 SOMEWHERE ELSE"  ;
  VALUE W500132W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 IMPROVED"
    2 = "2 GOT WORSE"
    3 = "3 STAYED ABOUT THE SAME"
    4 = "4 VARIED/UP AND DOWN (IF VOLUNTEERED)"  ;
 VALUE W500133W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A LOT"
    2 = "2 SOMEWHAT"
    3 = "3 A LITTLE"  ;

  VALUE W500137W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 WELL OFF"
    2 = "2 ABOVE AVERAGE"
    3 = "3 AVERAGE"
    4 = "4 BELOW AVERAGE"
    5 = "5 POOR"  ;
VALUE W500010W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MOTHER ONLY"
    2 = "2 FATHER ONLY"
    3 = "3 ANOTHER RELATIVE"
    4 = "4 NON-RELATIVES"
    5 = "5 VARIED/MOVED AROUND"  ;
  VALUE W500142W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 VERY WELL"
    2 = "2 WELL"
    3 = "3 NOT WELL"
    4 = "4 NOT AT ALL"  ;
  VALUE W500147W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 NUMBER OF YEARS"
    2 = "2 AGE"  ;
  VALUE W500150W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 ENTER PAYCHECK AMOUNT"
    2 = "2 ENTER PAY PER HOUR"
    3 = "3 ENTER PAY PER DAY"  ;
  VALUE W500151W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 ENTER OCCUPATION"
    2 = "2 NEVER WORKED ENTIRE LIFE"
    3 = "3 HOMEMAKER/RAISED CHILDREN/WORKED IN THE HOME"  ;
  VALUE W500152W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 SAME KIND OF WORK"
    2 = "2 SOMETHING DIFFERENT"  ;
  VALUE W500160W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 MAIL"
    2 = "2 DIRECT DEPOSIT"
    3 = "3 PREPAID CARD"  ;
  VALUE W500165W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 ENTER COMBINED AMOUNT"
    2 = "2 ENTER SP AND SPOUSE/PARTNER AMOUNTS SEPARATELY"  ;
  VALUE W500166W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,300"
    2 = "2 $1,300 TO LESS THAN $1,700"
    3 = "3 $1,700 TO LESS THAN $2,200"
    4 = "4 $2,200 TO LESS THAN $2,600"
    5 = "5 $2,600 OR MORE"  ;
  VALUE W500167W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN $700"
    2 = "2 $700 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $1,300"
    4 = "4 $1,300 TO LESS THAN $1,600"
    5 = "5 $1,600 OR MORE"  ;
  VALUE W500168W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $300"
    2 = "2 $300 TO LESS THAN $700"
    3 = "3 $700 TO LESS THAN $1,000"
    4 = "4 $1,000 OR MORE"   ;
  VALUE W500169W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
        1 = "1 LESS THAN $100"
    2 = "2 $100 TO LESS THAN $200"
    3 = "3 $200 TO LESS THAN $400"
    4 = "4 $400 TO LESS THAN $700"
    5 = "5 $700 OR MORE"  ;
  VALUE W500170W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,000"
    2 = "2 $1,000 TO LESS THAN $1,400"
    3 = "3 $1,400 TO LESS THAN $1,800"
    4 = "4 $1,800 TO LESS THAN $2,200"
    5 = "5 $2,200 OR MORE"  ;
  VALUE W500171W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $500"
    2 = "2 $500 TO LESS THAN $700"
    3 = "3 $700 TO LESS THAN $900"
    4 = "4 $900 TO LESS THAN $1,100"
    5 = "5 $1,100 OR MORE"  ;
  VALUE W500172W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $600"
    2 = "2 $600 TO LESS THAN $1,300"
    3 = "3 $1,300 TO LESS THAN $2,100"
    4 = "4 $2,100 TO LESS THAN $5,900"
    5 = "5 $5,900 OR MORE"  ;
  VALUE W500173W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $400"
    2 = "2 $400 TO LESS THAN $900"
    3 = "3 $900 TO LESS THAN $1,600"
    4 = "4 $1,600 TO LESS THAN $3,800"
    5 = "5 $3,800 OR MORE"  ;
  VALUE W500174W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $34,000"
    2 = "2 $34,000 TO LESS THAN $82,000"
    3 = "3 $82,000 TO LESS THAN $175,000"
    4 = "4 $175,000 TO LESS THAN $413,000"
    5 = "5 $413,000 OR MORE"   ;
  VALUE W500175W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $20,000"
    2 = "2 $20,000 TO LESS THAN $47,000"
    3 = "3 $47,000 TO LESS THAN $92,000"
    4 = "4 $92,000 TO LESS THAN $218,000"
    5 = "5 $218,000 OR MORE"   ;
  VALUE W500176W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $200"
    2 = "2 $200 TO LESS THAN $500"
    3 = "3 $500 TO LESS THAN $1,000"
    4 = "4 $1,000 TO LESS THAN $2,500"
    5 = "5 $2,500 OR MORE"  ;
  VALUE W500177W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $100"
    2 = "2 $100 TO LESS THAN $300"
    3 = "3 $300 TO LESS THAN $700"
    4 = "4 $700 TO LESS THAN $1,700"
    5 = "5 $1,700 OR MORE"  ;
  VALUE W500178W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,400"
    2 = "2 $2,400 TO LESS THAN $6,000"
    3 = "3 $6,000 TO LESS THAN $12,000"
    4 = "4 $12,000 TO LESS THAN $30,000"
    5 = "5 $30,000 OR MORE"  ;
  VALUE W500179W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $1,200"
    2 = "2 $1,200 TO LESS THAN $3,600"
    3 = "3 $3,600 TO LESS THAN $8,400"
    4 = "4 $8,400 TO LESS THAN $20,400"
    5 = "5 $20,400 OR MORE"  ;
  VALUE W500180W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $9,000"
    2 = "2 $9,000 TO LESS THAN $18,000"
    3 = "3 $18,000 TO LESS THAN $93,000"
    4 = "4 $93,000 TO LESS THAN $350,000"
    5 = "5 $350,000 OR MORE"  ;
  VALUE W500181W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $600"
    2 = "2 $600 TO LESS THAN $5,000"
    3 = "3 $5,000 TO LESS THAN $16,000"
    4 = "4 $16,000 TO LESS THAN $62,000"
    5 = "5 $62,000 OR MORE"  ;
  VALUE W500182W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $8,000"
    2 = "2 $8,000 TO LESS THAN $62,000"
    3 = "3 $62,000 TO LESS THAN $192,000"
    4 = "4 $192,000 TO LESS THAN $213,000"
    5 = "5 $213,000 OR MORE"  ;
  VALUE W500183W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $300"
    2 = "2 $300 TO LESS THAN $2,500"
    3 = "3 $2,500 TO LESS THAN $8,000"
    4 = "4 $8,000 TO LESS THAN $37,000"
    5 = "5 $37,000 OR MORE"  ;
  VALUE W500184W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $11,000"
    2 = "2 $11,000 TO LESS THAN $25,000"
    3 = "3 $25,000 TO LESS THAN $50,000"
    4 = "4 $50,000 TO LESS THAN $108,000"
    5 = "5 $108,000 OR MORE"  ;
  VALUE W500185W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,000"
    2 = "2 $2,000 TO LESS THAN $7,000"
    3 = "3 $7,000 TO LESS THAN $17,000"
    4 = "4 $17,000 TO LESS THAN $57,000"
    5 = "5 $57,000 OR MORE"  ;
  VALUE W500186W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $8,000"
    2 = "2 $8,000 TO LESS THAN $13,000"
    3 = "3 $13,000 TO LESS THAN $28,000"
    4 = "4 $28,000 TO LESS THAN $54,000"
    5 = "5 $54,000 OR MORE"  ;
  VALUE W500187W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $500"
    2 = "2 $500 TO LESS THAN $1,900"
    3 = "3 $1,900 TO LESS THAN $5,000"
    4 = "4 $5,000 TO LESS THAN $20,000"
    5 = "5 $20,000 OR MORE"  ;
  VALUE W500188W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $200"
    2 = "2 $200 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $4,000"
    4 = "4 $4,000 TO LESS THAN $16,000"
    5 = "5 $16,000 OR MORE"  ;
  VALUE W500189W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $400"
    2 = "2 $400 TO LESS THAN $1,000"
    3 = "3 $1,000 TO LESS THAN $2,000"
    4 = "4 $2,000 TO LESS THAN $11,000"
    5 = "5 $11,000 OR MORE"  ;
  VALUE W500190W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $30,000"
    2 = "2 $30,000 TO LESS THAN $101,000"
    3 = "3 $101,000 TO LESS THAN $247,000"
    4 = "4 $247,000 TO LESS THAN $703,000"
    5 = "5 $703,000 OR MORE"  ;
  VALUE W500191W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $18,000"
    2 = "2 $18,000 TO LESS THAN $68,000"
    3 = "3 $68,000 TO LESS THAN $122,000"
    4 = "4 $122,000 TO LESS THAN $293,000"
    5 = "5 $293,000 OR MORE"  ;
  VALUE W500192W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $3,600"
    2 = "2 $3,600 TO LESS THAN $12,000"
    3 = "3 $12,000 TO LESS THAN $25,000"
    4 = "4 $25,000 TO LESS THAN $64,000"
    5 = "5 $64,000 OR MORE"  ;
  VALUE W500193W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $3,600"
    2 = "2 $3,600 TO LESS THAN $7,200"
    3 = "3 $7,200 TO LESS THAN $14,000"
    4 = "4 $14,000 TO LESS THAN $38,000"
    5 = "5 $38,000 OR MORE"  ;
  VALUE W500194W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $30,000"
    2 = "2 $30,000 TO LESS THAN $43,000"
    3 = "3 $43,000 TO LESS THAN $66,000"
    4 = "4 $66,000 TO LESS THAN $109,000"
    5 = "5 $109,000 OR MORE"  ;
  VALUE W500195W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $18,000"
    2 = "2 $18,000 TO LESS THAN $22,000"
    3 = "3 $22,000 TO LESS THAN $36,000"
    4 = "4 $36,000 TO LESS THAN $56,000"
    5 = "5 $56,000 OR MORE" ;
  VALUE W500209W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 YES"
    2 = "2 NO"
    3 = "3 CANT DO - DONT DO"  ;
  VALUE W500196W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 LESS THAN $2,500"
    2 = "2 $2,500 TO LESS THAN $5,000"
    3 = "3 $5,000 TO LESS THAN $10,000"
    4 = "4 $10,000 TO LESS THAN $20,000"
    5 = "5 $20,000 TO LESS THAN $50,000"
    6 = "6 $50,000 OR MORE"  ;
  VALUE dage2us
        0 = "0 Less than age 1"
        997 = "997 Born in US"
    -8 = "-8 DK"
    -7 = "-7 RF"
    -1 = "-1 Inapplicable";
  VALUE locsp
     -9 ="-9 MISSING"
    -8 ="-8 DK"
    -7 ="-7 RF"
    -1 ="-1 Inapplicable"
    1 = "1 Independent Living"
    2 = "2 Assisted Living"
    3 = "3 Special Care Unit"
    4 = "4 Nursing Home"
    8 = "8 Not Reported" ;

    VALUE resid
   -9 = '-9 Missing'
        -8 = "-8 DK"
        -7 = "-7 RF"
        -1 = "-1 Inapplicable"
        1 = "Community"
        2 = "Residential care not nursing home (SP interview)"
        3 = "Residential care not nursing home (FQ only)"
        4 = "Nursing home (SP interview)"
        5 = "Nursing home (FQ only)"
        6 = "Deceased"
        7 = "Residential care not nursing home in R1 and R2 (FQ only)"
        8 = "Nursing home in R1 and R2 (FQ only)";

    VALUE  residlml
        1 = "1 Community"
        2 = "2 Residential care"
        -1 = "-1 Inapplicable"
   -9 = '-9 Missing';

  VALUE SP50139W
    1 = "1 White/Caucasian"
    2 = "2 Black/African American"
    3 = "3 Other"
      -7 = '-7 RF'
      -8 = '-8 DK'
   -9 = '-9 Missing';

  VALUE Locat15w
          1= "1 Lives in same City and State as at age 15"
          2= "2 Lives in same state but different City (or DKRF city) as age 15"
          3= "3 Does not live in same State as age 15"
      -1= "-1 Inapplicable"
      -7 = '-7 RF'
      -8 = '-8 DK'
          -9 = '-9 Missing';
  Value  dresnew
         1 = "1 same residence as last int"
         2 = "2 new residence since last int"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';

   Value dcontnew
         1 = "1 Continuing sample from R1"
         2 = "2 New sample in R5"
        -1= "-1 Inapplicable"
    -7 = '-7 RF'
    -8 = '-8 DK'
    -9 = '-9 Missing';

     VALUE DMDDEVYR
      1 = ' 1 No Mobility device use in last year/since last interview'
      2 = ' 2 Mobility device use in last year/since last interview'
     -1 = '-1 Inapplicable '
     -7  = '-7 RF'
     -8  = '-8 DK'
     -9 = '-9 Missing';

    VALUE DMDEVST
     0 = '0 less than 1 month of mobility device use'
     1 = '1 month of mobility device use'
     2 = '2 months of mobility device use'
     3 = '3 months of mobility device use'
     4 = '4 months of mobility device use'
     5 = '5 months of mobility device use'
     6 = '6 months of mobility device use'
     7 = '7 months of mobility device use'
     8 = '8 months of mobility device use'
     9 = '9 months of mobility device use'
    10 = '10 months of mobility device use'
    11 = '11 months of mobility device use'
    -7 = '-7 used last month but RF number of months of use in year'
    -8 = '-8 used last month but DK number of months of use in year'
    -1 = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample';

     VALUE DMDEVEND
         0 = '0 Between 11 and 12 months since device use ended'
     1 = '1 month since mobility device use ended'
     2 = '2 months since mobility device use ended'
     3 = '3 months since mobility device use ended'
     4 = '4 months since mobility device use ended'
     5 = '5 months since mobility device use ended'
     6 = '6 months since mobility device use ended'
     7 = '7 months since mobility device use ended'
     8 = '8 months since mobility device use ended'
     9 = '9 months since mobility device use ended'
    10 = '10 months since mobility device use ended'
    11 = '11 months since mobility device use ended'
    -7 = '-7 no use last month and RF number of months since device use ended'
    -8 = '-8 no use last month and DK number of months since device use ended'
    -1 = '-1 Inapplicable '
        -2 = '-2 Not asked of continuing sample' ;
     VALUE DMDHLPYR
     1 = " 1 No mobility help in last year/since last interview"
     2 = " 2 Mobility help in last year/since last interview"
    -7 = " -7 RF"
    -8 = " -8 DK"
    -1 = " -1 Inapplicable "
                -2 = '-2 Not asked of continuing sample' ;

     VALUE DMDHLPST
      0 = '0 less than 1 month of help'
      1 = '1 month of help'
      2 = '2 months of help'
      3 = '3 months of help'
      4 = '4 months of help'
      5 = '5 months of help'
      6 = '6 months of help'
      7 = '7 months of help'
      8 = '8 months of help'
      9 = '9 months of help'
     10 = '10 months of help'
     11 = '11 months of help'
     -7 = '-7 help last month but RF number of months of help in year'
     -8 = '-8 help last month but DK number of months of help in year'
    -1 = " -1 Inapplicable "
    -2 = " -2 Not asked of continuing sample ";
     VALUE DMDHLPEN
      0 = '0 less than 1 month since help ended'
      1 = '1 month since help ended'
      2 = '2 months since help ended'
      3 = '3 months since help ended'
      4 = '4 months since help ended'
      5 = '5 months since help ended'
      6 = '6 months since help ended'
      7 = '7 months since help ended'
      8 = '8 months since help ended'
      9 = '9 months since help ended'
     10 = '10 months since help ended'
     11 = '11 months since help ended'
     -7 = '-7 no help last month and RF number of months since help ended'
     -8 = '-8 no help last month and DK number of months since help ended'
     -1 = '-1 Inapplicable '
    -2 = '-2 Not asked of continuing sample';
    VALUE DMHLPYRS
     0   = '0 none or less than 1 year'
     997 = '997 since birth'
     -7  = '-7 RF'
     -8  = '-8 DK'
     -1  = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample'
    -9  = '-9 Missing';
    VALUE DSDHLPYR
    1 = ' 1 No self care help in last year/since last interview'
    2 = ' 2 Self care help in last year/since last interview'
   -1 = '-1 Inapplicable'
   -7 = '-7 DK'
   -8 = '-8 RF'
   -9 = '-9 Missing';
    VALUE DSHLPND
                0 = ' 0 Between 11 and 12 months since self care help ended'
                1 = '1 Month since self care help ended'
                2 = '2 Months since self care help ended'
                3 = '3 Months since self care help ended'
                4 = '4 Months since self care help ended'
                5 = '5 Months since self care help ended'
                6 = '6 Months since self care help ended'
                7 = '7 Months since self care help ended'
                8 = '8 Months since self care help ended'
                9 = '9 Months since self care help ended'
                10 = '10 Months since self care help ended'
                11 = '11 Months since self care help ended'
        -7 = '-7 No help last month and RF number of months since help ended'
        -8 = '-8 No help last month and DK number of months since help ended'
        -1 = '-1 Inapplicable'
                -2 = '-2 Not asked of continuing sample'
        -9 = '-9 Missing'    ;

    VALUE DSHLPYRS
         0 = ' 0 None or less than 1 year of self care help'
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
                -2 = '-2 Not asked of continuing sample'
        -9 = '-9 Missing'
             997 = '997 since birth';
        VALUE SP5RH7W
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
        -9 = '-9 Missing'
                1 = "1 As an overnight patient in a hospital, nursing home, or rehab facility"
                2 = "2 At an outpatient center, clinic, or doctors office or therapists office"
        3 = "3 At home"
        4 = "4 Somewhere else"  ;
        VALUE SP5LF5W
        -7 = '-7 RF'
        -8 = '-8 DK'
        -1 = '-1 Inapplicable'
        -9 = '-9 Missing'
        997 = "997 Number of hours vary each week"  ;

      VALUE  DMH_GRP
            1 = "1 Help started"
            2 = "2 Help ended"
            3 = "3 Help both interviews with gap"
            4 = "4 Help both interviews with no gap"
            5 = "5 Help between interviews only"
            6 = "6 No help either interview or between"
           11 = "11 Help started (month started missing)"
           21 = "21 Help ended (month ended missing)"
           41 = "41 Help both interviews (DK whether gap)"
           61 = "61 No help either interview (DK whether help between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 ="-3 Not asked of new sample"
         -999 = "-999 Not determined" ;

        VALUE  DMU_GRP
            1 = "1 Use started"
            2 = "2 Use ended"
            3 = "3 Use both interviews with gap"
            4 = "4 Use both interviews with no gap"
            5 = "5 Use between interviews only "
            6 = "6 No use either interview or between"
           11 = "11 Use started (month started missing)"
           21 = "21 Use ended (month ended missing)"
           41 = "41 Use both interviews (DK whether gap)"
           61 = "61 No use either interview (DK whether use between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 = "-3 Not asked of new sample"
         -999 = "-999 Not determined" ;

                VALUE  DMDS5FLG
            -1 = "-1 Inapplicable"
                        -3 = "-3 Not asked of new sample"
             0 = "0 No current SP interview"
             1 = "1 No SP interview last round"
             2 = "2 Died and month death missing"
             3 = "3 Died <=1 month after last interview"
             4 = "4 Died 12-13 months after last interview"
             7 = "7 Skipped 1 or more help questions" ;
                VALUE  DS_GRP
            1 = "1 Help started"
            2 = "2 Help ended"
            3 = "3 Help both interviews with gap"
            4 = "4 Help both interviews with no gap"
            5 = "5 Help between interviews only"
            6 = "6 No help either interview or between"
           11 = "11 Help started (month started missing)"
           21 = "21 Help ended (month ended missing)"
           41 = "41 Help both interviews (DK whether gap)"
           61 = "61 No help either interview (DK whether help between)"
           -9 = "-9 Missing"
           -1 = "-1 Inapplicable"
                   -3 = "-3 Not asked of new sample"
         -999 = "-999 Not determined" ;


                   value groupmo 1 = "1 Started"
                         2 = "2 Ended"
                     3 = "3 Both times with gap"
                     4 = "4 Both times no gap"
                         5 = "5 Between only (end missing)"
                     6 = "6 Neither time AND not between"
                    11 = "11 Started (start missing)"
                    21 = "21 Ended (end missing)"
                    41 = "41 Both times (gap missing)"
                    61 = "61 Neither time (between missing)"
                                -1= "-1 Inapplicable"
                                        -3="-3 Not asked of new sample"
                          -7= "-7 RF"
                          -8= "-8 DK"
                          -9= "-9 Missing"
                  -999 = "-999 Not determined"
                   -99 = "-99 Partial" ;

                        VALUE nw_mths  0 = "0 Less than 1 month"
             1 ="1 month"
             2 ="2 months"
             3 ="3 months"
             4 ="4 months"
             5 ="5 months"
             6 ="6 months"
             7 ="7 months"
             8 ="8 months"
             9 ="9 months"
             10= "10 months"
             11= "11 months"
             12= "12 months"
             13= "13 months"
             14= "14 months"
             15= "15 months"
             16= "16 months"
             17= "17 months"
             18= "18 months"
             19= "19 months"
             20= "20 months"
             90= "90 Last round disputed"
             999= "999 No months"
             -1= "-1 Inapplicable"
                         -3="-3 Not asked of new sample"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing"
             -10= "-10 Not ascertained"
             -12= "-12 Outside of range (greater than months between interviews)"
             -13= "-13 None"
             -999= "-999 Not determined"
             -99= "-99 Partial";
                        VALUE chntinhh
             1 ="1 Yes, not in household"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";
                Value d4mssadd
-1='-1 Inapplicable'
 0='0 no flags and added at undetermined section'
 1='1 no flags and added at CL section'
 2='2 no flags and added at DT section'
 3='3 no flags and added at EW section'
 4='4 no flags and added at HA section'
 5='5 no flags and added at HO section'
 6='6 no flags and added at MC section'
 7='7 no flags and added at MO section'
 8='8 no flags and added at PA section'
 9='9 no flags and added at PE section'
10='10 no flags and added at SC section'
11='11 no flags and added at SN section'
12='12 no flags and added at CS section'
13='13 no flags and added at HH section'
14='14 no flags and added at IS section'
15='15 no flags and added at HL section'
16='16 no flags and added at SL section';
                VALUE HA5DWHL
                        1 = "1 Meals on wheels last month"
                        -1 = "-1 Inapplicable";
                VALUE HA5DTKO
                        1 = "1 Restaurant or take out last month"
                        -1 = "-1 Inapplicable";
                VALUE RE5BLDG
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
VALUE S000163W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 SOCIALIZE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";

  VALUE S000164W
    1 = "1 SOCIALIZE MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
             -1= "-1 Inapplicable"
             -7= "-7 RF"
             -8= "-8 DK"
             -9= "-9 Missing";

  VALUE S000165W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000166W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000167W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000168W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000169W
    1 = "1 SOCIALIZING MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000170W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 SOCIALIZING MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000171W
    1 = "1 PRIVACY MORE IMPORTANT"
    2 = "2 HAVING CHOICES MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000172W
    1 = "1 HAVING CHOICES MORE IMPORTANT"
    2 = "2 PRIVACY MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000173W
    1 = "1 SOCIALIZING MORE IMPORTANT"
    2 = "2 BEING SAFE MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000174W
    1 = "1 BEING SAFE MORE IMPORTANT"
    2 = "2 SOCIALIZING MORE IMPORTANT"
    3 = "3 BOTH IMPORTANT/CANT CHOOSE/DONT KNOW"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000175W
    1 = "1 LESS THAN 1 HOUR"
    2 = "2 MORE THAN 1 HOUR"
    3 = "3 ABOUT 1 HOUR"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing"  ;

  VALUE S000176W
    1 = "1 LESS THAN 15 MINUTES"
    2 = "2 15 MINUTES"
    3 = "3 BETWEEN 15 AND 30 MINUTES"
    4 = "4 30 MINUTES"
    5 = "5 BETWEEN 30 AND 45 MINUTES"
    6 = "6 45 MINUTES"
    7 = "7 BETWEEN 45 AND 60 MINUTES"
    -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

  VALUE S000177W
    1 = "1 ABOUT 1  HOURS"
    2 = "2 ABOUT 2 HOURS"
    3 = "3 ABOUT 3 HOURS"
    4 = "4 ABOUT 4 HOURS"
    5 = "5 ABOUT 5 HOURS"
    6 = "6 6 OR MORE HOURS"
   -1= "-1 Inapplicable"
   -7= "-7 RF"
   -8= "-8 DK"
   -9= "-9 Missing" ;

     VALUE W600001W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 STRONGLY AGREE"
    2 = "2 AGREE"
    3 = "3 DISAGREE"
        4 = "4 STRONGLY DISAGREE";
     VALUE W600002W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    0 = "0 NONE"
    1 = "1 1-2"
    2 = "2 3-5"
    3 = "3 6-10"
    4 = "4 11-15"
    5 = "5 16-20"
    6 = "6 MORE THAN 20";
     VALUE W600003W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 A (picture showing 4 pills)"
    2 = "2 B (picture showing 8 pills)"
    3 = "3 C (picture showing 12 pills)"
    4 = "4 D (picture showing 16 pills)"
    5 = "5 E (picture showing 20 pills)"
    6 = "6 F (picture showing 24 pills)";

          VALUE YNF
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Inapplicable'
   -9 = '-9 Missing'
    1 = "1 Yes"
    2 = "2 No";
          VALUE FQ6DLOCA
        1 = "1 Independent Living"
    2 = "2 Assisted Living"
    3 = "3 Special Care Unit"
    4 = "4 Nursing home"
        -8 = "-8 Not reported"
        -1 = "-1 Inapplicable";
           VALUE R6DRES1A
    1 = '1 Community'
    2 = '2 Residential Care'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
                        VALUE SP30023W
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
                        VALUE RE5BLDG
             -7 = '-7 RF'
             -8 = '-8 DK'
             -1 = '-1 Inapplicable'
             -9 = '-9 Missing'
              1 = "1 Building has one floor"
              2 = "2 Building has multiple floors"   ;
         VALUE WORDRECC
        -1 = '-1 Inapplicable'
        -2 = '-2 Proxy says cannot ask SP'
        -3 = '-3 Proxy says can ask SP but SP unable to answer'
        -7 = '-7 SP refused activity'
        -9 = '-9 Missing';
            VALUE OLDMTHS
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
            VALUE MONTHS
    -7 = '-7 RF'
    -8 = '-8 DK'
    -1 = '-1 Inapplicable'
    -9 = '-9 Missing';
                        VALUE  FLAGS
            -1 = "-1 Inapplicable"
                        -3 = "-3 Not asked of new sample"
             0 = "0 No current SP interview"
             1 = "1 No SP interview last round"
             2 = "2 Died and month death missing"
             3 = "3 Died <=1 month after last interview"
             4 = "4 Died 12-13 months after last interview"
             7 = "7 Skipped 1 or more help questions" ;
    VALUE DMDEVUSE
     0   = '0 none or less than 1 year'
     997 = '997 since birth'
     -7  = '-7 RF'
     -8  = '-8 DK'
     -1  = '-1 Inapplicable '
     -2 = '-2 Not asked of continuing sample'
    -9  = '-9 Missing';
    VALUE SPPB_MISSING
       -7 = '-7 RF'
   -8 = '-8 DK'
   -9 = '-9 Missing'
    -1="-1 Inapplicable"
    1="1 Proxy interview"
    2="2 Missing walk and repeat chair and balance"
    3="3 Missing walk and repeat chair"
    4="4 Missing walk and balance"
    5="5 Missing repeat chair and balance"
    6="6 Missing walk"
    7="7 Missing repeat chair"
    8="8 Missing balance"
    9="9 No space"
    10="10 No chair"
    11="11 No space walk and no chair"
    12="12 No space walk and non-safety missing"
    13="13 No chair and non-safety missing"
    14="14 Non-safety walk"
    15="15 Non-safety chair"
    16="16 Non-safety balance"
    17="17 Non-safety walk and chair"
    18="18 Non-safety walk and balance"
    19="19 Non-safety chair and balance"
    20="20 Non-safety walk and chair and balance";
  VALUE W700BC2W
   -7 = '-7 RF'
   -8 = '-8 DK'
   -1 = '-1 Ineligible'
   -9 = '-9 Missing'
    1 = "1 Eligible and consented"
    2 = "2 Eligible and did not consent"
    3 = "3 Ineligible, proxy respondent";
run;
/* Section #2 - Input statement with variable name and location on the .txt file
                Reminder - change  to reflect your file locations       */
Data spfile;
INFILE  "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS\NHATS_Round_7_SP_File.txt"
LRECL=4674 ;
INPUT @1 spid 8.
@9 r7dlmlint 2.
@11 r7dresid 2.
@13 r6dresid 2.
@15 r5dresid 2.
@17 r4dresid 2.
@19 r3dresid 2.
@21 r2dresid 2.
@23 r1dresid 2.
@25 r7dresidlml 2.
@27 r5dcontnew 2.
@29 r7breakoffst 8.
@37 r7breakoffqt $8.
@45 is7resptype 2.
@47 is7reasnprx1 2.
@49 is7reasnprx2 2.
@51 is7reasnprx3 2.
@53 is7reasnprx4 2.
@55 is7reasnprx5 2.
@57 is7reasnprx6 2.
@59 is7reasnprx7 2.
@61 is7reasnprx9 2.
@63 is7tempres 2.
@65 is7prxyrelat 2.
@67 is7prxygendr 2.
@69 is7famrrutin 2.
@71 is7proxlivsp 2.
@73 r5dgender 2.
@75 rl5dracehisp 2.
@77 r7d2intvrage 3.
@80 is7dproxyid $3.
@83 fl7spdied 2.
@85 re7spadrsnew 2.
@87 re7intplace 2.
@89 re7newstrct 2.
@91 re7newblgfl 2.
@93 re7mthmove 2.
@95 re7yearmove 4.
@99 re7placedec 2.
@101 re7alonedec 2.
@103 re7dresistrct 2.
@105 re7dbldg 2.
@107 re7dcensdiv 2.
@109 re7dresnew 2.
@111 fl7structure 2.
@113 fl7resnew 2.
@115 fl7facility 2.
@117 fl7hotype 2.
@119 fl7retirecom 2.
@121 pd7placedied 2.
@123 pd7homedied 2.
@125 pd7hospdied 2.
@127 pd7hospice1 2.
@129 pd7hospice2 2.
@131 pd7stayunit 2.
@133 pd7staydays 3.
@136 pd7staywks 2.
@138 pd7staymths 2.
@140 pd7stayyrs 2.
@142 pd7staymthpl 2.
@144 pd7placepre 2.
@146 pd7hospcelml 2.
@148 pd7alert 2.
@150 pd7outbed 2.
@152 r7d2deathage 3.
@155 fl7notalert 2.
@157 fl7notmobile 2.
@159 lm7pain 2.
@161 lm7painhlp 2.
@163 lm7painhlpam 2.
@165 lm7bre 2.
@167 lm7brehlp 2.
@169 lm7brehlpam 2.
@171 lm7sad 2.
@173 lm7sadhlp 2.
@175 lm7sadhlpam 2.
@177 lm7caredecis 2.
@179 lm7carenowan 2.
@181 lm7perscare 2.
@183 lm7respect 2.
@185 lm7informed 2.
@187 lm7doctor 2.
@189 lm7docclear 2.
@191 lm7relg 2.
@193 lm7relgamt 2.
@195 lm7ratecare 2.
@197 hc7health 2.
@199 hc7disescn1 2.
@201 hc7disescn2 2.
@203 hc7disescn3 2.
@205 hc7disescn4 2.
@207 hc7disescn5 2.
@209 hc7disescn6 2.
@211 hc7disescn7 2.
@213 hc7disescn8 2.
@215 hc7disescn9 2.
@217 hc7disescn10 2.
@219 hc7cancerty1 2.
@221 hc7brokebon1 2.
@223 hc7brokebon2 2.
@225 hc7hosptstay 2.
@227 hc7hosovrnht 3.
@230 hc7knesrgyr 2.
@232 hc7hipsrgyr 2.
@234 hc7catrsrgyr 2.
@236 hc7backsrgyr 2.
@238 hc7hartsrgyr 2.
@240 hc7fllsinmth 2.
@242 hc7worryfall 2.
@244 hc7worrylimt 2.
@246 hc7faleninyr 2.
@248 hc7multifall 2.
@250 hc7depresan1 2.
@252 hc7depresan2 2.
@254 hc7depresan3 2.
@256 hc7depresan4 2.
@258 hc7aslep30mn 2.
@260 hc7trbfalbck 2.
@262 hc7sleepmed 2.
@264 ht7placedesc 2.
@266 ht7retiresen 2.
@268 ht7diffareun 2.
@270 ht7helpmedbd 2.
@272 ht7meals 2.
@274 ht7spacename 2.
@276 se7servcoff1 2.
@278 se7servcoff2 2.
@280 se7servcoff3 2.
@282 se7servcoff4 2.
@284 se7servcoff5 2.
@286 se7servcoff6 2.
@288 se7servcoff7 2.
@290 se7servcoff10 2.
@292 se7servcoff11 2.
@294 se7servcoff8 2.
@296 se7servcoff9 2.
@298 se7servcoff12 2.
@300 se7servcoff13 2.
@302 se7servused1 2.
@304 se7servused2 2.
@306 se7servused3 2.
@308 se7servused4 2.
@310 se7servused5 2.
@312 se7servused6 2.
@314 se7servused7 2.
@316 se7servused10 2.
@318 se7servused11 2.
@320 se7servused8 2.
@322 se7servused9 2.
@324 se7servused12 2.
@326 se7servused13 2.
@328 se7payservi1 2.
@330 se7payservi2 2.
@332 se7payservi3 2.
@334 se7payservi4 2.
@336 se7payservi5 2.
@338 se7payservi6 2.
@340 se7payservi7 2.
@342 se7payservi10 2.
@344 se7payservi11 2.
@346 se7payservi8 2.
@348 se7payservi9 2.
@350 se7payservi12 2.
@352 se7payservi13 2.
@354 hh7marchange 2.
@356 hh7martlstat 2.
@358 hh7dmarstat 2.
@360 hh7yrendmarr 4.
@364 hh7newspoprt 2.
@366 hh7spgender 2.
@368 hh7dspageall 2.
@370 hh7spouseduc 2.
@372 hh7spoupchlp 2.
@374 hh7livwthspo 2.
@376 hh7placekind 2.
@381 hh7dlvngarrg 2.
@383 hh7dhshldnum 2.
@385 hh7dhshldchd 2.
@387 hh7dspouseid $3.
@390 cs7sistrsnum 2.
@392 cs7brthrsnum 2.
@394 cs7dnumchild 2.
@396 cs7dnmstpchd 2.
@398 cs7dnumdaugh 2.
@400 cs7dnumson 2.
@402 sn7dnumsn 2.
@404 fl7noonetalk 2.
@406 ho7entrstair 2.
@408 ho7entrccomn 2.
@410 ho7entrnramp 2.
@412 ho7bldgamen1 2.
@414 ho7bldgamen2 2.
@416 ho7bldgamen3 2.
@418 ho7bldgamen4 2.
@420 ho7levelsflr 2.
@422 ho7homeamen1 2.
@424 ho7homeamen2 2.
@426 ho7homeamen3 2.
@428 ho7bathprivt 2.
@430 ho7bathamen1 2.
@432 ho7bathamen2 2.
@434 ho7bathamen3 2.
@436 ho7bathamen4 2.
@438 ho7bathamen5 2.
@440 ho7bathamen6 2.
@442 ho7bathamen7 2.
@444 ho7kitchnprv 2.
@446 ho7kitchncom 2.
@448 ho7microwave 2.
@450 ho7dbldg1 2.
@452 ho7dbldg2 2.
@454 ho7dbldg3 2.
@456 ho7dbldg4 2.
@458 ho7dbathprvt 2.
@460 ho7dkitchnpr 2.
@462 ho7dkitchnco 2.
@464 fl7bathgrbbr 2.
@466 fl7bathseat 2.
@468 fl7raisedtlt 2.
@470 fl7tltgrbbr 2.
@472 em7modhere1 2.
@474 em7addlstyr1 2.
@476 em7addlstyr2 2.
@478 em7addlstyr3 2.
@480 em7addlstyr4 2.
@482 em7addlstyr5 2.
@484 em7addlstyr6 2.
@486 em7addlstyr7 2.
@488 em7payyufam1 2.
@490 em7payyufam2 2.
@492 em7payyufam3 2.
@494 em7payyufam4 2.
@496 em7payyufam5 2.
@498 em7payyufam6 2.
@500 em7payyufam7 2.
@502 em7paydevce1 2.
@504 em7paydevce2 2.
@506 em7paydevce3 2.
@508 em7paydevce4 2.
@510 em7paydevce5 2.
@512 em7paydevce6 2.
@514 em7paydevce7 2.
@516 em7paydevce8 2.
@518 em7paydevce9 2.
@520 em7payaltgth 2.
@522 em7morls1000 2.
@524 em7morls100 2.
@526 cm7knowwell 2.
@528 cm7willnghlp 2.
@530 cm7peoptrstd 2.
@532 te7cellphone 2.
@534 te7othrphone 2.
@536 te7computer 2.
@538 te7compoth 2.
@540 te7tablet 2.
@542 te7emailtext 2.
@544 te7oftnemail 2.
@546 te7online 2.
@548 te7shoponli1 2.
@550 te7shoponli2 2.
@552 te7shoponli3 2.
@554 te7socialnet 2.
@556 te7intrntmd1 2.
@558 te7intrntmd2 2.
@560 te7intrntmd3 2.
@562 md7canewlker 2.
@564 md7cane 2.
@566 md7walker 2.
@568 md7wheelchar 2.
@570 md7whelcrspc 2.
@572 md7scooter 2.
@574 md7scterinsp 2.
@576 fl7cane 2.
@578 fl7walker 2.
@580 fl7wheelchr 2.
@582 fl7whlchrhom 2.
@584 fl7scooter 2.
@586 fl7scooterhm 2.
@588 ss7heringaid 2.
@590 ss7hearphone 2.
@592 ss7convwradi 2.
@594 ss7convquiet 2.
@596 ss7glasseswr 2.
@598 ss7seewellst 2.
@600 ss7seestvgls 2.
@602 ss7glasscls 2.
@604 ss7othvisaid 2.
@606 ss7glrednewp 2.
@608 ss7probchswl 2.
@610 ss7probspeak 2.
@612 ss7painbothr 2.
@614 ss7painlimts 2.
@616 ss7painmedof 2.
@618 ss7painwhe1 2.
@620 ss7painwhe2 2.
@622 ss7painwhe3 2.
@624 ss7painwhe4 2.
@626 ss7painwhe5 2.
@628 ss7painwhe6 2.
@630 ss7painwhe7 2.
@632 ss7painwhe8 2.
@634 ss7painwhe9 2.
@636 ss7painwhe10 2.
@638 ss7painwhe11 2.
@640 ss7painwhe12 2.
@642 ss7painwhe13 2.
@644 ss7probbreat 2.
@646 ss7prbbrlimt 2.
@648 ss7strnglmup 2.
@650 ss7uplimtact 2.
@652 ss7lwrbodstr 2.
@654 ss7lwrbodimp 2.
@656 ss7lowenergy 2.
@658 ss7loenlmtat 2.
@660 ss7prbbalcrd 2.
@662 ss7prbbalcnt 2.
@664 fl7deaf 2.
@666 fl7blind 2.
@668 pc7walk6blks 2.
@670 pc7walk3blks 2.
@672 pc7up20stair 2.
@674 pc7up10stair 2.
@676 pc7car20pnds 2.
@678 pc7car10pnds 2.
@680 pc7geonknees 2.
@682 pc7bendover 2.
@684 pc7hvobovrhd 2.
@686 pc7rechovrhd 2.
@688 pc7opnjarwhd 2.
@690 pc7grspsmobj 2.
@692 cp7memrygood 2.
@694 cp7knownspyr 2.
@696 cp7chgthink1 2.
@698 cp7chgthink2 2.
@700 cp7chgthink3 2.
@702 cp7chgthink4 2.
@704 cp7chgthink5 2.
@706 cp7chgthink6 2.
@708 cp7chgthink7 2.
@710 cp7chgthink8 2.
@712 cp7memcogpr1 2.
@714 cp7memcogpr2 2.
@716 cp7memcogpr3 2.
@718 cp7memcogpr4 2.
@720 cp7dad8dem 2.
@722 cg7speaktosp 2.
@724 cg7quesremem 2.
@726 cg7reascano1 2.
@728 cg7reascano2 2.
@730 cg7reascano3 2.
@732 cg7reascano4 2.
@734 cg7reascano5 2.
@736 cg7reascano6 2.
@738 cg7reascano7 2.
@740 cg7reascano8 2.
@742 cg7reascano9 2.
@744 cg7ratememry 2.
@746 cg7ofmemprob 2.
@748 cg7memcom1yr 2.
@750 cg7todaydat1 2.
@752 cg7todaydat2 2.
@754 cg7todaydat3 2.
@756 cg7todaydat5 2.
@758 cg7todaydat4 2.
@760 cg7todaydat6 2.
@762 cg7prewrdrcl 2.
@764 cg7dwrdlstnm 2.
@766 cg7wrdsrcal1 2.
@768 cg7wrdsrcal2 2.
@770 cg7wrdsrcal3 2.
@772 cg7wrdsrcal4 2.
@774 cg7wrdsrcal5 2.
@776 cg7wrdsrcal6 2.
@778 cg7wrdsrcal7 2.
@780 cg7wrdsrcal8 2.
@782 cg7wrdsrcal9 2.
@784 cg7wrdsrcal10 2.
@786 cg7dwrdimmrc 2.
@788 cg7dwrdinone 2.
@790 cg7dwrdirref 2.
@792 cg7wrdsntlst 2.
@794 cg7numnotlst 2.
@796 cg7probreca1 2.
@798 cg7probreca2 2.
@800 cg7probreca3 2.
@802 cg7probreca4 2.
@804 cg7probreca5 2.
@806 cg7dclkdraw 2.
@808 cg7dclkimgcl 2.
@810 cg7atdrwclck 2.
@812 cg7presidna1 2.
@814 cg7presidna2 2.
@816 cg7presidna3 2.
@818 cg7presidna4 2.
@820 cg7vpname1 2.
@822 cg7vpname2 2.
@824 cg7vpname3 2.
@826 cg7vpname4 2.
@828 cg7wrdsdcal1 2.
@830 cg7wrdsdcal2 2.
@832 cg7wrdsdcal3 2.
@834 cg7wrdsdcal4 2.
@836 cg7wrdsdcal5 2.
@838 cg7wrdsdcal6 2.
@840 cg7wrdsdcal7 2.
@842 cg7wrdsdcal8 2.
@844 cg7wrdsdcal9 2.
@846 cg7wrdsdca10 2.
@848 cg7dwrddlyrc 2.
@850 cg7dwrddnone 2.
@852 cg7dwrddrref 2.
@854 cg7wrdnotlst 2.
@856 cg7numwrdnot 2.
@858 cg7dwrd1rcl 2.
@860 cg7dwrd2rcl 2.
@862 cg7dwrd3rcl 2.
@864 cg7dwrd4rcl 2.
@866 cg7dwrd5rcl 2.
@868 cg7dwrd6rcl 2.
@870 cg7dwrd7rcl 2.
@872 cg7dwrd8rcl 2.
@874 cg7dwrd9rcl 2.
@876 cg7dwrd10rcl 2.
@878 cg7dwrd1dly 2.
@880 cg7dwrd2dly 2.
@882 cg7dwrd3dly 2.
@884 cg7dwrd4dly 2.
@886 cg7dwrd5dly 2.
@888 cg7dwrd6dly 2.
@890 cg7dwrd7dly 2.
@892 cg7dwrd8dly 2.
@894 cg7dwrd9dly 2.
@896 cg7dwrd10dly 2.
@898 mo7outoft 2.
@900 mo7outcane 2.
@902 mo7outwalkr 2.
@904 mo7outwlchr 2.
@906 mo7outsctr 2.
@908 mo7outhlp 2.
@910 mo7outslf 2.
@912 mo7outdif 2.
@914 mo7outyrgo 2.
@916 mo7outwout 2.
@918 mo7oftgoarea 2.
@920 mo7oflvslepr 2.
@922 mo7insdcane 2.
@924 mo7insdwalkr 2.
@926 mo7insdwlchr 2.
@928 mo7insdsctr 2.
@930 mo7oftholdwl 2.
@932 mo7insdhlp 2.
@934 mo7insdslf 2.
@936 mo7insddif 2.
@938 mo7insdyrgo 2.
@940 mo7insdwout 2.
@942 mo7beddev 2.
@944 mo7bedhlp 2.
@946 mo7bedslf 2.
@948 mo7beddif 2.
@950 mo7bedwout 2.
@952 mo7doutsfdf 2.
@954 mo7doutdevi 2.
@956 mo7douthelp 2.
@958 mo7dinsdsfdf 2.
@960 mo7dinsddevi 2.
@962 mo7dinsdhelp 2.
@964 mo7dbedsfdf 2.
@966 mo7dbeddevi 2.
@968 mo7dbedhelp 2.
@970 fl7didntleav 2.
@972 fl7ntlvrmslp 2.
@974 dm7helpmobil 2.
@976 dm7helpstmo 2.
@978 dm7helpstyr 4.
@982 dm7helpendmo 2.
@984 dm7helpendyr 4.
@988 dm7nohelp 2.
@990 dm7nohelpmos 2.
@992 dm7lstyrcane 4.
@996 dm7devstmo 2.
@998 dm7devstyr 4.
@1002 dm7devendmo 2.
@1004 dm7devendyr 4.
@1008 dm7nodev 2.
@1010 dm7nodevmos 2.
@1012 dm7dmohlp 4.
@1016 dm7dmodev 4.
@1020 dm7dmohlpgr 4.
@1024 dm7dmodevgr 4.
@1028 dmds7dintvl 4.
@1032 dm7flag 2.
@1034 dt7driveyr 2.
@1036 dt7oftedrive 2.
@1038 dt7avoidriv1 2.
@1040 dt7avoidriv2 2.
@1042 dt7avoidriv3 2.
@1044 dt7avoidriv4 2.
@1046 dt7getoplcs1 2.
@1048 dt7getoplcs2 2.
@1050 dt7getoplcs3 2.
@1052 dt7getoplcs4 2.
@1054 dt7getoplcs5 2.
@1056 dt7getoplcs6 2.
@1058 dt7getoplcs7 2.
@1060 dt7otfrfamtk 2.
@1062 fl7drives 2.
@1064 fl7drvlstyr 2.
@1066 fl5dneverdrv 2.
@1068 ha7laun 2.
@1070 ha7launslf 2.
@1072 ha7whrmachi1 2.
@1074 ha7whrmachi2 2.
@1076 ha7whrmachi3 2.
@1078 ha7whrmachi4 2.
@1080 ha7whrmachi5 2.
@1082 ha7whrmachi6 2.
@1084 ha7dlaunreas 2.
@1086 ha7laundif 2.
@1088 ha7launoft 2.
@1090 ha7launwout 2.
@1092 ha7shop 2.
@1094 ha7shopslf 2.
@1096 ha7howpaygr1 2.
@1098 ha7howpaygr2 2.
@1100 ha7howpaygr3 2.
@1102 ha7howpaygr4 2.
@1104 ha7howpaygr5 2.
@1106 ha7howpaygr6 2.
@1108 ha7howpaygr7 2.
@1110 ha7howgtstr1 2.
@1112 ha7howgtstr2 2.
@1114 ha7howgtstr3 2.
@1116 ha7howgtstr4 2.
@1118 ha7howgtstr5 2.
@1120 ha7howgtstr6 2.
@1122 ha7howgtstr7 2.
@1124 ha7howgtstr8 2.
@1126 ha7shopcart 2.
@1128 ha7shoplean 2.
@1130 ha7dshopreas 2.
@1132 ha7shopdif 2.
@1134 ha7shopoft 2.
@1136 ha7shopwout 2.
@1138 ha7meal 2.
@1140 ha7mealslf 2.
@1142 ha7restamels 2.
@1144 ha7mealwheel 2.
@1146 ha7oftmicrow 2.
@1148 ha7dmealreas 2.
@1150 ha7mealdif 2.
@1152 ha7mealoft 2.
@1154 ha7mealwout 2.
@1156 ha7bank 2.
@1158 ha7bankslf 2.
@1160 ha7dbankreas 2.
@1162 ha7bankdif 2.
@1164 ha7bankoft 2.
@1166 ha7bankwout 2.
@1168 ha7money 2.
@1170 ha7moneyhlp 2.
@1172 ha7dlaunsfdf 2.
@1174 ha7dshopsfdf 2.
@1176 ha7dmealsfdf 2.
@1178 ha7dbanksfdf 2.
@1180 ha7dmealwhl 2.
@1182 ha7dmealtkot 2.
@1184 sc7eatdev 2.
@1186 sc7eatdevoft 2.
@1188 sc7eathlp 2.
@1190 sc7eatslfoft 2.
@1192 sc7eatslfdif 2.
@1194 sc7eatwout 2.
@1196 sc7showrbat1 2.
@1198 sc7showrbat2 2.
@1200 sc7showrbat3 2.
@1202 sc7bdevdec 2.
@1204 sc7prfrshbth 2.
@1206 sc7scusgrbrs 2.
@1208 sc7shtubseat 2.
@1210 sc7bathhlp 2.
@1212 sc7bathoft 2.
@1214 sc7bathdif 2.
@1216 sc7bathyrgo 2.
@1218 sc7bathwout 2.
@1220 sc7usvartoi1 2.
@1222 sc7usvartoi2 2.
@1224 sc7usvartoi3 2.
@1226 sc7usvartoi4 2.
@1228 sc7toilhlp 2.
@1230 sc7toiloft 2.
@1232 sc7toildif 2.
@1234 sc7toilwout 2.
@1236 sc7dresoft 2.
@1238 sc7dresdev 2.
@1240 sc7dreshlp 2.
@1242 sc7dresslf 2.
@1244 sc7dresdif 2.
@1246 sc7dresyrgo 2.
@1248 sc7dreswout 2.
@1250 sc7deatdevi 2.
@1252 sc7deathelp 2.
@1254 sc7deatsfdf 2.
@1256 sc7dbathdevi 2.
@1258 sc7dbathhelp 2.
@1260 sc7dbathsfdf 2.
@1262 sc7dtoildevi 2.
@1264 sc7dtoilhelp 2.
@1266 sc7dtoilsfdf 2.
@1268 sc7ddresdevi 2.
@1270 sc7ddreshelp 2.
@1272 sc7ddressfdf 2.
@1274 fl7showering 2.
@1276 fl7takingbth 2.
@1278 fl7washingup 2.
@1280 ds7gethlpeat 2.
@1282 ds7helpstmo 2.
@1284 ds7helpstyr 4.
@1288 ds7helpendmo 2.
@1290 ds7helpendyr 4.
@1294 ds7nohelp 2.
@1296 ds7nohelpmos 2.
@1298 ds7dschlp 4.
@1302 ds7dschlpgr 4.
@1306 ds7flag 2.
@1308 mc7meds 2.
@1310 mc7medstrk 2.
@1312 mc7medsslf 2.
@1314 mc7whrgtmed1 2.
@1316 mc7whrgtmed2 2.
@1318 mc7whrgtmed3 2.
@1320 mc7whrgtmed4 2.
@1322 mc7howpkupm1 2.
@1324 mc7howpkupm2 2.
@1326 mc7howpkupm3 2.
@1328 mc7medsrem 2.
@1330 mc7dmedsreas 2.
@1332 mc7medsdif 2.
@1334 mc7medsyrgo 2.
@1336 mc7medsmis 2.
@1338 mc7havregdoc 2.
@1340 mc7regdoclyr 2.
@1342 mc7hwgtregd1 2.
@1344 mc7hwgtregd2 2.
@1346 mc7hwgtregd3 2.
@1348 mc7hwgtregd4 2.
@1350 mc7hwgtregd5 2.
@1352 mc7hwgtregd6 2.
@1354 mc7hwgtregd7 2.
@1356 mc7hwgtregd8 2.
@1358 mc7hwgtregd9 2.
@1360 mc7ansitindr 2.
@1362 mc7tpersevr1 2.
@1364 mc7tpersevr2 2.
@1366 mc7tpersevr3 2.
@1368 mc7tpersevr4 2.
@1370 mc7chginspln 2.
@1372 mc7anhlpwdec 2.
@1374 mc7dmedssfdf 2.
@1376 pa7vistfrfam 2.
@1378 pa7hlkepfvst 2.
@1380 pa7trkpfrvis 2.
@1382 pa7impvstfam 2.
@1384 pa7attrelser 2.
@1386 pa7htkfrrlsr 2.
@1388 pa7trprrelsr 2.
@1390 pa7imprelser 2.
@1392 pa7clbmtgrac 2.
@1394 pa7hlkpfrclb 2.
@1396 pa7trprkpfgr 2.
@1398 pa7imparclub 2.
@1400 pa7outfrenjy 2.
@1402 pa7hlkpgoenj 2.
@1404 pa7trprgoout 2.
@1406 pa7impouteny 2.
@1408 pa7workfrpay 2.
@1410 pa7hlkpfrwrk 2.
@1412 pa7voltrwork 2.
@1414 pa7hlkpfrvol 2.
@1416 pa7prcranoth 2.
@1418 pa7evrgowalk 2.
@1420 pa7vigoractv 2.
@1422 pa7dofavact 2.
@1424 pa7fvactlimyr 2.
@1426 pa5dfavact 3.
@1429 rh7rehab 2.
@1431 rh7rehabmo 2.
@1433 rh7rehabweek 2.
@1435 rh7rehabsurg 2.
@1437 rh7surgcond 2.
@1439 rh7rehabcond 2.
@1441 rh7funcback 2.
@1443 rh7funchips 2.
@1445 rh7funcknees 2.
@1447 rh7funcfeet 2.
@1449 rh7funchands 2.
@1451 rh7funcwrist 2.
@1453 rh7funcshold 2.
@1455 rh7funchead 2.
@1457 rh7funcneck 2.
@1459 rh7funcarms 2.
@1461 rh7funclegs 2.
@1463 rh7funcstom 2.
@1465 rh7funcmouth 2.
@1467 rh7funcheart 2.
@1469 rh7funclung 2.
@1471 rh7funcos 2.
@1473 rh7funcnotsp 2.
@1475 rh7impchew 2.
@1477 rh7impspeak 2.
@1479 rh7impspain 2.
@1481 rh7impbreath 2.
@1483 rh7impweak 2.
@1485 rh7impmove 2.
@1487 rh7impenergy 2.
@1489 rh7impbal 2.
@1491 rh7impfall 2.
@1493 rh7impmemory 2.
@1495 rh7impnone 2.
@1497 rh7impbed 2.
@1499 rh7impwalk 2.
@1501 rh7impleave 2.
@1503 rh7impdistnc 2.
@1505 rh7impclimb 2.
@1507 rh7impdrive 2.
@1509 rh7imptransp 2.
@1511 rh7impnotths 2.
@1513 rh7impsc 2.
@1515 rh7imphh 2.
@1517 rh7impcomp 2.
@1519 rh7impwork 2.
@1521 rh7impcare 2.
@1523 rh7impactiv 2.
@1525 rh7impactnon 2.
@1527 rh7devcane 2.
@1529 rh7devwhlch 2.
@1531 rh7devramp 2.
@1533 rh7devstair 2.
@1535 rh7devtub 2.
@1537 rh7devtoil 2.
@1539 rh7deveat 2.
@1541 rh7devdres 2.
@1543 rh7devgrab 2.
@1545 rh7devcomp 2.
@1547 rh7devcar 2.
@1549 rh7devother 2.
@1551 rh7place1 2.
@1553 rh7place2 2.
@1555 rh7place3 2.
@1557 rh7place4 2.
@1559 rh7place5 2.
@1561 rh7placelast 2.
@1563 rh7ability 2.
@1565 rh7abilimp 2.
@1567 rh7abilworse 2.
@1569 rh7rehabnow 2.
@1571 rh7metgoals 2.
@1573 rh7metinsur 2.
@1575 rh7abilnow 2.
@1577 rh7nowimp 2.
@1579 rh7nowworse 2.
@1581 sd7smokesnow 2.
@1583 sd7numcigday 3.
@1586 pe7whhndsign 2.
@1588 pe7surghdwrt 2.
@1590 pe7surgyside 2.
@1592 pe7flruppain 2.
@1594 pe7sideflrup 2.
@1596 pe7surgarmsh 2.
@1598 pe7sidsurgar 2.
@1600 pe7surgyhips 2.
@1602 pe7sidhipsrg 2.
@1604 pe7stndwhold 2.
@1606 pe7upchbyslf 2.
@1608 pe7wlkdsself 2.
@1610 fl7lefthand 2.
@1612 fl7righthand 2.
@1614 fl7eiherhand 2.
@1616 fl7lftgrptst 2.
@1618 fl7rhtgrptst 2.
@1620 fl7charstnds 2.
@1622 fl7balstands 2.
@1624 fl7wlkingrse 2.
@1626 bc7dconsent 2.
@1628 ba7dblssadm 2.
@1630 ba7dblstadm 2.
@1632 ba7dblftadm 2.
@1634 ba7dblopadm 2.
@1636 ba7dblcladm 2.
@1638 wa7dwlkadm 2.
@1640 ch7dschradm 2.
@1642 ch7drchradm 2.
@1644 gr7dgripadm 2.
@1646 wc7dwaistadm 2.
@1648 pk7dpeakadm 2.
@1650 ab7datemonth 2.
@1652 ab7dateyear 4.
@1656 in7strtabhrs 4.
@1660 in7strtabmin 4.
@1664 in7strtmampm 2.
@1666 ba7sxsresult 2.
@1668 ba7blstdsecs 2.
@1670 ba7blstdhndr 2.
@1672 ba7rsn1ssstd 2.
@1674 ba7rsn2ssstd 2.
@1676 ba7rsn3ssstd 2.
@1678 ba7rsn4ssstd 2.
@1680 ba7rsn9ssstd 2.
@1682 ba7stdmreslt 2.
@1684 ba7stdmsecs 2.
@1686 ba7stdmhndr 2.
@1688 ba7rsn1ststd 2.
@1690 ba7rsn2ststd 2.
@1692 ba7rsn3ststd 2.
@1694 ba7rsn4ststd 2.
@1696 ba7rsn9ststd 2.
@1698 ba7ftdmreslt 2.
@1700 ba7ftdmsecs 2.
@1702 ba7ftdmhndr 2.
@1704 ba7rsn1ftstd 2.
@1706 ba7rsn2ftstd 2.
@1708 ba7rsn3ftstd 2.
@1710 ba7rsn4ftstd 2.
@1712 ba7rsn9ftstd 2.
@1714 ba71leoreslt 2.
@1716 ba71leosfsec 2.
@1718 ba71leohndr 2.
@1720 ba7rsn11leo 2.
@1722 ba7rsn21leo 2.
@1724 ba7rsn31leo 2.
@1726 ba7rsn41leo 2.
@1728 ba7rsn91leo 2.
@1730 ba71lecreslt 2.
@1732 ba71lecsfsec 2.
@1734 ba71lechndr 2.
@1736 ba7rsn11lec 2.
@1738 ba7rsn21lec 2.
@1740 ba7rsn31lec 2.
@1742 ba7rsn41lec 2.
@1744 ba7rsn91lec 2.
@1746 wa7wlkcorspc 2.
@1748 wa7wkaidused 2.
@1750 wa7wlkc1rslt 2.
@1752 wa7wlkc1secs 4.
@1756 wa7wlk1hndr 4.
@1760 wa7rsn11wkc 2.
@1762 wa7rsn21wkc 2.
@1764 wa7rsn31wkc 2.
@1766 wa7rsn41wkc 2.
@1768 wa7rsn51wkc 2.
@1770 wa7rsn91wkc 2.
@1772 wa7wkaidusc2 2.
@1774 wa7wlkc2rslt 2.
@1776 wa7wlkc2secs 4.
@1780 wa7wlk2hndr 4.
@1784 wa7rsn12wkc 2.
@1786 wa7rsn22wkc 2.
@1788 wa7rsn32wkc 2.
@1790 wa7rsn42wkc 2.
@1792 wa7rsn92wkc 2.
@1794 ch7chravail 2.
@1796 ch7chstcompl 2.
@1798 ch7chairheit 3.
@1801 ch7whlchrusd 2.
@1803 ch7sgchstres 2.
@1805 ch7armuse 2.
@1807 ch7rsn11chs 2.
@1809 ch7rsn21chs 2.
@1811 ch7rsn31chs 2.
@1813 ch7rsn41chs 2.
@1815 ch7rsn51chs 2.
@1817 ch7rsn91chs 2.
@1819 ch72chstrslt 2.
@1821 ch7chstndsec 2.
@1823 ch7chstdhndr 3.
@1826 ch7chstddone 2.
@1828 ch7chstntdn1 2.
@1830 ch7chstntdn2 2.
@1832 ch7chstntdn3 2.
@1834 ch7chstntdn4 2.
@1836 ch7chstntdn5 2.
@1838 ch7chstntdn9 2.
@1840 ch7chstntat1 2.
@1842 ch7chstntat2 2.
@1844 ch7chstntat3 2.
@1846 ch7chstntat4 2.
@1848 ch7chstntat9 2.
@1850 gr7handtstd1 2.
@1852 gr7adjgr1ps3 2.
@1854 gr7grp1reslt 2.
@1856 gr7grp1rdng 6.3
@1862 gr7grp1noat1 2.
@1864 gr7grp1noat2 2.
@1866 gr7grp1noat3 2.
@1868 gr7grp1noat4 2.
@1870 gr7grp1noat9 2.
@1872 gr7handtstd2 2.
@1874 gr7adjgr2ps3 2.
@1876 gr7grp2reslt 2.
@1878 gr7grp2rdng 6.3
@1884 gr7grp2noat1 2.
@1886 gr7grp2noat2 2.
@1888 gr7grp2noat3 2.
@1890 gr7grp2noat4 2.
@1892 gr7grp2noat9 2.
@1894 wc7measdiff1 2.
@1896 wc7measdiff2 2.
@1898 wc7measdiff3 2.
@1900 wc7measdiff4 2.
@1902 wc7measdiff5 2.
@1904 wc7measdiff6 2.
@1906 wc7measdiff9 2.
@1908 wc7waistrslt 4.
@1912 wc7wstmsrinc 4.
@1916 wc7wstmsrqrt 4.
@1920 wc7wstbulkcl 2.
@1922 wc7whomeasur 2.
@1924 wc7wstpostn 2.
@1926 wc7wstnotat1 2.
@1928 wc7wstnotat2 2.
@1930 wc7wstnotat3 2.
@1932 wc7wstnotat4 2.
@1934 wc7wstnotat5 2.
@1936 wc7wstnotat9 2.
@1938 pk7pkarf1pos 2.
@1940 pk7pkarfl1ef 2.
@1942 pk7pkarfl1rs 2.
@1944 pk7pkarfl1rd 3.
@1947 pk7pk1noatt1 2.
@1949 pk7pk1noatt2 2.
@1951 pk7pk1noatt3 2.
@1953 pk7pk1noatt4 2.
@1955 pk7pk1noatt9 2.
@1957 pk7paf2posit 2.
@1959 pk7pkarfl2ef 2.
@1961 pk7pkarfl2rs 2.
@1963 pk7pkarfl2rd 3.
@1966 pk7pk2noatt1 2.
@1968 pk7pk2noatt2 2.
@1970 pk7pk2noatt3 2.
@1972 pk7pk2noatt4 2.
@1974 pk7pk2noatt9 2.
@1976 cl7endtimhrs 2.
@1978 cl7endtimmin 4.
@1982 cl7endtmampm 2.
@1984 r7dnhatssppb 4.
@1988 r7dnhatsbasc 4.
@1992 r7dnhatswksc 4.
@1996 r7dnhatschsc 4.
@2000 r7dnhatsgrav 8.
@2008 r7dnhatsgrb 8.
@2016 r7dnhatspkav 8.
@2024 r7dnhatspkb 8.
@2032 r7dsppbmiss 2.
@2034 r7dorigsppb 2.
@2036 r7dorigbasc 2.
@2038 r7dorigwksc 2.
@2040 r7dorigchsc 2.
@2042 hw7currweigh 3.
@2045 hw7lst10pnds 2.
@2047 hw7trytolose 2.
@2049 hw7howtallft 2.
@2051 hw7howtallin 3.
@2054 el7mothalive 2.
@2056 el7fathalive 2.
@2058 wb7offelche1 2.
@2060 wb7offelche2 2.
@2062 wb7offelche3 2.
@2064 wb7offelche4 2.
@2066 wb7truestme1 2.
@2068 wb7truestme2 2.
@2070 wb7truestme3 2.
@2072 wb7truestme4 2.
@2074 wb7ageyofeel 3.
@2077 wb7agrwstmt1 2.
@2079 wb7agrwstmt2 2.
@2081 wb7agrwstmt3 2.
@2083 ip7covmedcad 2.
@2085 ip7otdrugcov 2.
@2087 ip7mgapmedsp 2.
@2089 ip7cmedicaid 2.
@2091 ip7covtricar 2.
@2093 ip7nginslast 2.
@2095 ip7nginsnurs 2.
@2097 ip7typcarco1 2.
@2099 ip7typcarco2 2.
@2101 ip7typcarco3 2.
@2103 ip7paypremms 8.
@2111 lf7workfpay 2.
@2113 lf7abstlstwk 2.
@2115 lf7wrkplstmn 2.
@2117 lf7mrthnonjb 2.
@2119 lf7hrswkwork 4.
@2123 lf7hrwrkltwk 4.
@2127 lf7hrwrklstw 4.
@2131 lf7oftpaid 2.
@2133 lf7doccup 4.
@2137 lf7huswifwrk 8.
@2145 hp7ownrentot 2.
@2147 hp7mrtpadoff 2.
@2149 hp7mthlymort 8.
@2157 hp7mortpaymt 8.
@2165 hp7whnpayoff 4.
@2169 hp7amtstlowe 8.
@2177 hp7amoutowed 8.
@2185 hp7homevalue 8.
@2193 hp7homvalamt 8.
@2201 hp7payrent 2.
@2203 hp7rentamt 8.
@2211 hp7rentamout 8.
@2219 hp7sec8pubsn 8.
@2227 ia7recsspa1 2.
@2229 ia7recsspa2 2.
@2231 ia7recsspa3 2.
@2233 ia7recssils1 2.
@2235 ia7recssils2 2.
@2237 ia7recssils3 2.
@2239 ia7rvapayls1 2.
@2241 ia7rvapayls2 2.
@2243 ia7rvapayls3 2.
@2245 ia7penjobou1 2.
@2247 ia7penjobou2 2.
@2249 ia7penjobou3 2.
@2251 ia7iraothac1 2.
@2253 ia7iraothac2 2.
@2255 ia7iraothac3 2.
@2257 ia7mutfdstk1 2.
@2259 ia7mutfdstk2 2.
@2261 ia7mutfdstk3 2.
@2263 ia7mutfdstk4 2.
@2265 ia7ownbond1 2.
@2267 ia7ownbond2 2.
@2269 ia7ownbond3 2.
@2271 ia7ownbond4 2.
@2273 ia7bnkacccd1 2.
@2275 ia7bnkacccd2 2.
@2277 ia7bnkacccd3 2.
@2279 ia7bnkacccd4 2.
@2281 ia7bnkacccd5 2.
@2283 ia7bnkacccd6 2.
@2285 ia7bnkacccd7 2.
@2287 ia7bnkacccd8 2.
@2289 ia7bnkacccd9 2.
@2291 ia7bnkaccc10 2.
@2293 ia7bnkaccc11 2.
@2295 ia7bnkaccc12 2.
@2297 ia7realestt1 2.
@2299 ia7realestt2 2.
@2301 ia7realestt3 2.
@2303 ia7realestt4 2.
@2305 ia7totinc 8.
@2313 ia7toincimf 2.
@2315 ia7toincim1 8.
@2323 ia7toincim2 8.
@2331 ia7toincim3 8.
@2339 ia7toincim4 8.
@2347 ia7toincim5 8.
@2355 ia7toincesjt 2.
@2357 ia7eincimjf 2.
@2359 ia7eincimj1 2.
@2361 ia7eincimj2 2.
@2363 ia7eincimj3 2.
@2365 ia7eincimj4 2.
@2367 ia7eincimj5 2.
@2369 ia7toincessg 2.
@2371 ia7eincimsf 2.
@2373 ia7eincims1 2.
@2375 ia7eincims2 2.
@2377 ia7eincims3 2.
@2379 ia7eincims4 2.
@2381 ia7eincims5 2.
@2383 ew7pycredbal 2.
@2385 ew7crecardeb 2.
@2387 ew7credcdmed 2.
@2389 ew7amtcrdmed 2.
@2391 ew7medpaovtm 2.
@2393 ew7ampadovrt 2.
@2395 ew7finhlpfam 2.
@2397 ew7whohelfi1 2.
@2399 ew7whohelfi2 2.
@2401 ew7atchhelyr 2.
@2403 ew7fingftfam 2.
@2405 ew7whregoth1 2.
@2407 ew7whregoth2 2.
@2409 ew7whregoth3 2.
@2411 ew7amthlpgiv 2.
@2413 ew7progneed1 2.
@2415 ew7progneed2 2.
@2417 ew7progneed3 2.
@2419 ew7mealskip1 2.
@2421 ew7mealskip2 2.
@2423 ew7nopayhous 2.
@2425 ew7nopayutil 2.
@2427 ew7nopaymed 2.
@2429 ir7intlang 2.
@2431 ir7spattitud 2.
@2433 ir7undrstand 2.
@2435 ir7sppresent 2.
@2437 ir7spnotprs1 2.
@2439 ir7spnotprs2 2.
@2441 ir7spnotprs3 2.
@2443 ir7spnotprs4 2.
@2445 ir7spnotprs5 2.
@2447 ir7spnotprs6 2.
@2449 ir7intvwhlp 2.
@2451 ir7prsnhlp1 2.
@2453 ir7prsnhlp2 2.
@2455 ir7prsnhlp3 2.
@2457 ir7prsnhlp4 2.
@2459 ir7prsnhlp5 2.
@2461 ir7prsnhlp6 2.
@2463 ir7prsnhlp91 2.
@2465 ir7demolang1 2.
@2467 ir7sessions 2.
@2469 ir7sessrsn1 2.
@2471 ir7sessrsn2 2.
@2473 ir7sessrsn3 2.
@2475 ir7sessrsn91 2.
@2477 ir7conhomapt 2.
@2479 ir7insidhome 2.
@2481 ir7condihom1 2.
@2483 ir7condihom2 2.
@2485 ir7condihom3 2.
@2487 ir7condihom4 2.
@2489 ir7condihom5 2.
@2491 ir7clutterr1 2.
@2493 ir7clutterr2 2.
@2495 ir7areacond1 2.
@2497 ir7areacond2 2.
@2499 ir7areacond3 2.
@2501 ir7condhome1 2.
@2503 ir7condhome2 2.
@2505 ir7condhome3 2.
@2507 ir7condhome4 2.
@2509 ir7condhome5 2.
@2511 ir7condhome6 2.
@2513 fq7dfacdescr 2.
@2515 fq7dosfacd 2.
@2517 fq7prtlivnam 2.
@2519 fq7dfacarea 2.
@2521 fq7dosfaca 2.
@2523 fq7assdnrsng 2.
@2525 fq7othrlevls 2.
@2527 fq7whotlevl1 2.
@2529 fq7whotlevl2 2.
@2531 fq7whotlevl3 2.
@2533 fq7whotlevl4 2.
@2535 fq7whotlevl5 2.
@2537 fq7servaval1 2.
@2539 fq7servaval2 2.
@2541 fq7servaval3 2.
@2543 fq7servaval4 2.
@2545 fq7servaval5 2.
@2547 fq7servaval6 2.
@2549 fq7servaval7 2.
@2551 fq7servaval10 2.
@2553 fq7servaval11 2.
@2555 fq7servaval8 2.
@2557 fq7servaval9 2.
@2559 fq7servaval12 2.
@2561 fq7servaval13 2.
@2563 fq7paysourc1 6.
@2569 fq7paysourc2 6.
@2575 fq7paysourc3 6.
@2581 fq7paysourc4 6.
@2587 fq7paysourc5 6.
@2593 fq7paysourc6 6.
@2599 fq7totalpaym 8.
@2607 fq7mnthlyamt 5.
@2612 fq7primpayer 2.
@2614 fq7govsource 2.
@2616 fq7dlocsp 2.
@2618 w7anfinwgt0 18.11
@2636 w7anfinwgt1 18.11
@2654 w7anfinwgt2 18.11
@2672 w7anfinwgt3 18.11
@2690 w7anfinwgt4 18.11
@2708 w7anfinwgt5 18.11
@2726 w7anfinwgt6 18.11
@2744 w7anfinwgt7 18.11
@2762 w7anfinwgt8 18.11
@2780 w7anfinwgt9 18.11
@2798 w7anfinwgt10 18.11
@2816 w7anfinwgt11 18.11
@2834 w7anfinwgt12 18.11
@2852 w7anfinwgt13 18.11
@2870 w7anfinwgt14 18.11
@2888 w7anfinwgt15 18.11
@2906 w7anfinwgt16 18.11
@2924 w7anfinwgt17 18.11
@2942 w7anfinwgt18 18.11
@2960 w7anfinwgt19 18.11
@2978 w7anfinwgt20 18.11
@2996 w7anfinwgt21 18.11
@3014 w7anfinwgt22 18.11
@3032 w7anfinwgt23 18.11
@3050 w7anfinwgt24 18.11
@3068 w7anfinwgt25 18.11
@3086 w7anfinwgt26 18.11
@3104 w7anfinwgt27 18.11
@3122 w7anfinwgt28 18.11
@3140 w7anfinwgt29 18.11
@3158 w7anfinwgt30 18.11
@3176 w7anfinwgt31 18.11
@3194 w7anfinwgt32 18.11
@3212 w7anfinwgt33 18.11
@3230 w7anfinwgt34 18.11
@3248 w7anfinwgt35 18.11
@3266 w7anfinwgt36 18.11
@3284 w7anfinwgt37 18.11
@3302 w7anfinwgt38 18.11
@3320 w7anfinwgt39 18.11
@3338 w7anfinwgt40 18.11
@3356 w7anfinwgt41 18.11
@3374 w7anfinwgt42 18.11
@3392 w7anfinwgt43 18.11
@3410 w7anfinwgt44 18.11
@3428 w7anfinwgt45 18.11
@3446 w7anfinwgt46 18.11
@3464 w7anfinwgt47 18.11
@3482 w7anfinwgt48 18.11
@3500 w7anfinwgt49 18.11
@3518 w7anfinwgt50 18.11
@3536 w7anfinwgt51 18.11
@3554 w7anfinwgt52 18.11
@3572 w7anfinwgt53 18.11
@3590 w7anfinwgt54 18.11
@3608 w7anfinwgt55 18.11
@3626 w7anfinwgt56 18.11
@3644 w7an2011wgt0 18.11
@3662 w7an2011wgt1 18.11
@3680 w7an2011wgt2 18.11
@3698 w7an2011wgt3 18.11
@3716 w7an2011wgt4 18.11
@3734 w7an2011wgt5 18.11
@3752 w7an2011wgt6 18.11
@3770 w7an2011wgt7 18.11
@3788 w7an2011wgt8 18.11
@3806 w7an2011wgt9 18.11
@3824 w7an2011wgt10 18.11
@3842 w7an2011wgt11 18.11
@3860 w7an2011wgt12 18.11
@3878 w7an2011wgt13 18.11
@3896 w7an2011wgt14 18.11
@3914 w7an2011wgt15 18.11
@3932 w7an2011wgt16 18.11
@3950 w7an2011wgt17 18.11
@3968 w7an2011wgt18 18.11
@3986 w7an2011wgt19 18.11
@4004 w7an2011wgt20 18.11
@4022 w7an2011wgt21 18.11
@4040 w7an2011wgt22 18.11
@4058 w7an2011wgt23 18.11
@4076 w7an2011wgt24 18.11
@4094 w7an2011wgt25 18.11
@4112 w7an2011wgt26 18.11
@4130 w7an2011wgt27 18.11
@4148 w7an2011wgt28 18.11
@4166 w7an2011wgt29 18.11
@4184 w7an2011wgt30 18.11
@4202 w7an2011wgt31 18.11
@4220 w7an2011wgt32 18.11
@4238 w7an2011wgt33 18.11
@4256 w7an2011wgt34 18.11
@4274 w7an2011wgt35 18.11
@4292 w7an2011wgt36 18.11
@4310 w7an2011wgt37 18.11
@4328 w7an2011wgt38 18.11
@4346 w7an2011wgt39 18.11
@4364 w7an2011wgt40 18.11
@4382 w7an2011wgt41 18.11
@4400 w7an2011wgt42 18.11
@4418 w7an2011wgt43 18.11
@4436 w7an2011wgt44 18.11
@4454 w7an2011wgt45 18.11
@4472 w7an2011wgt46 18.11
@4490 w7an2011wgt47 18.11
@4508 w7an2011wgt48 18.11
@4526 w7an2011wgt49 18.11
@4544 w7an2011wgt50 18.11
@4562 w7an2011wgt51 18.11
@4580 w7an2011wgt52 18.11
@4598 w7an2011wgt53 18.11
@4616 w7an2011wgt54 18.11
@4634 w7an2011wgt55 18.11
@4652 w7an2011wgt56 18.11
@4670 w7varstrat 2.
@4672 w7varunit 2.;


/* Section #3 - format assignment statement   */
format r5dcontnew Dcontnew.
r7dlmlint DLMLINT.
r7dresid f_dresid.
r6dresid f_dresid.
r5dresid f_dresid.
r4dresid f4dresid.
r3dresid f3dresid.
r2dresid f2dresid.
r1dresid R1DRESID.
r7dresidlml D_LMLLOC.
r7breakoffst RFDK_B.
r7breakoffqt $RFDK_C.
is7resptype W200030W.
is7reasnprx1 RFDK_YN.
is7reasnprx2 RFDK_YN.
is7reasnprx3 RFDK_YN.
is7reasnprx4 RFDK_YN.
is7reasnprx5 RFDK_YN.
is7reasnprx6 RFDK_YN.
is7reasnprx7 RFDK_YN.
is7reasnprx9 RFDK_YN.
is7tempres W200032W.
is7prxyrelat W200035W.
is7prxygendr w200002w.
is7famrrutin W200036W.
is7proxlivsp W200011W.
r5dgender w200002w.
rl5dracehisp RACEHISP.
r7d2intvrage D2INTVRA.
is7dproxyid $RFDK_C.
fl7spdied W200011W.
re7spadrsnew W200037W.
re7intplace W200011W.
re7newstrct W200018W.
re7newblgfl W200021W.
re7mthmove W200038W.
re7yearmove W200039W.
re7placedec W200011W.
re7alonedec W200011W.
re7dresistrct W200018W.
re7dbldg RE5BLDG.
re7dcensdiv CENDIV.
re7dresnew dresnew.
fl7structure W200020W.
fl7resnew W200011W.
fl7facility W200011W.
fl7hotype W200022W.
fl7retirecom W200011W.
pd7placedied W200041W.
pd7homedied W200042W.
pd7hospdied W200043W.
pd7hospice1 W200011W.
pd7hospice2 W200044W.
pd7stayunit W200045W.
pd7staydays RFDK_F.
pd7staywks RFDK_F.
pd7staymths RFDK_F.
pd7stayyrs RFDK_F.
pd7staymthpl W200011W.
pd7placepre SP30046W.
pd7hospcelml W200011W.
pd7alert W200047W.
pd7outbed W200047W.
r7d2deathage D2INTVRA.
fl7notalert W200011W.
fl7notmobile W200011W.
lm7pain W200011W.
lm7painhlp W200011W.
lm7painhlpam W200048W.
lm7bre W200011W.
lm7brehlp W200011W.
lm7brehlpam W200048W.
lm7sad W200011W.
lm7sadhlp W200011W.
lm7sadhlpam W200048W.
lm7caredecis W200049W.
lm7carenowan W200049W.
lm7perscare W200050W.
lm7respect W200050W.
lm7informed W200050W.
lm7doctor W200049W.
lm7docclear W200011W.
lm7relg W200049W.
lm7relgamt W200011W.
lm7ratecare SP30051W.
hc7health W200051W.
hc7disescn1 W200011W.
hc7disescn2 W200011W.
hc7disescn3 W200011W.
hc7disescn4 W200011W.
hc7disescn5 W200011W.
hc7disescn6 W200011W.
hc7disescn7 W200011W.
hc7disescn8 W200011W.
hc7disescn9 W200011W.
hc7disescn10 W200011W.
hc7cancerty1 RFDK_YN.
hc7brokebon1 W200011W.
hc7brokebon2 W200011W.
hc7hosptstay W200011W.
hc7hosovrnht RFDK_F.
hc7knesrgyr W200011W.
hc7hipsrgyr W200011W.
hc7catrsrgyr W200011W.
hc7backsrgyr W200011W.
hc7hartsrgyr W200011W.
hc7fllsinmth W200011W.
hc7worryfall W200011W.
hc7worrylimt W200011W.
hc7faleninyr W200011W.
hc7multifall W200011W.
hc7depresan1 W200052W.
hc7depresan2 W200052W.
hc7depresan3 W200052W.
hc7depresan4 W200052W.
hc7aslep30mn W200053W.
hc7trbfalbck W200054W.
hc7sleepmed W200053W.
ht7placedesc W200055W.
ht7retiresen W200011W.
ht7diffareun W200011W.
ht7helpmedbd W200011W.
ht7meals W200011W.
ht7spacename W200057W.
se7servcoff1 W200011W.
se7servcoff2 W200011W.
se7servcoff3 W200011W.
se7servcoff4 W200011W.
se7servcoff5 W200011W.
se7servcoff6 W200011W.
se7servcoff7 W200011W.
se7servcoff10 RFDK_YN.
se7servcoff11 RFDK_YN.
se7servcoff8 W200011W.
se7servcoff9 W200011W.
se7servcoff12 RFDK_YN.
se7servcoff13 RFDK_YN.
se7servused1 W200011W.
se7servused2 W200011W.
se7servused3 W200011W.
se7servused4 W200011W.
se7servused5 W200011W.
se7servused6 W200011W.
se7servused7 W200011W.
se7servused10 W200011W.
se7servused11 W200011W.
se7servused8 W200011W.
se7servused9 W200011W.
se7servused12 W200011W.
se7servused13 RFDK_YN.
se7payservi1 W200147W.
se7payservi2 W200147W.
se7payservi3 W200147W.
se7payservi4 W200147W.
se7payservi5 W200147W.
se7payservi6 W200147W.
se7payservi7 W200147W.
se7payservi10 W200147W.
se7payservi11 W200147W.
se7payservi8 W200147W.
se7payservi9 W200147W.
se7payservi12 W200147W.
se7payservi13 W200147W.
hh7marchange W200011W.
hh7martlstat W200010W.
hh7dmarstat dmarstat.
hh7yrendmarr RFDK_F.
hh7newspoprt W200058W.
hh7spgender W200002W.
hh7dspageall DSPSAGEC.
hh7spouseduc W200005W.
hh7spoupchlp W200011W.
hh7livwthspo W200011W.
hh7placekind W200060W.
hh7dlvngarrg LVGARRG.
hh7dhshldnum RFDK_F.
hh7dhshldchd RFDK_F.
hh7dspouseid $RFDK_F.
cs7sistrsnum RFDK_F.
cs7brthrsnum RFDK_F.
cs7dnumchild RFDK_F.
cs7dnmstpchd RFDK_F.
cs7dnumdaugh RFDK_F.
cs7dnumson RFDK_F.
sn7dnumsn RFDK_F.
fl7noonetalk W200011W.
ho7entrstair W200011W.
ho7entrccomn W200067W.
ho7entrnramp W200011W.
ho7bldgamen1 W200011W.
ho7bldgamen2 W200011W.
ho7bldgamen3 W200011W.
ho7bldgamen4 W200011W.
ho7levelsflr W200068W.
ho7homeamen1 W200011W.
ho7homeamen2 W200011W.
ho7homeamen3 W200011W.
ho7bathprivt W200011W.
ho7bathamen1 W200011W.
ho7bathamen2 W200011W.
ho7bathamen3 W200011W.
ho7bathamen4 W200011W.
ho7bathamen5 W200011W.
ho7bathamen6 W200011W.
ho7bathamen7 W200011W.
ho7kitchnprv W200011W.
ho7kitchncom W200011W.
ho7microwave W200011W.
ho7dbldg1 RFDK_YN.
ho7dbldg2 RFDK_YN.
ho7dbldg3 RFDK_YN.
ho7dbldg4 RFDK_YN.
ho7dbathprvt RFDK_YN.
ho7dkitchnpr RFDK_YN.
ho7dkitchnco RFDK_YN.
fl7bathgrbbr W200011W.
fl7bathseat W200011W.
fl7raisedtlt W200011W.
fl7tltgrbbr W200011W.
em7modhere1 W200069W.
em7addlstyr1 W200011W.
em7addlstyr2 W200011W.
em7addlstyr3 W200011W.
em7addlstyr4 W200011W.
em7addlstyr5 W200011W.
em7addlstyr6 W200011W.
em7addlstyr7 W200011W.
em7payyufam1 W200011W.
em7payyufam2 W200011W.
em7payyufam3 W200011W.
em7payyufam4 W200011W.
em7payyufam5 W200011W.
em7payyufam6 W200011W.
em7payyufam7 W200011W.
em7paydevce1 W200011W.
em7paydevce2 W200011W.
em7paydevce3 W200011W.
em7paydevce4 W200011W.
em7paydevce5 W200011W.
em7paydevce6 W200011W.
em7paydevce7 W200011W.
em7paydevce8 W200011W.
em7paydevce9 W200011W.
em7payaltgth W200070W.
em7morls1000 W200071W.
em7morls100 W200072W.
cm7knowwell W200126W.
cm7willnghlp W200126W.
cm7peoptrstd W200126W.
te7cellphone W200011W.
te7othrphone W200011W.
te7computer W200073W.
te7compoth W200011W.
te7tablet SP30076W.
te7emailtext W200011W.
te7oftnemail W200074W.
te7online W200011W.
te7shoponli1 W200011W.
te7shoponli2 W200011W.
te7shoponli3 W200011W.
te7socialnet W200011W.
te7intrntmd1 W200011W.
te7intrntmd2 W200011W.
te7intrntmd3 W200011W.
md7canewlker W200011W.
md7cane W200011W.
md7walker W200011W.
md7wheelchar W200011W.
md7whelcrspc W200011W.
md7scooter W200011W.
md7scterinsp W200011W.
fl7cane W200011W.
fl7walker W200011W.
fl7wheelchr W200011W.
fl7whlchrhom W200011W.
fl7scooter W200011W.
fl7scooterhm W200011W.
ss7heringaid W200076W.
ss7hearphone W200011W.
ss7convwradi W200011W.
ss7convquiet W200011W.
ss7glasseswr W200077W.
ss7seewellst W200011W.
ss7seestvgls W200011W.
ss7glasscls W200011W.
ss7othvisaid W200011W.
ss7glrednewp W200011W.
ss7probchswl W200011W.
ss7probspeak W200011W.
ss7painbothr W200011W.
ss7painlimts W200011W.
ss7painmedof W200078W.
ss7painwhe1 RFDK_YN.
ss7painwhe2 RFDK_YN.
ss7painwhe3 RFDK_YN.
ss7painwhe4 RFDK_YN.
ss7painwhe5 RFDK_YN.
ss7painwhe6 RFDK_YN.
ss7painwhe7 RFDK_YN.
ss7painwhe8 RFDK_YN.
ss7painwhe9 RFDK_YN.
ss7painwhe10 RFDK_YN.
ss7painwhe11 RFDK_YN.
ss7painwhe12 RFDK_YN.
ss7painwhe13 RFDK_YN.
ss7probbreat W200011W.
ss7prbbrlimt W200011W.
ss7strnglmup W200011W.
ss7uplimtact W200011W.
ss7lwrbodstr W200011W.
ss7lwrbodimp W200011W.
ss7lowenergy W200011W.
ss7loenlmtat W200011W.
ss7prbbalcrd W200011W.
ss7prbbalcnt W200011W.
fl7deaf W200011W.
fl7blind W200011W.
pc7walk6blks W200011W.
pc7walk3blks W200011W.
pc7up20stair W200011W.
pc7up10stair W200011W.
pc7car20pnds W200011W.
pc7car10pnds W200011W.
pc7geonknees W200011W.
pc7bendover W200011W.
pc7hvobovrhd W200011W.
pc7rechovrhd W200011W.
pc7opnjarwhd W200011W.
pc7grspsmobj W200011W.
cp7memrygood W200051W.
cp7knownspyr W200011W.
cp7chgthink1 W200080W.
cp7chgthink2 W200080W.
cp7chgthink3 W200080W.
cp7chgthink4 W200080W.
cp7chgthink5 W200080W.
cp7chgthink6 W200080W.
cp7chgthink7 W200080W.
cp7chgthink8 W200080W.
cp7memcogpr1 W200011W.
cp7memcogpr2 W200011W.
cp7memcogpr3 W200011W.
cp7memcogpr4 W200011W.
cp7dad8dem DAD8DEM.
cg7speaktosp W200011W.
cg7quesremem W200011W.
cg7reascano1 RFDK_YN.
cg7reascano2 RFDK_YN.
cg7reascano3 RFDK_YN.
cg7reascano4 RFDK_YN.
cg7reascano5 RFDK_YN.
cg7reascano6 RFDK_YN.
cg7reascano7 RFDK_YN.
cg7reascano8 RFDK_YN.
cg7reascano9 RFDK_YN.
cg7ratememry W200051W.
cg7ofmemprob W200078W.
cg7memcom1yr W200082W.
cg7todaydat1 W200083W.
cg7todaydat2 W200083W.
cg7todaydat3 W200083W.
cg7todaydat5 W200083W.
cg7todaydat4 W200083W.
cg7todaydat6 W200083W.
cg7prewrdrcl W200084W.
cg7dwrdlstnm WORDREC.
cg7wrdsrcal1 W200085W.
cg7wrdsrcal2 W200085W.
cg7wrdsrcal3 W200085W.
cg7wrdsrcal4 W200085W.
cg7wrdsrcal5 W200085W.
cg7wrdsrcal6 W200085W.
cg7wrdsrcal7 W200085W.
cg7wrdsrcal8 W200085W.
cg7wrdsrcal9 W200085W.
cg7wrdsrcal10 W200085W.
cg7dwrdimmrc WORDRE_N.
cg7dwrdinone DWRDINON.
cg7dwrdirref DWRDIRRE.
cg7wrdsntlst W200011W.
cg7numnotlst RFDK_F.
cg7probreca1 RFDK_YN.
cg7probreca2 RFDK_YN.
cg7probreca3 RFDK_YN.
cg7probreca4 RFDK_YN.
cg7probreca5 RFDK_YN.
cg7dclkdraw DCLCKSC.
cg7dclkimgcl DCLCKCL.
cg7atdrwclck W200087W.
cg7presidna1 RFDK_YN.
cg7presidna2 RFDK_YN.
cg7presidna3 RFDK_YN.
cg7presidna4 RFDK_YN.
cg7vpname1 RFDK_YN.
cg7vpname2 RFDK_YN.
cg7vpname3 RFDK_YN.
cg7vpname4 RFDK_YN.
cg7wrdsdcal1 W200085W.
cg7wrdsdcal2 W200085W.
cg7wrdsdcal3 W200085W.
cg7wrdsdcal4 W200085W.
cg7wrdsdcal5 W200085W.
cg7wrdsdcal6 W200085W.
cg7wrdsdcal7 W200085W.
cg7wrdsdcal8 W200085W.
cg7wrdsdcal9 W200085W.
cg7wrdsdca10 W200085W.
cg7dwrddlyrc WORDRE_N.
cg7dwrddnone DWRDINON.
cg7dwrddrref DWRDIRRE.
cg7wrdnotlst W200011W.
cg7numwrdnot RFDK_F.
cg7dwrd1rcl RFDK_YN.
cg7dwrd2rcl RFDK_YN.
cg7dwrd3rcl RFDK_YN.
cg7dwrd4rcl RFDK_YN.
cg7dwrd5rcl RFDK_YN.
cg7dwrd6rcl RFDK_YN.
cg7dwrd7rcl RFDK_YN.
cg7dwrd8rcl RFDK_YN.
cg7dwrd9rcl RFDK_YN.
cg7dwrd10rcl RFDK_YN.
cg7dwrd1dly RFDK_YN.
cg7dwrd2dly RFDK_YN.
cg7dwrd3dly RFDK_YN.
cg7dwrd4dly RFDK_YN.
cg7dwrd5dly RFDK_YN.
cg7dwrd6dly RFDK_YN.
cg7dwrd7dly RFDK_YN.
cg7dwrd8dly RFDK_YN.
cg7dwrd9dly RFDK_YN.
cg7dwrd10dly RFDK_YN.
mo7outoft W200089W.
mo7outcane W200090W.
mo7outwalkr W200090W.
mo7outwlchr W200090W.
mo7outsctr W200090W.
mo7outhlp W200011W.
mo7outslf W200092W.
mo7outdif W200093W.
mo7outyrgo W200094W.
mo7outwout W200011W.
mo7oftgoarea W200078W.
mo7oflvslepr W200078W.
mo7insdcane W200090W.
mo7insdwalkr W200090W.
mo7insdwlchr W200090W.
mo7insdsctr W200090W.
mo7oftholdwl W200090W.
mo7insdhlp W200011W.
mo7insdslf W200092W.
mo7insddif W200093W.
mo7insdyrgo W200094W.
mo7insdwout W200011W.
mo7beddev W200090W.
mo7bedhlp W200011W.
mo7bedslf W200092W.
mo7beddif W200093W.
mo7bedwout W200011W.
mo7doutsfdf DOUTSFDF.
mo7doutdevi DOUTDEVI.
mo7douthelp DOUTHELP.
mo7dinsdsfdf DINSDSFD.
mo7dinsddevi DINSDDEV.
mo7dinsdhelp DINSDHLP.
mo7dbedsfdf DBEDSFDF.
mo7dbeddevi DBEDDEVI.
mo7dbedhelp DBEDHELP.
fl7didntleav W200011W.
fl7ntlvrmslp W200011W.
dm7helpmobil W200011W.
dm7helpstmo W200095W.
dm7helpstyr RFDK_YN.
dm7helpendmo W200095W.
dm7helpendyr W200040W.
dm7nohelp W200096W.
dm7nohelpmos RFDK_F.
dm7lstyrcane W200011W.
dm7devstmo SP3019aW.
dm7devstyr RFDK_F.
dm7devendmo SP3019aW.
dm7devendyr RFDK_F.
dm7nodev W200096W.
dm7nodevmos RFDK_F.
dm7dmohlp NW_MTHS.
dm7dmodev NW_MTHS.
dm7dmohlpgr DMH_GRP.
dm7dmodevgr DMU_GRP.
dmds7dintvl NW_MTHS.
dm7flag DMDS5FLG.
dt7driveyr W200097W.
dt7oftedrive W200078W.
dt7avoidriv1 W200098W.
dt7avoidriv2 W200098W.
dt7avoidriv3 W200098W.
dt7avoidriv4 W200098W.
dt7getoplcs1 W200011W.
dt7getoplcs2 W200011W.
dt7getoplcs3 W200011W.
dt7getoplcs4 W200011W.
dt7getoplcs5 W200011W.
dt7getoplcs6 W200011W.
dt7getoplcs7 W200011W.
dt7otfrfamtk W200011W.
fl7drives W200011W.
fl7drvlstyr W200011W.
fl5dneverdrv RFDK_Y.
ha7laun W200099W.
ha7launslf W200011W.
ha7whrmachi1 RFDK_YN.
ha7whrmachi2 RFDK_YN.
ha7whrmachi3 RFDK_YN.
ha7whrmachi4 RFDK_YN.
ha7whrmachi5 RFDK_YN.
ha7whrmachi6 RFDK_YN.
ha7dlaunreas DLAUNREA.
ha7laundif W200093W.
ha7launoft W200094W.
ha7launwout W200011W.
ha7shop W200099W.
ha7shopslf W200011W.
ha7howpaygr1 RFDK_YN.
ha7howpaygr2 RFDK_YN.
ha7howpaygr3 RFDK_YN.
ha7howpaygr4 RFDK_YN.
ha7howpaygr5 RFDK_YN.
ha7howpaygr6 RFDK_YN.
ha7howpaygr7 RFDK_YN.
ha7howgtstr1 RFDK_YN.
ha7howgtstr2 RFDK_YN.
ha7howgtstr3 RFDK_YN.
ha7howgtstr4 RFDK_YN.
ha7howgtstr5 RFDK_YN.
ha7howgtstr6 RFDK_YN.
ha7howgtstr7 RFDK_YN.
ha7howgtstr8 RFDK_YN.
ha7shopcart W200011W.
ha7shoplean W200011W.
ha7dshopreas DSHOPREA.
ha7shopdif W200093W.
ha7shopoft W200102W.
ha7shopwout W200011W.
ha7meal W200099W.
ha7mealslf W200011W.
ha7restamels W200090W.
ha7mealwheel W200090W.
ha7oftmicrow W200090W.
ha7dmealreas DMEALREA.
ha7mealdif W200093W.
ha7mealoft W200102W.
ha7mealwout W200011W.
ha7bank W200099W.
ha7bankslf W200011W.
ha7dbankreas DBANKREA.
ha7bankdif W200093W.
ha7bankoft W200102W.
ha7bankwout W200011W.
ha7money W200011W.
ha7moneyhlp W200011W.
ha7dlaunsfdf DLAUNSFD.
ha7dshopsfdf DSHOPSFD.
ha7dmealsfdf DMEALSFD.
ha7dbanksfdf DBANKSFD.
ha7dmealwhl HA5DWHL.
ha7dmealtkot HA5DTKO.
sc7eatdev W200106W.
sc7eatdevoft W200107W.
sc7eathlp W200011W.
sc7eatslfoft W200092W.
sc7eatslfdif W200093W.
sc7eatwout W200011W.
sc7showrbat1 RFDK_YN.
sc7showrbat2 RFDK_YN.
sc7showrbat3 RFDK_YN.
sc7bdevdec W200011W.
sc7prfrshbth W200109W.
sc7scusgrbrs W200090W.
sc7shtubseat W200090W.
sc7bathhlp W200011W.
sc7bathoft W200092W.
sc7bathdif W200093W.
sc7bathyrgo W200102W.
sc7bathwout W200011W.
sc7usvartoi1 W200011W.
sc7usvartoi2 RFDK_YN.
sc7usvartoi3 RFDK_YN.
sc7usvartoi4 RFDK_YN.
sc7toilhlp W200011W.
sc7toiloft W200092W.
sc7toildif W200093W.
sc7toilwout W200011W.
sc7dresoft W200078W.
sc7dresdev W200011W.
sc7dreshlp RFDK_YN.
sc7dresslf W200092W.
sc7dresdif W200093W.
sc7dresyrgo W200102W.
sc7dreswout W200011W.
sc7deatdevi DEATDEVI.
sc7deathelp DEATHELP.
sc7deatsfdf DEATSFDF.
sc7dbathdevi DBATHDEV.
sc7dbathhelp DBATHHEL.
sc7dbathsfdf DBATHSFD.
sc7dtoildevi DTOILDEV.
sc7dtoilhelp DTOILHEL.
sc7dtoilsfdf DTOILSFD.
sc7ddresdevi DDRESDEV.
sc7ddreshelp DDRESHEL.
sc7ddressfdf DDRESSFD.
fl7showering W200011W.
fl7takingbth W200011W.
fl7washingup W200011W.
ds7gethlpeat W200011W.
ds7helpstmo W200095W.
ds7helpstyr W200040W.
ds7helpendmo W200095W.
ds7helpendyr W200040W.
ds7nohelp W200096W.
ds7nohelpmos RFDK_F.
ds7dschlp NW_MTHS.
ds7dschlpgr DS_GRP.
ds7flag DMDS5FLG.
mc7meds W200011W.
mc7medstrk W200099W.
mc7medsslf W200011W.
mc7whrgtmed1 RFDK_YN.
mc7whrgtmed2 RFDK_YN.
mc7whrgtmed3 RFDK_YN.
mc7whrgtmed4 RFDK_YN.
mc7howpkupm1 RFDK_YN.
mc7howpkupm2 RFDK_YN.
mc7howpkupm3 RFDK_YN.
mc7medsrem W200090W.
mc7dmedsreas dmedsrea.
mc7medsdif W200093W.
mc7medsyrgo W200102W.
mc7medsmis RFDK_YN.
mc7havregdoc W200011W.
mc7regdoclyr W200011W.
mc7hwgtregd1 RFDK_YN.
mc7hwgtregd2 RFDK_YN.
mc7hwgtregd3 RFDK_YN.
mc7hwgtregd4 RFDK_YN.
mc7hwgtregd5 RFDK_YN.
mc7hwgtregd6 RFDK_YN.
mc7hwgtregd7 RFDK_YN.
mc7hwgtregd8 RFDK_YN.
mc7hwgtregd9 RFDK_YN.
mc7ansitindr RFDK_YN.
mc7tpersevr1 RFDK_YN.
mc7tpersevr2 RFDK_YN.
mc7tpersevr3 RFDK_YN.
mc7tpersevr4 RFDK_YN.
mc7chginspln W200011W.
mc7anhlpwdec W200011W.
mc7dmedssfdf DMEDSSFD.
pa7vistfrfam W200011W.
pa7hlkepfvst W200011W.
pa7trkpfrvis W200011W.
pa7impvstfam W200114W.
pa7attrelser W200011W.
pa7htkfrrlsr W200011W.
pa7trprrelsr W200011W.
pa7imprelser W200114W.
pa7clbmtgrac W200011W.
pa7hlkpfrclb W200011W.
pa7trprkpfgr W200011W.
pa7imparclub W200114W.
pa7outfrenjy W200011W.
pa7hlkpgoenj W200011W.
pa7trprgoout W200011W.
pa7impouteny W200114W.
pa7workfrpay RFDK_YN.
pa7hlkpfrwrk W200011W.
pa7voltrwork W200011W.
pa7hlkpfrvol RFDK_YN.
pa7prcranoth RFDK_YN.
pa7evrgowalk W200011W.
pa7vigoractv W200011W.
pa7dofavact W200115W.
pa7fvactlimyr RFDK_YN.
pa5dfavact PA25FMT.
rh7rehab RFDK_YN.
rh7rehabmo W500124W.
rh7rehabweek W500125W.
rh7rehabsurg RFDK_YN.
rh7surgcond W500126W.
rh7rehabcond W500126W.
rh7funcback RFDK_YN.
rh7funchips RFDK_YN.
rh7funcknees RFDK_YN.
rh7funcfeet RFDK_YN.
rh7funchands RFDK_YN.
rh7funcwrist RFDK_YN.
rh7funcshold RFDK_YN.
rh7funchead RFDK_YN.
rh7funcneck RFDK_YN.
rh7funcarms RFDK_YN.
rh7funclegs RFDK_YN.
rh7funcstom RFDK_YN.
rh7funcmouth RFDK_YN.
rh7funcheart RFDK_YN.
rh7funclung RFDK_YN.
rh7funcos RFDK_YN.
rh7funcnotsp RFDK_YN.
rh7impchew RFDK_YN.
rh7impspeak RFDK_YN.
rh7impspain RFDK_YN.
rh7impbreath RFDK_YN.
rh7impweak RFDK_YN.
rh7impmove RFDK_YN.
rh7impenergy RFDK_YN.
rh7impbal RFDK_YN.
rh7impfall RFDK_YN.
rh7impmemory RFDK_YN.
rh7impnone RFDK_YN.
rh7impbed RFDK_YN.
rh7impwalk RFDK_YN.
rh7impleave RFDK_YN.
rh7impdistnc RFDK_YN.
rh7impclimb RFDK_YN.
rh7impdrive RFDK_YN.
rh7imptransp RFDK_YN.
rh7impnotths RFDK_YN.
rh7impsc RFDK_YN.
rh7imphh RFDK_YN.
rh7impcomp RFDK_YN.
rh7impwork RFDK_YN.
rh7impcare RFDK_YN.
rh7impactiv RFDK_YN.
rh7impactnon RFDK_YN.
rh7devcane RFDK_YN.
rh7devwhlch RFDK_YN.
rh7devramp RFDK_YN.
rh7devstair RFDK_YN.
rh7devtub RFDK_YN.
rh7devtoil RFDK_YN.
rh7deveat RFDK_YN.
rh7devdres RFDK_YN.
rh7devgrab RFDK_YN.
rh7devcomp RFDK_YN.
rh7devcar RFDK_YN.
rh7devother RFDK_YN.
rh7place1 RFDK_YN.
rh7place2 RFDK_YN.
rh7place3 RFDK_YN.
rh7place4 RFDK_YN.
rh7place5 SP5RH7W.
rh7placelast W500131W.
rh7ability W500132W.
rh7abilimp W500133W.
rh7abilworse W500133W.
rh7rehabnow RFDK_YN.
rh7metgoals RFDK_YN.
rh7metinsur RFDK_YN.
rh7abilnow W500132W.
rh7nowimp W500133W.
rh7nowworse W500133W.
sd7smokesnow W200011W.
sd7numcigday NUMCIGS.
pe7whhndsign W200116W.
pe7surghdwrt W200011W.
pe7surgyside W200117W.
pe7flruppain W200011W.
pe7sideflrup W200117W.
pe7surgarmsh W200011W.
pe7sidsurgar W200117W.
pe7surgyhips W200011W.
pe7sidhipsrg W200118W.
pe7stndwhold W200011W.
pe7upchbyslf W200011W.
pe7wlkdsself W200011W.
fl7lefthand W200011W.
fl7righthand W200011W.
fl7eiherhand W200011W.
fl7lftgrptst W200011W.
fl7rhtgrptst W200011W.
fl7charstnds W200011W.
fl7balstands W200011W.
fl7wlkingrse W200011W.
bc7dconsent W700BC2W.
ba7dblssadm BA1SS.
ba7dblstadm BA1STAN.
ba7dblftadm BA1TAN.
ba7dblopadm BA1OP.
ba7dblcladm BA1CL.
wa7dwlkadm WA1WLK.
ch7dschradm CH1SCH.
ch7drchradm CH1RSH.
gr7dgripadm GR1GRIP.
wc7dwaistadm WC1WAIST.
pk7dpeakadm PK1PEAK.
ab7datemonth W200038W.
ab7dateyear RFDK_F.
in7strtabhrs RFDK_F.
in7strtabmin RFDK_F.
in7strtmampm A0001AB.
ba7sxsresult PE_RSLT.
ba7blstdsecs RFDK_F.
ba7blstdhndr RFDK_F.
ba7rsn1ssstd RFDK_YN.
ba7rsn2ssstd RFDK_YN.
ba7rsn3ssstd RFDK_YN.
ba7rsn4ssstd RFDK_YN.
ba7rsn9ssstd RFDK_YN.
ba7stdmreslt PE_RSLT.
ba7stdmsecs RFDK_F.
ba7stdmhndr RFDK_F.
ba7rsn1ststd RFDK_YN.
ba7rsn2ststd RFDK_YN.
ba7rsn3ststd RFDK_YN.
ba7rsn4ststd RFDK_YN.
ba7rsn9ststd RFDK_YN.
ba7ftdmreslt PE_RSLT.
ba7ftdmsecs RFDK_F.
ba7ftdmhndr RFDK_F.
ba7rsn1ftstd RFDK_YN.
ba7rsn2ftstd RFDK_YN.
ba7rsn3ftstd RFDK_YN.
ba7rsn4ftstd RFDK_YN.
ba7rsn9ftstd RFDK_YN.
ba71leoreslt PE_RSLT.
ba71leosfsec RFDK_F.
ba71leohndr RFDK_F.
ba7rsn11leo RFDK_YN.
ba7rsn21leo RFDK_YN.
ba7rsn31leo RFDK_YN.
ba7rsn41leo RFDK_YN.
ba7rsn91leo RFDK_YN.
ba71lecreslt PE_RSLT.
ba71lecsfsec RFDK_F.
ba71lechndr RFDK_F.
ba7rsn11lec RFDK_YN.
ba7rsn21lec RFDK_YN.
ba7rsn31lec RFDK_YN.
ba7rsn41lec RFDK_YN.
ba7rsn91lec RFDK_YN.
wa7wlkcorspc A0002WA.
wa7wkaidused A0004WA.
wa7wlkc1rslt PE_RSLT.
wa7wlkc1secs RFDK_F.
wa7wlk1hndr RFDK_F.
wa7rsn11wkc RFDK_YN.
wa7rsn21wkc RFDK_YN.
wa7rsn31wkc RFDK_YN.
wa7rsn41wkc RFDK_YN.
wa7rsn51wkc RFDK_YN.
wa7rsn91wkc RFDK_YN.
wa7wkaidusc2 A0004WA.
wa7wlkc2rslt PE_RSLT.
wa7wlkc2secs RFDK_F.
wa7wlk2hndr RFDK_F.
wa7rsn12wkc RFDK_YN.
wa7rsn22wkc RFDK_YN.
wa7rsn32wkc RFDK_YN.
wa7rsn42wkc RFDK_YN.
wa7rsn92wkc RFDK_YN.
ch7chravail RFDK_YN.
ch7chstcompl A0004CH.
ch7chairheit RFDK_F.
ch7whlchrusd RFDK_YN.
ch7sgchstres PE_RSLT.
ch7armuse A0008CH.
ch7rsn11chs RFDK_YN.
ch7rsn21chs RFDK_YN.
ch7rsn31chs RFDK_YN.
ch7rsn41chs RFDK_YN.
ch7rsn51chs RFDK_YN.
ch7rsn91chs RFDK_YN.
ch72chstrslt PE_RSLT.
ch7chstndsec RFDK_F.
ch7chstdhndr RFDK_F.
ch7chstddone A0014CH.
ch7chstntdn1 RFDK_YN.
ch7chstntdn2 RFDK_YN.
ch7chstntdn3 RFDK_YN.
ch7chstntdn4 RFDK_YN.
ch7chstntdn5 RFDK_YN.
ch7chstntdn9 RFDK_YN.
ch7chstntat1 RFDK_YN.
ch7chstntat2 RFDK_YN.
ch7chstntat3 RFDK_YN.
ch7chstntat4 RFDK_YN.
ch7chstntat9 RFDK_YN.
gr7handtstd1 RGT_LFT.
gr7adjgr1ps3 RFDK_YN.
gr7grp1reslt PE_RSLT.
gr7grp1rdng RFDK_F.
gr7grp1noat1 RFDK_YN.
gr7grp1noat2 RFDK_YN.
gr7grp1noat3 RFDK_YN.
gr7grp1noat4 RFDK_YN.
gr7grp1noat9 RFDK_YN.
gr7handtstd2 RGT_LFT.
gr7adjgr2ps3 RFDK_YN.
gr7grp2reslt PE_RSLT.
gr7grp2rdng RFDK_F.
gr7grp2noat1 RFDK_YN.
gr7grp2noat2 RFDK_YN.
gr7grp2noat3 RFDK_YN.
gr7grp2noat4 RFDK_YN.
gr7grp2noat9 RFDK_YN.
wc7measdiff1 RFDK_YN.
wc7measdiff2 RFDK_YN.
wc7measdiff3 RFDK_YN.
wc7measdiff4 RFDK_YN.
wc7measdiff5 RFDK_YN.
wc7measdiff6 RFDK_YN.
wc7measdiff9 RFDK_YN.
wc7waistrslt PE_RSLT.
wc7wstmsrinc RFDK_F.
wc7wstmsrqrt RFDK_F.
wc7wstbulkcl RFDK_Y.
wc7whomeasur PERSON.
wc7wstpostn STAND.
wc7wstnotat1 RFDK_YN.
wc7wstnotat2 RFDK_YN.
wc7wstnotat3 RFDK_YN.
wc7wstnotat4 RFDK_YN.
wc7wstnotat5 RFDK_YN.
wc7wstnotat9 RFDK_YN.
pk7pkarf1pos STAND.
pk7pkarfl1ef EFFORT.
pk7pkarfl1rs PE_RSLT.
pk7pkarfl1rd RFDK_F.
pk7pk1noatt1 RFDK_YN.
pk7pk1noatt2 RFDK_YN.
pk7pk1noatt3 RFDK_YN.
pk7pk1noatt4 RFDK_YN.
pk7pk1noatt9 RFDK_YN.
pk7paf2posit STAND.
pk7pkarfl2ef EFFORT.
pk7pkarfl2rs PE_RSLT.
pk7pkarfl2rd RFDK_F.
pk7pk2noatt1 RFDK_YN.
pk7pk2noatt2 RFDK_YN.
pk7pk2noatt3 RFDK_YN.
pk7pk2noatt4 RFDK_YN.
pk7pk2noatt9 RFDK_YN.
cl7endtimhrs RFDK_F.
cl7endtimmin RFDK_F.
cl7endtmampm A0001AB.
r7dnhatssppb SPPB.
r7dnhatsbasc QUARTILE.
r7dnhatswksc QUARTILE.
r7dnhatschsc QUARTILE.
r7dnhatsgrav QUARTILE.
r7dnhatsgrb QUARTILE.
r7dnhatspkav QUARTILE.
r7dnhatspkb QUARTILE.
r7dsppbmiss SPPB_MIS.
r7dorigsppb RFDK_F.
r7dorigbasc RFDK_F.
r7dorigwksc RFDK_F.
r7dorigchsc RFDK_F.
hw7currweigh RFDK_F.
hw7lst10pnds RFDK_YN.
hw7trytolose W200011W.
hw7howtallft RFDK_F.
hw7howtallin RFDK_F.
el7mothalive W200011W.
el7fathalive W200011W.
wb7offelche1 W200078W.
wb7offelche2 W200078W.
wb7offelche3 W200078W.
wb7offelche4 W200078W.
wb7truestme1 W200127W.
wb7truestme2 W200127W.
wb7truestme3 W200127W.
wb7truestme4 W200127W.
wb7ageyofeel RFDK_F.
wb7agrwstmt1 W200127W.
wb7agrwstmt2 W200127W.
wb7agrwstmt3 W200127W.
ip7covmedcad W200011W.
ip7otdrugcov W200011W.
ip7mgapmedsp W200011W.
ip7cmedicaid W200011W.
ip7covtricar W200011W.
ip7nginslast W200096W.
ip7nginsnurs W200011W.
ip7typcarco1 RFDK_YN.
ip7typcarco2 RFDK_YN.
ip7typcarco3 RFDK_YN.
ip7paypremms W200129W.
lf7workfpay W200131W.
lf7abstlstwk W200131W.
lf7wrkplstmn W200011W.
lf7mrthnonjb W200011W.
lf7hrswkwork SP5LF5W.
lf7hrwrkltwk RFDK_F.
lf7hrwrklstw RFDK_F.
lf7oftpaid W200132W.
lf7doccup OCC_CODE.
lf7huswifwrk W200011W.
hp7ownrentot W200133W.
hp7mrtpadoff W200134W.
hp7mthlymort RFDK_F.
hp7mortpaymt W500135W.
hp7whnpayoff W200136W.
hp7amtstlowe RFDK_F.
hp7amoutowed W200137W.
hp7homevalue RFDK_F.
hp7homvalamt W200138W.
hp7payrent W200011W.
hp7rentamt RFDK_F.
hp7rentamout W500135W.
hp7sec8pubsn W200011W.
ew7pycredbal W200139W.
ew7crecardeb W200140W.
ew7credcdmed W200011W.
ew7amtcrdmed W200141W.
ew7medpaovtm W200011W.
ew7ampadovrt W200142W.
ew7finhlpfam W200011W.
ew7whohelfi1 RFDK_YN.
ew7whohelfi2 RFDK_YN.
ew7atchhelyr W200142W.
ew7fingftfam W200011W.
ew7whregoth1 RFDK_YN.
ew7whregoth2 RFDK_YN.
ew7whregoth3 RFDK_YN.
ew7amthlpgiv W200142W.
ew7progneed1 W200011W.
ew7progneed2 W200011W.
ew7progneed3 W200011W.
ew7mealskip1 RFDK_YN.
ew7mealskip2 W200146W.
ew7nopayhous W200011W.
ew7nopayutil W200011W.
ew7nopaymed W200011W.
ia7recsspa1 RFDK_YN.
ia7recsspa2 RFDK_YN.
ia7recsspa3 RFDK_YN.
ia7recssils1 RFDK_YN.
ia7recssils2 RFDK_YN.
ia7recssils3 RFDK_YN.
ia7rvapayls1 RFDK_YN.
ia7rvapayls2 RFDK_YN.
ia7rvapayls3 RFDK_YN.
ia7penjobou1 RFDK_YN.
ia7penjobou2 RFDK_YN.
ia7penjobou3 RFDK_YN.
ia7iraothac1 RFDK_YN.
ia7iraothac2 RFDK_YN.
ia7iraothac3 RFDK_YN.
ia7mutfdstk1 RFDK_YN.
ia7mutfdstk2 RFDK_YN.
ia7mutfdstk3 RFDK_YN.
ia7mutfdstk4 RFDK_YN.
ia7ownbond1 RFDK_YN.
ia7ownbond2 RFDK_YN.
ia7ownbond3 RFDK_YN.
ia7ownbond4 RFDK_YN.
ia7bnkacccd1 RFDK_YN.
ia7bnkacccd2 RFDK_YN.
ia7bnkacccd3 RFDK_YN.
ia7bnkacccd4 RFDK_YN.
ia7bnkacccd5 RFDK_YN.
ia7bnkacccd6 RFDK_YN.
ia7bnkacccd7 RFDK_YN.
ia7bnkacccd8 RFDK_YN.
ia7bnkacccd9 RFDK_YN.
ia7bnkaccc10 RFDK_YN.
ia7bnkaccc11 RFDK_YN.
ia7bnkaccc12 RFDK_YN.
ia7realestt1 RFDK_YN.
ia7realestt2 RFDK_YN.
ia7realestt3 RFDK_YN.
ia7realestt4 RFDK_YN.
ia7totinc RFDK_F.
ia7toincim1 RFDK_F.
ia7toincim2 RFDK_F.
ia7toincim3 RFDK_F.
ia7toincim4 RFDK_F.
ia7toincim5 RFDK_F.
ia7toincesjt W500194W.
ia7eincimj1 W500194W.
ia7eincimj2 W500194W.
ia7eincimj3 W500194W.
ia7eincimj4 W500194W.
ia7eincimj5 W500194W.
ia7toincessg W500195W.
ia7eincims1 W500195W.
ia7eincims2 W500195W.
ia7eincims3 W500195W.
ia7eincims4 W500195W.
ia7eincims5 W500195W.
ia7toincimf RFDK_I.
ia7eincimjf RFDK_I.
ia7eincimsf RFDK_I.
ir7intlang I200003W.
ir7spattitud I200005W.
ir7undrstand I200006W.
ir7sppresent I200008W.
ir7spnotprs1 RFDK_YN.
ir7spnotprs2 RFDK_YN.
ir7spnotprs3 RFDK_YN.
ir7spnotprs4 RFDK_YN.
ir7spnotprs5 RFDK_YN.
ir7spnotprs6 RFDK_YN.
ir7intvwhlp I200010W.
ir7prsnhlp1 RFDK_YN.
ir7prsnhlp2 RFDK_YN.
ir7prsnhlp3 RFDK_YN.
ir7prsnhlp4 RFDK_YN.
ir7prsnhlp5 RFDK_YN.
ir7prsnhlp6 RFDK_YN.
ir7prsnhlp91 RFDK_YN.
ir7demolang1 I200013W.
ir7sessions I200002W.
ir7sessrsn1 RFDK_YN.
ir7sessrsn2 RFDK_YN.
ir7sessrsn3 RFDK_YN.
ir7sessrsn91 RFDK_YN.
ir7conhomapt I200016W.
ir7insidhome I200002W.
ir7condihom1 I200002W.
ir7condihom2 I200002W.
ir7condihom3 I200002W.
ir7condihom4 I200002W.
ir7condihom5 I200002W.
ir7clutterr1 I200017W.
ir7clutterr2 I200017W.
ir7areacond1 I200018W.
ir7areacond2 I200018W.
ir7areacond3 I200018W.
ir7condhome1 I200019W.
ir7condhome2 I200019W.
ir7condhome3 I200019W.
ir7condhome4 I200019W.
ir7condhome5 I200019W.
ir7condhome6 I200019W.
fq7dfacdescr F200006W.
fq7dosfacd dosfacd.
fq7prtlivnam F200007W.
fq7dfacarea F200008W.
fq7dosfaca dosfaca.
fq7assdnrsng F200009W.
fq7othrlevls F200007W.
fq7whotlevl1 RFDK_YN.
fq7whotlevl2 RFDK_YN.
fq7whotlevl3 RFDK_YN.
fq7whotlevl4 RFDK_YN.
fq7whotlevl5 RFDK_YN.
fq7servaval1 F200011W.
fq7servaval2 F200011W.
fq7servaval3 F200011W.
fq7servaval4 F200011W.
fq7servaval5 F200011W.
fq7servaval6 F200011W.
fq7servaval7 F200011W.
fq7servaval10 F200011W.
fq7servaval11 F200011W.
fq7servaval8 F200011W.
fq7servaval9 F200011W.
fq7servaval12 F200011W.
fq7servaval13 F200011W.
fq7paysourc1 RFDK_F.
fq7paysourc2 RFDK_F.
fq7paysourc3 RFDK_F.
fq7paysourc4 RFDK_F.
fq7paysourc5 RFDK_F.
fq7paysourc6 RFDK_F.
fq7totalpaym F200007W.
fq7mnthlyamt RFDK_F.
fq7primpayer F200012W.
fq7govsource F200007W.
fq7dlocsp D_LOCSP.
;

/* Section #4 - Label assignment statement   */
label spid="NHATS SAMPLED PERSON ID"
r7dlmlint="R7 D LAST MTH LIFE INTVW DONE"
r7dresid="R7 D RESIDENTIAL CARE STATUS"
r6dresid="R6 D RESIDENTIAL CARE STATUS"
r5dresid="R5 D RESIDENTIAL CARE STATUS"
r4dresid="R4 D RESIDENTIAL CARE STATUS"
r3dresid="R3 D RESIDENTIAL CARE STATUS"
r2dresid="R2 D RESIDENTIAL CARE STATUS"
r1dresid="R1 D RESIDENTIAL CARE STATUS"
r7dresidlml="R7 D LAST MTH LIFE RESIDNCE"
r5dcontnew="R5 D CONTINUING OR NEW SAMPLE IN R5"
r7breakoffst="R7 CASE BREAKOFF STATUS"
r7breakoffqt="R7 CASE BREAKOFF QUESTION"
is7resptype="R7 IS2 TYPE OF RESPONDENT"
is7reasnprx1="R7 IS2A PROXY REAS SP DEMENTIA"
is7reasnprx2="R7 IS2A PROXY REAS SP ILL"
is7reasnprx3="R7 IS2A PRXY REAS SP SPCH IMPAIR"
is7reasnprx4="R7 IS2A PRXY REAS SP HEAR IMPAIR"
is7reasnprx5="R7 IS2A PROXY REAS LANG BARRIER"
is7reasnprx6="R7 IS2A PROXY REAS TEMP UNAVAIL"
is7reasnprx7="R7 IS2A PROXY REAS DECEASED"
is7reasnprx9="R7 IS2A PROXY REAS OTHER"
is7tempres="R7 IS2B2 TEMPORARY RESIDENCE"
is7prxyrelat="R7 IS9 PROXY RELATIONSHIP TO SP"
is7prxygendr="R7 IS10 PROXY GENDER"
is7famrrutin="R7 IS11 FAMILRTY SP DAILY ROUTIN"
is7proxlivsp="R7 IS11A PROXY LIVES W SP"
r5dgender="R5 D GENDER OF SP"
rl5dracehisp="R5 D RACE AND HISPANIC ETHNICITY"
r7d2intvrage="R7 D SP CAT AGE AT INTVW"
is7dproxyid="R7 D PROXY OPID"
fl7spdied="R7 F SP DIED PRIOR TO R7  "
re7spadrsnew="R7 RE4F SP ADDRESS SAME OR DIFF"
re7intplace="R7 RE7 SP INT AT PLACE OF RES"
re7newstrct="R7 RE8 NEW RESID PHYS STRUC IN R7"
re7newblgfl="R7 RE9 NEW RESID BLDG FLOORS IN R7 "
re7mthmove="R7 RE10 MONTH MOVED NEW ADDRESS "
re7yearmove="R7 RE10B YEAR MOVED NEW ADDRESS "
re7placedec="R7 RE11 CARE AT NEW RESID PLACE SP DIED"
re7alonedec="R7 RE12 LIVED ALONE AT DEATH"
re7dresistrct="R7 D RESIDNCE PHYSICAL STRCTUR"
re7dbldg="R7 D SP BLDG MORE THAN ONE FLOOR"
re7dcensdiv="R7 D SP CENSUS DIVISION"
re7dresnew="R7 D NEW RESIDENCE SINCE LAST INT"
fl7structure="R7 F RE STRUCTURE OF SP DWELLING"
fl7resnew="R7 F RE NEW RESIDENCE ROUTING FLAG"
fl7facility="R7 F RE ROUTING FLAG FROM RE4f HT3 5 6 7"
fl7hotype="R7 F RE HT TYPE OF HOME"
fl7retirecom="R7 F RE HT SP LIVES IN RETIREMT COM"
pd7placedied="R7 PD3 PLACE OF DEATH"
pd7homedied="R7 PD3B SP OR OTHER HOME DIED"
pd7hospdied="R7 PD3C HOSPITAL UNIT DIED"
pd7hospice1="R7 PD3D HOSPICE AT NURSING HOME"
pd7hospice2="R7 PD3E HOSPICE OTHER PLACE"
pd7stayunit="R7 PD4 LENGTH OF STAY UNIT"
pd7staydays="R7 PD4A LENGTH OF STAY DAYS"
pd7staywks="R7 PD4B LENGTH OF STAY WEEKS"
pd7staymths="R7 PD4C LENGTH OF STAY MONTHS"
pd7stayyrs="R7 PD4D LENGTH OF STAY YEARS"
pd7staymthpl="R7 PD4E LENGTH OF STAY MTH PLUS"
pd7placepre="R7 PD5 PLACE PRE HOSP HOSPICE NH"
pd7hospcelml="R7 PD5B HOSPICE CARE IN LAST MTH"
pd7alert="R7 PD6 ALERT IN LAST MONTH"
pd7outbed="R7 PD7 GET OUT OF BED IN LST MTH"
r7d2deathage="R7 D SP CAT AGE AT DEATH"
fl7notalert="R7 F LML NOT ALERT"
fl7notmobile="R7 F LML NOT MOBILE"
lm7pain="R7 LM1 PAIN IN LAST MONTH"
lm7painhlp="R7 LM1A GET HELP WITH PAIN"
lm7painhlpam="R7 LM1B PAIN HELP AMOUNT"
lm7bre="R7 LM2 BREATHING TROUBLE"
lm7brehlp="R7 LM2A GET HELP WITH BREATHING"
lm7brehlpam="R7 LM2B BREATHING HELP AMOUNT"
lm7sad="R7 LM3 ANXIOUS OR SAD LAST MONTH"
lm7sadhlp="R7 LM3A ANXIOUS SAD GET HELP FOR"
lm7sadhlpam="R7 LM3B ANXIOUS SAD HELP AMOUNT"
lm7caredecis="R7 LM4 DEC ABOUT CARE WO INPUT"
lm7carenowan="R7 LM5 DEC ABOUT CARE NOT WANTED"
lm7perscare="R7 LM6 PERSONAL CARE NEEDS MET"
lm7respect="R7 LM7 TREATED WITH RESPECT"
lm7informed="R7 LM8 INFORMED ABOUT CONDITION"
lm7doctor="R7 LM9 MORE THAN ONE DOCTOR"
lm7docclear="R7 LM9A CLEAR DOCTOR IN CHARGE"
lm7relg="R7 LM10 TALK RELIGIOUS BELIEFS"
lm7relgamt="R7 LM10A RELIGIOUS BLIEF CONTACT"
lm7ratecare="R7 LM11 HOW RATE CARE"
hc7health="R7 HC1 OVERALL HEALTH CONDITION"
hc7disescn1="R7 HC2 SP HAD HEART ATTACK"
hc7disescn2="R7 HC2 SP HAS HEART DISEASE"
hc7disescn3="R7 HC2 SP HAS HIGH BLOOD PRESS"
hc7disescn4="R7 HC2 SP HAS ARTHRITIS"
hc7disescn5="R7 HC2 SP HAS OSTEOPOROSIS"
hc7disescn6="R7 HC2 SP HAS DIABETES"
hc7disescn7="R7 HC2 SP HAS LUNG DISEASE"
hc7disescn8="R7 HC2 SP HAD STROKE"
hc7disescn9="R7 HC2 SP HAS DEMENTIA OR ALZH"
hc7disescn10="R7 HC2 SP HAS CANCER"
hc7cancerty1="R7 HC3 SP HAD SKIN CANCER"
hc7brokebon1="R7 HC5A SP BROKEN OR FRACT HIP"
hc7brokebon2="R7 HC5B SP OTHR BRKN FRACT BONE"
hc7hosptstay="R7 HC7 SP HOSP STAY LAST 12MOS "
hc7hosovrnht="R7 HC8 SP NUM OF HOSP STAYS"
hc7knesrgyr="R7 HC9B KNEE SURGERY IN 12 MNTHS"
hc7hipsrgyr="R7 HC10B HIP SURG IN 12 MNTHS"
hc7catrsrgyr="R7 HC11B CATER SURG IN 12 MNTHS"
hc7backsrgyr="R7 HC12B BCK SPNE SURGR 12 MNTHS"
hc7hartsrgyr="R7 HC13B HEART SURGERY 12 MONTHS"
hc7fllsinmth="R7 HC14 FALL DOWN IN LAST MONTH"
hc7worryfall="R7 HC15 WORRIED ABOT FALLNG DOWN"
hc7worrylimt="R7 HC16 WORRY EVR LIMT ACTIVTIES"
hc7faleninyr="R7 HC17 FALLEN DOWN IN 12 MONTHS"
hc7multifall="R7 HC18 FALLEN DWN MORE THN ONCE"
hc7depresan1="R7 HC19A SP LITTLE INTERST PLEAS"
hc7depresan2="R7 HC19B SP DOWN DEPRES HOPELESS"
hc7depresan3="R7 HC19C SP NERVOUS ANXIOUS"
hc7depresan4="R7 HC19D SP UNABLE TO STOP WORRY"
hc7aslep30mn="R7 HC20 OVER 30 MIN FALL ASLEEP"
hc7trbfalbck="R7 HC21 TROBLE FALLNG BCK ASLEEP"
hc7sleepmed="R7 HC22 OFTN MEDICATE HELP SLEEP"
ht7placedesc="R7 HT3 PLACE BEST DESCRIPTION"
ht7retiresen="R7 HT4 RETIRMNT CMMTY SEN HOUSIN"
ht7diffareun="R7 HT5 DIFF AREAS UNITS TO MOVE"
ht7helpmedbd="R7 HT6 HELP W MEDS BATH DRESSING"
ht7meals="R7 HT7 MEALS FOR RESIDENTS"
ht7spacename="R7 HT10 NAME OF LIVING SPACE"
fl7facility="R7 F RE ROUTING FLAG FROM RE4f HT3 5 6 7"
fl7hotype="R7 F RE HT TYPE OF HOME"
fl7retirecom="R7 F RE HT SP LIVES IN RETIREMT COM"
se7servcoff1="R7 SE1 FAC SERVICES MEALS"
se7servcoff2="R7 SE1 FAC SERVICES HELP W RX"
se7servcoff3="R7 SE1 FAC SERV HELP BATH DRESS"
se7servcoff4="R7 SE1 FAC SERVICES LAUNDRY"
se7servcoff5="R7 SE1 FAC SERVICES HOUSEKEEP"
se7servcoff6="R7 SE1 FAC SERV VAN TO DOCTOR"
se7servcoff7="R7 SE1 FAC SRV VAN TO STORE EVNT"
se7servcoff10="R7 SE1 FAC SERV FITNESS CTR"
se7servcoff11="R7 SE1 FAC SERV WALKING AREA"
se7servcoff8="R7 SE1 FAC SERV RECREATIONAL FAC"
se7servcoff9="R7 SE1 FAC SERV SOCIAL EVENTS"
se7servcoff12="R7 SE1 FAC SERV ONSITE HEALTH"
se7servcoff13="R7 SE1 FAC SERV MED EMERGENCY SYSTEM"
se7servused1="R7 SE2 SERVS USED MEALS"
se7servused2="R7 SE2 SERVS USED HELP W RX"
se7servused3="R7 SE2 SERVS USED HLP BATH DRESS"
se7servused4="R7 SE2 SERVS USED LAUNDRY"
se7servused5="R7 SE2 SERVS USED HOUSEKEEPING"
se7servused6="R7 SE2 SERVS USED VAN TO DOCTOR"
se7servused7="R7 SE2 SERVS USED VAN TO STORE"
se7servused10="R7 SE2 SERVS USED FITNESS CTR"
se7servused11="R7 SE2 SERVS USED WALKING AREA"
se7servused8="R7 SE2 SERVS USED RECREATION FAC"
se7servused9="R7 SE2 SERVS USED SOCIAL EVENTS"
se7servused12="R7 SE2 SERVS USED ONSITE HEALTH"
se7servused13="R7 SE2 SERVS USED MED EMERGENCY SYSTEM"
se7payservi1="R7 SE3 PAYMENT FOR SERV MEALS"
se7payservi2="R7 SE3 PAYMENT FOR SERV HLP W RX"
se7payservi3="R7 SE3 PAY FR SERV HLP BATH DRSS"
se7payservi4="R7 SE3 PAYMENT FOR SERV LAUNDRY"
se7payservi5="R7 SE3 PAYMNT FOR SERV HOUSEKEEP"
se7payservi6="R7 SE3 PAYMNT FR SERV VAN TO DOC"
se7payservi7="R7 SE3 PAY FOR SERV VAN TO STORE"
se7payservi10="R7 SE3 PAY FOR SERV FITNESS CTR"
se7payservi11="R7 SE3 PAY FOR SERV WALKING AREA"
se7payservi8="R7 SE3 PAY FOR SERV RECREATION"
se7payservi9="R7 SE3 PAY FOR SERV SOCIAL EVNTS"
se7payservi12="R7 SE3 PAY FOR SERV ONSITE HEALTH"
se7payservi13="R7 SE3 PAY FOR SERV MED EMERGENCY SYSTEM"
hh7marchange="R7 HH1A MARITAL STATUS CHANGE"
hh7martlstat="R7 HH1 MARITAL STATUS CHANGE OR NEW"
hh7dmarstat="R7 D MARITAL STATUS AT R7"
hh7yrendmarr="R7 HH2C YR MARR END OR SPS PASS"
hh7newspoprt="R7 HH4A1 SPOUSE PRTNR SAME OR DIFF"
hh7spgender="R7 HH5 NEW R7 SPOU PART GENDER"
hh7dspageall="R7 D SPOU PAR AGE UPDATE AND NEW"
hh7spouseduc="R7 HH9 NEW R7 SPOU PART HIGH EDUC"
hh7spoupchlp="R7 HH10 SPOUS NEED PERS CARE HLP"
hh7livwthspo="R7 HH11 LIVE WITH SPOUSE PARTNER"
hh7placekind="R7 HH12 KIND OF PLACE LIVE IN"
hh7dmarstat="R7 D MARITAL STATUS AT R7"
hh7dlvngarrg="R7 D LIVING ARRANGEMENT"
hh7dhshldnum="R7 D TOTAL NUMBER IN HOUSEHOLD"
hh7dhshldchd="R7 D TOTAL CHILDREN IN HOUSEHOLD"
hh7dspouseid="R7 D SPOUSE ID"
cs7sistrsnum="R7 CS14 NUMBER OF LIVING SISTERS"
cs7brthrsnum="R7 CS15 NUMBER OF LIVNG BROTHERS"
cs7dnumchild="R7 D NUMBER OF CHILDREN"
cs7dnmstpchd="R7 D NUMBER OF STEP CHILDREN"
cs7dnumdaugh="R7 D NUMBER OF DAUGHTERS"
cs7dnumson="R7 D NUMBER OF SONS"
sn7dnumsn="R7 D NUMBER IN SOCIAL NETWORK"
fl7noonetalk="R7 F SN SP HAS NO ONE TO TALK TO"
ho7entrstair="R7 HO1 ENTRANCE STAIRS OUTSIDE"
ho7entrccomn="R7 HO2 ENTRANCE COMMON OR PRIVAT"
ho7entrnramp="R7 HO3 RAMP AT ENTRANCE"
ho7bldgamen1="R7 HO4A NEW RES BLDG HAS ELEVATOR"
ho7bldgamen2="R7 HO4B NEW RES BLDG STAIR LIFT GLIDE"
ho7bldgamen3="R7 HO4C NEW RES BLDG COMMN SPACE MEALS"
ho7bldgamen4="R7 HO4D NEW RES BLDG SPACE SOCIAL EVT"
ho7levelsflr="R7 HO5 NUMBR OF LEVELS OR FLOORS"
ho7homeamen1="R7 HO8A BED KITCHN BATH SAME FLR"
ho7homeamen2="R7 HO8B HOME HAS ELEVATOR"
ho7homeamen3="R7 HO8C HOME HAS STAIR LFT GLIDE"
ho7bathprivt="R7 HO10 NEW FAC RES PRIV BATH"
ho7bathamen1="R7 HO11A BATH HAS BATHTUB"
ho7bathamen2="R7 HO11B BATH HAS SHOWER STALL"
ho7bathamen3="R7 HO11C BATH GRAB BAR IN SHOWER"
ho7bathamen4="R7 HO11D BATH SEAT FR SHOWER TUB"
ho7bathamen5="R7 HO11E BATH RAISED TOILET SEAT"
ho7bathamen6="R7 HO11F BATH GRAB BARS TOILET"
ho7bathamen7="R7 HO11G BATH MED EMERGNCY SYSTM"
ho7kitchnprv="R7 HO12 NEW FAC RES PRIV KITCHEN"
ho7kitchncom="R7 HO13 NEW FAC RES COMMON KITCHEN"
ho7microwave="R7 HO14 USE OF MICROWAVE"
ho7dbldg1="R7 D BLDG HAS ELEVATOR"
ho7dbldg2="R7 D BLDG HAS STAIR LIFT GLIDE"
ho7dbldg3="R7 D BLDG HAS COMMN SPACE MEALS"
ho7dbldg4="R7 D BLDG HAS SPACE SOCIAL EVENT"
ho7dbathprvt="R7 D FAC HAS PRIVATE BATH"
ho7dkitchnpr="R7 D FAC HAS PRIV KITCHEN"
ho7dkitchnco="R7 D FAC HAS COMMON KITCHEN"
fl7bathgrbbr="R7 F HO SPS BATH HAS GRAB BARS"
fl7bathseat="R7 F HO SPS BATH HAS SEAT"
fl7raisedtlt="R7 F HO SP HAS RAISED TOILET"
fl7tltgrbbr="R7 F HO SP TOILET HAS GRAB BARS"
em7modhere1="R7 EM1 NEW RES ALL ITEMS HERE"
em7addlstyr1="R7 EM2A RAMP ADDED"
em7addlstyr2="R7 EM2B ELEVATOR ADDED"
em7addlstyr3="R7 EM2C STR LIFT ADDED"
em7addlstyr4="R7 EM2D SHWR GRABBAR ADDED"
em7addlstyr5="R7 EM2E BATHSEAT ADDED"
em7addlstyr6="R7 EM2F TOILETSEAT ADDED"
em7addlstyr7="R7 EM2G TOILET GRABBARS ADDED"
em7payyufam1="R7 EM3A SP PAID FOR RAMP"
em7payyufam2="R7 EM3B SP PAID FOR ELEVATOR"
em7payyufam3="R7 EM3C SP PAID STAIR LFT GLIDE"
em7payyufam4="R7 EM3D SP PAID SHOWER GRABBAR"
em7payyufam5="R7 EM3E SP PAID SHOWER SEAT"
em7payyufam6="R7 EM3F SP PAID RAISD TOILT SEAT"
em7payyufam7="R7 EM3G SP PAID TOILET GRABBARS"
em7paydevce1="R7 EM4A SP PAID FOR VISION AIDS"
em7paydevce2="R7 EM4B SP PAID FOR HEARING AID"
em7paydevce3="R7 EM4C SP PAID FOR CANE"
em7paydevce4="R7 EM4D SP PAID FOR WALKER"
em7paydevce5="R7 EM4E SP PAID FOR WHEELCHAIR"
em7paydevce6="R7 EM4F SP PAID FOR SCOOTER"
em7paydevce7="R7 EM4G SP PAID FOR GRABBER"
em7paydevce8="R7 EM4H SP PD SPECIAL DRESS ITM"
em7paydevce9="R7 EM4I SP PAID ADAPTED UTENSILS"
em7payaltgth="R7 EM5 PAY FOR THESE ALTOGETHER"
em7morls1000="R7 EM6 MORE LESS OR ABOUT $1000"
em7morls100="R7 EM7 MORE LESS OR ABOUT $100"
cm7knowwell="R7 CM1 PEOPL KNOW EACH OTHR WELL"
cm7willnghlp="R7 CM2 PEOPL WILLG HLP EACH OTHR"
cm7peoptrstd="R7 CM4 PEOPLE CAN BE TRUSTED"
te7cellphone="R7 TE1 WORKING CELL PHONE"
te7othrphone="R7 TE3 ONE PHONE OTHER THAN CELL"
te7computer="R7 TE6 HAS A WORKING COMPUTER"
te7compoth="R7 TE8 USED COMPUTER ANYWHRE ELS"
te7tablet="R7 TE8A SP HAS A TABLET COMPUTER"
te7emailtext="R7 TE9 EMAIL OR TEXTING"
te7oftnemail="R7 TE10 EMAIL OR TEXTING OFTEN"
te7online="R7 TE11 ONLINE COMPUTER USE"
te7shoponli1="R7 TE12A INTERNET SHOP GROCERY"
te7shoponli2="R7 TE12B INTERNET BANKING"
te7shoponli3="R7 TE12C INTERNET ORDR REFLL RX "
te7socialnet="R7 TE12D SOCIAL NETWORK SITES"
te7intrntmd1="R7 TE13A INTERNET MEDICAL PROVDR"
te7intrntmd2="R7 TE13B INTERNET INSURANCE INFO"
te7intrntmd3="R7 TE13C INTERNET HEALTH CONDS"
md7canewlker="R7 MD1 USED CANE WALKER WHLCHAIR"
md7cane="R7 MD2 USED A CANE"
md7walker="R7 MD3 USED A WALKER"
md7wheelchar="R7 MD4 USED A WHEELCHAIR"
md7whelcrspc="R7 MD4A WHELCHAIR IN LIVNG SPACE"
md7scooter="R7 MD5 USE A SCOOTER"
md7scterinsp="R7 MD5A SCOOTER IN LIVING SPACE"
fl7cane="R7 F MD SP USES CANE"
fl7walker="R7 F MD SP USES WALKER"
fl7wheelchr="R7 F MD SP USES WHEELCHAIR"
fl7whlchrhom="R7 F MD SP HAS WHEELCHR AT HOME"
fl7scooter="R7 F MD SP USES SCOOTER"
fl7scooterhm="R7 F MD SP HAS SCOOTER AT HOME"
ss7heringaid="R7 SS3 HEARING AID USED"
ss7hearphone="R7 SS4A SP CAN USE TELEPHONE"
ss7convwradi="R7 SS4B CONVERSATIN WTH TV RADIO"
ss7convquiet="R7 SS4C CONVERS IN QUIET ROOM"
ss7glasseswr="R7 SS7 WEARS GLASSES CONTCTS"
ss7seewellst="R7 SS8A SEES ACROSS THE STREET"
ss7seestvgls="R7 SS8B TV ACROSS ROOM W GLASSES"
ss7glasscls="R7 SS10 WEAR GLS CONTCS SEE CLOS"
ss7othvisaid="R7 SS11 USED OTHER VISION AIDS"
ss7glrednewp="R7 SS12 CAN READ NEWSPAPER PRINT"
ss7probchswl="R7 SS13 PROBLEMS CHEW OR SWALLOW"
ss7probspeak="R7 SS14 PROBLEMS SPEAKING"
ss7painbothr="R7 SS15 BOTHERED BY PAIN"
ss7painlimts="R7 SS17 PAIN EVER LIMTS ACTIVIT"
ss7painmedof="R7 SS18A LST MNTH OFTEN PAIN MED"
ss7painwhe1="R7 SS18B BACK PAIN IN LAST MNTH"
ss7painwhe2="R7 SS18B HIP PAIN IN LAST MONTH"
ss7painwhe3="R7 SS18B KNEE PAIN IN LAST MNTH"
ss7painwhe4="R7 SS18B FOOT PAIN IN LAST MNTH"
ss7painwhe5="R7 SS18B HAND PAIN IN LAST MNTH"
ss7painwhe6="R7 SS18B WRIST PAIN IN LAST MNTH"
ss7painwhe7="R7 SS18B SHOULDR PAIN LST MNTH"
ss7painwhe8="R7 SS18B HEAD PAIN IN LAST MNTH"
ss7painwhe9="R7 SS18B NECK PAIN IN LAST MNTH"
ss7painwhe10="R7 SS18B ARM PAIN IN LAST MNTH"
ss7painwhe11="R7 SS18B LEG PAIN IN LAST MNTH"
ss7painwhe12="R7 SS18B STOMACH PAIN LAST MNTH"
ss7painwhe13="R7 SS18B OTHR SPCFY PAIN LST MO"
ss7probbreat="R7 SS19 BREATHING PROBLEMS"
ss7prbbrlimt="R7 SS20 BREATH PROBLS LIMT ACTIV"
ss7strnglmup="R7 SS21 UPPER BOD STRENGTH LIMIT"
ss7uplimtact="R7 SS22 UP BOD STRNGTH LIMT ACT"
ss7lwrbodstr="R7 SS23 LOWER BODY STRNGTH LIMIT"
ss7lwrbodimp="R7 SS24 LWER BOD STRNGTH IMT ACT"
ss7lowenergy="R7 SS25 LOW ENERGY IN LAST MONTH"
ss7loenlmtat="R7 SS26 LOW ENERGY EVER LIM ACT"
ss7prbbalcrd="R7 SS27 BALANCE OR COORD PROBS"
ss7prbbalcnt="R7 SS28 BAL COORD PROB LIMIT ACT"
fl7deaf="R7 F SS DEAF CURRENT ROUND "
fl7blind="R7 F SS BLIND CURRENT ROUND "
pc7walk6blks="R7 PC1 ABLE TO WALK 6 BLOCKS"
pc7walk3blks="R7 PC2 ABLE TO WALK 3 BLOCKS"
pc7up20stair="R7 PC3 ABLE TO WALK UP 20 STAIRS"
pc7up10stair="R7 PC4 ABLE TO WALK UP 10 STAIRS"
pc7car20pnds="R7 PC5 ABLE TO CARRY 20 POUNDS"
pc7car10pnds="R7 PC6 ABLE TO CARRY 10 POUNDS"
pc7geonknees="R7 PC7 ABLE TO GET DOWN ON KNEES"
pc7bendover="R7 PC8 ABLE TO BEND OVER"
pc7hvobovrhd="R7 PC9 HEAVY OBJECT ABOVE HEAD"
pc7rechovrhd="R7 PC10 ABLE TO REACH OVERHEAD"
pc7opnjarwhd="R7 PC11 OPEN SEALED JAR W HANDS"
pc7grspsmobj="R7 PC12 ABLE GRASP SMALL OBJECTS"
cp7memrygood="R7 CP1 HOW GOOD MEMRY AT PRESNT"
cp7knownspyr="R7 CP2 KNOWN SP 4 AT LEAST A YR"
cp7chgthink1="R7 CP3A SP DIFF REMEMBER DATE"
cp7chgthink2="R7 CP3B SP REPEATS SELF"
cp7chgthink3="R7 CP3C SP DIFF REMEMBER APPT"
cp7chgthink4="R7 CP3D SP CHNG INTRST ACT HOB"
cp7chgthink5="R7 CP3E SP DIFF WITH MONEY MGMT"
cp7chgthink6="R7 CP3F SP DIFF LEARNG USE TOOL"
cp7chgthink7="R7 CP3G SP PRBLMS WITH JDGMNT"
cp7chgthink8="R7 CP3H SP DLY PRBLMS W THNK MEM"
cp7memcogpr1="R7 CP4A LOST IN FAMILIAR ENVIRON"
cp7memcogpr2="R7 CP4B SP WANDERD OFF NO RETRN"
cp7memcogpr3="R7 CP4C SP ABLE LEFT ALONE 1 HR"
cp7memcogpr4="R7 CP4D SP HEARS SEES THNGS"
cp7dad8dem="R7 D DEMENTIA REPORTED IN PRIOR AD8"
cg7speaktosp="R7 CG1A MAY SPEAK TO SP ASK QUES"
cg7quesremem="R7 CG1C START W QUES ABOUT MEMRY"
cg7reascano1="R7 CG1D SP CANT ANS DEMENTIA"
cg7reascano2="R7 CG1D SP CANT ANS UNABLE SPEAK"
cg7reascano3="R7 CG1D SP CANT ANS UNABLE HEAR"
cg7reascano4="R7 CG1D SP CANT ANS SP REFUSED"
cg7reascano5="R7 CG1D SP CANT ANS PROXY REFUSD"
cg7reascano6="R7 CG1D SP CANT ANS NOT PRESENT"
cg7reascano7="R7 CG1D SP CANT ANS SP TOO ILL"
cg7reascano8="R7 CG1D SP CANT ANS LANG BARRIER"
cg7reascano9="R7 CG1D SP CANT ANS OTHR SPECIFY"
cg7ratememry="R7 CG2 RATE YOUR MEMORY"
cg7ofmemprob="R7 CG3 OFTN MEMRY PROBS INTERFER"
cg7memcom1yr="R7 CG4 MEMRY COMPARD TO 1 YR AGO"
cg7todaydat1="R7 CG6Aa TODAY'S DATE CORRCT MNTH"
cg7todaydat2="R7 CG6Ab TODAY'S DATE CORRECT DAY"
cg7todaydat3="R7 CG6Ac TODAY'S DATE CORRECT YR"
cg7todaydat5="R7 CG6Ad USED AID FOR MTH DAY YEAR"
cg7todaydat4="R7 CG6Ba TODAY'S DATE CORRCT DOW"
cg7todaydat6="R7 CG6Bb USED AID FOR DAY OF WEEK"
cg7prewrdrcl="R7 CG7PRE INTRO TO WORD RECALL"
cg7dwrdlstnm="R7 D WHICH WORD LIST ASSIGNED"
cg7wrdsrcal1="R7 CG8 1 TELL WORDS U CAN RECALL"
cg7wrdsrcal2="R7 CG8 2 TELL WORDS U CAN RECALL"
cg7wrdsrcal3="R7 CG8 3 TELL WORDS U CAN RECALL"
cg7wrdsrcal4="R7 CG8 4 TELL WORDS U CAN RECALL"
cg7wrdsrcal5="R7 CG8 5 TELL WORDS U CAN RECALL"
cg7wrdsrcal6="R7 CG8 6 TELL WORDS U CAN RECALL"
cg7wrdsrcal7="R7 CG8 7 TELL WORDS U CAN RECALL"
cg7wrdsrcal8="R7 CG8 8 TELL WORDS U CAN RECALL"
cg7wrdsrcal9="R7 CG8 9 TELL WORDS U CAN RECALL"
cg7wrdsrcal10="R7 CG8 10 TELLWORDS U CAN RECALL"
cg7dwrdimmrc="R7 D SCORE IMMEDIATE WORD RECALL"
cg7dwrdinone="R7 D IMMEDIATE RECALL NONE"
cg7dwrdirref="R7 D IMMEDIATE RECALL REFUSED"
cg7wrdsntlst="R7 CG8A WORDS NOT ON LIST"
cg7numnotlst="R7 CG8B NUM WORDS NOT ON LIST"
cg7probreca1="R7 CG9 SP HAD DIFF HEARING WORDS"
cg7probreca2="R7 CG9 INTERRUPTION AS LIST READ"
cg7probreca3="R7 CG9 PROB WORD RECALL SPECIFY"
cg7probreca4="R7 CG9 WD RECALL NO PROB OCCURRD"
cg7probreca5="R7 CG9 SP REFUSED WORD RECALL"
cg7dclkdraw="R7 D SCORE OF CLOCK DRAWING TEST"
cg7dclkimgcl="R7 D IMAGE CLARITY CLOCK DRAWING"
cg7atdrwclck="R7 CG10A SP ATTEMPT CLOCK DRAWIG"
cg7presidna1="R7 CG13A PRES LAST NAME CORRECT"
cg7presidna2="R7 CG13B PRES LAST NAME INCORRCT"
cg7presidna3="R7 CG13C PRES FIRST NAME CORRCT"
cg7presidna4="R7 CG13D PRES FIRST NAME INCORR"
cg7vpname1="R7 CG14A VP LAST NAME CORRECT"
cg7vpname2="R7 CG14B VP LAST NAME INCORRECT"
cg7vpname3="R7 CG14C VP FIRST NAME CORRECT"
cg7vpname4="R7 CG14D VP FIRST NAME INCORRECT"
cg7wrdsdcal1="R7 CG15 1 DELAYED WORD RECALL"
cg7wrdsdcal2="R7 CG15 2 DELAYED WORD RECALL"
cg7wrdsdcal3="R7 CG15 3 DELAYED WORD RECALL"
cg7wrdsdcal4="R7 CG15 4 DELAYED WORD RECALL"
cg7wrdsdcal5="R7 CG15 5 DELAYED WORD RECALL"
cg7wrdsdcal6="R7 CG15 6 DELAYED WORD RECALL"
cg7wrdsdcal7="R7 CG15 7 DELAYED WORD RECALL"
cg7wrdsdcal8="R7 CG15 8 DELAYED WORD RECALL"
cg7wrdsdcal9="R7 CG15 9 DELAYED WORD RECALL"
cg7wrdsdca10="R7 CG15 10 DELAYED WORD RECALL"
cg7dwrddlyrc="R7 D SCORE DELAYED WORD RECALL"
cg7dwrddnone="R7 D DELAYED RECALL NONE"
cg7dwrddrref="R7 D DELAYED RECALL REFUSED"
cg7wrdnotlst="R7 CG16 WORDS NOT ON LIST"
cg7numwrdnot="R7 CG17 NUM OF WORDS NOT ON LIST"
cg7dwrd1rcl="R7 D WORD1 IMMEDIATE RECALL"
cg7dwrd2rcl="R7 D WORD2 IMMEDIATE RECALL"
cg7dwrd3rcl="R7 D WORD3 IMMEDIATE RECALL"
cg7dwrd4rcl="R7 D WORD4 IMMEDIATE RECALL"
cg7dwrd5rcl="R7 D WORD5 IMMEDIATE RECALL"
cg7dwrd6rcl="R7 D WORD6 IMMEDIATE RECALL"
cg7dwrd7rcl="R7 D WORD7 IMMEDIATE RECALL"
cg7dwrd8rcl="R7 D WORD8 IMMEDIATE RECALL"
cg7dwrd9rcl="R7 D WORD9 IMMEDIATE RECALL"
cg7dwrd10rcl="R7 D WORD10 IMMEDIATE RECALL"
cg7dwrd1dly="R7 D WORD1 DELAYED RECALL"
cg7dwrd2dly="R7 D WORD2 DELAYED RECALL"
cg7dwrd3dly="R7 D WORD3 DELAYED RECALL"
cg7dwrd4dly="R7 D WORD4 DELAYED RECALL"
cg7dwrd5dly="R7 D WORD5 DELAYED RECALL"
cg7dwrd6dly="R7 D WORD6 DELAYED RECALL"
cg7dwrd7dly="R7 D WORD7 DELAYED RECALL"
cg7dwrd8dly="R7 D WORD8 DELAYED RECALL"
cg7dwrd9dly="R7 D WORD9 DELAYED RECALL"
cg7dwrd10dly="R7 D WORD10 DELAYED RECALL"
mo7outoft="R7 MO1 OFTEN GO OUTSIDE"
mo7outcane="R7 MO2 CANE USED OUTSIDE"
mo7outwalkr="R7 MO3 WALKER USED OUTSIDE"
mo7outwlchr="R7 MO4 WHEELCHAIR USED OUTSIDE"
mo7outsctr="R7 MO5 SCOOTER USED OUTSIDE"
mo7outhlp="R7 MO6 HELP GO OUTSIDE"
mo7outslf="R7 MO7 LEFT BY YOURSELF"
mo7outdif="R7 MO8 HOW DIFFICULT"
mo7outyrgo="R7 MO9 HOW OFTEN LEAVE"
mo7outwout="R7 MO10 STAYED IN NO HELP"
mo7oftgoarea="R7 MO11 HOW OFTEN GO OTHER AREAS"
mo7oflvslepr="R7 MO12 HOW OFTN LEAVE BEDROOM"
mo7insdcane="R7 MO13 OFTEN USED CANE INSIDE"
mo7insdwalkr="R7 MO14 OFTEN USED WALKER INSIDE"
mo7insdwlchr="R7 MO15 OFT USD WHEELCHAR INSIDE"
mo7insdsctr="R7 MO16 OFTEN USD SCOOTER INSIDE"
mo7oftholdwl="R7 MO17 OFTEN HOLD WALLS INSIDE"
mo7insdhlp="R7 MO18 GOT HELP INSIDE"
mo7insdslf="R7 MO20 HOW OFTEN BY YOURSELF"
mo7insddif="R7 MO21 HOW DIFF GET ARD W DEVCE"
mo7insdyrgo="R7 MO22 HOW OFTEN COMPRED YR AGO"
mo7insdwout="R7 MO23 PLACES INSIDE DID NOT GO"
mo7beddev="R7 MO24 OUT OF BED USED DEVICE"
mo7bedhlp="R7 MO25 GOT HELP OUT OF BED"
mo7bedslf="R7 MO26 OFT GOT OUT BED BY SLF"
mo7beddif="R7 MO27 DIFF GET OUT BED BY SELF"
mo7bedwout="R7 MO28 OFTEN HAD TO STAY IN BED"
mo7doutsfdf="R7 D GO OUTSIDE SELF "
mo7doutdevi="R7 D GO OUTSIDE USING DEVICES"
mo7douthelp="R7 D GO OUTSIDE USING HELP"
mo7dinsdsfdf="R7 D MOVE INSIDE SELF"
mo7dinsddevi="R7 D MOVE INSIDE WITH DEVICES"
mo7dinsdhelp="R7 D MOVE INSIDE WITH HELP"
mo7dbedsfdf="R7 D GET OUT OF BED"
mo7dbeddevi="R7 D DEVICE USE 2 GET OUT OF BED"
mo7dbedhelp="R7 D HELP TO GET OUT OF BED"
fl7didntleav="R7 F MO SP DID NOT LEAVE HOME"
fl7ntlvrmslp="R7 F MO SP DID NOT LEAVE BEDROOM"
dm7helpmobil="R7 DM1 GET HELP WITH MOBILITY"
dm7helpstmo="R7 DM3C MONTH MOBIL HELP STARTED"
dm7helpstyr="R7 DM3C1 YEAR MOBIL HELP STARTED"
dm7helpendmo="R7 DM3D MONTH MOBIL HELP ENDED"
dm7helpendyr="R7 DM3D1 YEAR MOBIL HELP ENDED"
dm7nohelp="R7 DM3E NO MOBIl HELP MTH PLUS"
dm7nohelpmos="R7 DM3F MONTHS OF NO MOBIl HELP"
dm7lstyrcane="R7 DM4 IN LST YR USE CANE WALKER"
dm7devstmo="R7 DM6C MONTH DEVICE USE STARTED"
dm7devstyr="R7 DM6C1 YEAR DEVICE USE STARTED"
dm7devendmo="R7 DM6D MONTH DEVICE USE ENDED"
dm7devendyr="R7 DM6D1 YEAR DEVICE USE ENDED"
dm7nodev="R7 DM6E NO DEVICE MONTH PLUS"
dm7nodevmos="R7 DM6F MONTHS OF NO DEVICE"
dm7dmohlp="R7 D MONTHS OF MOBILITY HELP"
dm7dmodev="R7 D MONTHS OF MOBILITY DEVICE HELP"
dm7dmohlpgr="R7 D MOBILITY HELP GROUP"
dm7dmodevgr="R7 D MOBILITY DEVICE GROUP"
dmds7dintvl="R7 D MONTHS BETWEEN LAST INT AND EITHER CURRENT INT OR DATE OF DEATH"
dm7flag="R7 D SPECIAL CASES DM SECTION ROUTE"
dt7driveyr="R7 DT1A DRIVE IN LAST YEAR"
dt7oftedrive="R7 DT1 HOW OFTEN DRIVE PLACES"
dt7avoidriv1="R7 DT3A AVOID DRIVING AT NIGHT"
dt7avoidriv2="R7 DT3A AVOID DRIVING ALONE"
dt7avoidriv3="R7 DT3A AVOID DRIVING HIGHWAYS"
dt7avoidriv4="R7 DT3A AVOID DRIVING BAD WEATHER"
dt7getoplcs1="R7 DT4A SP WALKED GOT PLACES"
dt7getoplcs2="R7 DT4B GOT RIDE FAM FRIEND PD"
dt7getoplcs3="R7 DT4C VANSHUTTLE PROV BY PLACE"
dt7getoplcs4="R7 DT4D VAN SHUTTLE FOR SENIORS"
dt7getoplcs5="R7 DT4E SP TOOK PUBLIC TRANSPRT"
dt7getoplcs6="R7 DT4F SP TOOK TAXI GOT PLACES"
dt7getoplcs7="R7 DT4G GOT PLACES OTHR SPECIFY"
dt7otfrfamtk="R7 DT6 ANTH FND FAM MEM TOOK YOU"
fl7drives="R7 F DT SP DRIVES CAR"
fl7drvlstyr="R7 F DT SP DROVE CAR IN PAST YR"
fl5dneverdrv="R5 F DT SP NEVER DROVE WHEN ADDED"
ha7laun="R7 HA1 HOW LAUNDRY GOT DONE"
ha7launslf="R7 HA1A DO LAUNDRY YOURSELF"
ha7whrmachi1="R7 HA2 WASH MACHINE IN HOME"
ha7whrmachi2="R7 HA2 WASH MACHIN IN BUILDING"
ha7whrmachi3="R7 HA2 WASH MACHIN LAUNDROMAT"
ha7whrmachi4="R7 HA2 WASH MACHIN SINK IN HOME"
ha7whrmachi5="R7 HA2 WASH MACH SINK IN BUILDNG"
ha7whrmachi6="R7 HA2 WASH MACHIN OTHR SPECIFY"
ha7dlaunreas="R7 D LAUNDRY REASN WITH BY OTHERS"
ha7laundif="R7 HA5 DIFF DOING LAUNDY BY SELF"
ha7launoft="R7 HA6 HOW OFTEN DO LAUNDRY"
ha7launwout="R7 HA7 EVER GO WOUT CLEAN LAUNDR"
ha7shop="R7 HA20 HOW YOUR SHOPPING DONE"
ha7shopslf="R7 HA20A EVER SHOP BY YOURSELF"
ha7howpaygr1="R7 HA22 PAY GROC PERS ITMS CASH"
ha7howpaygr2="R7 HA22 PAY GROC PERS ITMS CHCK"
ha7howpaygr3="R7 HA22 PAY GROC PERS ITMS DEBIT"
ha7howpaygr4="R7 HA22 PAY GROC PERS CREDIT"
ha7howpaygr5="R7 HA22 PAY GROC PERS FOOD STMP"
ha7howpaygr6="R7 HA22 PAY GROC PERS SMON ELS"
ha7howpaygr7="R7 HA22 PAY GROC PERS OTHR SPEC"
ha7howgtstr1="R7 HA23 DROVE TO THE STORE"
ha7howgtstr2="R7 HA23 FAM FRND PD HLP DROVE"
ha7howgtstr3="R7 HA23 VAN PLACE SP LIVES DROVE"
ha7howgtstr4="R7 HA23 VAN 4 DIS SENIORS DROVE"
ha7howgtstr5="R7 HA23 PUBLIC TRANSPORT 2 STORE"
ha7howgtstr6="R7 HA23 SP TOOK TAXI 2 THE STORE"
ha7howgtstr7="R7 HA23 SP WALKED TO THE STORE"
ha7howgtstr8="R7 HA23 OTHR SPECIFY TO STORE"
ha7shopcart="R7 HA24A EVER USE MOTORIZED CART"
ha7shoplean="R7 HA24B EVER LEAN ON SHOP CART"
ha7dshopreas="R7 D SHOP REASN WITH BY OTHERS "
ha7shopdif="R7 HA27 DIFF SHOPPING BY SELF"
ha7shopoft="R7 HA28 HOW OFT SHOP GROCERIES"
ha7shopwout="R7 HA29 EVER GO WITHOUT GROCRIES"
ha7meal="R7 HA30 HOW HOT MEALS GET MADE"
ha7mealslf="R7 HA30A MAKE HOT MEALS YOURSELF"
ha7restamels="R7 HA30B OFTN HAV RESTARNT MEALS"
ha7mealwheel="R7 HA30C OFTN GET MEALS ON WHEEL"
ha7oftmicrow="R7 HA31 OFTEN USE THE MICROWAVE"
ha7dmealreas="R7 D MEALS REASN WITH BY OTHERS"
ha7mealdif="R7 HA34 DIFICULTY MAK MEALS SELF"
ha7mealoft="R7 HA35 HOW OFTEN MAKE HOT MEALS"
ha7mealwout="R7 HA36 EVER GO WITHOUT HOT MEAL"
ha7bank="R7 HA40 HOW BILLS BANKIN HANDLED"
ha7bankslf="R7 HA40A HNDL BILLS BNKING YRSLF"
ha7dbankreas="R7 D BANK BILL REASN WITH BY OTH"
ha7bankdif="R7 HA44 DIF HNDL BLLS BNKING SLF"
ha7bankoft="R7 HA45 HOW OFTEN YOU PAY BILLS"
ha7bankwout="R7 HA46 EVER GO WOUT PAYIN BILLS"
ha7money="R7 HA50 MONEY MATTERS TO HANDLE"
ha7moneyhlp="R7 HA51 ANYONE HLP W MONY MATTRS"
ha7dlaunsfdf="R7 D LAUNDRY SELF AND DIFF LEVEL"
ha7dshopsfdf="R7 D SLF SHOPPING AND DIFF LEVEL"
ha7dmealsfdf="R7 D SELF MEALS AND DIFF LEVEL"
ha7dbanksfdf="R7 D SELF BANKS AND DIFF LEVEL"
ha7dmealwhl="R7 D HELPER IS MEALS ON WHEELS"
ha7dmealtkot="R7 D HELPER IS RESTAURNT TAKEOUT"
sc7eatdev="R7 SC1 EVER USE ADAPTED UTENSILS"
sc7eatdevoft="R7 SC2 OFTEN USE ADAPTED UTENSLS"
sc7eathlp="R7 SC3 DID ANYONE HELP YOU EAT"
sc7eatslfoft="R7 SC4 HOW OFTEN EAT BY YOURSELF"
sc7eatslfdif="R7 SC5 DIFFICULTY EATING BY SELF"
sc7eatwout="R7 SC6 GO WOUT EAT BECSE NO HELP"
sc7showrbat1="R7 SC7 SP SHOWERED"
sc7showrbat2="R7 SC7 SP TOOK BATHS IN A TUB"
sc7showrbat3="R7 SC7 SP WASHED SOME OTHR WAY"
sc7bdevdec="R7 SC7A USE BATH DEVICE IN LML"
sc7prfrshbth="R7 SC8 PREFER SHOWR BATH OR OTHR"
sc7scusgrbrs="R7 SC9 HOW OFTEN USE GRAB BARS"
sc7shtubseat="R7 SC10 OFTN USE SHOWR TUB SEAT"
sc7bathhlp="R7 SC11 ANYN HLP SHOWR BATH OTHR"
sc7bathoft="R7 SC12 HOW OFTEN BATHE YOURSELF"
sc7bathdif="R7 SC13 DIFF USING BARS OR SEATS"
sc7bathyrgo="R7 SC14 BATHE MRE OFT THN YR AGO"
sc7bathwout="R7 SC15 EVER GO WITHOUT WASHING"
sc7usvartoi1="R7 SC16 SP USED PORTABLE COMMODE"
sc7usvartoi2="R7 SC16 SP USED PADS UNDERGMT"
sc7usvartoi3="R7 SC16 USED GRABBARS FR TOILET"
sc7usvartoi4="R7 SC16 USED RAISED TOILET SEAT"
sc7toilhlp="R7 SC17 ANYON HLP YOU USE TOILET"
sc7toiloft="R7 SC18 OFTEN USE TOILET BY SELF"
sc7toildif="R7 SC19 DIFFICUTY TOILETING SELF"
sc7toilwout="R7 SC20 ACCIDENT WET SOIL CLTHES"
sc7dresoft="R7 SC21 OFTEN YOU GET DRESSED"
sc7dresdev="R7 SC22 USE SPECL ITEMS TO DRESS"
sc7dreshlp="R7 SC23 ANYONE HELP GET DRESSED"
sc7dresslf="R7 SC24 OFTEN YOU DRESS YOURSELF"
sc7dresdif="R7 SC25 DIF WHN US SP ITMS YRSLF"
sc7dresyrgo="R7 SC26 HOW OFTN YOU GET DRESSED"
sc7dreswout="R7 SC27 GO WITHOUT GTTNG DRESSED"
sc7deatdevi="R7 D USES DEVICES WHILE EATING"
sc7deathelp="R7 D HAS HELP EATING"
sc7deatsfdf="R7 D DIFF EATING BY SELF WO HELP"
sc7dbathdevi="R7 D USES DEVICES WHILE BATHING"
sc7dbathhelp="R7 D HAS HELP WHILE BATHING"
sc7dbathsfdf="R7 D DIFF BATHING SELF NO HELP"
sc7dtoildevi="R7 D USES DEVICE WHILE TOILETING"
sc7dtoilhelp="R7 D HAS HELP WHILE TOILETING"
sc7dtoilsfdf="R7 D DIFF LEVEL TOILETING SELF"
sc7ddresdevi="R7 D USES DEVICES WHILE DRESSING"
sc7ddreshelp="R7 D HAS HELP WHILE DRESSING"
sc7ddressfdf="R7 D DIFF LEVEL DRESSING SELF"
fl7showering="R7 F SC SP USES SHOWER"
fl7takingbth="R7 F SC SP TAKES BATHS"
fl7washingup="R7 F SC SP WASHES OTHER WAY"
ds7gethlpeat="R7 DS1 GET HELP WITH EATING, ETC"
ds7helpstmo="R7 DS3C MONTH SELF CARE HLP START"
ds7helpstyr="R7 DS3C1 YEAR SELF CARE HELP STARTED"
ds7helpendmo="R7 DS3D MONTH SELF CARE HELP ENDED"
ds7helpendyr="R7 DS3D1 YEAR SELF CARE HELP ENDED"
ds7nohelp="R7 DS3E NO SELF CARE HELP MTH PLUS"
ds7nohelpmos="R7 DS3F MONTHS OF NO SELF CARE HELP"
ds7dschlp="R7 D MONTHS OF SELF CARE HELP"
ds7dschlpgr="R7 D SELF CARE HELP GROUP"
ds7flag="R7 D SPECIAL CASES DS SECTION ROUTE"
mc7meds="R7 MC1 IN MNTH TKE MEDS PRESCRBD"
mc7medstrk="R7 MC2 KEEP TRCK PRESCRIED MEDS"
mc7medsslf="R7 MC2A LAST MNTH KEEP TRACK SLF"
mc7whrgtmed1="R7 MC3 SP GOT MEDS LOCAL STORE"
mc7whrgtmed2="R7 MC3 SP GOT MEDS BY MAIL"
mc7whrgtmed3="R7 MC3 SP GOT MEDS HC PRVDR HSP"
mc7whrgtmed4="R7 MC3 SP GOT MEDS OTHR SPECIFY"
mc7howpkupm1="R7 MC3B SP PICKD UP MEDS BY SELF"
mc7howpkupm2="R7 MC3B SP HAD MEDS DELIVERED"
mc7howpkupm3="R7 MC3B SMEON ELSE PICKD UP MEDS"
mc7medsrem="R7 MC4 USE REMNDERS TO KEEP TRCK"
mc7dmedsreas="R7 D MEDS REASN BY WITH OTHERS "
mc7medsdif="R7 MC7 HOW DIFFIC KEEP TRACK MED"
mc7medsyrgo="R7 MC8 COMPAR YR AGO HW KEP TRCK"
mc7medsmis="R7 MC9 MAKE MISTAKE TAKING MEDS"
mc7havregdoc="R7 MC10 YOU HAVE REGULAR DOCTOR"
mc7regdoclyr="R7 MC12 SEEN REG DOC WTHN LST YR"
mc7hwgtregd1="R7 MC15 SP DROVE SELF TO REG DOC"
mc7hwgtregd2="R7 MC15 FAM PD HLP DRVE REG DOC"
mc7hwgtregd3="R7 MC15 VAN PLCE SP LIVE REG DOC"
mc7hwgtregd4="R7 MC15 VAN FR DIS SENIOR REG DC"
mc7hwgtregd5="R7 MC15 PUBLIC TRANSPORT REG DOC"
mc7hwgtregd6="R7 MC15 SP TOOK TAXI TO REG DOC"
mc7hwgtregd7="R7 MC15 SP WALKED TO REG DOC"
mc7hwgtregd8="R7 MC15 REG DOC WAS HOME VISIT"
mc7hwgtregd9="R7 MC15 OTHR SPECIFY REG DOC"
mc7ansitindr="R7 MC16 ANONE SIT IN W YOU AT DR"
mc7tpersevr1="R7 MC19 HLP UPTO EXAM TBL DRESS"
mc7tpersevr2="R7 MC19 REMND SP OF QSTNS FR DOC"
mc7tpersevr3="R7 MC19 ASK TELL DOC THINGS 4 SP"
mc7tpersevr4="R7 MC19 HLP SP UNDERSTAND DOC"
mc7chginspln="R7 MC20 CHGD ADD INS OR DRUG PLN"
mc7anhlpwdec="R7 MC21 ANYONE HELP W DECISION"
mc7dmedssfdf="R7 D DIFF LEVEL MEDICATIONS SELF"
pa7vistfrfam="R7 PA1 EVER VISIT FRIENDS FAMILY"
pa7hlkepfvst="R7 PA2 HLTH KP FR VIST FAM FRNDS"
pa7trkpfrvis="R7 PA3 TRAN PRB KP FR VST FRNDS"
pa7impvstfam="R7 PA4 IMPRTNT VISIT FRNDS FAMLY"
pa7attrelser="R7 PA5 EVER ATTEND RELIG SERVCES"
pa7htkfrrlsr="R7 PA6 HEALTH KEEP FRM RELI SERV"
pa7trprrelsr="R7 PA7 TRAN PRO KEEP FM RELG SER"
pa7imprelser="R7 PA8 HW IMPORT ARE RELIG SERVS"
pa7clbmtgrac="R7 PA9 CLUB MEETINGS GRP ACTIVES"
pa7hlkpfrclb="R7 PA10 HELTH KEP FRM CLB MTINGS"
pa7trprkpfgr="R7 PA11 TRANS PROB KEEP FM GROPS"
pa7imparclub="R7 PA12 IMPORT PARTIC CLUBS GRUP"
pa7outfrenjy="R7 PA13 EVER GO OUT FOR ENJOYMNT"
pa7hlkpgoenj="R7 PA14 HLTH KP GO OUT FOR ENJOY"
pa7trprgoout="R7 PA15 TRANSPROB KEEP FM GO OUT"
pa7impouteny="R7 PA16 IMPORT GO OUT FOR ENJOYT"
pa7workfrpay="R7 PA17 EVER WORK FOR PAY"
pa7hlkpfrwrk="R7 PA18 HEALTH KEEP YOU FRM WORK"
pa7voltrwork="R7 PA19 EVER DO VOLUNTEER WORK"
pa7hlkpfrvol="R7 PA20 HELTH KEEP FM VOLUNTRING"
pa7prcranoth="R7 PA21 PROVIDE CARE ANTHER PERS"
pa7evrgowalk="R7 PA23 EVER GO WALKING"
pa7vigoractv="R7 PA24 EVER VIGOROUS ACTIVITIES"
pa7dofavact="R7 PA25A GET TO DO FAV ACT LST YR"
pa7fvactlimyr="R7 PA26 HEALTH LIMIT FAV ACTIVITY YEAR"
pa5dfavact="R5 D FAVORITE ACTIVITY AT R5"
rh7rehab="R7 RH1 RECEIVED REHAB IN LAST YEAR"
rh7rehabmo="R7 RH1A MONTHS OF REHAB"
rh7rehabweek="R7 RH1B WEEKS OF REHAB"
rh7rehabsurg="R7 RH2 REHAB POST SURGERY"
rh7surgcond="R7 RH3 MAIN MED CONDITION FOR SURGERY"
rh7rehabcond="R7 RH4 MAIN MED CONDITION FOR REHAB"
rh7funcback="R7 RH5 IMPROVE FUNCTION IN BACK"
rh7funchips="R7 RH5 IMPROVE FUNCTION IN HIPS"
rh7funcknees="R7 RH5 IMPROVE FUNCTION IN KNEES"
rh7funcfeet="R7 RH5 IMPROVE FUNCTION IN FEET"
rh7funchands="R7 RH5 IMPROVE FUNCTION IN HANDS"
rh7funcwrist="R7 RH5 IMPROVE FUNCTION IN WRIST"
rh7funcshold="R7 RH5 IMPROVE FUNCTION IN SHOULDERS"
rh7funchead="R7 RH5 IMPROVE FUNCTION IN HEAD"
rh7funcneck="R7 RH5 IMPROVE FUNCTION IN NECK"
rh7funcarms="R7 RH5 IMPROVE FUNCTION IN ARMS"
rh7funclegs="R7 RH5 IMPROVE FUNCTION IN LEGS"
rh7funcstom="R7 RH5 IMPROVE FUNCTION IN STOMACH"
rh7funcmouth="R7 RH5 IMPROVE FUNCTION IN MOUTH"
rh7funcheart="R7 RH5 IMPROVE FUNCTION IN HEART"
rh7funclung="R7 RH5 IMPROVE FUNCTION IN LUNGS"
rh7funcos="R7 RH5 IMPROVE FUNCTION OTHER SPECIFY"
rh7funcnotsp="R7 RH5 IMPROVE FUNCTION NO SPECIFIC PLACE"
rh7impchew="R7 RH6 IMPROVE CHEWING SWALLOWING"
rh7impspeak="R7 RH6 IMPROVE SPEAKING BEING UNDERSTOOD"
rh7impspain="R7 RH6 IMPROVE PAIN LEVEL"
rh7impbreath="R7 RH6 IMPROVE BREATHING"
rh7impweak="R7 RH6 IMPROVE STRENGTH"
rh7impmove="R7 RH6 IMPROVE MOVEMENT RANGE OF MOTION"
rh7impenergy="R7 RH6 IMPROVE ENERGY LEVEL"
rh7impbal="R7 RH6 IMPROVE BALANCE COORDINATION"
rh7impfall="R7 RH6 IMPROVE PROBLEMS WITH FALLS"
rh7impmemory="R7 RH6 IMPROVE MEMORY"
rh7impnone="R7 RH6 IMPROVE NONE OF THESE PROBLEMS"
rh7impbed="R7 RH6B IMPROVE GETTING OUT OF BED"
rh7impwalk="R7 RH6B IMPROVE WALKING INSIDE HOME"
rh7impleave="R7 RH6B IMPROVE LEAVING HOME OUTSIDE"
rh7impdistnc="R7 RH6B IMPROVE WALKING DISTANCES OUTSIDE"
rh7impclimb="R7 RH6B IMPROVE CLIMBING STAIRS"
rh7impdrive="R7 RH6B IMPROVE DRIVING"
rh7imptransp="R7 RH6B IMPROVE USING OTHER TRANSPORTATION"
rh7impnotths="R7 RH6B IMPROVE NONE OF THESE MOBIL ACT"
rh7impsc="R7 RH6C IMPROVE CARING FOR SELF"
rh7imphh="R7 RH6C IMPROVE HOUSEHOLD ACTIVITIES"
rh7impcomp="R7 RH6C IMPROVE USING COMPUTER TABLET"
rh7impwork="R7 RH6C IMPROVE WORKING VOLUNTEERING"
rh7impcare="R7 RH6C IMPROVE PROVIDING CARE"
rh7impactiv="R7 RH6C IMPROVE PARTICIPATING ACTIVITIES"
rh7impactnon="R7 RH6C IMPROVE NONE OF THESE ACTIVITIES"
rh7devcane="R7 RH6D THERAPIST RECOMMEND CANE WALKER"
rh7devwhlch="R7 RH6D THERAPIST RECOMMEND WHEELCHR SCOOTER"
rh7devramp="R7 RH6D THERAPIST RECOMMEND ENTRANCE RAMP"
rh7devstair="R7 RH6D THERAPIST RECOMMEND STAIR LIFT GLIDE"
rh7devtub="R7 RH6D THERAPIST RECOMMEND GRABBAR TUB SEAT"
rh7devtoil="R7 RH6D THERAPIST RECOMMEND GRABBAR TOIL SEAT"
rh7deveat="R7 RH6D THERAPIST RECOMMEND ADAPTED UTENSIL"
rh7devdres="R7 RH6D THERAPIST RECOMMEND DRESSING DEV"
rh7devgrab="R7 RH6D THERAPIST RECOMMEND REACHER GRABBER"
rh7devcomp="R7 RH6D THERAPIST RECOMMEND COMPUTER DEVICE"
rh7devcar="R7 RH6D THERAPIST RECOMMEND CAR DEVICE"
rh7devother="R7 RH6D THERAPIST RECOMMEND OTHER CHANGES"
rh7place1="R7 RH7A RECEIVE REHAB OVERNIGHT HOSP NH REHAB"
rh7place2="R7 RH7B RECEIVE REHAB OUTPATIENT"
rh7place3="R7 RH7C RECEIVE REHAB HOME"
rh7place4="R7 RH7D RECEIVE REHAB SOMEWHERE ELSE"
rh7place5="R7 RH7E RECEIVE REHAB OTHER SPECIFY PLACE TYPE"
rh7placelast="R7 RH8 PLACE LAST RECEIVED REHAB"
rh7ability="R7 RH9 FUNCTIONING IMPROVE IN REHAB"
rh7abilimp="R7 RH9A HOW MUCH FUNCTIONING IMPROVE IN REHAB"
rh7abilworse="R7 RH9B HOW MUCH FUNCTIONING WORSE IN REHAB"
rh7rehabnow="R7 RH10 STILL RECEIVING REHAB"
rh7metgoals="R7 RH11 MET GOALS WHEN REHAB ENDED"
rh7metinsur="R7 RH12 MET INSURANCE LIMIT WHEN REHAB ENDED"
rh7abilnow="R7 RH13 FUNCTIONING IMPROVE WHEN REHAB ENDED"
rh7nowimp="R7 RH14 HOW MUCH FUNCTION IMPROVE AFTER REHAB"
rh7nowworse="R7 RH15 HOW MUCH FUNCTION WORSE AFTER REHAB"
sd7smokesnow="R7 SD2 SMOKES NOW"
sd7numcigday="R7 SD3 NUM OF CIGARETTES PER DAY"
pe7whhndsign="R7 PE1 HAND USE TO SIGN YOR NAME"
pe7surghdwrt="R7 PE2 HAVE SURGRY TO HAND WRIST"
pe7surgyside="R7 PE3 WHICH SIDE WAS SURGERY"
pe7flruppain="R7 PE4 EXPER FLARE UP PAIN HAND"
pe7sideflrup="R7 PE5 SIDE CURRNT FLARE UP PAIN"
pe7surgarmsh="R7 PE6 SURGERY ARM OR SHOULDER"
pe7sidsurgar="R7 PE7 SIDE SURGERY ARM OR SHLDR"
pe7surgyhips="R7 PE8 SURG HIPS INCLUD REPLCMNT"
pe7sidhipsrg="R7 PE9 SIDE WAS HIP SURGERY ON"
pe7stndwhold="R7 PE11 STAND WITHOUT HOLDING ON"
pe7upchbyslf="R7 PE12 GET UP OUT CHAIR BY SELF"
pe7wlkdsself="R7 PE13 WALK SHORT DIST BY SELF"
fl7lefthand="R7 F PE CAN SP DO LEFT HAND TEST"
fl7righthand="R7 F PE CAN SP DO RGT HAND TEST"
fl7eiherhand="R7 F PE CAN SP DO EITHR HAND TST"
fl7lftgrptst="R7 F PE CAN SP DO LFT GRIP TEST"
fl7rhtgrptst="R7 F PE CAN SP DO RIGHT GRIP TST"
fl7charstnds="R7 F PE CAN SP DO CHAIR STANDS"
fl7balstands="R7 F PE CAN SP DO BALANCE STANDS"
fl7wlkingrse="R7 F PE CAN SP DO WALKING COURSE"
bc7dconsent="R7 D BC2 SP CONSENT BLOOD SPOT COLLECTION"
ba7dblssadm="R7 D BALANCE SIDE BY SIDE ADMIN"
ba7dblstadm="R7 D BALANCE SEMI TANDEM ADMIN"
ba7dblftadm="R7 D BALANCE FULL TANDEM ADMIN"
ba7dblopadm="R7 D BALANCE 1 LEG OP EYE ADMIN"
ba7dblcladm="R7 D BALANCE 1 LEG CLS EYE ADMIN"
wa7dwlkadm="R7 D WALKING COURSE ADMIN"
ch7dschradm="R7 D SINGLE CHAIR ADMIN"
ch7drchradm="R7 D REPEAT CHAIR ADMIN"
gr7dgripadm="R7 D GRIP STRENGTH ADMIN"
wc7dwaistadm="R7 D WAIST CIRCUMFERENCE ADMIN"
pk7dpeakadm="R7 D PEAK AIR FLOW ADMIN"
ab7datemonth="R7 AB COVER DATE MONTH"
ab7dateyear="R7 AB COVER DATE YEAR"
in7strtabhrs="R7 IN8 START TIME HOURS"
in7strtabmin="R7 IN8 START TIME MINUTES"
in7strtmampm="R7 IN8 START TIME AM OR PM"
ba7sxsresult="R7 BA3 SIDE BY SIDE STAND RESULT"
ba7blstdsecs="R7 BA4A SECS SIDE BY SIDE STAND"
ba7blstdhndr="R7 BA4B HNRDS SIDE BY SIDE STND"
ba7rsn1ssstd="R7 BA5 1 NO STAND SP FELT UNSAFE"
ba7rsn2ssstd="R7 BA5 2 NO STAND PRXY FELT UNSF"
ba7rsn3ssstd="R7 BA5 3 NO STND INTWR FELT UNSF"
ba7rsn4ssstd="R7 BA5 4NO STND SP UNABL2UNDRSTD"
ba7rsn9ssstd="R7 BA5 9 NO STAND OTHER SPECIFY"
ba7stdmreslt="R7 BA7 SEMI TANDEM STAND RESULT"
ba7stdmsecs="R7 BA8A SECS HELD SEMI TANDM STD"
ba7stdmhndr="R7 BA8B HNRDS HLD SEMI TANDM STD"
ba7rsn1ststd="R7 BA9 1 NO STNDM SP FELT UNSAFE"
ba7rsn2ststd="R7 BA9 2NO STNDM PRXY FELT UNSAF"
ba7rsn3ststd="R7 BA9 3 NO STNDM INTR FELT UNSF"
ba7rsn4ststd="R7 BA9 4NO STNDM SP UNABL2UNDSTD"
ba7rsn9ststd="R7 BA9 9 NO STNDM OTHER SPECIFY"
ba7ftdmreslt="R7 BA11 FULL TANDEM STAND RESULT"
ba7ftdmsecs="R7 BA12A SECS HLD FULL TANDM STD"
ba7ftdmhndr="R7 BA12B HNRDS HLD FLL TANDM STD"
ba7rsn1ftstd="R7 BA13 1 NO FTNDM SP FLT UNSAFE"
ba7rsn2ftstd="R7 BA13 2NO FTNDM PRXY FLT UNSAF"
ba7rsn3ftstd="R7 BA13 3 NO FTNDM INTR FLT UNSF"
ba7rsn4ftstd="R7 BA13 4NO FTNDM SP UNABL2UNDST"
ba7rsn9ftstd="R7 BA13 9 NO FTNDM OTHER SPECIFY"
ba71leoreslt="R7 BA15 ONE LEG STAND EYES OPEN"
ba71leosfsec="R7 BA16A SECS HLD 1LEG EYES OPEN"
ba71leohndr="R7 BA16B HNRDS HLD 1LEG EYE OPEN"
ba7rsn11leo="R7 BA17 1 NO1LEGEO SP FLT UNSAFE"
ba7rsn21leo="R7 BA17 2NO1LEGEO PRXY FLT UNSAF"
ba7rsn31leo="R7 BA17 3 NO1LEGEO INTR FLT UNSF"
ba7rsn41leo="R7 BA17 4NO1LEGEO SP UNABL2UNDST"
ba7rsn91leo="R7 BA17 9NO1LEGEO OTHER SPECIFY"
ba71lecreslt="R7 BA19 ONE LEG STAND EYES CLOS"
ba71lecsfsec="R7 BA20A SECS HLD 1LEG EYES CLOS"
ba71lechndr="R7 BA20B HNRDS HLD 1LEG EYE CLOS"
ba7rsn11lec="R7 BA21 1 NO1LEGEC SP FLT UNSAFE"
ba7rsn21lec="R7 BA21 2NO1LEGEC PRXY FLT UNSAF"
ba7rsn31lec="R7 BA21 3 NO1LEGEC INTR FLT UNSF"
ba7rsn41lec="R7 BA21 4NO1LEGEC SP UNABL2UNDST"
ba7rsn91lec="R7 BA21 9NO1LEGEC OTHER SPECIFY"
wa7wlkcorspc="R7 WA2 WALKING COURSE SPACE"
wa7wkaidused="R7 WA4 WALKING AID USED COURSE 1"
wa7wlkc1rslt="R7 WA5 WALKING COURSE 1 RESULT"
wa7wlkc1secs="R7 WA6A SECS HLD WALKNG COURSE1"
wa7wlk1hndr="R7 WA6B HNRDS HLD WALKNG COURSE1"
wa7rsn11wkc="R7 WA7 1 WLKCOURS1 SP FLT UNSAFE"
wa7rsn21wkc="R7 WA7 2WLKCOURS1 PRXY FLT UNSAF"
wa7rsn31wkc="R7 WA7 3WLKCOURS1 INTR FLT UNSF"
wa7rsn41wkc="R7 WA7 4WLKCOURS1 SP UNABL2UNDST"
wa7rsn51wkc="R7 WA7 5WLKCOURS1 NOT APPR SPACE"
wa7rsn91wkc="R7 WA7 9WLKCOURS1 OTHER SPECIFY"
wa7wkaidusc2="R7 WA8 WALKING AID USED COURSE 2"
wa7wlkc2rslt="R7 WA9 WALKING COURSE 2 RESULT"
wa7wlkc2secs="R7 WA10A SECS HLD WALKNG COURSE2"
wa7wlk2hndr="R7 WA10B HNRDS HLD WALKNG COURS2"
wa7rsn12wkc="R7 WA11 1 WKCOURS2 SP FLT UNSAFE"
wa7rsn22wkc="R7 WA11 2WKCOURS2 PRXY FLT UNSAF"
wa7rsn32wkc="R7 WA11 3WKCOURS2 INTR FLT UNSF"
wa7rsn42wkc="R7 WA11 4WKCOURS2 SP UNABL2UNDST"
wa7rsn92wkc="R7 WA11 9WKCOURS2 OTHER SPECIFY"
ch7chravail="R7 CH2 APPROPRIATE CHAIR AVAIL"
ch7chstcompl="R7 CH4 CHAIR STND COMPLETED TRY1"
ch7chairheit="R7 CH5 CHAIR HEIGHT(INCHES)"
ch7whlchrusd="R7 CH6 WHEELCHAIR USED"
ch7sgchstres="R7 CH7 SINGLE CHAIR STAND RESLT"
ch7armuse="R7 CH8 CHAIR STAND ARM USE"
ch7rsn11chs="R7 CH9 1CH STAND1 SP FLT UNSAFE"
ch7rsn21chs="R7 CH9 2CH STAND1 PRXY FLT UNSAF"
ch7rsn31chs="R7 CH9 3CH STAND1 INTR FLT UNSF"
ch7rsn41chs="R7 CH9 4CH STAND1 SP UNABL2UNDST"
ch7rsn51chs="R7 CH9 5CH STAND1 NOT APPR CHAIR"
ch7rsn91chs="R7 CH9 9CH STAND1 OTHER SPECIFY"
ch72chstrslt="R7 CH12 REPEAT CHAIR STAND RSLTS"
ch7chstndsec="R7 CH13A TIME REPEAT CH STD SECS"
ch7chstdhndr="R7 CH13B TIME RPEAT CH STD HNRDS"
ch7chstddone="R7 CH14 NUMBER CHAIR STANDS DONE"
ch7chstntdn1="R7 CH15 1 CH STD SP TIRED"
ch7chstntdn2="R7 CH15 2 CH STD SP USED ARMS"
ch7chstntdn3="R7 CH15 3 CH STD OVER 1 MIN"
ch7chstntdn4="R7 CH15 4 CH STD CNCRN SP SAFETY"
ch7chstntdn5="R7 CH15 5 CH STD SP STOPPED"
ch7chstntdn9="R7 CH15 9 CH STD OTHERSPECIFY"
ch7chstntat1="R7 CH16 1 NO CH ST SP UNSAFE"
ch7chstntat2="R7 CH16 2 NO CH ST PRXY UNSAFE"
ch7chstntat3="R7 CH16 3 NO CH ST INTV UNSAFE"
ch7chstntat4="R7 CH16 4 NO CH ST SP UNAB2UNDST"
ch7chstntat9="R7 CH16 9 NO CH ST OTHER SPEC"
gr7handtstd1="R7 GR3 GRIP1 TEST WHICH HAND"
gr7adjgr1ps3="R7 GR4 GRIP1POSITION ADJUST TO 3"
gr7grp1reslt="R7 GR5 GRIP STRENGTH 1 RESULT"
gr7grp1rdng="R7 GR6 GRP1 DISPLAY READING"
gr7grp1noat1="R7 GR7 1 SP FELT UNSAFE"
gr7grp1noat2="R7 GR7 2 PROXY FELT UNSAFE"
gr7grp1noat3="R7 GR7 3 INTERVIEWR FELT UNSAFE"
gr7grp1noat4="R7 GR7 4 SP UNABLE 2 UNDERSTAND"
gr7grp1noat9="R7 GR7 9 OTHER SPECIFY"
gr7handtstd2="R7 GR8 GRIP2 TEST WHICH HAND"
gr7adjgr2ps3="R7 GR9 GRIP2POSITION ADJUST TO 3"
gr7grp2reslt="R7 GR10GRIP STRENGTH 2 RESULT"
gr7grp2rdng="R7 GR11GRP2 DISPLAY READING"
gr7grp2noat1="R7 GR12 1 SP FELT UNSAFE"
gr7grp2noat2="R7 GR12 2 PROXY FELT UNSAFE"
gr7grp2noat3="R7 GR12 3 INTERVIEWR FELT UNSAFE"
gr7grp2noat4="R7 GR12 4 SP UNABLE 2 UNDERSTAND"
gr7grp2noat9="R7 GR12 9 OTHER SPECIFY"
wc7measdiff1="R7 WC2 1 MEAS DIFF NONE"
wc7measdiff2="R7 WC2 2 MEAS DIFF DIFF BREATH"
wc7measdiff3="R7 WC2 3 MEAS DIFF NOHOLD BREATH"
wc7measdiff4="R7 WC2 4 MEAS DIFF EFFORT PAIN"
wc7measdiff5="R7 WC2 5 MEAS DIFF EFFORT OTHER"
wc7measdiff6="R7 WC2 6 MEAS DIFF LOCATE NAVEL"
wc7measdiff9="R7 WC2 9 MEAS DIFF OTHER SPECIFY"
wc7waistrslt="R7 W3 WAIST CIRCUMFRNC RESULTS"
wc7wstmsrinc="R7 W4A WAIST MEASURE INCHES"
wc7wstmsrqrt="R7 W4B WAIST MEASURE QTR INCHES"
wc7wstbulkcl="R7 WC5 BULKY CLOTHING WORN"
wc7whomeasur="R7 WC6 WHO MEASURED"
wc7wstpostn="R7 WC7 POSITION 4 WAIST MEASURE"
wc7wstnotat1="R7 WC8 1 NO WC SP FELT UNSAFE"
wc7wstnotat2="R7 WC8 2 NO WC PROXY UNSAFE"
wc7wstnotat3="R7 WC8 3 NO WC INTERVIEWR UNSAFE"
wc7wstnotat4="R7 WC8 4 NO WC SP UNABLE2UNDRSTD"
wc7wstnotat5="R7 WC8 5 NO WC SP REFUSED"
wc7wstnotat9="R7 WC8 9 NO WC OTHER SPECIFY"
pk7pkarf1pos="R7 PK2 PEAK AIR FLOW 1 POSITION"
pk7pkarfl1ef="R7 PK3 PK AIR FLW 1 EFFORT GIVEN"
pk7pkarfl1rs="R7 PK4 PEAK AIR FLOW 1 RESULT"
pk7pkarfl1rd="R7 PK5 PEAK AIR FLOW 1 READING"
pk7pk1noatt1="R7 PK6 1 PEAK NO SP FELT UNSAFE"
pk7pk1noatt2="R7 PK6 2 PEAK NO PROXY UNSAFE"
pk7pk1noatt3="R7 PK6 3 PEAK NO INTERVWR UNSAFE"
pk7pk1noatt4="R7 PK6 4 PEAK NO SP UNABL2UNDSTD"
pk7pk1noatt9="R7 PK6 9 PEAK NO OTHER SPECIFY"
pk7paf2posit="R7 PK7 PEAK AIR FLOW 2 POSITION"
pk7pkarfl2ef="R7 PK8 PEAK AIR FLW 2 EFFRT GIVN"
pk7pkarfl2rs="R7 PK9 PEAK AIR FLOW 2 RESULT"
pk7pkarfl2rd="R7 PK10 PEAK AIR FLOW 2 READING"
pk7pk2noatt1="R7 PK11 1 PEAK NO SP FELT UNSAFE"
pk7pk2noatt2="R7 PK11 2 PEAK NO PROXY UNSAFE"
pk7pk2noatt3="R7 PK11 3 PEAK NO INTRVWR UNSAFE"
pk7pk2noatt4="R7 PK11 4 PEAK NO SP UNABL2UNDST"
pk7pk2noatt9="R7 PK11 9 PEAK NO OTHER SPECIFY"
cl7endtimhrs="R7 CL1 HRS END TIME HOURS"
cl7endtimmin="R7 CL1 MINS END TIME MINUTES"
cl7endtmampm="R7 CL1 AMPM END TIME AM OR PM"
r7dnhatssppb="R7 D NHATS SPPB SCORE"
r7dnhatsbasc="R7 D NHATS BALANCE SCORE"
r7dnhatswksc="R7 D NHATS WALK SCORE"
r7dnhatschsc="R7 D NHATS REPEAT CHAIR SCORE"
r7dnhatsgrav="R7 D NHATS AVG GRIP SCORE"
r7dnhatsgrb="R7 D NHATS BEST GRIP SCORE"
r7dnhatspkav="R7 D NHATS AVG AIR FLOW SCORE"
r7dnhatspkb="R7 D NHATS BEST AIR FLOW SCORE"
r7dsppbmiss="R7 D REASON MISSING SPPB"
r7dorigsppb="R7 D ORIGINAL SPPB SCORE"
r7dorigbasc="R7 D ORIGINAL BALNCE SCORE"
r7dorigwksc="R7 D ORIGINAL WALK SCORE"
r7dorigchsc="R7 D ORIGINAL REPEAT CHAIR SCORE"
hw7currweigh="R7 HW2 YOU CURRENTLY WEIGH"
hw7lst10pnds="R7 HW4 LOST 10 POUNDS IN LAST YR"
hw7trytolose="R7 HW5 WERE YOU TRYNG LOSE WEGHT"
hw7howtallft="R7 HW7 HOW TALL ARE YOU FEET"
hw7howtallin="R7 HW8 HOW TALL ARE YOU INCHES"
el7mothalive="R7 EL11 YOUR MOTHER STILL LIVING"
el7fathalive="R7 EL12 YOUR FATHER STILL LIVING"
wb7offelche1="R7 WB1 OFTEN YOU FEEL CHEERFUL"
wb7offelche2="R7 WB1 OFTEN YOU FEEL BORED"
wb7offelche3="R7 WB1 OFTEN YOU FEEL FULLOFLIFE"
wb7offelche4="R7 WB1 OFTEN YOU FEEL UPSET"
wb7truestme1="R7 WB2 SP LIFE HAS MEANING PURPS"
wb7truestme2="R7 WB2 SP FEELS CONFIDENT"
wb7truestme3="R7 WB2 SP GAVE UP IMPROVING LIFE"
wb7truestme4="R7 WB2 SP LIKES LIVING SITUATION"
wb7ageyofeel="R7 WB3 AGE YOU FEEL MOST OF TIME"
wb7agrwstmt1="R7 WB4 SP SELF DETERMINATION"
wb7agrwstmt2="R7 WB4 SP WANTS-FINDS WAY TO DO"
wb7agrwstmt3="R7 WB4 SP ADJUSTS TO CHANGE"
ip7covmedcad="R7 IP1 COVERD BY MEDICARE PART D"
ip7otdrugcov="R7 IP2 DRUG COVERG SOME OTHR WAY"
ip7mgapmedsp="R7 IP3 MEDIGAP OR MEDICARE SUPP"
ip7cmedicaid="R7 IP4 COV BY STATE MEDICAID PRG"
ip7covtricar="R7 IP5 COVERED BY TRICARE"
ip7nginslast="R7 IP5A HAVE LTC INS FROM LAST INT"
ip7nginsnurs="R7 IP6 NONGOV INSR FOR NURS HOME"
ip7typcarco1="R7 IP7 LTC INS NURSNG HOME COVD"
ip7typcarco2="R7 IP7 LTC INS ASSISTD LVNG COVD"
ip7typcarco3="R7 IP7 LTC INS HOME HEALTH COVD"
ip7paypremms="R7 IP8 HOW MUCH PAY IN PREMIUMS"
lf7workfpay="R7 LF1 WORKED FOR PAY RECENTLY"
lf7abstlstwk="R7 LF2 ABSENT FRM JOB LAST WEEK"
lf7wrkplstmn="R7 LF3 WORK FOR PAY IN LST MONTH"
lf7mrthnonjb="R7 LF4 MOR THN ONE JOB LAST WEEK"
lf7hrswkwork="R7 LF5 HRS PR WEEK WORK MAIN JOB"
lf7hrwrkltwk="R7 LF6 HOURS WORK LAST WEEK"
lf7hrwrklstw="R7 LF7 HOW MNY HOURS DID YOU WRK"
lf7oftpaid="R7 LF8 HOW OFTN PAID ON MAIN JOB"
lf7doccup="R7 D CURRENT OCCUPATION CATEGORY  "
lf7huswifwrk="R7 LF13 HUSB WIFE PARTN PAY WORK"
hp7ownrentot="R7 HP1 OWN RENT OR OTHER"
hp7mrtpadoff="R7 HP2 MORTGAGE PAID OFF"
hp7mthlymort="R7 HP3 MORTGAGE PAYMNT EACH MNTH"
hp7mortpaymt="R7 HP3A MORTGAGE PAYMENT AMOUNT"
hp7whnpayoff="R7 HP3B WHEN EXPCT PAY OFF MORTG"
hp7amtstlowe="R7 HP3C HOW MUCH STILL OWE"
hp7amoutowed="R7 HP3D THE AMOUNT OWED IS"
hp7homevalue="R7 HP4 PRESENT VALUE OF HOME"
hp7homvalamt="R7 HP4A HOME VALUE AMOUNT"
hp7payrent="R7 HP5 DO YOU PAY RENT"
hp7rentamt="R7 HP6 RENT PAID EACH MONTH"
hp7rentamout="R7 HP6A RENT AMOUNT"
hp7sec8pubsn="R7 HP7 HME SEC 8 PUBL SENOR HOUS"
ia7recsspa1="R7 IA1 SP REC SOCIAL SECURITY"
ia7recsspa2="R7 IA1 SPOUSE PART REC SOC SEC"
ia7recsspa3="R7 IA1 NO SOC SECURTY PAYMNT REC"
ia7recssils1="R7 IA4 SP RECEIVD SSI LAST MONTH"
ia7recssils2="R7 IA4 SPOUSE PRT REC SSI LST MO"
ia7recssils3="R7 IA4 NO SSI RECEIVD LAST MONTH"
ia7rvapayls1="R7 IA5 SP REC PAY FRM VA LAST MO"
ia7rvapayls2="R7 IA5 SPOUS PA REC VA PAY LSTMO"
ia7rvapayls3="R7 IA5 NO VA PAY REC LAST MONTH"
ia7penjobou1="R7 IA6 SP HAS PENSION PLAN"
ia7penjobou2="R7 IA6 SPOUSE HAS PENSION PLAN"
ia7penjobou3="R7 IA6 NO PENSION PLAN"
ia7iraothac1="R7 IA7 SP HAS IRA OTH RETIRE ACC"
ia7iraothac2="R7 IA7 SPOUSE HAS IRA OTHR ACC"
ia7iraothac3="R7 IA7 NO IRA OTHR RETIRE ACCT "
ia7mutfdstk1="R7 IA8 SP OWNS MUTUAL FUND STOCK"
ia7mutfdstk2="R7 IA8 SPOUSE OWNS FUNDS STOCK"
ia7mutfdstk3="R7 IA8 SP SPOUSE OWN FUNDS STOCK"
ia7mutfdstk4="R7 IA8 NO FUNDS OR STOCK OWNED"
ia7ownbond1="R7 IA9 SP OWNS BONDS"
ia7ownbond2="R7 IA9 SPOUSE OWNS BONDS"
ia7ownbond3="R7 IA9 SP SPOUSE OWN BONDS"
ia7ownbond4="R7 IA9 NO BONDS OWNED"
ia7bnkacccd1="R7 IA10 SP OWNS CHECK ACCT "
ia7bnkacccd2="R7 IA10 SPOUSE OWNS CHECK ACCT"
ia7bnkacccd3="R7 IA10 SP SPOUSE OWN CHECK ACCT"
ia7bnkacccd4="R7 IA10 NO CHECK ACCT OWNED"
ia7bnkacccd5="R7 IA10 SP OWNS SAVINGS ACCT "
ia7bnkacccd6="R7 IA10 SPOUSE OWNS SAVING ACCT"
ia7bnkacccd7="R7 IA10 SP SPOUSE OWN SAVNG ACT"
ia7bnkacccd8="R7 IA10 NO SAVINGS ACCT OWNED"
ia7bnkacccd9="R7 IA10 SP OWNS CDS "
ia7bnkaccc10="R7 IA10 SPOUSE OWNS CDS"
ia7bnkaccc11="R7 IA10 SP SPOUSE OWN CDS"
ia7bnkaccc12="R7 IA10 NO CDS OWNED"
ia7realestt1="R7 IA13 SP OWNS REAL ESTATE"
ia7realestt2="R7 IA13 SPOUSE OWNS REAL ESTATE"
ia7realestt3="R7 IA13 SP SPOUSE OWN REAL ESTTE"
ia7realestt4="R7 IA13 NO REAL ESTATE OWNED"
ia7totinc="R7 IA50 TOTAL INCOME"
ia7toincimf="R7 F IMPUTED TOTAL INC FLG"
ia7toincim1="R7 IA50 IMPUTED TOTAL INC1"
ia7toincim2="R7 IA50 IMPUTED TOTAL INC2"
ia7toincim3="R7 IA50 IMPUTED TOTAL INC3"
ia7toincim4="R7 IA50 IMPUTED TOTAL INC4"
ia7toincim5="R7 IA50 IMPUTED TOTAL INC5"
ia7toincesjt="R7 IA51A JOINT EST TOT INCOME"
ia7eincimjf="R7 F IMPTD JOINT EST TOT INC FLG"
ia7eincimj1="R7 IA51A IMP EST JOINT TOT INC1"
ia7eincimj2="R7 IA51A IMP EST JOINT TOT INC2"
ia7eincimj3="R7 IA51A IMP EST JOINT TOT INC3"
ia7eincimj4="R7 IA51A IMP EST JOINT TOT INC4"
ia7eincimj5="R7 IA51A IMP EST JOINT TOT INC5"
ia7toincessg="R7 IA51B SNGLE EST TOT INC "
ia7eincimsf="R7 F IMPUTED SGL EST TOT INC FLG"
ia7eincims1="R7 IA51B IMP EST SP SGL TOT INC1"
ia7eincims2="R7 IA51B IMP EST SP SGL TOT INC2"
ia7eincims3="R7 IA51B IMP EST SP SGL TOT INC3"
ia7eincims4="R7 IA51B IMP EST SP SGL TOT INC4"
ia7eincims5="R7 IA51B IMP EST SP SGL TOT INC5"
ew7pycredbal="R7 EW1 PAY OFF CREDIT CARD BALAN"
ew7crecardeb="R7 EW2 TOTAL CREDIT CARD DEBT"
ew7credcdmed="R7 EW3 CREDIT CARD MEDICAL CARE"
ew7amtcrdmed="R7 EW4 AMT ON CARDS FOR MED CARE"
ew7medpaovtm="R7 EW5 MED BILLS PAID OVERTIME"
ew7ampadovrt="R7 EW6 AMT FOR MED BILL OVR TIME"
ew7finhlpfam="R7 EW7 FINANCIAL HELP FRM FAMILY"
ew7whohelfi1="R7 EW8 CHILD HELPED FINANCIALLY"
ew7whohelfi2="R7 EW8 OTHER HELPED FINANCIALLY"
ew7atchhelyr="R7 EW10 AMT FROM CHILDR LST YR"
ew7fingftfam="R7 EW11 FINANCIAL GIFTS TO FAMLY"
ew7whregoth1="R7 EW12 SP GAVE CHILD FINCL HLP"
ew7whregoth2="R7 EW12 SP GAVE GRANDCHD FIN HLP"
ew7whregoth3="R7 EW12 SP GAVE OTHR FINANCL HLP"
ew7amthlpgiv="R7 EW14 AMOUNT OF HELP GIVEN"
ew7progneed1="R7 EW15 SP RECEIVD FOOD STAMPS"
ew7progneed2="R7 EW15 SP REC OTHR FOOD ASST"
ew7progneed3="R7 EW15 SP REC GAS ENERGY ASST"
ew7mealskip1="R7 EW16 SKIP MEALS NO MONEY"
ew7mealskip2="R7 EW17 SKIP MEALS HOW OFTEN"
ew7nopayhous="R7 EW18 NO MONEY FOR HOUSING"
ew7nopayutil="R7 EW18 NO MONEY FOR UTILITIES"
ew7nopaymed="R7 EW18 NO MONEY FOR MEDICAL"
ir7intlang="R7 IR1A1 INTERVIEW LANGUAGE"
ir7spattitud="R7 IR2 SP ATTITUDE TOWARD INTVW"
ir7undrstand="R7 IR3 SP UNDERSTAND QUESTION"
ir7sppresent="R7 IR4 AMT OF INTERVIW SP PRESNT"
ir7spnotprs1="R7 IR5 REASON SP NOT PRESENT_SLEEP "
ir7spnotprs2="R7 IR5 REASON SP NOT PRESENT_2ILL "
ir7spnotprs3="R7 IR5 REASON SP NOT PRESENT_ALZH "
ir7spnotprs4="R7 IR5 REASON SP NOT PRESENT_PRXYREQ "
ir7spnotprs5="R7 IR5 REASON SP NOT PRESENT_INFCLTY "
ir7spnotprs6="R7 IR5 REASON SP NOT PRESENT_OTHSPFY "
ir7intvwhlp="R7 IR6 ANYONE HELP WITH INTVW"
ir7prsnhlp1="R7 IR6A SPOUSE HELPED WITH INTVW"
ir7prsnhlp2="R7 IR6A CHILD HELPED WITH INTVW"
ir7prsnhlp3="R7 IR6A RELATIVE HELP WITH INTVW"
ir7prsnhlp4="R7 IR6A FRIEND HELPED WITH INTVW"
ir7prsnhlp5="R7 IR6A STAFF HELPED WITH INTVW"
ir7prsnhlp6="R7 IR6A AIDE HELPED WITH INTVW"
ir7prsnhlp91="R7 IR6A OTHER HELPED WITH INTVW"
ir7demolang1="R7 IR10B PHYS ACT DEMO SAFETY TRANS"
ir7sessions="R7 IR12 MORE ONE INTVW SESSION"
ir7sessrsn1="R7 IR12A MORE 1 SESSION SP TIRED"
ir7sessrsn2="R7 IR12A MORE 1 SESSION SP ILL"
ir7sessrsn3="R7 IR12A MORE 1 SESSION SCHEDULE"
ir7sessrsn91="R7 IR12A MORE 1 SESSION OTHER"
ir7conhomapt="R7 IR12C INTRV CONDTD AT HME/APT"
ir7insidhome="R7 IR12E GO INSIDE HOME/APT/UNIT"
ir7condihom1="R7 IR13 PAINT PEELING IN SP HOME"
ir7condihom2="R7 IR13 PESTS IN SP HOME"
ir7condihom3="R7 IR13 BROKN FURNITURE SP HOME"
ir7condihom4="R7 IR13 FLOORING NEEDS REPAIR"
ir7condihom5="R7 IR13 HOME OTHR TRIPPING HAZRD"
ir7clutterr1="R7 IR14 CLUTTR IN INTERVIEW ROOM"
ir7clutterr2="R7 IR14 CLUTTR IN OTHR SP ROOMS"
ir7areacond1="R7 IR15 LITTER GLASS ON SDWLK ST"
ir7areacond2="R7 IR15 GRAFFITI ON BUILDG WALLS"
ir7areacond3="R7 IR15 VACANT HOUSES OR STORES"
ir7condhome1="R7 IR16 BROKEN WINDOWS IN HOME"
ir7condhome2="R7 IR16 CRUMBLNG FOUNDTN IN HOME"
ir7condhome3="R7 IR16 MISSNG BRCKS SIDNG IN HM"
ir7condhome4="R7 IR16 ROOF PROBLEM IN HOME"
ir7condhome5="R7 IR16 BROKEN STEPS TO HOME"
ir7condhome6="R7 IR16 CONTINUOUS SIDEWALKS"
fq7dfacdescr="R7 FQ6 FACILITY TYPE"
fq7dosfacd="R7 FQ6A OTHER SPECIFY FAC TYPE"
fq7prtlivnam="R7 FQ8 FAC NM DIFF4PLC SP LIVES"
fq7dfacarea="R7 FQ10 FACILITY AREA SP LIVES"
fq7dosfaca="R7 FQ10A OTHER SPECIFY FAC AREA"
fq7assdnrsng="R7 FQ11 ASSIST LIV OR NURSG HOME"
fq7othrlevls="R7 FQ12 OTH LEVELS OF CARE AVAIL"
fq7whotlevl1="R7 FQ13 INDEPNDNT LIV CARE AVAIL"
fq7whotlevl2="R7 FQ13 ASSISTED LVNG CARE AVAIL"
fq7whotlevl3="R7 FQ13 ALZHEIMER CARE AVAIL"
fq7whotlevl4="R7 FQ13 NURSING HOME CARE AVAIL"
fq7whotlevl5="R7 FQ13 OTHR SPECIFY CARE AVAIL"
fq7servaval1="R7 FQ15 MEALS AVAIL"
fq7servaval2="R7 FQ15 HELP WITH MEDS AVAIL"
fq7servaval3="R7 FQ15 HELP W BATH DRESS AVAIL"
fq7servaval4="R7 FQ15 LAUNDRY SERVCS AVAIL"
fq7servaval5="R7 FQ15 HOUSEKEEPING SERV AVAIL"
fq7servaval6="R7 FQ15 TRANSPRT MED CARE PROV"
fq7servaval7="R7 FQ15 TRANSPRT TO STORE EVENT"
fq7servaval10="R7 FQ15 FITNESS CENTER AVAIL"
fq7servaval11="R7 FQ15 WALKING AREA AVAIL"
fq7servaval8="R7 FQ15 RECREATIONAL FAC AVAIL"
fq7servaval9="R7 FQ15 SOCIAL EVENTS AVAIL"
fq7servaval12="R7 FQ15 ONSITE HEALTH AVAIL"
fq7servaval13="R7 FQ15 MED EMERGENCY SYSTEM AVAIL"
fq7paysourc1="R7 FQ16 SP OR SP FAMILY PAYMENT"
fq7paysourc2="R7 FQ16 SOC SEC SSI PAYMENT"
fq7paysourc3="R7 FQ16 MEDICAID PAYMENT"
fq7paysourc4="R7 FQ16 MEDICARE PAYMENT"
fq7paysourc5="R7 FQ16 PRIVATE INSURANCE PAYMNT"
fq7paysourc6="R7 FQ16 OTHR GOVT PAYMENT"
fq7totalpaym="R7 FQ17 TOTAL PAYMENT FOR CARE"
fq7mnthlyamt="R7 FQ18 TOT MTHLY AMT FOR CARE"
fq7primpayer="R7 FQ19 PRIMARY PAYER FOR CARE"
fq7govsource="R7 FQ20 GOVERNMENT SOURCE"
fq7dlocsp="R7 D FQ6 6A 10 10A FOR SAMP WGT "
w7anfinwgt0="R7 FINAL ANALYTIC WGT FULL SAMP"
w7anfinwgt1="R7 FINAL ANALYTIC WGT REP 1"
w7anfinwgt2="R7 FINAL ANALYTIC WGT REP 2"
w7anfinwgt3="R7 FINAL ANALYTIC WGT REP 3"
w7anfinwgt4="R7 FINAL ANALYTIC WGT REP 4"
w7anfinwgt5="R7 FINAL ANALYTIC WGT REP 5"
w7anfinwgt6="R7 FINAL ANALYTIC WGT REP 6"
w7anfinwgt7="R7 FINAL ANALYTIC WGT REP 7"
w7anfinwgt8="R7 FINAL ANALYTIC WGT REP 8"
w7anfinwgt9="R7 FINAL ANALYTIC WGT REP 9"
w7anfinwgt10="R7 FINAL ANALYTIC WGT REP 10"
w7anfinwgt11="R7 FINAL ANALYTIC WGT REP 11"
w7anfinwgt12="R7 FINAL ANALYTIC WGT REP 12"
w7anfinwgt13="R7 FINAL ANALYTIC WGT REP 13"
w7anfinwgt14="R7 FINAL ANALYTIC WGT REP 14"
w7anfinwgt15="R7 FINAL ANALYTIC WGT REP 15"
w7anfinwgt16="R7 FINAL ANALYTIC WGT REP 16"
w7anfinwgt17="R7 FINAL ANALYTIC WGT REP 17"
w7anfinwgt18="R7 FINAL ANALYTIC WGT REP 18"
w7anfinwgt19="R7 FINAL ANALYTIC WGT REP 19"
w7anfinwgt20="R7 FINAL ANALYTIC WGT REP 20"
w7anfinwgt21="R7 FINAL ANALYTIC WGT REP 21"
w7anfinwgt22="R7 FINAL ANALYTIC WGT REP 22"
w7anfinwgt23="R7 FINAL ANALYTIC WGT REP 23"
w7anfinwgt24="R7 FINAL ANALYTIC WGT REP 24"
w7anfinwgt25="R7 FINAL ANALYTIC WGT REP 25"
w7anfinwgt26="R7 FINAL ANALYTIC WGT REP 26"
w7anfinwgt27="R7 FINAL ANALYTIC WGT REP 27"
w7anfinwgt28="R7 FINAL ANALYTIC WGT REP 28"
w7anfinwgt29="R7 FINAL ANALYTIC WGT REP 29"
w7anfinwgt30="R7 FINAL ANALYTIC WGT REP 30"
w7anfinwgt31="R7 FINAL ANALYTIC WGT REP 31"
w7anfinwgt32="R7 FINAL ANALYTIC WGT REP 32"
w7anfinwgt33="R7 FINAL ANALYTIC WGT REP 33"
w7anfinwgt34="R7 FINAL ANALYTIC WGT REP 34"
w7anfinwgt35="R7 FINAL ANALYTIC WGT REP 35"
w7anfinwgt36="R7 FINAL ANALYTIC WGT REP 36"
w7anfinwgt37="R7 FINAL ANALYTIC WGT REP 37"
w7anfinwgt38="R7 FINAL ANALYTIC WGT REP 38"
w7anfinwgt39="R7 FINAL ANALYTIC WGT REP 39"
w7anfinwgt40="R7 FINAL ANALYTIC WGT REP 40"
w7anfinwgt41="R7 FINAL ANALYTIC WGT REP 41"
w7anfinwgt42="R7 FINAL ANALYTIC WGT REP 42"
w7anfinwgt43="R7 FINAL ANALYTIC WGT REP 43"
w7anfinwgt44="R7 FINAL ANALYTIC WGT REP 44"
w7anfinwgt45="R7 FINAL ANALYTIC WGT REP 45"
w7anfinwgt46="R7 FINAL ANALYTIC WGT REP 46"
w7anfinwgt47="R7 FINAL ANALYTIC WGT REP 47"
w7anfinwgt48="R7 FINAL ANALYTIC WGT REP 48"
w7anfinwgt49="R7 FINAL ANALYTIC WGT REP 49"
w7anfinwgt50="R7 FINAL ANALYTIC WGT REP 50"
w7anfinwgt51="R7 FINAL ANALYTIC WGT REP 51"
w7anfinwgt52="R7 FINAL ANALYTIC WGT REP 52"
w7anfinwgt53="R7 FINAL ANALYTIC WGT REP 53"
w7anfinwgt54="R7 FINAL ANALYTIC WGT REP 54"
w7anfinwgt55="R7 FINAL ANALYTIC WGT REP 55"
w7anfinwgt56="R7 FINAL ANALYTIC WGT REP 56"
w7an2011wgt0="R7 FINAL ANALYTIC WGT 2011 COHORT"
w7an2011wgt1="R7 FINAL ANALYTIC WGT 2011 COHORT REP 1"
w7an2011wgt2="R7 FINAL ANALYTIC WGT 2011 COHORT REP 2"
w7an2011wgt3="R7 FINAL ANALYTIC WGT 2011 COHORT REP 3"
w7an2011wgt4="R7 FINAL ANALYTIC WGT 2011 COHORT REP 4"
w7an2011wgt5="R7 FINAL ANALYTIC WGT 2011 COHORT REP 5"
w7an2011wgt6="R7 FINAL ANALYTIC WGT 2011 COHORT REP 6"
w7an2011wgt7="R7 FINAL ANALYTIC WGT 2011 COHORT REP 7"
w7an2011wgt8="R7 FINAL ANALYTIC WGT 2011 COHORT REP 8"
w7an2011wgt9="R7 FINAL ANALYTIC WGT 2011 COHORT REP 9"
w7an2011wgt10="R7 FINAL ANALYTIC WGT 2011 COHORT REP 10"
w7an2011wgt11="R7 FINAL ANALYTIC WGT 2011 COHORT REP 11"
w7an2011wgt12="R7 FINAL ANALYTIC WGT 2011 COHORT REP 12"
w7an2011wgt13="R7 FINAL ANALYTIC WGT 2011 COHORT REP 13"
w7an2011wgt14="R7 FINAL ANALYTIC WGT 2011 COHORT REP 14"
w7an2011wgt15="R7 FINAL ANALYTIC WGT 2011 COHORT REP 15"
w7an2011wgt16="R7 FINAL ANALYTIC WGT 2011 COHORT REP 16"
w7an2011wgt17="R7 FINAL ANALYTIC WGT 2011 COHORT REP 17"
w7an2011wgt18="R7 FINAL ANALYTIC WGT 2011 COHORT REP 18"
w7an2011wgt19="R7 FINAL ANALYTIC WGT 2011 COHORT REP 19"
w7an2011wgt20="R7 FINAL ANALYTIC WGT 2011 COHORT REP 20"
w7an2011wgt21="R7 FINAL ANALYTIC WGT 2011 COHORT REP 21"
w7an2011wgt22="R7 FINAL ANALYTIC WGT 2011 COHORT REP 22"
w7an2011wgt23="R7 FINAL ANALYTIC WGT 2011 COHORT REP 23"
w7an2011wgt24="R7 FINAL ANALYTIC WGT 2011 COHORT REP 24"
w7an2011wgt25="R7 FINAL ANALYTIC WGT 2011 COHORT REP 25"
w7an2011wgt26="R7 FINAL ANALYTIC WGT 2011 COHORT REP 26"
w7an2011wgt27="R7 FINAL ANALYTIC WGT 2011 COHORT REP 27"
w7an2011wgt28="R7 FINAL ANALYTIC WGT 2011 COHORT REP 28"
w7an2011wgt29="R7 FINAL ANALYTIC WGT 2011 COHORT REP 29"
w7an2011wgt30="R7 FINAL ANALYTIC WGT 2011 COHORT REP 30"
w7an2011wgt31="R7 FINAL ANALYTIC WGT 2011 COHORT REP 31"
w7an2011wgt32="R7 FINAL ANALYTIC WGT 2011 COHORT REP 32"
w7an2011wgt33="R7 FINAL ANALYTIC WGT 2011 COHORT REP 33"
w7an2011wgt34="R7 FINAL ANALYTIC WGT 2011 COHORT REP 34"
w7an2011wgt35="R7 FINAL ANALYTIC WGT 2011 COHORT REP 35"
w7an2011wgt36="R7 FINAL ANALYTIC WGT 2011 COHORT REP 36"
w7an2011wgt37="R7 FINAL ANALYTIC WGT 2011 COHORT REP 37"
w7an2011wgt38="R7 FINAL ANALYTIC WGT 2011 COHORT REP 38"
w7an2011wgt39="R7 FINAL ANALYTIC WGT 2011 COHORT REP 39"
w7an2011wgt40="R7 FINAL ANALYTIC WGT 2011 COHORT REP 40"
w7an2011wgt41="R7 FINAL ANALYTIC WGT 2011 COHORT REP 41"
w7an2011wgt42="R7 FINAL ANALYTIC WGT 2011 COHORT REP 42"
w7an2011wgt43="R7 FINAL ANALYTIC WGT 2011 COHORT REP 43"
w7an2011wgt44="R7 FINAL ANALYTIC WGT 2011 COHORT REP 44"
w7an2011wgt45="R7 FINAL ANALYTIC WGT 2011 COHORT REP 45"
w7an2011wgt46="R7 FINAL ANALYTIC WGT 2011 COHORT REP 46"
w7an2011wgt47="R7 FINAL ANALYTIC WGT 2011 COHORT REP 47"
w7an2011wgt48="R7 FINAL ANALYTIC WGT 2011 COHORT REP 48"
w7an2011wgt49="R7 FINAL ANALYTIC WGT 2011 COHORT REP 49"
w7an2011wgt50="R7 FINAL ANALYTIC WGT 2011 COHORT REP 50"
w7an2011wgt51="R7 FINAL ANALYTIC WGT 2011 COHORT REP 51"
w7an2011wgt52="R7 FINAL ANALYTIC WGT 2011 COHORT REP 52"
w7an2011wgt53="R7 FINAL ANALYTIC WGT 2011 COHORT REP 53"
w7an2011wgt54="R7 FINAL ANALYTIC WGT 2011 COHORT REP 54"
w7an2011wgt55="R7 FINAL ANALYTIC WGT 2011 COHORT REP 55"
w7an2011wgt56="R7 FINAL ANALYTIC WGT 2011 COHORT REP 56"
w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER";
run;

data nhats_sp;
set spfile;
run;

*strata var= w7varstrat;

*cluster var= w7varunit ;

*weight var= For Round 7, the final tracker replicate weights are provided in the variables:
w7trfinwgt1-w7trfinwgt56 for the 2015 Cohort,
w7tr2011wgt1- w7tr2011wgt56 for the 2011 Cohort

The analytic replicate weights are provided in the variables:
w7anfinwgt1-w7anfinwgt56 for the 2015 Cohort,
w7an2011wgt1-w7an2011wgt56 for the 2011 Cohort;

*full sample weight for 2015 cohort- w7anfinwgt0 - use with Taylor Series Estimation;

**************DEMOGRAPHIC DATA;

*not adjusted for complex design;
*age;
proc freq data=nhats_sp;
tables r7d2intvrage;
run;

data nhats_sp_2;
set nhats_sp;
where r7d2intvrage ne -1;
run;

proc surveyfreq data=nhats_sp_2;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage ;
run ;
*same data produced as Freedman, V. A., & Kasper, J. D. (2019). Cohort Profile: The National Health and Aging Trends Study (NHATS).
International journal of epidemiology, 48(4), 1044–1045g. https://doi.org/10.1093/ije/dyz109 ;



********************************MERGE ALL DATASET - NHATS_DEM, NHATS_DBS, NHAT_TRACKER, NHATS_SP  ;

*w7varstrat="R7 VARIANCE ESTIMATION STRATUM"
w7varunit="R7 VARIANCE ESTIMATION CLUSTER"
w7dbsfinwgt0="R7 DBS FINAL WGT FULL SAMP"
NHATS SAMPLED PERSON ID ;


*sort all datasets by NHATS sample person ID - spid;
proc sort data=nhats_dbs; by spid ; run;
proc sort data=nhats_dem; by spid; run;
proc sort data=nhats_sp; by spid; run;
proc sort data=nhats_tracker; by spid; run;


*merge all datasets by spid;
data nhats_master;
merge nhats_dem (in=a) nhats_dbs (in=b) nhats_sp (in=c) nhats_tracker (in=d);
by spid;
if a=1 and b=1 and c=1 and d=1;
run;

*filter to only those with dbs data (n=4648);
data nhats_master_;
set nhats_master;
where dbs7danyassay=1;
run;

************************************************demographics;
*mean age;
proc surveymeans data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var r7dintvwrage;
run;
*same as methods paper;

*age category;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage ;
run ;
*same as methods paper;

*gender;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender ;
run ;
*same as methods paper;

*race/ethnicity;
proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp ;
run ;
*****adjust race cat;
data nhats_master_b;
set nhats_master_;
if (rl5dracehisp=6 or rl5dracehisp=5) then rl5dracehisp_new=.;
else rl5dracehisp_new = rl5dracehisp ;
run;

proc surveyfreq data=nhats_master_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new ;
run ;
*same as methods paper;

*income;
proc surveymeans data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var ia7totinc;
run;

proc surveyfreq data=nhats_master_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables ia7totinc ia7toincesjt ia7toincessg;
run ;

data nhats_master_c;
set nhats_master_b;
if (ia7totinc=-8 or ia7totinc=-7) then ia7totinc=.;
if (ia7toincim1=-8 or ia7toincim1=-7) then ia7toincim1=.;
if (ia7toincim2=-8 or ia7toincim2=-7) then ia7toincim2=.;
if (ia7toincim3=-8 or ia7toincim3=-7) then ia7toincim3=.;
if (ia7toincim4=-8 or ia7toincim4=-7) then ia7toincim4=.;
if (ia7toincim5=-8 or ia7toincim5=-7) then ia7toincim5=.;

if 0 le ia7totinc lt 15000 then income_cat=0;
if 15000 le ia7totinc lt 30000 then income_cat=1;
if 30000 le ia7totinc lt 60000 then income_cat=2;
if ia7totinc ge 60000 then income_cat=3;

if 0 le ia7toincim1 lt 15000 then income_cat_b=0;
if 15000 le ia7toincim1 lt 30000 then income_cat_b=1;
if 30000 le ia7toincim1 lt 60000 then income_cat_b=2;
if ia7toincim1 ge 60000 then income_cat_b=3;

if 0 le ia7toincim2 lt 15000 then income_cat_c=0;
if 15000 le ia7toincim2 lt 30000 then income_cat_c=1;
if 30000 le ia7toincim2 lt 60000 then income_cat_c=2;
if ia7toincim2 ge 60000 then income_cat_c=3;

if 0 le ia7toincim3 lt 15000 then income_cat_d=0;
if 15000 le ia7toincim3 lt 30000 then income_cat_d=1;
if 30000 le ia7toincim3 lt 60000 then income_cat_d=2;
if ia7toincim3 ge 60000 then income_cat_d=3;

if 0 le ia7toincim4 lt 15000 then income_cat_e=0;
if 15000 le ia7toincim4 lt 30000 then income_cat_e=1;
if 30000 le ia7toincim4 lt 60000 then income_cat_e=2;
if ia7toincim4 ge 60000 then income_cat_e=3;

if 0 le ia7toincim5 lt 15000 then income_cat_f=0;
if 15000 le ia7toincim5 lt 30000 then income_cat_f=1;
if 30000 le ia7toincim5 lt 60000 then income_cat_f=2;
if ia7toincim5 ge 60000 then income_cat_f=3;

run;

proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat income_cat_b income_cat_c income_cat_d income_cat_e income_cat_f ;
run ;
*use income cat b - based off of imputation variable 1;
proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat_b ;
run ;


***********************************************covariates / risk factors of interest;

*Ever smoked? ;
proc surveyfreq data=nhats_master_c;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables sd7smokesnow;
run ;
*same as methods paper - but the q is do you smoke cigs now;

*BMI;
*
hw7currweigh = weight in pounds
hw7howtallft = height in feet
hw7howtallin = height in inches;
proc freq data=nhats_master_d;
tables hw7howtallin hw7howtallft hw7currweigh;
run;

data nhats_master_d;
set nhats_master_c ;
if hw7howtallin lt 0 then hw7howtallin=.;
if hw7howtallft lt 0 then hw7howtallft=.;
if hw7currweigh lt 0 then hw7currweigh=.;

height_sq = ((hw7howtallft*12) +  hw7howtallin)**2;
BMI = (hw7currweigh / height_sq * 703);
run;

proc surveymeans data=nhats_master_d;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var BMI;
run;
*same as methods paper, but SE=0.12 instead of 0.11;


*# of chronic conditions;
proc surveyfreq data=nhats_master_d;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7disescn1 hc7disescn2 hc7disescn3 hc7disescn4 hc7disescn5 hc7disescn6 hc7disescn7 hc7disescn8 hc7disescn9 hc7disescn10;
run;


data nhats_master_e;
set nhats_master_d;
if (hc7disescn1=1 or hc7disescn1=7)  then heart_attack=1;
else heart_attack=0;
if (hc7disescn2=1 or hc7disescn2=7) then heart_disease=1;
else heart_disease=0;
if (hc7disescn3=1 or hc7disescn3=7) then blood_press=1;
else blood_press=0;
if (hc7disescn4=1 or hc7disescn4=7) then arthritis=1;
else arthritis=0;
if (hc7disescn5=1 or hc7disescn5=7) then osteoporosis=1;
else osteoporosis=0;
if (hc7disescn6=1 or hc7disescn6=7) then diabetes=1;
else diabetes=0;
if (hc7disescn7=1 or hc7disescn7=7) then lung_disease=1;
else lung_disease=0;
if (hc7disescn8=1 or hc7disescn8=7) then stroke=1;
else stroke=0;
if (hc7disescn9=1 or hc7disescn9=7) then dementia=1;
else dementia=0;
if (hc7disescn10=1 or hc7disescn10=7) then cancer=1;
else cancer=0;
chron_conditions = heart_attack + heart_disease + blood_press + arthritis + osteoporosis + diabetes + lung_disease + stroke + cancer;
if 0 le chron_conditions le 1 then chron_cat=0;
else if 2 le chron_conditions le 3 then chron_cat=1;
else if chron_conditions gt 3 then chron_cat=2;

run;
*Comorbidities include heart attack, heart disease, hypertension, arthritis, osteoporosis, diabetes, lung disease, stroke, and cancer;

proc surveyfreq data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7disescn1 heart_attack hc7disescn2 heart_disease hc7disescn3 blood_press hc7disescn4 arthritis hc7disescn5 osteoporosis hc7disescn6 diabetes
hc7disescn7 lung_disease hc7disescn8 stroke hc7disescn9 dementia hc7disescn10 cancer;
run;

proc surveymeans data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var chron_conditions ;
run;

proc surveyfreq data=nhats_master_e;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables chron_cat ;
run;
*same as methods paper so must be different variable;


*Dementia;
*SAS code from NHATS;
proc format;
value demclas
 1="1:Probable dementia"
 2="2:Possible dementia"
 3="3:No dementia"
 -1="-1:Deceased or nursing home resident in initial round"
 -9="-9:Missing"
 ;
value ad8dem
 1="1:Meets dementia criteria"
 2="2:Does not meet dementia criteria"
 ;
value domain_l
0="0:Does not meet criteria"
1="1:Meets criteria"
;
value domain65_l
0="0 Not impaired"
1="Impaired in 1 domain"
2="Impaired in 2 domains"
3="Impaired in 3 domains"
;
run;


*************************** SKIP THIS SECTION TO BOTTOM OF MACRO ******************************************;


libname demclas "U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis";


%macro dementia1to12(rd, path, dataname, formatfile);


libname nhatsr&rd "&path";
%include "&path\&formatfile..sas";

data demclas.Round&rd;
set nhatsr&rd..&dataname;

** DATE STEP CODE FOR CREATING DEMENTIA CLASSIFICATION VARIABLE **;
length r&rd.demclas
 r&rd.ad8_dem r&rd.ad8_1-r&rd.ad8_8 r&rd.ad8miss_1-r&rd.ad8miss_8 r&rd.ad8_score r&rd.ad8_miss
 r&rd.date_mon r&rd.date_day r&rd.date_yr r&rd.date_dow r&rd.date_sum r&rd.date_sumr
 r&rd.preslast r&rd.presfirst r&rd.vplast r&rd.vpfirst r&rd.presvp r&rd.presvpr r&rd.date_prvp
 r&rd.clock_scorer r&rd.irecall r&rd.drecall r&rd.wordrecall0_20
 r&rd.clock65 r&rd.word65 r&rd.datena65 r&rd.domain65
 3;
label r&rd.demclas="R&rd. NHATS Dementia Classification";

%if &rd = 2 %then %do;
      if cg2dwrdimmrc = 10 and cg2dwrddlyrc = -3  then  cg2dwrdimmrc = -3; **USE THIS LINE TO FIX A CODING ERROR IN ROUND 2 ONLY**;
%end;

%if &rd = 1 %then %do;
** 1) SET MISSING (RESIDENTIAL CARE FQ ONLY) AND N.A. (NURSING HOME RESIDENTS) **;
      if r1dresid=3 then r1demclas=-9 ;
      if r1dresid=4 then r1demclas=-1 ;
%end;

%if &rd ne 1 %then %do;
** 1) SET MISSING (RESIDENTIAL CARE FQ ONLY) AND N.A. (NURSING HOME RESIDENTS, DECEASED) **;
      if r&rd.dresid in (3,5,7) then r&rd.demclas=-9;
      if r&rd.dresid in (6,8) then r&rd.demclas=-1;
%end;

** 2) CODE PROBABLE IF DEMENTIA DIAGNOSIS REPORTED BY SELF OR PROXY **;
if hc&rd.disescn9 in (1,7) and is&rd.resptype in (1,2) then r&rd.demclas=1;

** 3a) CODE AD8_SCORE **;
array r&rd.think {*} cp&rd.chgthink1-cp&rd.chgthink8; ** QUESTIONNAIRE ITEMS **;
array r&rd.ad8item {*} r&rd.ad8_1-r&rd.ad8_8;
array r&rd.ad8miss {*} r&rd.ad8miss_1-r&rd.ad8miss_8;
 r&rd.ad8_score =-1;
 r&rd.ad8_miss =-1;

 do i=1 to dim(r&rd.ad8item);
 ** INITIALIZE COUNTS TO NOT APPLICABLE**;
 r&rd.ad8item{i}=-1;
 r&rd.ad8miss{i}=-1;
 ** ASSIGN VALUES TO AD8 ITEMS IF PROXY AND DEMENTIA CLASS NOT ALREADY ASSIGNED BY
REPORTED DIAGNOSIS **;
 if is&rd.resptype=2 and r&rd.demclas=. then do;
 r&rd.ad8item{i}=.;
 if r&rd.think{i} in (1,3) then r&rd.ad8item{i}=1; ** PROXY REPORTS A CHANGE OR ALZ/DEMENTIA **;
 else if r&rd.think{i}=2 then r&rd.ad8item{i}=0; ** PROXY REPORTS NO CHANGE **;
 r&rd.ad8_score=sum(of r&rd.ad8item{*}); ** COUNT AD8 ITEMS **;

 if r&rd.ad8item{i} in (0,1) then r&rd.ad8miss{i}=0;
 else if r&rd.ad8item{i}=. then r&rd.ad8miss{i}=1;
 r&rd.ad8_miss=sum(of r&rd.ad8miss{*}); ** COUNT MISSING AD8 ITEMS **;
 end;
 end;
** 3b) CODE AD8 DEMENTIA CLASS **;

%if &rd ne 1 %then %do;
if cp&rd.dad8dem=1 and is&rd.resptype=2 and r&rd.demclas=. then r&rd.ad8_score=8;
%end;

**USE THIS LINE FOR ROUNDS 4-9 ONLY**;
%if &rd = 4 or &rd = 5 or &rd = 6  or &rd = 7  or &rd = 8 or &rd = 9 %then %do;
if is&rd.resptype=2 and cp&rd.dad8dem=-1 and cp&rd.chgthink1=-1 and r&rd.demclas=. then r&rd.ad8_score=8;
%end;

if r&rd.ad8_score>=2 then r&rd.ad8_dem=1 ; ** IF SCORE >=2 THEN MEETS AD8 CRITERION **;
if (r&rd.ad8_score in (0,1) or r&rd.ad8_miss=8) and r&rd.ad8_dem=. then r&rd.ad8_dem=2; ** IF SCORE IS 0 OR 1 OR ALL ITEMS MISSING THEN DOES NOT MEET AD8 CRITERION **;
** 4) UPDATE DEMENTIA CLASSIFICATION VARIABLE WITH AD8 CLASS **;
if r&rd.demclas=. then do;
 if r&rd.ad8_dem=1 then r&rd.demclas=1; ** PROBABLE BASED ON AD8 SCORE **;
 if r&rd.ad8_dem=2 and cg&rd.speaktosp=2 then r&rd.demclas=3; ** NO DIAGNOSIS, DOES NOT MEET AD8
CRITERION, AND PROXY SAYS CANNOT ASK SP COGNITIVE ITEMS **;
end;
** 5) CODE DATE ITEMS AND COUNT **;

%if &rd ne 4 %then %do;
array cg&rd.date {*} cg&rd.todaydat1-cg&rd.todaydat4; **USE THIS LINE FOR ROUNDS 1-3 and 5-11**;
%end;

array r&rd.date_item {*} r&rd.date_mon r&rd.date_day r&rd.date_yr r&rd.date_dow;


do i=1 to dim(r&rd.date_item);
 if cg&rd.date{i} > 0 then r&rd.date_item{i}=cg&rd.date{i}; *** CODE ONLY YES/NO RESPONSES: MISSING/N.A.
CODES -1,-9 LEFT MISSING **;
 if cg&rd.date{i} in (-7,2) then r&rd.date_item{i}=0; ** 2:NO/DK OR -7:REFUSED RECODED TO 0:NO/DK/RF
**;
 r&rd.date_sum=sum(of r&rd.date_item{*}); ** COUNT CORRECT DATE ITEMS
**;
end;

if r&rd.date_sum=. then do;
 if cg&rd.speaktosp=2 then r&rd.date_sum=-2; ** PROXY SAYS CAN'T SPEAK TO SP
**;
 else if cg&rd.speaktosp=1 and max(of cg&rd.date{*})=-1 then r&rd.date_sum=-3; ** PROXY SAYS CAN SPEAK TO
SP BUT SP UNABLE TO ANSWER **;
end;

r&rd.date_sumr=r&rd.date_sum;
if r&rd.date_sum=-2 then r&rd.date_sumr=.; ** MISSING IF PROXY SAYS CAN'T SPEAK TO SP
**;
else if r&rd.date_sum=-3 then r&rd.date_sumr=0; ** 0 IF SP UNABLE TO ANSWER **;
** 6) PRESIDENT AND VICE PRESIDENT NAME ITEMS AND COUNT **;
array cg&rd.pres {*} cg&rd.presidna1 cg&rd.presidna3 cg&rd.vpname1 cg&rd.vpname3;
array r&rd.pres_item {*} r&rd.preslast r&rd.presfirst r&rd.vplast r&rd.vpfirst;
do i=1 to dim(r&rd.pres_item);
 if cg&rd.pres{i} > 0 then r&rd.pres_item{i}=cg&rd.pres{i}; ** CODE ONLY YES/NO RESPONSES: MISSING/N.A. CODES
-1,-9 LEFT MISSING **;
 if cg&rd.pres{i} in (-7,2) then r&rd.pres_item{i}=0; ** 2:NO/DK OR -7:REFUSED RECODED TO 0:NO/DK/RF
**;
 r&rd.presvp=sum(of r&rd.pres_item{*}); ** COUNT CORRECT PRESIDENT/VEEP NAME ITEMS
**;
end;
if r&rd.presvp=. then do;
 if cg&rd.speaktosp=2 then r&rd.presvp=-2; ** PROXY SAYS CAN'T SPEAK TO SP
**;
 else if cg&rd.speaktosp=1 and max(of cg&rd.pres{*})=-1 then r&rd.presvp=-3; ** PROXY SAYS CAN SPEAK TO SP
BUT SP UNABLE TO ANSWER **;
end;
r&rd.presvpr=r&rd.presvp;
if r&rd.presvp=-2 then r&rd.presvpr=.; ** MISSING IF PROXY SAYS CAN'T SPEAK TO SP **;
else if r&rd.presvp=-3 then r&rd.presvpr=0; ** 0 IF SP UNABLE TO ANSWER **;
** 7) ORIENTATION DOMAIN: SUM OF DATE RECALL AND PRESIDENT NAMING **;
r&rd.date_prvp=sum(r&rd.date_sumr,r&rd.presvpr);

** 8) EXECUTIVE FUNCTION DOMAIN: CLOCK DRAWING SCORE **;
*RECODE CLOCK DRAWING SCORE TO ALIGN WITH MISSING VALUES IN PREVIOUS ROUNDS (ROUNDS 11 AND FORWARD ONLY)*;
%if &rd = 11 or &rd = 12 %then %do;
      if cg&rd.speaktosp=2 and cg&rd.dclkdraw=-9 then cg&rd.dclkdraw=-2;
      if cg&rd.speaktosp=1 and cg&rd.quesremem in (2, -7, -8) and cg&rd.dclkdraw=-9 then cg&rd.dclkdraw=-3;
%end;

%if &rd = 10 %then %do;
      if cg10speaktosp=2 and cg10dclkdraw=-9 then cg10dclkdraw=-2;
      if cg10speaktosp=1 and cg10quesremem in (2, -7, -8) and cg10dclkdraw=-9 then cg10dclkdraw=-3;
      if cg10atdrwclck=2  and cg10dclkdraw=-9 then cg10dclkdraw=-4;
      if cg10atdrwclck=97 and cg10dclkdraw=-9 then cg10dclkdraw=-7;
%end;

r&rd.clock_scorer=cg&rd.dclkdraw;
if cg&rd.dclkdraw in (-2,-9) then r&rd.clock_scorer=.;
if cg&rd.dclkdraw in (-3,-4,-7) then r&rd.clock_scorer=0;

** IMPUTE MEAN SCORE TO PERSONS MISSING A CLOCK **;
if cg&rd.dclkdraw=-9 and cg&rd.speaktosp=1 then r&rd.clock_scorer=2; ** IF PROXY SAID CAN ASK SP **;
if cg&rd.dclkdraw=-9 and cg&rd.speaktosp=-1 then r&rd.clock_scorer=3; ** IF SELF RESPONDENT **;


** 9) MEMORY DOMAIN: IMMEDIATE AND DELAYED WORD RECALL **;
array cg&rd.recall {*} cg&rd.dwrdimmrc cg&rd.dwrddlyrc;
array r&rd.word_recall {*} r&rd.irecall r&rd.drecall;
do i=1 to dim(r&rd.word_recall);
 r&rd.word_recall{i}=cg&rd.recall{i};
 if cg&rd.recall{i} in (-2,-1) then r&rd.word_recall{i}=.;
 if cg&rd.recall{i} in (-7,-3) then r&rd.word_recall{i}=0;

**SET CASES WITH MISSING WORD LIST AND NOT PREVIOUSLY ASSIGNED TO MISSING (ROUND 5 ONLY)**;
%if &rd = 5 %then %do;
      if cg5dwrdimmrc=-9 then r5word_recall{i}=.;
%end;

 r&rd.wordrecall0_20=sum(of r&rd.word_recall{*});
end;

** 10) CREATE COGNITIVE DOMAINS FOR ALL ELIGIBLE **;
** I.E. PROXY BUT PROXY SAYS CAN ASK SP, NOT FQ ONLY, NOT NH **;
if 1 < r&rd.clock_scorer <=5 then r&rd.clock65=0;
if 0 <= r&rd.clock_scorer <=1 then r&rd.clock65=1;
if 3 < r&rd.wordrecall0_20 <=20 then r&rd.word65=0;
if 0 <= r&rd.wordrecall0_20 <=3 then r&rd.word65=1;
if 3 < r&rd.date_prvp <= 8 then r&rd.datena65=0;
if 0 <= r&rd.date_prvp <= 3 then r&rd.datena65=1;
** 10) CREATE COGNITIVE DOMAIN SCORE **;
array r&rd.domains {*} r&rd.clock65 r&rd.word65 r&rd.datena65;
do i=1 to dim(r&rd.domains);
 r&rd.domain65=r&rd.clock65 + r&rd.word65 + r&rd.datena65;
end;


**SET CASES WITH MISSING WORD LIST AND NOT PREVIOUSLY ASSIGNED TO MISSING (ROUND 5 ONLY)**;
%if &rd = 5 %then %do;
      if cg5dwrdlstnm=-9 and r5demclas=. then r5demclas=-9;
%end;

** 11) UPDATE COGNITIVE CLASSIFICATION **;
if r&rd.demclas=. and cg&rd.speaktosp in (-1,1) then do;
if 2 <= r&rd.domain65 <=3 then r&rd.demclas=1; ** PROBABLE DEMENTIA **;
if r&rd.domain65 =1 then r&rd.demclas=2; ** POSSIBLE DEMENTIA **;
if r&rd.domain65 =0 then r&rd.demclas=3; ** NO DEMENTIA **;
end;



*KEEP DEMENTIA CLASSIFICATION AND COMPONENTS*;
keep spid r&rd.demclas r&rd.domain65 r&rd.ad8_dem r&rd.clock65 r&rd.word65 r&rd.datena65;

format
r&rd.demclas demclas.
r&rd.ad8_dem  ad8dem.
r&rd.clock65 r&rd.word65 r&rd.datena65 domain_l.
r&rd.domain65 domain65_l.;


run;


proc freq data = demclas.Round&rd;
table  r&rd.demclas ;
run;


%mend;


%dementia1to12(1,
[LOCATION WHERE ROUND 1 DATA IS SAVED],
NHATS_Round_1_SP_File,
Proc Format)


%dementia1to12(2,
[LOCATION WHERE ROUND 2 DATA IS SAVED],
NHATS_Round_2_SP_File_v2,
NHATS_Round_2_Combined_PROC_FORMAT_Statement_v2)

%dementia1to12(3,
[LOCATION WHERE ROUND 3 DATA IS SAVED],
NHATS_Round_3_SP_File,
NHATS_Round_3_Combined_PROC_FORMAT_Statement)

%dementia1to12(4,
[LOCATION WHERE ROUND 4 DATA IS SAVED],
NHATS_Round_4_SP_File,
NHATS_Round_4_Combined_PROC_FORMAT_Statement)

%dementia1to12(5,
[LOCATION WHERE ROUND 5 DATA IS SAVED],
NHATS_Round_5_SP_File_v2,
NHATS_Round_5_Combined_PROC_FORMAT_Statement_V2)


%dementia1to12(6,
[LOCATION WHERE ROUND 6 DATA IS SAVED],
NHATS_Round_6_SP_File_V2,
NHATS_Round_6_Combined_PROC_FORMAT_Statement_V2)


%dementia1to12(7,
U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis\SAS,
NHATS_Round_7_SP_File,
NHATS_Round_7_Combined_PROC_FORMAT_Statement)

%dementia1to12(8,
[LOCATION WHERE ROUND 8 DATA IS SAVED],
NHATS_Round_8_SP_File,
NHATS_Round_8_Combined_PROC_FORMAT_Statement)


%dementia1to12(9,
[LOCATION WHERE ROUND 9 DATA IS SAVED],
NHATS_Round_9_SP_File,
NHATS_Round_9_Combined_PROC_FORMAT_Statement)


%dementia1to12(10,
[LOCATION WHERE ROUND 10 DATA IS SAVED],
NHATS_Round_10_SP_File,
NHATS_Round_10_Combined_PROC_FORMAT_Statement)


%dementia1to12(11,
[LOCATION WHERE ROUND 11 DATA IS SAVED],
NHATS_Round_11_SP_File,
NHATS_Round_11_Combined_PROC_FORMAT_Statement)

%dementia1to12(12,
[LOCATION WHERE ROUND 12 DATA IS SAVED],
NHATS_Round_12B_SP_File,
NHATS_Round_12B_Combined_PROC_FORMAT_Statement)


************************************************************************* START CODE BACK AT THIS POINT TO IMPORT FILE WITH DEMENTIA CLASS **********;


libname dementia 'U:\ORDSA_desktop\Klinedinst_Secondary_Data_Analysis';

data work.dementia;
set dementia.Nhats_round_7_sp_file;
run;

data dementia_b;
set dementia (keep=spid r7demclas);
run;

*merge dementia_b dataset with nhats_master_e file;
proc sort data=dementia_b; by spid; run;
proc sort data=nhats_master_e; by spid; run;

data nhats_master_e_;
merge nhats_master_e (in=a) dementia_b (in=b) ;
by spid;
if a=1 and b=1;
run;

proc surveyfreq data=nhats_master_e_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7demclas;
run;

data nhats_master_e_b;
set nhats_master_e_;
if  r7demclas=1 then dementia=1;
else dementia=0;
run;

proc surveyfreq data=nhats_master_e_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dementia;
run;

*Depression (PHQ-2);
proc surveyfreq data=nhats_master_e_b;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7depresan1 hc7depresan2;
run;
*recode -8 for 1st item to missing and -7 or -8 on second item to missing, also change scoring to be 0-3 instead of 1-4;
data nhats_master_f;
set nhats_master_e_b;
if hc7depresan1=-8 then hc7depresan1=.;
if (hc7depresan2=-7 or hc7depresan2=-8) then hc7depresan2=.;
hc7depresan1_ = hc7depresan1 - 1;
hc7depresan2_ = hc7depresan2 - 1;
phq_2_ = hc7depresan1_ + hc7depresan2_ ;
if 0 le phq_2_ lt 3 then depression=0;
else if phq_2_ ge 3 then depression=1;
run;

proc surveyfreq data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hc7depresan1_ hc7depresan2_ phq_2_ depression;
run;

proc surveymeans data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var phq_2_;
run;
                                                                                                                                                                                                                                                                                                                   ;

*Walking for exercise;
proc surveyfreq data=nhats_master_f;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
run;
data nhats_master_g;
set nhats_master_f;
if Pa7evrgowalk = -8 then Pa7evrgowalk =.;
run;

proc surveyfreq data=nhats_master_g;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
run;

*Community network;
proc surveyfreq data=nhats_master_g;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell cm7willnghlp cm7peoptrstd;
run;

data nhats_master_h;
set nhats_master_g;
if (cm7knowwell=-7 or cm7knowwell=-8) then cm7knowwell=.;
if (cm7willnghlp=-7 or cm7willnghlp=-8) then cm7willnghlp=.;
if (cm7peoptrstd=-7 or cm7peoptrstd=-8) then cm7peoptrstd=.;
comm_net = cm7knowwell + cm7willnghlp + cm7peoptrstd;
run;

proc surveyfreq data=nhats_master_h;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell cm7willnghlp cm7peoptrstd;
run;

proc surveymeans data=nhats_master_h;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var comm_net;
run;

data nhats_master_i;
set nhats_master_h;
if cm7knowwell=3 then cm7knowwell_b = 0;
if cm7knowwell=2 then cm7knowwell_b = 1;
if cm7knowwell=1 then cm7knowwell_b = 2;
if cm7willnghlp=3 then cm7willnghlp_b = 0;
if cm7willnghlp=2 then cm7willnghlp_b = 1;
if cm7willnghlp=1 then cm7willnghlp_b = 2;
if cm7peoptrstd=3 then cm7peoptrstd_b = 0;
if cm7peoptrstd=2 then cm7peoptrstd_b = 1;
if cm7peoptrstd=1 then cm7peoptrstd_b = 2;
comm_net_b = cm7knowwell_b + cm7willnghlp_b + cm7peoptrstd_b ;
run;

proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables cm7knowwell_b cm7willnghlp_b cm7peoptrstd_b;
run;

proc surveymeans data=nhats_master_i percentile=(15,25,50,75,90,95);
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var comm_net_b;
run;


*IL-6;
proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7directil6;
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7directil6;
run;
proc surveyfreq data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7peil6;
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7peil6 ;
run;
data nhats_master_j;
set nhats_master_i;
if dbs7peil6=-9 then dbs7peil6=.;
log_dbs_IL6_ = log(dbs7peil6);
run;
proc surveymeans data=nhats_master_i;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7dfillil6 ;
run;

proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7peil6 ;
run;
proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_ ;
run;

*CRP;
proc surveyfreq data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dbs7pehscrp;
run;
proc surveymeans data=nhats_master_j;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7directhscrp dbs7pehscrp ;
run;

data nhats_master_k;
set nhats_master_j;
if dbs7pehscrp=-9 then dbs7pehscrp=.;
log_dbs_crp_ = log(dbs7pehscrp);
run;

proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var dbs7pehscrp ;
run;
proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_ ;
run;

*Frailty - use definition provided here: Bandeen-Roche, K., Seplaki, C. L., Huang, J., Buta, B., Kalyani, R. R., Varadhan, R., Xue, Q. L., Walston, J. D., & Kasper, J. D. (2015).
Frailty in Older Adults: A Nationally Representative Profile in the United States. The journals of gerontology. Series A, Biological sciences and medical sciences, 70(11),
 1427–1434. https://doi.org/10.1093/gerona/glv133;

*Weakness = Grip strength (kg) by BMI by gender;
grip stregnth results 1 = gr7grp1rdng
grip stregnth results 2 = gr7grp2rdng
proc surveyfreq data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables gr7grp1reslt gr7grp2reslt gr7grp1noat1 gr7grp1noat3 gr7grp1noat4 gr7grp1noat9   ;
run;
proc surveymeans data=nhats_master_k;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var gr7grp1rdng gr7grp2rdng;
run;

*create avg grip stregnth from 2 tests;
data nhats_master_l;
set nhats_master_k;
if gr7grp1reslt ne 1 then gr7grp1rdng =.;
if gr7grp2reslt ne 1 then gr7grp2rdng =.;
grip_avg = max(of gr7grp1rdng gr7grp2rdng);
run;

data grip_check;
set nhats_master_l (keep= gr7grp1rdng gr7grp2rdng grip_avg);
run;

proc surveyfreq data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables gr7grp1reslt gr7grp2reslt;
run;
proc surveymeans data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var gr7grp1rdng gr7grp2rdng grip_avg;
run;

*gender = r5dgender ;
proc surveyfreq data=nhats_master_l;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender;
run;
*1=male, 2=female;

*define weakness;
data nhats_master_m;
set nhats_master_l;
if (gr7grp1reslt=-1 or gr7grp2reslt=-1 or gr7grp1reslt=3 or gr7grp2reslt=2 or gr7grp2reslt=3 or gr7grp1noat1=1) then weakness=1;
else if r5dgender =1 and (0 le BMI lt 18.5 and 0 le grip_avg le 5.52) then weakness = 1;
else if r5dgender =1 and (0 le BMI lt 18.5 and grip_avg gt 5.52) then weakness = 0;

else if r5dgender =1 and (18.5 le BMI lt 25 and 0 le grip_avg le 22.75) then weakness = 1;
else if r5dgender =1 and (18.5 le BMI lt 25 and grip_avg gt 22.75) then weakness = 0;

else if r5dgender =1 and (25 le BMI lt 30 and 0 le grip_avg le 25.59) then weakness = 1;
else if r5dgender =1 and (25 le BMI lt 30 and grip_avg gt 25.59) then weakness = 0;

else if r5dgender =1 and (BMI ge 30 and 0 le grip_avg le 25.96) then weakness = 1;
else if r5dgender =1 and (BMI ge 30 and grip_avg gt 25.96) then weakness = 0;

else if r5dgender =2 and (0 le BMI lt 18.5 and 0 le grip_avg le 9.21) then weakness = 1;
else if r5dgender =2 and (0 le BMI lt 18.5 and grip_avg gt 9.21) then weakness = 0;

else if r5dgender =2 and (18.5 le BMI lt 25 and 0 le grip_avg le 12.66) then weakness = 1;
else if r5dgender =2 and (18.5 le BMI lt 25 and grip_avg gt 12.66) then weakness = 0;

else if r5dgender =2 and (25 le BMI lt 30 and 0 le grip_avg le 12.92) then weakness = 1;
else if r5dgender =2 and (25 le BMI lt 30 and grip_avg gt 12.92) then weakness = 0;

else if r5dgender =2 and (BMI ge 30 and 0 le grip_avg le 12.23) then weakness = 1;
else if r5dgender =2 and (BMI ge 30 and grip_avg gt 12.23) then weakness = 0;

else weakness=.;
run;

proc surveyfreq data=nhats_master_m;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables weakness;
run;

*Slowness = Gait speed m/s by height (cm) by gender;
*create height in cm from height in feet and inches;
data nhats_master_n;
set nhats_master_m;
height_in = ((hw7howtallft*12) +  hw7howtallin);
height_cm = height_in * 2.54;
run;

*Gait speed variable = wa7wlkc2secs ;
*Walking course completed = wa7wlkc2rslt ;
proc surveyfreq data=nhats_master_n;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables wa7wlkc2rslt wa7wlkc1rslt wa7wkaidused;
run;
proc surveymeans data=nhats_master_n;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var wa7wlkc2secs wa7wlkc1secs;
run;

data nhats_master_o;
set nhats_master_n;

walk_speed_avg = (4.8768 / wa7wlkc1secs) ;
run;

proc surveyfreq data=nhats_master_o;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender ;
run;

proc surveymeans data=nhats_master_o;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var walk_speed_avg;
domain r5dgender;
run;

data nhats_master_o_;
set nhats_master_o;
if (wa7wlkc2rslt=-1 or wa7wlkc1rslt=-1 or wa7wlkc2rslt=3 or wa7wlkc1rslt=2 or wa7wlkc1rslt=3 or
wa7wkaidused=2 or wa7wkaidused=3 or gr7grp2noat1=1) then slowness=1;

else if r5dgender =1 and (0 le height_cm le 175 and 0 le walk_speed_avg le 0.50) then slowness=1;
else if r5dgender =1 and (0 le height_cm le 175 and walk_speed_avg gt 0.50) then slowness=0;

else if r5dgender =1 and (height_cm gt 175 and 0 le walk_speed_avg le 0.58) then slowness=1;
else if r5dgender =1 and (height_cm gt 175 and walk_speed_avg gt 0.58) then slowness=0;

else if r5dgender =2 and (0 le height_cm le 159 and 0 le walk_speed_avg le 0.35) then slowness=1;
else if r5dgender =2 and (0 le height_cm le 159 and walk_speed_avg gt 0.35) then slowness=0;

else if r5dgender =2 and (height_cm gt 159 and 0 le walk_speed_avg le 0.45) then slowness=1;
else if r5dgender =2 and (height_cm gt 159 and walk_speed_avg gt 0.45) then slowness=0;

*count missing as 0;
run;

proc surveyfreq data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables wa7wlkc2rslt wa7wlkc1rslt slowness;
run;
proc surveymeans data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var wa7wlkc2secs wa7wlkc1secs walk_speed_avg;
run;


*Shrinking = wt loss of >= 10lbs in last year or BMI < 18.5;
proc surveyfreq data=nhats_master_o_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables hw7lst10pnds hw7trytolose;
run;

data nhats_master_p;
set nhats_master_o_;
if ((hw7lst10pnds=1 and hw7trytolose=2) or (0 le BMI lt 18.5)) then shrinking=1;
else if (hw7lst10pnds =. or hw7trytolose =. or BMI =.) then shrinking=.;
else shrinking=0;
run;

proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables shrinking;
run;

*Exhaustion = Self-report of low energy or ease of exhaustion to limit activities;
proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables ss7loenlmtat ss7lowenergy;
run;

data nhats_master_p_;
set nhats_master_p;
if ss7loenlmtat=1 then low_energ_exhaust=1;
else if (ss7loenlmtat=-8 or ss7lowenergy=-8) then low_energ_exhaust=.;
else low_energ_exhaust=0;
run;

proc surveyfreq data=nhats_master_p_;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_energ_exhaust;
run;


*Low physical activity = Never walked for exercise or engaged in vigorous activity in the last month;
proc surveyfreq data=nhats_master_p;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk pa7vigoractv ;
run;

data nhats_master_q;
set nhats_master_p_;
if (Pa7evrgowalk=2 and pa7vigoractv=2) then low_phys_act=1;
else if (Pa7evrgowalk=. or pa7vigoractv=.) then low_phys_act=.;
else low_phys_act=0;
run;

proc surveyfreq data=nhats_master_q;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_phys_act ;
run;

*Defining frailty;
proc surveyfreq data=nhats_master_q;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables weakness slowness shrinking low_energ_exhaust low_phys_act ;
run;

*0 criteria=robust, 1-2 criteria=pre-frail, 3-5=frail;
proc format;
value frailty
0='robust'
1='pre-frail'
2='frail'
;
run;

data nhats_master_r;
set nhats_master_q;
nmiss = nmiss(of weakness slowness shrinking low_energ_exhaust low_phys_act);
if (0 le nmiss le 2 and weakness=.) then weakness=0;
if (0 le nmiss le 2 and slowness=.) then slowness=0;
if (0 le nmiss le 2 and shrinking=.) then shrinking=0;
if (0 le nmiss le 2 and low_energ_exhaust=.) then low_energ_exhaust=0;
if (0 le nmiss le 2 and low_phys_act=.) then low_phys_act=0;

frail_index = weakness + slowness + shrinking + low_energ_exhaust + low_phys_act;
if frail_index=0 then frailty=0;
else if 1 le frail_index le 2 then frailty=1;
else if 3 le frail_index le 5 then frailty=2;
run;

proc surveyfreq data=nhats_master_r;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables nmiss frail_index frailty;
format frailty frailty.;
run;


********************************************* analysis;

*association between covariates and social cohesion;
*age;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model comm_net_b= r7dintvwrage / solution;
run ;

*age category;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model comm_net_b= r7d2intvrage  / solution;
run ;

*gender;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model comm_net_b= r5dgender  / solution;
run ;

*race/ethncity;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new ;
model comm_net_b= rl5dracehisp_new / solution;
run ;

*income;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class income_cat_b ;
model comm_net_b= income_cat_b / solution;
run ;

*smoking;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= sd7smokesnow / solution;
run ;

*bmi;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= BMI / solution;
run ;

*chronic conditions;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= chron_cat / solution;
run ;

*dementia;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= dementia / solution;
run ;

*frailty;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= frailty / solution;
run ;

*depression;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= phq_2_  / solution;
run ;

proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= depression  / solution;
run ;

*walking for exercise;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model comm_net_b= Pa7evrgowalk  / solution;
run ;


****** cronbach's alpha comm_net_b ******;
proc corr data=nhats_master_r nomiss alpha plots=matrix;
   var cm7knowwell_b cm7willnghlp_b cm7peoptrstd_b;
run;


**************** CRP *************************;

*unadjusted/model 1;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_crp_= comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty/ clparm solution;
run ;


************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b  / clparm solution;
run ;

*model 2;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_r ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model log_dbs_IL6_ = comm_net_b comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;

*re-catorize based on a value of 2 or less indicating low social cohesion;
data nhats_master_s;
set nhats_master_r;
if 0 le comm_net_b le 2 then low_cohesion=1;
else if comm_net_b gt 2 then low_cohesion=0;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables low_cohesion;
run;

proc means data=nhats_master_s;
weight w7anfinwgt0 ; *strata w7varstrat ; *cluster w7varunit ;
var log_dbs_crp_ ;
*by low_cohesion;
run;


****** BELOW IS SUBSTITUTING LOW SOCIAL COHESION FOR SOCIAL COHESION CONTINUOUS VARIABLE ****;

**************** CRP *************************;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage rl5dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage rl5dracehisp_new income_cat_b chron_cat frailty sd7smokesnow ;
model log_dbs_crp_= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
output out=outdiag3 p=phat r=resid ;
run ;

proc univariate data=outdiag3 ;
var resid ;
histogram resid / cfill=grey normal ;
run ;

*what if we used untransformed data?;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model dbs7pehscrp= low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
output out=outdiag3_b p=phat r=resid ;
run ;

proc univariate data=outdiag3_b ;
var resid ;
histogram resid / cfill=grey normal ;
run ;


proc sort data=nhats_master_s;
by low_cohesion;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_crp_;
by low_cohesion;
run;


************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion  / clparm solution;
run ;

*model 2;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
output out=outdiag4 p=phat r=resid ;
run ;

proc univariate data=outdiag4 ;
var resid ;
histogram resid / cfill=grey normal ;
run ;

*what if we used untransformed data?;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model dbs7peil6 = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
output out=outdiag4_b p=phat r=resid ;
run ;

proc univariate data=outdiag4_b ;
var resid ;
histogram resid / cfill=grey normal ;
run ;

proc sort data=nhats_master_s;
by low_cohesion;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_;
run;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var log_dbs_IL6_;
by low_cohesion;
run;


*association between covariates and low social cohesion;
*age;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model low_cohesion = r7dintvwrage ;
run ;

proc surveymeans data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
var r7dintvwrage ;
domain low_cohesion ;
run ;

*age category;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model low_cohesion= r7d2intvrage  ;
run ;

proc sort datan=nhats_master_s;
by low_cohesion;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r7d2intvrage;
by low_cohesion;
run;

*gender;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model low_cohesion= r5dgender  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables r5dgender;
by low_cohesion;
run;

*race/ethncity;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new ;
model low_cohesion= rl5dracehisp_new ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new;
run;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables rl5dracehisp_new;
by low_cohesion;
run;

*income;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class income_cat_b ;
model low_cohesion= income_cat_b ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables income_cat_b ;
by low_cohesion;
run;

*smoking;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= sd7smokesnow ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables sd7smokesnow ;
by low_cohesion;
run;

*bmi;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= BMI ;
run ;

proc surveymeans data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
var BMI ;
by low_cohesion;
run;

*chronic conditions;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= chron_cat ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables chron_cat ;
by low_cohesion;
run;

*dementia;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= dementia ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables dementia ;
by low_cohesion;
run;

*frailty;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= frailty ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables frailty ;
by low_cohesion;
run;

*depression;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= phq_2_  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables depression ;
by low_cohesion;
run;

proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= depression  ;
run ;

*walking for exercise;
proc surveylogistic data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class sd7smokesnow ;
model low_cohesion= Pa7evrgowalk  ;
run ;

proc surveyfreq data=nhats_master_s;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
tables Pa7evrgowalk ;
by low_cohesion;
run;


********** ASSOCIATION BETWEEN COVARIATES OF INTEREST AND OUR OUTCOMES ***********;

*age;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model log_dbs_IL6_ = r7dintvwrage ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
*class marcat ;
model log_dbs_crp_ = r7dintvwrage ;
run ;

*age category;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  r7d2intvrage ;
model log_dbs_IL6_ = r7d2intvrage / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  r7d2intvrage ;
model log_dbs_crp_ = r7d2intvrage / solution ;
run ;

*gender;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_= r5dgender  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_= r5dgender  ;
run ;

*race/ethncity;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class rl5dracehisp_new (ref='1');
model log_dbs_IL6_ = rl5dracehisp_new /solution;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class  rl5dracehisp_new (ref='1') ;
model log_dbs_crp_ = rl5dracehisp_new /solution;
run ;

*income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class income_cat_b ;
model log_dbs_IL6_ = income_cat_b /solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class income_cat_b ;
model log_dbs_crp_ = income_cat_b /solution ;
run ;

*smoking;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class sd7smokesnow ;
model log_dbs_IL6_ = sd7smokesnow / solution;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class sd7smokesnow ;
model log_dbs_crp_ = sd7smokesnow / solution;
run ;

*bmi;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_= BMI ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_= BMI ;
run ;

*chronic conditions;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class chron_cat ;
model log_dbs_IL6_ = chron_cat / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class chron_cat ;
model log_dbs_crp_ = chron_cat / solution ;
run ;

*dementia;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = dementia / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = dementia / solution ;
run ;

*frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class frailty ;
model log_dbs_IL6_ = frailty / solution ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class frailty ;
model log_dbs_crp_ = frailty / solution ;
run ;

*depression;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = phq_2_  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = phq_2_  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = depression  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = depression  ;
run ;

*walking for exercise;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_IL6_ = Pa7evrgowalk  ;
run ;

proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
model log_dbs_crp_ = Pa7evrgowalk  ;
run ;


***** DO CONFOUNDERS ALTER THE ESTIMATE BY AT LEAST 10% ************* IL-6 ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15dracehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_ = low_cohesion comm_net_b r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;

***** DO CONFOUNDERS ALTER THE ESTIMATE BY AT LEAST 10% ************* CRP ****************************;
*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_ = low_cohesion dementia / clparm solution;
run ;

*model 3;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_ = low_cohesion r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow
BMI chron_cat dementia depression frailty / clparm solution;
run ;


************ BELOW IS ONLY ADJUSTING FOR FACTORS DETERMINED TO BE CONFOUNDING FACTORS *********;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion rl5dracehisp_new income_cat_b / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_crp_= low_cohesion rl5dracehisp_new income_cat_b
BMI chron_cat depression frailty Pa7evrgowalk/ clparm solution;
run ;

*unadjusted/model 1;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion  / clparm solution;
run ;

*model 2 - add age cat, gender, race/ethnicity, and income;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion rl5dracehisp_new / clparm solution;
run ;

*model 3 - model 2 + smoking, BMI, comorbidity (# chronic disease), dementia, depressive symptoms and frailty;
proc surveyreg data=nhats_master_s ;
weight w7anfinwgt0 ; strata w7varstrat ; cluster w7varunit ;
class r7d2intvrage r15racehisp_new income_cat_b chron_cat frailty sd7smokesnow;
model log_dbs_IL6_= low_cohesion rl5dracehisp_new
BMI chron_cat dementia depression frailty Pa7evrgowalk/ clparm solution;
run ;











***************** missing data;
data nhats_t;
set nhats_master_s;
where low_cohesion ne .;
run;
*n=4315;

proc freq data=nhats_t;
tables r7d2intvrage r5dgender rl5dracehisp_new income_cat_b sd7smokesnow  chron_cat dementia depression  hc7depresan1_ hc7depresan2_ frailty Pa7evrgowalk ;
run;

proc means data=nhats_t missing;
var BMI ;
run;

data nhats_u;
set nhats_t;
where (r7d2intvrage=. OR r5dgender=. OR rl5dracehisp_new=. OR income_cat_b=. OR
sd7smokesnow=. OR  chron_cat=. OR dementia=. OR depression=. OR frailty=. OR Pa7evrgowalk=.
or BMI=.);
run;

data nhats_v;
set nhats_t;
where (r7d2intvrage ne . AND r5dgender ne . AND rl5dracehisp_new ne . AND income_cat_b ne . AND
sd7smokesnow ne . AND  chron_cat ne . AND dementia ne . AND depression ne . AND frailty ne . AND Pa7evrgowalk ne .
AND BMI ne .) ;
run;

data nhats_w;
set nhats_v;
where log_dbs_IL6_ ne .;
run;

data nhats_x;
set nhats_v;
where log_dbs_crp_ ne .;
run;

data nhats_w_;
set nhats_v;
where dbs7pehscrp ne .;
run;

data nhats_x_;
set nhats_v;
where dbs7peil6 ne .;
run;

