

use "E:\Energy Poverty\Individuals - Reduced.dta"

*******************Cleaning Individuals******************************

keep SURVEY - RO7 FM36Y FMEARN FMHOURLY AN1 NF1 NFBN1 NF1A NFEARN1 NFBN21 ///
NF21A NFEARN2 NFBN41 NF41A NFEARN3 NFEARN NFHOURLY IN12Y IN13S1 IN13S2 IN13S3 ///
IN13S4 IN13S5 IN13S6 IN13S7 IN13S8 - EDUC7 ED12 MM7Y FAMCAT WSEARN WKEARNPLUS ///
ID11 GROUPS6 DEFLATOR ASSETS ASSETS2005 ASSETS5 COTOTAL COTOTAL5 INCOME INCOME5 ///
POOR POOR1 POORI POVLINE2005 POVLINE2012 NMARRIEDF NMARRIEDM HHEDUC HHEDUC7 HHEDUCF ///
HHEDUCM HHLITERATE WT2005 WT FWT HHPBASE


**Renamimg Variables
rename URBAN Urban
rename URBAN2001 Urban_2001
rename URBAN4 Urban_4cat
rename URBAN4_2001 Urban_4cat_2001
rename URBAN2011 Urban_2011
rename URBAN4_2011 Urban_4cat_2011
rename METRO Metro
rename METRO6 Metro_name
rename RO3 Sex
rename RO4 Relate_Head
rename RO5 Age
rename RO6 Marital_stat
rename RO7 Prim_Act
rename FM1 Land_own_cultiv
rename FM36Y Own_farm_work
rename FMEARN Ind_crop_net_earn
rename FMHOURLY Own_farm_net_hr_earn
rename AN1 Owns_cattle
rename NF1 Non_farm_busin
rename NFBN1 HH_busin_1
rename NF1A HH_busin_1_indus
rename NFEARN1 Ind_busin_1_earn
rename NFBN21 HH_busin_2
rename NF21A HH_busin_2_indus
rename NFEARN2 Ind_busin_2_earn
rename NFBN41 HH_busin_3
rename NF41A HH_busin_3_indus
rename NFEARN3 Ind_busin_3_earn
rename NFEARN Ind_busin_net_earn
rename NFHOURLY Ind_busin_net_hr_earn
rename IN12Y Transfer_income
rename IN13S1 Old_age_pen
rename IN13S2 Widow_pen
rename IN13S3 Maternity_pen
rename IN13S4 Disability_pen
rename IN13S5 Annapurna
rename IN13S6 other_govt_pen
rename IN13S7 NGO_Rs
rename IN13S8 Other_scheme_Rs
rename ED2 Education
rename ED3 English_ability
rename ED4 Attend_school
rename ED5 Now_enrolled
rename ED6 Edu_completed_yrs
rename EDUC7 Edu_yrs_cat
rename ED12 Max_degree
rename MM7Y Computer_use
rename FAMCAT Family_type
rename WSEARN Ind_WS_earn_tot_yr
rename WKEARNPLUS Earnings_all_work
rename ID11 Religion
rename GROUPS6 Caste
rename DEFLATOR DEFLATOR
rename ASSETS HH_assets_W2
rename ASSETS2005 HH_assets_W1
rename ASSETS5 HH_assets_Quin
rename COTOTAL HHCE_yr
rename COTOTAL5 HHCE_Quin
rename INCOME HH_annual_income
rename INCOME5 HH_Income_Quin
rename POOR Poor_either_2005_2012
rename POOR1 Poor_2005
rename POORI BPL_2005
rename POVLINE2005 Pov_line_2005
rename POVLINE2012 Pov_line_2012
rename NMARRIEDF Married_Fem_num
rename NMARRIEDM Married_Male_num
rename HHEDUC HH_max_edu
rename HHEDUC7 HH_max_edu_7cat
rename HHEDUCF HH_max_female_edu
rename HHEDUCM HH_max_male_edu
rename HHLITERATE HH_any_literate


***Unique KEY
isid STATEID DISTID PSUID HHID HHSPLITID PERSONID IDPERSON


*** Primary Analysis Tabulations
*Demographics
global Tabs Sex Marital_stat Land_own_cultiv Education ///
English_ability Attend_school Now_enrolled Edu_yrs_cat Computer_use ///
Family_type Religion Caste
 
*Income and Poverty
*IHDS1 
global Tabs  HH_assets_Quin HHCE_Quin HH_Income_Quin Poor_2005 ///
BPL_2005 Poor_either_2005_2012 

*IHDS2
global Tabs  HH_assets_Quin HHCE_Quin HH_Income_Quin Poor_either_2005_2012 

*change save file accordingly
foreach var in $Tabs{
tabout `var' if SURVEY==2 [iw= FWT] ///
using "E:\Energy Poverty\Misc Docs\Stata auto output\ ind inc 2.xls", oneway append ///
c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cum_Freq)
}

foreach var in $Tabs{
tabout `var' if SURVEY==2 [iw= FWT2012] ///
using "E:\Energy Poverty\Misc Docs\Stata auto output\ income1.xls", oneway append ///
c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
}


*** Primary "Income" Summary Analysis Tabulations
*for IHDS 1 
estpost sum Ind_crop_net_earn Own_farm_net_hr_earn Ind_busin_net_earn ///
Ind_busin_net_hr_earn Ind_WS_earn_tot_yr HH_assets_W1 HHCE_yr HH_annual_income ///
if SURVEY==1 [iw= FWT]
esttab using "E:\Energy Poverty\Misc Docs\Stata auto output\ind sum 1 .csv", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(0)) max(fmt(0)) count(fmt(0))")noobs replace

*for IHDS 2
estpost sum Ind_crop_net_earn Own_farm_net_hr_earn Ind_busin_net_earn ///
Ind_busin_net_hr_earn Ind_WS_earn_tot_yr HH_assets_W2 HHCE_yr HH_annual_income ///
if SURVEY==2 [iw= FWT]
esttab using "E:\Energy Poverty\Misc Docs\Stata auto output\ind sum 2.csv", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(0)) max(fmt(0)) count(fmt(0))")noobs replace





*******Merge Attempt****
gen Key_help_1=1
gen Key_help_0=0


* Creating KEY for STATEID<10 & DISTID<10 & PSUID<10 & HHID<10
egen KEY=concat( Key_help_1 Key_help_0 STATEID Key_help_0 DISTID Key_help_0 PSUID Key_help_0 HHID Key_help_0 HHSPLITID2012 ) if STATEID<10 & DISTID<10 & PSUID<10 & HHID<10

egen State_KEY=concat( Key_help_1 Key_help_0 STATEID) if STATEID<10
egen State_KEY_10=concat( Key_help_1 STATEID) if STATEID>=10
gen St_id = State_KEY if STATEID<10
replace St_id = State_KEY_10 if STATEID>=10


*creating DSID
egen DSID_KEY= concat(Key_help_0 DISTID) if DISTID<10
egen DSID_KEY_10= concat(DISTID) if DISTID>=10
gen D_id= DSID_KEY if DISTID<10
replace D_id= DSID_KEY_10 if DISTID>=10

*creating PSID
egen PSID_KEY= concat(Key_help_0 PSUID) if PSUID<10
egen PSID_KEY_10= concat(PSUID) if PSUID>=10
gen P_id= PSID_KEY if PSUID<10
replace P_id= PSID_KEY_10 if PSUID>=10

*Creating HHID
egen HHID_KEY= concat(Key_help_0 HHID Key_help_0) if HHID<10
egen HHID_KEY_10= concat(HHID Key_help_0) if HHID>=10 & HHID<100
egen HHID_KEY_100= concat(HHID) if HHID>=100 

gen HH_id= HHID_KEY if HHID<10
replace HH_id= HHID_KEY_10 if HHID>=10 & HHID<100
replace HH_id= HHID_KEY_100 if HHID>=100

***Generating Final KEY
egen HH_KEY= concat(St_id D_id P_id HH_id HHSPLITID2012) 













