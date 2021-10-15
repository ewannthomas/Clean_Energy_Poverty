
*Merging IHDS2 HH and Individual
use "E:\Energy Poverty\Mother\IHDS 2 HH\ICPSR_36151\DS0002\36151-0002-Data.dta", clear
isid STATEID DISTID PSUID HHID HHSPLITID
merge 1:m STATEID DISTID PSUID HHID HHSPLITID using "E:\Energy Poverty\Mother\IHDS 2 Individual\ICPSR_36151\DS0001\36151-0001-Data.dta"
drop _merge
save "E:\Energy Poverty\IHDS 2 Merged.dta", replace


use "E:\Energy Poverty\IHDS 2 Merged.dta"

	keep SURVEY - DISTRICT AP2 AP3 AP5 AP6 AP7 AP8 AP9 HS3M HS3Y ID11 ID13 GROUPS ID14 ID15 ID16 ID17 ID18A ///
	ID18C RC1B1 RC1B2 RC1D RC1E CO4A CO4B CO4C CO4D CO4E CO4X ///
	COTOTAL ASSETS ASSETS2005 OH8 SA2 SAKITCHEN SA2A FU1 FU1A FU1B ///
	FU1C FU3 FU7 FU7A FU7B FU8 FU8A FU8B FU9 FU9A FU9B FU10 FU10A FU10B FU11 FULPG FU11A FU11B ///
	FU12 FU12A FU12B FU13A RO3 RO4 RO5 RO6 RO7 POVLINE2012 POVLINE2005 ///
	DEFLATOR URBAN2011 URBAN4_2011 METRO METRO6 NPERSONS  INCOME INCOMEPC ED6 EDUC7 MM7Y MB5 MB6 MB9 MB10 HHEDUC HHEDUCM HHEDUCF

	
	
	**renaming variables
	rename ID11 Religion
	rename GROUPS Caste
	rename ID14 Income_sourcer
	rename ID15 Stay_yrs
	rename ID16 Origin_place
	rename ID17 Urban_origin
	rename ID18A HH_head_job
	rename ID18C HH_head_edu
	rename RC1B1 BPL_card
	rename RC1B2 APL_card
	rename RC1D Card_used
	rename RC1E Reason_not_used
	rename CO4A Keros_lts
	rename CO4B Keros_Purchased
	rename CO4C Keros_mkt_price
	rename CO4D Keros_PDS_lts
	rename CO4E Keros_pds_pric
	rename CO4X Keros_tot_Rs
	rename COTOTAL HHCE_yr
	rename ASSETS HH_assets_W2
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
	rename POVLINE2005 Pov_line_2005
	rename POVLINE2012 Pov_line_2012
	rename DEFLATOR DEFLATOR
	
	rename URBAN2011 Urban_2011
	rename URBAN4_2011 Urban_4cat_2011
	rename METRO Metro
	rename METRO6 Metro_name
	
	rename INCOME HH_annual_income
	rename INCOMEPC Per_capita_income
	rename NPERSONS HH_size

	 
	rename ED6 Edu_completed_yrs
	rename EDUC7 Edu_completed_7cat
	rename HHEDUC HH_max_edu
	rename HHEDUCM HH_max_male_edu
	rename HHEDUCF HH_max_female_edu

	rename RO3 Gender
	rename RO4 Relate_to_head
	rename RO5 Age
	rename RO6 Marital_stat
	rename RO7 Primary_Act
	rename MM7Y Use_Computer
******************************************************************************************************************************************************

**************************************Fuel Index Creation***********************************************************************************
********************************************************************************************************************************************
	
	**FPOV5 
	gen FPOV5=1 if HH_electricity==0 & HH_LPG_Purpose ==1
	replace FPOV5=0 if HH_electricity > 0 | HH_LPG_Purpose >1
******************************************************************************************************************************************************

******************************************************************************************************************************************************
********************************Creating BMI**********************************************************************************************************
gen AP5_m= AP5/100
gen BMI = AP8/ (AP5_m^2)
gen AP6_m= AP6/100
gen BMI_2 = AP9/ (AP6_m^2)
******************************************************************************************************************************************************
