

*************************Dropping Unnecessary variables from HH File***********************
	use "E:\Energy Poverty\Household - Reduced.dta"



	keep HHBASE- HHWAVES HS3M HS3Y ID11 GROUPS6 ID14 ID15 ID16 ID17 ID18A ID18C FM1 ///
	FM4 FM5 FM6 FM7 FM40B FM40C FM40E FM40L NF5 NF25 NF45 IN1 IN2 IN3A IN3B IN4A IN4B ///
	IN5 IN6 IN7 IN7NM RC1B1 RC1B2 RC1D RC1E CO4A CO4B CO4C CO4D CO4E CO4M CO4X CO21_22 ///
	CO28_29 COTOTAL COTOTAL5 ASSETS ASSETS5 ASSETS2005 OH8 SA2 SAKITCHEN SA2A FU1 FU1A FU1B ///
	FU1C FU3 FU7 FU7A FU7B FU8 FU8A FU8B FU9 FU9A FU9B FU10 FU10A FU10B FU11 FULPG FU11A FU11B ///
	FU12 FU12A FU12B FU13A FUCOLLECT FU14A3 FU14B3 FU14C3 FU14D3 POVLINE2005 POVLINE2012 DEFLATOR ///
	PSUWAVES URBAN URBAN2001 URBAN2011 URBAN4 URBAN4_2001 URBAN4_2011 METRO METRO6 DIST11 INCOME ///
	INCOME5 NPERSONS NWKANY NNR HHLITERATE HHEDUC HHEDUC7 HHEDUCM HHEDUCF POP01 POORI POOR1 POOR2 POOR

*************Cleaning HH-Reduced**********************

**renaming variables
	rename ID11 Religion
	rename GROUPS6 Caste
	rename ID14 Income_sourcer
	rename ID15 Stay_yrs
	rename ID16 Origin_place
	rename ID17 Urban_origin
	rename ID18A HH_head_job
	rename ID18C HH_head_edu
	rename FM1 Land_own_cultiv
	rename FM4 Land_own_max
	rename FM5 Land_rentin_max
	rename FM6 Land_rentout_max
	rename FM7 Land_holding_max
	rename FM40B Own_electric_pump
	rename FM40C Own_diesel_pump
	rename FM40E Own_tractors
	rename FM40L Own_biogas_plant
	rename NF5 Busi1_net_income
	rename NF25 Busi2_net_income
	rename NF45 Busi3_net_income
	rename IN1 Inc_renting_property
	rename IN2 Inc_interest
	rename IN3A Inc_govt_pens
	rename IN3B Inc_pvt_pens
	rename IN4A Inc_sale_nonag_land
	rename IN4B Inc_sale_ag_land
	rename IN5 Inc_scholarship_gift
	rename IN6 Inc_other_govt_source
	rename IN7 Inc_other_source
	rename IN7NM Inc_other_name
	rename RC1B1 BPL_card
	rename RC1B2 APL_card
	rename RC1D Card_used
	rename RC1E Reason_not_used
	rename CO4A Keros_lts
	rename CO4B Keros_Purchased
	rename CO4C Keros_mkt_price
	rename CO4D Keros_PDS_lts
	rename CO4E Keros_pds_pric
	rename CO4M Keros_mkt_lts
	rename CO4X Keros_tot_Rs
	rename CO21_22 Electricity_Fuel_cost
	rename CO28_29 Trans_Petrol_cost
	rename COTOTAL HHCE_yr
	rename COTOTAL5 HHCE_Quin
	rename ASSETS HH_assets_W2
	rename ASSETS5 HH_assets_Quin
	rename ASSETS2005 HH_assets_W1
	rename OH8 Obs_knows_expend
	rename SA2 Busi2_cooking_place
	rename SAKITCHEN Kitchen_separate
	rename SA2A Cook_place_vent
	rename FU1 HH_electricity
	rename FU1A Electricity_hours
	rename FU1B Electricity_pay
	rename FU1C Electricity_Rs
	rename FU3 stove_burn_hrs
	rename FU7 HH_firewood_use
	rename FU7A HH_firewood_source
	rename FU7B Firewood_Rs
	rename FU8 HH_dung_use
	rename FU8A HH_dung_source
	rename FU8B Dung_rs
	rename FU9 HH_cropresidue_use
	rename FU9A HH_cropresidue_source
	rename FU9B HH_cropresidue_Rs
	rename FU10 HH_keros_use
	rename FU10A HH_keros_source
	rename FU10B Keros_Rs
	rename FU11 HH_LPG_Purpose
	rename FULPG HH_LPG_use
	rename FU11A HH_LPG_source
	rename FU11B LPG_Rs
	rename FU12 HH_coal_charc_use
	rename FU12A HH_coal_charc_source
	rename FU12B HH_coal_charc_Rs
	rename FU13A Dist_to_fuel
	rename FUCOLLECT HH_collects_fuel
	rename FU14A3 Fuel_women_min_week
	rename FU14B3 Fuel_men_min_week
	rename FU14C3 Fuel_girl_min_week
	rename FU14D3 Fuel_boy_min_week
	rename POVLINE2005 Pov_line_2005
	rename POVLINE2012 Pov_line_2012
	rename DEFLATOR DEFLATOR
	rename PSUWAVES PSU_wave
	rename URBAN Urban
	rename URBAN2001 Urban_2001
	rename URBAN2011 Urban_2011
	rename URBAN4 Urban_4cat
	rename URBAN4_2001 Urban_4cat_2001
	rename URBAN4_2011 Urban_4cat_2011
	rename METRO Metro
	rename METRO6 Metro_name
	rename DIST11 District_id_2011
	rename INCOME HH_annual_income
	rename INCOME5 HH_Income_Quin
	rename NPERSONS HH_size
	rename NNR HH_nonresidents
	rename HHLITERATE HH_any_literate
	rename HHEDUC HH_max_edu
	rename HHEDUC7 HH_max_edu_7cat
	rename HHEDUCM HH_max_male_edu
	rename HHEDUCF HH_max_female_edu
	rename POP01 Pop_size_place
	rename POORI BPL_2005
	rename POOR1 Poor_2005
	rename POOR2 Poor_2012
	rename POOR Poor_either_2005_2012
******************************************************************************************************************************************************




************************************** Primary Analysis Tabulations***********************************************************************************
******************************************************************************************************************************************************
*** Primary Analysis Tabulations
*Demographics
	global Tabs Religion Caste Income_sourcer HH_head_edu Urban
 
*Income and Poverty 
	global Tabs BPL_card APL_card Card_used ///
	Reason_not_used Poor_2012 BPL_2005 Poor_2005 ///
	HH_assets_Quin HH_Income_Quin

*Fuel Details
	global Tabs Land_own_cultiv Own_electric_pump Own_diesel_pump ///
	Own_tractors Own_biogas_plant HH_electricity HH_electricity HH_firewood_use ///
	HH_firewood_source HH_dung_use HH_dung_source HH_cropresidue_use ///
	HH_cropresidue_source HH_keros_use HH_keros_source HH_LPG_Purpose ///
	HH_LPG_use HH_LPG_source HH_coal_charc_use HH_coal_charc_source HH_collects_fuel


*change save file accordingly
	foreach var in $Tabs{
	tabout `var' if SURVEY==1 [iw= FWT2005 ] ///
	using "E:\Energy Poverty\Misc Docs\Stata auto output\ test.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}

	foreach var in $Tabs{
	tabout `var' if SURVEY==2 [iw= FWT2012] ///
	using "E:\Energy Poverty\Misc Docs\Stata auto output\ income1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}


*** Primary "Fuel" Summary Analysis Tabulations
*for IHDS 1 
	estpost sum Keros_mkt_price Keros_PDS_lts Keros_pds_pric ///
	Keros_mkt_lts Keros_tot_Rs Electricity_Fuel_cost Trans_Petrol_cost ///
	HHCE_yr HH_assets_W2 HH_assets_W1 Electricity_hours Electricity_Rs ///
	Firewood_Rs Dung_rs HH_cropresidue_Rs Keros_Rs LPG_Rs HH_coal_charc_Rs ///
	HH_annual_income if SURVEY==1 [iw= FWT2005]
	esttab using "E:\Energy Poverty\sum.csv", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(0)) max(fmt(0)) count(fmt(0))")noobs replace

*for IHDS 2
	estpost sum Keros_mkt_price Keros_PDS_lts Keros_pds_pric ///
	Keros_mkt_lts Keros_tot_Rs Electricity_Fuel_cost Trans_Petrol_cost ///
	HHCE_yr HH_assets_W2 HH_assets_W1 Electricity_hours Electricity_Rs ///
	Firewood_Rs Dung_rs HH_cropresidue_Rs Keros_Rs LPG_Rs HH_coal_charc_Rs ///
	HH_annual_income if SURVEY==2 [iw= FWT2012]
	esttab using "E:\Energy Poverty\sum.csv", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(0)) max(fmt(0)) count(fmt(0))")noobs replace
********************************************************************************************************************************************



**************************************Variable Reconfiguration for Analysis***********************************************************************************
********************************************************************************************************************************************
***Unique KEY for H to H
	isid STATEID DISTID PSUID HHID HHSPLITID IDHH
	egen H_H_KEY=concat(STATEID DISTID PSUID HHID HHSPLITID IDHH)
	isid H_H_KEY


**Year Dummy
	gen year=0  if SURVEY==1
	replace year=1 if SURVEY==2

**Deflating 2004-05 price to 2011-12
	foreach var in Keros_mkt_price Keros_pds_pric Keros_tot_Rs Electricity_Fuel_cost ///
	Trans_Petrol_cost Electricity_Rs Firewood_Rs Dung_rs ///
	HH_cropresidue_Rs Keros_Rs LPG_Rs HH_coal_charc_Rs HH_annual_income{
	gen `var'_DEF = `var'/DEFLATOR if SURVEY==1
	}

**foreach var in Keros_mkt_price_DEF Keros_pds_pric_DEF Keros_tot_Rs_DEF Electricity_Fuel_cost_DEF ///
**Trans_Petrol_cost_DEF Electricity_Rs_DEF Firewood_Rs_DEF Dung_rs_DEF ///
**HH_cropresidue_Rs_DEF Keros_Rs_DEF LPG_Rs_DEF HH_coal_charc_Rs_DEF ///
**HH_annual_income_DEF

*Replacing 2012 values in SURVEY=2 cases
	replace Keros_mkt_price_DEF = Keros_mkt_price if SURVEY==2
	replace Keros_pds_pric_DEF = Keros_pds_pric if SURVEY==2
	replace Keros_tot_Rs_DEF = Keros_tot_Rs if SURVEY==2
	replace Electricity_Fuel_cost_DEF = Electricity_Fuel_cost if SURVEY==2
	replace Trans_Petrol_cost_DEF = Trans_Petrol_cost if SURVEY==2
	replace Electricity_Rs_DEF = Electricity_Rs if SURVEY==2
	replace Firewood_Rs_DEF = Firewood_Rs if SURVEY==2
	replace Dung_rs_DEF = Dung_rs if SURVEY==2
	replace HH_cropresidue_Rs_DEF = HH_cropresidue_Rs if SURVEY==2
	replace Keros_Rs_DEF = Keros_Rs if SURVEY==2
	replace LPG_Rs_DEF = LPG_Rs if SURVEY==2
	replace HH_coal_charc_Rs_DEF = HH_coal_charc_Rs if SURVEY==2
	replace HH_annual_income_DEF = HH_annual_income if SURVEY==2



**Dropping Outlier in IHDS 1 income
*drop if HH_annual_income_DEF>=22200000



*code for visual confirmation of DEFLATED values
	br Keros_mkt_price_DEF Keros_mkt_price Keros_pds_pric_DEF Keros_pds_pric Keros_tot_Rs_DEF ///
	Keros_tot_Rs Electricity_Rs_DEF Electricity_Rs Firewood_Rs_DEF Firewood_Rs ///
	Dung_rs_DEF Dung_rs HH_cropresidue_Rs_DEF HH_cropresidue_Rs Keros_Rs_DEF ///
	Keros_Rs LPG_Rs_DEF LPG_Rs HH_coal_charc_Rs_DEF HH_coal_charc_Rs ///
	HH_annual_income_DEF HH_annual_income
*******************************************************************************************************************************************


**************************************Fuel Index Creation***********************************************************************************
********************************************************************************************************************************************

	br Keros_tot_Rs Electricity_Fuel_cost HH_firewood_use HH_firewood_source ///
	Firewood_Rs HH_dung_use HH_dung_source Dung_rs HH_cropresidue_use HH_cropresidue_source ///
	HH_cropresidue_Rs HH_keros_use HH_keros_source Keros_Rs HH_LPG_Purpose HH_LPG_source LPG_Rs ///
	HH_coal_charc_use HH_coal_charc_source HH_coal_charc_Rs Dist_to_fuel HH_collects_fuel

**MH INCOME
	gen MHInc= HH_annual_income_DEF/12

**Fuel Cost
	egen Fuel_cost= rowtotal(Keros_tot_Rs_DEF Electricity_Rs_DEF Firewood_Rs_DEF Dung_rs_DEF HH_cropresidue_Rs_DEF LPG_Rs_DEF HH_coal_charc_Rs_DEF)
*quantile Fuel_cost
	summarize Fuel_cost, detail

**FPOV 1
	gen FPOV1= Fuel_cost/ MHInc

**10% of Income
	gen Ten_percent_Income= 0.1* MHInc

**FPOV 2
	gen FPOV2= 1 if Fuel_cost>= Ten_percent_Income
	replace FPOV2=0 if Fuel_cost< Ten_percent_Income

**FPOV3
	gen FPOV3=1 if HH_electricity==0 & HH_keros_use==1 & HH_LPG_Purpose ==1 & HH_coal_charc_use==1
	replace FPOV3=0 if HH_electricity > 0 | HH_keros_use>1 | HH_LPG_Purpose >1 | HH_coal_charc_use > 1
	replace FPOV3=.  if HH_electricity ==. & HH_keros_use==. & HH_LPG_Purpose ==. & HH_coal_charc_use ==.  & FPOV3==0
	
**FPOV4 index
	gen di_fpov4= (0.5* FPOV2 ) + (0.5*FPOV3 )

**FPOV4 
	gen FPOV4 = 0 if FPOV2==0 & FPOV3==0
	replace FPOV4=1 if FPOV2 > 0 | FPOV3 > 0

**FPOV5 
	gen FPOV5=1 if HH_electricity==0 & HH_LPG_Purpose ==1
	replace FPOV5=0 if HH_electricity > 0 | HH_LPG_Purpose >1
	replace FPOV5=. if HH_electricity ==. & HH_LPG_use==.

		
	label variable FPOV5 "FPOV5"
	label variable FPOV4 "FPOV4"
	label variable FPOV3 "FPOV3"
	label variable FPOV2 "FPOV2"
	label variable FPOV1 "FPOV1"
	

	
**Fuel Poverty Indicators Tabulation
	global Tabs FPOV2 FPOV3 FPOV4 FPOV5

	foreach var in $Tabs{
	tabout `var' if SURVEY==1 [iw= FWT2005 ] ///
	using "E:\Energy Poverty\Misc Docs\Stata auto output\ FPOV survey 1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}


	foreach var in $Tabs{
	tabout `var' if SURVEY==2 [iw= FWT2012 ] ///
	using "E:\Energy Poverty\Misc Docs\Stata auto output\ FPOV survey 1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}
**********************************************************************************************************************************************



duplicates tag HHBASE2 , gen(dupl)
tab dupl
br if dupl==0

***Outlier in HH Income
HHBASE2
10904100801





*******CEM attempt1
cem Religion Caste HH_Income_Quin HH_size Urban ///
HH_assets_Quin STATEID if SURVEY==1, treatment (FPOV2)
**SUCCESS
*****************************************************************************************************************************************************


**************************************HH Development Index Creation***********************************************************************************
******************************************************************************************************************************************************

***********Education Index***********************************
**Max PG education = 17 yrs
**Min = 0yrs
	
gen HH_max_male_edu_new= HH_max_male_edu
gen HH_max_female_edu_new= HH_max_female_edu
replace HH_max_male_edu_new=1 if HH_max_male_edu_new==0
replace HH_max_female_edu_new=1 if HH_max_female_edu_new==0

**Male edu weight 1/3
gen male_edu_score= HH_max_male_edu_new *(1/3)
**Female edu weight 2/3
gen female_edu_score= HH_max_female_edu_new *(2/3)
**Education score of HH
egen Edu_score=rowtotal( male_edu_score female_edu_score )
**replacing 0 with lowest edu score of 0.3333333
replace Edu_score=0.3333333 if Edu_score==0
summarize Edu_score,detail

**HH Education Index	
gen HH_Edu_INDEX= (Edu_score-0)/ (17-0)	
summarize Edu_score,detail	
	
	
	
	
************************************************************************

***********************Exposure to mass media***************************

**Merging to bring in necessary variables
	merge 1:1 HHBASE2 SURVEY using "E:\Energy Poverty\Household - Origin.dta", keepusing(MM1M MM2M MM3M MM1W MM2W MM3W MM1C MM2C MM3C)
	drop _merge

**Generating exposure score
	egen Men_massmedia_Score= rowtotal(MM1M MM2M MM3M)
	egen Women_massmedia_Score= rowtotal(MM1W MM2W MM3W)
	egen Child_massmedia_Score= rowtotal(MM1C MM2C MM3C)
	egen HH_Massmedia_Score= rowtotal(Men_massmedia_Score Women_massmedia_Score Child_massmedia_Score)

**HH_Mass Media Index
*Men weight=1/5
*women weight =2/5
*child weight = 2/5	
**Generating Weighted Score
	gen HH_Media_Score=(Men_massmedia_Score*(1/5)) + (Women_massmedia_Score*(2/5)) + (Child_massmedia_Score*(2/5))

**Replacing zero value for lowest score of 0.2
	replace HH_Media_Score=0.2 if HH_Media_Score==0

****HH_Mass Media Index
	gen HH_Massmedia_Index = (HH_Media_Score - 0) / (9-0)

***************************************************************************************************************=


**************Assets Debt Income Cumulative Index************************
*****Assets based Index****************************************

**Merging to bring in necessary variables
	merge 1:1 HHBASE2 SURVEY using "E:\Energy Poverty\Household - Origin.dta", keepusing(ASSETS2005)
	drop _merge
*Assets Index
	gen HH_Assets_Index = (ASSETS2005-0)/(30-0)
	replace HH_Assets_Index=0 if HH_Assets_Index==.
***********************************************************************

****HH Debt based Index**************************************

**Merging to bring in necessary variables
	merge 1:1 HHBASE2 SURVEY using "E:\Energy Poverty\Household - Origin.dta", keepusing(DB5)
	drop _merge

**Deflating 2005 Debts to 2012 Prices
	gen double HH_Debt= DB5/DEFLATOR if SURVEY==1
	replace HH_Debt = DB5 if SURVEY==2


**max value = 22,550,000 (after rounding off to nearest 10,000)
**min value = 0	
**Creating HH Debt Index
	gen HH_Debt_Index= 1-((HH_Debt - 0)/(22550000 - 0))
	replace HH_Debt_Index= 1 if HH_Debt_Index==.
*************************************************************************

******HH Income based Index**************************************
**Dropping Outlier income 
	drop if HHBASE2==10904100801

**Generating povertyy line 2012 as PL for both 2005 and 2012
	sort HHBASE2 SURVEY
	gen Pov_Line_Both_2012 = Pov_line_2012 if SURVEY==2
	replace Pov_Line_Both_2012 = Pov_Line_Both_2012[_n+1] if SURVEY==1

**Creating HH monthly income index
	gen HH_MInc_Index= (MHInc- Pov_Line_Both_2012) / (950000- Pov_Line_Both_2012)
*************************************************************************

**************Assets Debt Income Cumulative Index************************
	gen HH_ADI_Index=(HH_Debt_Index+ HH_Assets_Index+ HH_MInc_Index)/3
*************************************************************************

***********************Community Trust and Crime Index******************
***Community Trust Index************************************
**Merging to bring in necessary variables
	merge 1:1 HHBASE2 SURVEY using "E:\Energy Poverty\Household - Origin.dta", keepusing(TR1 TR3)
	drop _merge
**since we dropped one HH as Incoem outlier, merge wouldnt be perfect match so use:
	drop if HHBASE2==10904100801 
**Generating Community trust score
	egen Commun_Trust_Score = rowtotal(TR1 TR3)
**Generating Community trust Index	
	gen Commun_Trust_Index= (Commun_Trust_Score - 0)/(6-0)
***********************************************************************

*****Crime Index***********************************************	
**Merging to bring in necessary variables
	merge 1:1 HHBASE2 SURVEY using "E:\Energy Poverty\Household - Origin.dta", keepusing(LC1 LC2 LC3 LC4)
	drop _merge
**since we dropped one HH as Incoem outlier, merge wouldnt be perfect match so use:
	drop if HHBASE2==10904100801 	

**recoding LC4
	recode LC4 (1=0 "No") (2/3=1 "Yes"), gen(women_harassed)

**creating Crime Score
egen Crime_score= rowtotal(LC1 LC2 LC3 women_harassed)

**creating Crime Index
gen Crime_Index= 1 - ((Crime_score-0)/(4-0))


****Creating Community Trust and Crime Index*************************
	gen HH_Trust_Crime_Index=(Commun_Trust_Index + Crime_Index)/2

	
	
****Generating HH Development Index
	egen HH_dev_Index_rowprod= rprod(HH_Edu_INDEX HH_Massmedia_Index HH_ADI_Index HH_Trust_Crime_Index)

	gen HH_Dev_Index=HH_dev_Index_rowprod ^ (1/4)
	
**Labelling Indices
label variable HH_Dev_Index "Household Development Index (HHDI)"
label variable HH_Massmedia_Index "Household Exposure to Mass media Index (HHMI)"
label variable HH_Edu_INDEX "Household Adult Education Index (HHAEI)"
label variable HH_Trust_Crime_Index "Community Trust and Crime Index (CTCI)"
label variable HH_ADI_Index "Household Assets, Debts and Income Index (HHADI Index)"	
label variable HH_Dev_change_percent "Inter Temporal HHDI"

label variable HH_annual_income_DEF "HH Annual Income (in 2012 prices)"
label variable HH_Debt "HH Outstanding Debt (in 2012 prices)"


**Creating Percentage change in HDI HH
bysort HHBASE2: gen obsnum= _n
bysort HHBASE2: gen HH_Dev_change_percent= (HH_Dev_Index[2]- HH_Dev_Index[1])/ HH_Dev_Index[1]	
drop obsnum


****************************************************************************************************************************************************





************************************************Propensity Score Matching****************************************************************************


*******CEM FPOV5
cem Religion Caste HH_Income_Quin Urban_4cat ///
HH_assets_Quin Poor_2005 STATEID if SURVEY==1, treatment (FPOV5)

global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012


psmatch2 FPOV4 $Indeps if SURVEY==1 & cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1) 
pstest $Indeps,  both


*****CEM reg
	reg _HH_Dev_change_percent FPOV5 HH_size Edu_score HHCE_yr ib11.Income_sourcer if SURVEY==1 [iw= CEM_Sur_WT ]
	reg HH_Dev_Index FPOV5 HH_size Edu_score HHCE_yr ib11.Income_sourcer if SURVEY==1 [iw= CEM_Sur_WT ]

	
***************************Within PSM for Transition in FPOV5****************************************************************************
	bysort HHBASE2: gen FPOV5_trans=. if FPOV5[1]==0 & FPOV5[2]==0
	bysort HHBASE2: replace FPOV5_trans= . if FPOV5[1]==1 & FPOV5[2]==1
	bysort HHBASE2: replace FPOV5_trans= 1 if FPOV5[1]==0 & FPOV5[2]==1
	bysort HHBASE2: replace FPOV5_trans= 0 if FPOV5[1]==1 & FPOV5[2]==0

*******CEM FPOV5_trans
*cem Religion Caste HH_Income_Quin Urban_4cat ///
*HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & FPOV5_trans>=0, treatment (FPOV5_trans)

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 

**Without CEM
	psmatch2 FPOV5_trans $Indeps if SURVEY==1, outcome(HH_Dev_change_percent) neighbor(1) 
	pstest $Indeps,  both

**With CEM
	psmatch2 FPOV5_trans $Indeps if SURVEY==1 & cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1) 
	pstest $Indeps,  both


*****Regression based Causal Effects: Difference Estimator
**Without CEM
	reg HH_Dev_change_percent FPOV5_trans HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
	*reg HH_Dev_Index FPOV5_trans HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]

**With CEM
	reg HH_Dev_change_percent FPOV5_trans HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]
	*reg HH_Dev_Index FPOV5_trans HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]
	br HH_Dev_Index HH_Dev_change_percent

	
***Causal Inference with and without matching
reg HH_Dev_change_percent FPOV5 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
reg HH_Dev_change_percent FPOV5 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]

reg HH_Dev_change_percent FPOV4 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
reg HH_Dev_change_percent FPOV4 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]

reg HH_Dev_change_percent FPOV3 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
reg HH_Dev_change_percent FPOV3 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]

reg HH_Dev_change_percent FPOV2 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
reg HH_Dev_change_percent FPOV2 HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]






***************************Within PSM for Transition in FPOV5_Poor 2005 ****************************************************************************
	bysort HHBASE2: gen FPOV5_trans_poor=0 if FPOV5[1]==1 & SURVEY==1
	*bysort HHBASE2: replace FPOV5_trans= . if FPOV5[1]==1 & FPOV5[2]==1
	*bysort HHBASE2: replace FPOV5_trans= 1 if FPOV5[1]==0 & FPOV5[2]==1
	bysort HHBASE2: replace FPOV5_trans_poor=1 if FPOV5[1]==1 & FPOV5[2]==0
	replace FPOV5_trans_poor=. if FPOV5==.
	label variable FPOV5_trans_poor "FPOV5 Transition"
	
	label define FPOV_Trans_Poor 1 "Non Poor" 0 "Poor"
	label values FPOV5_trans_poor FPOV_Trans_Poor
	
	***Creating FPOV5_trans_poor_Verify to check who all shifted to only electricity, only LPG and both
bysort HHBASE2: gen FPOV5_trans_poor_Verify = .
bysort HHBASE2: replace FPOV5_trans_poor_Verify =1 if FPOV5_trans_poor==1 & HH_electricity[1]==0 & HH_electricity[2]==1
bysort HHBASE2: replace FPOV5_trans_poor_Verify =2 if FPOV5_trans_poor==1 & HH_LPG_use[1]==0 & HH_LPG_use[2]==1
bysort HHBASE2: replace FPOV5_trans_poor_Verify =3 if FPOV5_trans_poor==1 & HH_LPG_use[1]==0 & HH_LPG_use[2]==1 & HH_electricity[1]==0 & HH_electricity[2]==1
bysort HHBASE2: replace FPOV5_trans_poor_Verify =0 if FPOV5_trans_poor==0

**FPOV6 (HH which shifted to only Electricity)
bysort HHBASE2: gen FPOV6= 0 if FPOV5_trans_poor_Verify==0
bysort HHBASE2: replace FPOV6= 1 if FPOV5_trans_poor_Verify==1

label variable FPOV6 "FPOV6"

label values FPOV6 FPOV_Trans_Poor




*******CEM FPOV5_trans
cem Religion Caste HH_Income_Quin Urban_4cat ///
HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & FPOV5_trans_poor>=0, treatment (FPOV5_trans_poor)

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index

**Without CEM
	psmatch2 FPOV5_trans_poor $Indeps if SURVEY==1, outcome(HH_Dev_change_percent) neighbor(1) 
	pstest $Indeps,  both

**With CEM
	psmatch2 FPOV5_trans_poor $Indeps if SURVEY==1 & cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1) 
	pstest $Indeps,  both


*****Regression based Causal Effects: Difference Estimator
**Without CEM
	reg HH_Dev_change_percent FPOV5_trans_poor HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]
	*reg HH_Dev_Index FPOV5_trans_poor HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= FWT2005]

**With CEM
	reg HH_Dev_change_percent FPOV5_trans_poor HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]
	*reg HH_Dev_Index FPOV5_trans_poor HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw= CEM_Sur_WT ]
	br HH_Dev_Index HH_Dev_change_percent

	
*egen HH_KEY= concat(HHBASE2)
	
*merge 1:m HHBASE2 SURVEY using "E:\Energy Poverty\Individuals - Reduced.dta", keepusing(Sex)	
****************************************************************************************************************************************************


****************************************************IV REGRESS and PSM**************************************************************************************
**Creating Trans Poor Variable
	bysort HHBASE2: gen Trans_Poor=0 if Poor_either_2005_2012[1]==1 & Poor_either_2005_2012[2]==1
	bysort HHBASE2: replace Trans_Poor=1 if Poor_either_2005_2012[1]==1 & Poor_either_2005_2012[2]==0
	label variable Trans_Poor "Poverty Transition over Time"
**Creating Log of Clean Energy Prices
	egen clean_energy_price_DEF= rowtotal(Electricity_Rs_DEF LPG_Rs_DEF )
	gen Log_clean_energy_price= ln( clean_energy_price_DEF )

	
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Land_holding_max

*IVREGRESS
***No endogeneity in variables
	ivregress 2sls Trans_Poor $Indeps (FPOV5_trans_poor = Log_clean_energy_price Dist_to_fuel)
	estat endogenous
	
**Without CEM: PSM for Trans_poor
	psmatch2 FPOV5_trans_poor $Indeps if SURVEY==1, outcome(Trans_Poor) neighbor(1) 
	pstest $Indeps,  both

**With CEM: PSM for Trans_poor
**DO preserve manually, DON'T FORGET

	*keep if Trans_Poor !=.
	cem Religion Caste HH_Income_Quin Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1, treatment (FPOV5_trans_poor)
	psmatch2 FPOV5_trans_poor $Indeps if SURVEY==1 & cem_matched==1, outcome(Trans_Poor) neighbor(1) 
	pstest $Indeps,  both
**************************************************************************************************************************************************


*******CEM DID Treat effects FPOV's
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
cem Religion Caste HH_Income_Quin Urban_4cat ///
HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')


*****Regression based Causal Effects: Difference Estimator
	reg HH_Dev_change_percent `var' HH_size HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index if SURVEY==1 [iw=cem_weights]
	outreg2 using "E:\Energy Poverty\Writeups\ CEM DID on FPOV", word append title("Sample Average Treatment Effects of Fuel Poverty Indicators using Coarsened Exact Matching upon Inter Temporal HHDI") ct("`var'") label 
	}
***********************************************************************************************************************************************************


*******PSM Treat effects FPOV's
foreach var in FPOV2 FPOV3 FPOV5 FPOV5_trans_poor{
cem Religion Caste HH_Income_Quin Urban_4cat ///
HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index
	psmatch2 `var' $Indeps if SURVEY==1 & cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1)
}
***********************************************************************************************************************************************************

****teffects on FPOV's
teffects psmatch ( HH_Dev_change_percent ) (FPOV5 $Indeps, probit) if SURVEY==1 & cem_matched==1, atet nn(1)





