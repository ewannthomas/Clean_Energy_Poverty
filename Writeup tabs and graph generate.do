
	use "E:\Energy Poverty\Household - Reduced.dta", clear

******Summary statistcis for Writeup
	foreach val in 1 2{
	estpost sum Fuel_cost FPOV1 HH_ADI_Index HH_Edu_INDEX HH_Massmedia_Index HH_Trust_Crime_Index HH_Dev_Index HH_Dev_change_percent if SURVEY==`val'
	esttab using "E:\Energy Poverty\Writeups\sum.rtf", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(0)) max(fmt(0)) count(fmt(0))") title("Summary Statistics") label noobs append
	}
	**
************************************************************************************************************************************************************

***Creating Frequency tabs
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{

tabout `var' if SURVEY==1 [iw=FWT2005] ///
	using "E:\Energy Poverty\Writeups\tab IHDS1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
}

foreach var in FPOV2 FPOV3 FPOV4 FPOV5{

tabout `var' if SURVEY==2 [iw=FWT2012] ///
	using "E:\Energy Poverty\Writeups\tab IHDS2.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
}
**

***recoding HH_max_edu for creating 4 categories of highest adult HH edu
recode HH_max_edu (0=0 "Not Literate") (1/5= 1 "Primary") (6/10= 2 "Secondary") (11/12 =3 "Higher Secondary") (13/15= 4 "Graduate"), gen(HH_Max_Edu)

foreach var in HH_Max_Edu{
	foreach m in FWT2005 FWT2012{

tabout `var' if SURVEY==1 [iw=`m'] ///
	using "E:\Energy Poverty\Writeups\edu IHDS1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}
}
*

***recoding fuel use variables for final tabulation

foreach var in HH_firewood_use HH_dung_use HH_cropresidue_use HH_keros_use HH_coal_charc_use{
recode `var' (1=1 "No") (2/5=2 "Yes"), gen(recode_`var')
}
**

foreach var in HH_firewood_use HH_dung_use HH_cropresidue_use HH_keros_use HH_coal_charc_use{

	foreach m in FWT2005 FWT2012{

tabout recode_`var' if SURVEY==1 [iw=`m'] ///
	using "E:\Energy Poverty\Writeups\fuel use recode IHDS1.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	}
}
************************************************************************************************************************************************************


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
****Iv regress
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Land_holding_max
	ivregress 2sls Trans_Poor $Indeps (FPOV5_trans_poor = clean_energy_price_DEF Dist_to_fuel), first	
	outreg2 using "E:\Energy Poverty\Writeups\ IV FPOV5_trans", word append title("2SLS using External and Internal Instruments") ///
	keep(FPOV5_trans_poor) addtext(Controls, YES) cttop(Second Stage) label 
***IV regress2 for first stage 
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Land_holding_max
	ivregress2 2sls Trans_Poor $Indeps (FPOV5_trans_poor = clean_energy_price_DEF Dist_to_fuel), first
	est restore first
	outreg2 using "E:\Energy Poverty\Writeups\ IV FPOV5_trans", word append title("2SLS using External and Internal Instruments") ///
	keep(clean_energy_price_DEF Dist_to_fuel) cttop(First Stage) addtext(Internal Instruments, YES) label 
***FPOV5_ytrans_poor first stage
*logit FPOV5_trans_poor $Indeps Log_clean_energy_price Dist_to_fuel
***********************************************************************************************************************************************************





*********************************************************************Teffects psmatch**************************************************************************************
****teffects on FPOV's

	foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
	cem Religion Caste HH_Income_Quin Urban_4cat ///
	HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	HH_ADI_Index HH_Trust_Crime_Index HH_Edu_INDEX HH_Massmedia_Index

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & cem_matched==1, atet nn(1)
	outreg2 using "E:\Energy Poverty\Writeups\ teffects psmatch", word ///
	title("ATT of Fuel Poverty Indicators using Nearest Neighbour Propensity Score Matching upon Inter Temporal HHDI") ct("`ATT'") label append
}
******************************************************************************************************************************************************************************


*********************************************************************Teffects psmatch**************************************************************************************
****teffects on FPOV's

	foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
	cem Religion Caste HH_Income_Quin Urban_4cat ///
	HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & cem_matched==1, atet nn(1)
	outreg2 using "E:\Energy Poverty\Writeups\ teffects new psmatch", word ///
	title("ATT of Fuel Poverty Indicators using Nearest Neighbour Propensity Score Matching upon Inter Temporal HHDI") ct("ATT") label append
}
**********************************************************************Teffects psmatch**************************************************************************************


label define Fuel_Poverty 1"Poor" 0 "Non-Poor"
label values FPOV2 FPOV3 FPOV4 FPOV5 Fuel_Poverty




***********************************************************************************************************************************************************
***T Test tab export
	label variable clean_energy_price_DEF "Clean Energy Prices (in 2012 prices)"

*for IHDS 1
	foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
	cem Religion Caste HH_Income_Quin Urban_4cat ///
	HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')

		global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012
		quietly teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & cem_matched==1, atet nn(1)
		
	estpost ttest HH_max_male_edu_new HH_max_female_edu_new clean_energy_price_DEF  ///
	Fuel_cost  HH_annual_income_DEF HH_Debt HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") replace label
	
	
*for IHDS 2
	foreach var in FPOV2 FPOV3 FPOV4 FPOV5{
	cem Religion Caste HH_Income_Quin Urban_4cat ///
	HH_assets_Quin Poor_2005 STATEID if SURVEY==2 & `var' != ., treatment (`var')

		global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012
		quietly teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==2 & cem_matched==1, atet nn(1)
		
	estpost ttest HH_max_male_edu_new HH_max_female_edu_new clean_energy_price_DEF  ///
	Fuel_cost  HH_annual_income_DEF HH_Debt HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 using "E:\Energy Poverty\Writeups\ttest.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2012") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label
***********************************************************************************************************************************************************



***********************************************************************************************************************************************************
****Summary Statistics for Variables
*for IHDS 1
estpost sum HH_max_male_edu_new HH_max_female_edu_new clean_energy_price_DEF  ///
Fuel_cost  HH_annual_income_DEF HH_Debt HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
HH_Dev_Index if SURVEY==1, detail

esttab  using "E:\Energy Poverty\Writeups\Summary.rtf", ///
cells("mean(label(Mean)fmt(%14.3f)) sd(label(Standard Deviation)fmt(%14.3f)) p50(label(Median)fmt(%14.3f)) skewness(label(Skewness)fmt(%14.3f)) kurtosis(label(Kurtosis)fmt(%14.3f)) min(label(Minimum)fmt(%14.3f)) max(label(Maximum)fmt(%14.3f))") ///
title("Sample Summary Statistics of Variables in 2005") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
nonumber nomtitle wide replace label
*for IHDS 2
estpost sum HH_max_male_edu_new HH_max_female_edu_new clean_energy_price_DEF  ///
Fuel_cost  HH_annual_income_DEF HH_Debt HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
HH_Dev_Index if SURVEY==2, detail

esttab  using "E:\Energy Poverty\Writeups\Summary.rtf", ///
cells("mean(label(Mean)fmt(%14.3f)) sd(label(Standard Deviation)fmt(%14.3f)) p50(label(Median)fmt(%14.3f)) skewness(label(Skewness)fmt(%14.3f)) kurtosis(label(Kurtosis)fmt(%14.3f)) min(label(Minimum)fmt(%14.3f)) max(label(Maximum)fmt(%14.3f))") ///
title("Sample Summary Statistics of Variables in 2012") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
nonumber nomtitle wide append label
***********************************************************************************************************************************************************



***********************************************************************************************************************************************************
**creating percentiles of Indices
foreach var in HH_annual_income_DEF Fuel_cost HH_ADI_Index HH_Edu_INDEX HH_Massmedia_Index HH_Trust_Crime_Index HH_Dev_Index{
egen q_`var' = cut(`var') if SURVEY==1, group(10) label
}
**


***Running CEM + PSM on percentiles for T Test
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
cem q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index ///
Religion Caste Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var'!=., treatment (`var')

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size ib11.Income_sourcer Poor_either_2005_2012 ///
	q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index 
	quietly teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if cem_matched==1, atet nn(1)
	
	estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest cem&psm.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005") coeflabel( Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label

	
***Running CEM on percentiles for T Test
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
cem q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index ///
Religion Caste Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	estpost ttest Fuel_cost HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if cem_matched==1, by(`var') w
	est store `var'
}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest cem.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005") coeflabel( Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label

***********************************************************************************************************************************************************


***iteration 1 FAILED

***Running CEM + PSM on percentiles for T Test
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
cem q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index ///
Religion Caste Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var'!=., treatment (`var')

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size ib11.Income_sourcer Poor_either_2005_2012 ///
	q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index 
	quietly teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if cem_matched==1, atet nn(1)
	
	estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest cem&psm.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005") coeflabel( Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label



***iteration 2 FAILED
***Running CEM + PSM on percentiles for T Test
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
cem q_HH_annual_income_DEF q_Fuel_cost q_HH_Dev_Index Religion Caste Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var'!=., treatment (`var')

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size ib11.Income_sourcer Poor_either_2005_2012 ///
	q_HH_annual_income_DEF q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index 
	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if cem_matched==1, atet nn(1)
	
	estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
**

***iteration 3 FAILED
***Running CEM + PSM on percentiles for T Test
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{

	cem Religion Caste HH_Income_Quin Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size ib11.Income_sourcer Poor_either_2005_2012 ///
	i.q_Fuel_cost i.q_HH_ADI_Index i.q_HH_Edu_INDEX i.q_HH_Massmedia_Index i.q_HH_Trust_Crime_Index i.q_HH_Dev_Index
	
	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if cem_matched==1, atet nn(1)
	outreg2 using "E:\Energy Poverty\Writeups\ teffects Updated psmatch", word ///
	title("ATT of Fuel Poverty Indicators using Nearest Neighbour Propensity Score Matching upon Inter Temporal HHDI") ct("ATT") label append

	estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if e(sample), by(`var') w
	est store `var'
}
**
	esttab FPOV2 FPOV3 FPOV4 FPOV5 using "E:\Energy Poverty\Writeups\ttest.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2012") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5") eqlabels(,lhs("Varibales"))addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label
***********************************************************************************************************************************************************



***********************************************************Matched sample Indicators Generation (OLD Model)**********************************************************************************************************************
**Need not do CEM and PSM if for given covariates of old model
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
	cem Religion Caste HH_Income_Quin Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & cem_matched==1, atet nn(1) gen(`var'_match)
	predict `var'_PS_control `var'_PS_treat, ps
	
	psmatch2 `var' $Indeps if SURVEY==1 & cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1)
	
	rename cem_matched `var'_cem_matched
	rename _weight `var'_psm_weight
	drop cem_strata cem_weights `var'_match* `var'_PS_control _pscore _treated _support _HH_Dev_change_percent _id _n1 _nn _pdif
	
	}
	**

***T Test for PScore above 25%, 50% and 75%
	foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.25 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest 0.25.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.25 Propensity Score") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition") addnotes("Mean Difference = Mean of Control - Mean of Treatment") replace label

	

foreach var in FPOV2 FPOV4 FPOV5 FPOV5_trans_poor{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.5 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}	
	esttab FPOV2 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest 0.5.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.5 Propensity Score") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV4" "FPOV5" "FPOV5 Transition") addnotes("Mean Difference = Mean of Control - Mean of Treatment" "No Observations for FPOV3 at 0.5 Propensity Score") replace label


foreach var in FPOV2 FPOV4 FPOV5 FPOV5_trans_poor{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.75 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}
	esttab FPOV2 FPOV4 FPOV5 FPOV5_trans_poor using "E:\Energy Poverty\Writeups\ttest 0.75.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.75 Propensity Score") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV4" "FPOV5" "FPOV5 Transition") addnotes("Mean Difference = Mean of Control - Mean of Treatment" "No Observations for FPOV3 at 0.75 Propensity Score") replace label
***********************************************************************************************************************************************************


***********************************************************Matched sample Indicators Generation (NEW Model)**********************************************************************************************************************
**Need not do CEM and PSM if for given covariates of new model (Without Quantiles of HH Annual Income DEF)

drop FPOV2_PS_treat FPOV2_psm_weight FPOV3_PS_treat FPOV3_psm_weight FPOV4_PS_treat FPOV4_psm_weight FPOV5_PS_treat FPOV5_psm_weight FPOV5_trans_poor_PS_treat FPOV5_trans_poor_psm_weight

foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & `var'_cem_matched==1, atet nn(1) gen(`var'_match)
	predict `var'_PS_control `var'_PS_treat, ps
	
	psmatch2 `var' $Indeps if SURVEY==1 & `var'_cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1)
	
	rename _weight `var'_psm_weight
	drop `var'_match* `var'_PS_control _pscore _treated _support _HH_Dev_change_percent _id _n1 _nn _pdif
	
	}
	**
**T test of 2005 unmatched sample

foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{	
	estpost ttest Fuel_cost HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if SURVEY==1, by(`var') w
	est store `var'
}
*
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\ttest new model.rtf", ///
	title("T test of Overall Sample Mean Differences by Fuel Poverty in 2005 (Before Matching)") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") addnotes("Mean Difference = Mean of Control - Mean of Treatment") replace label

***T Test matched Overall new model
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{	
	estpost ttest Fuel_cost HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
	HH_Dev_Index if `var'_psm_weight != ., by(`var') w
	est store `var'
}
*
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\ttest new model.rtf", ///
	title("T test of Overall Sample Mean Differences by Fuel Poverty in 2005 (After Matching)") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label

	
***T Test for PScore above 25%, 50% and 75%
	foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.25 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\ttest new model.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.25 Propensity Score and above") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") addnotes("Mean Difference = Mean of Control - Mean of Treatment") append label

	

foreach var in FPOV2 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.5 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}	
	esttab FPOV2 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\ttest new model.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.5 Propensity Score and above") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") addnotes("Mean Difference = Mean of Control - Mean of Treatment" "No Observations for FPOV3 at 0.5 Propensity Score") append label


foreach var in FPOV2 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
		estpost ttest Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_PS_treat >=0.75 & `var'_psm_weight !=. , by(`var') w
		est store `var'
	}
	esttab FPOV2 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\ttest new model.rtf", ///
	title("T test of Sample Mean Differences by Fuel Poverty in 2005 at 0.75 Propensity Score and above") coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") addnotes("Mean Difference = Mean of Control - Mean of Treatment" "No Observations for FPOV3 at 0.75 Propensity Score") append label

***********************************************************************************************************************************************************

***ATT of New Model
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor{

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & `var'_cem_matched==1, atet nn(1)
	outreg2 using "E:\Energy Poverty\Writeups\ teffects new model controlling for  Quantiles of HH Indices", word ///
	title("ATT of Fuel Poverty Indicators using Nearest Neighbour Propensity Score Matching upon Inter Temporal HHDI") ct("ATT") label append
}
***






***********************************************************Correlation of FPOV Indicators**********************************************************************************************************************
**Correlation of FPOV's in 2005
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
		estpost corr `var' Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if SURVEY==1, list
		est store `var'
	}	
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\FPOV correlation.rtf", ///
	title("Correlation Between Fuel Poverty and Household Development Indices in 2005 (Without Matching)") ///
	coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") replace label

	
**Correlation of FPOV's in 2012
foreach var in FPOV2 FPOV3 FPOV4 FPOV5{
		estpost corr `var' Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if SURVEY==2, list
		est store `var'
	}	
	esttab FPOV2 FPOV3 FPOV4 FPOV5 using "E:\Energy Poverty\Writeups\FPOV correlation.rtf", ///
	title("Correlation Between Fuel Poverty and Household Development Indices in 2012 (Without Matching)") ///
	coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5") append label

	
**Correlation of FPOV's After Matching	
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
		estpost corr `var' Fuel_cost  HH_annual_income_DEF HH_Edu_INDEX HH_ADI_Index HH_Massmedia_Index HH_Trust_Crime_Index ///
		HH_Dev_Index if `var'_psm_weight !=., list
		est store `var'
	}	
	esttab FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 using "E:\Energy Poverty\Writeups\FPOV correlation.rtf", ///
	title("Correlation Between Fuel Poverty and Household Development Indices in 2005 (After Matching)") ///
	coeflabel(HH_max_male_edu_new "Maximum Education (Male member)" HH_max_female_edu_new "Maximum Education (Female member)" Fuel_cost "Total Fuel Cost (in 2012 prices)") ///
	mtitle("FPOV2" "FPOV3" "FPOV4" "FPOV5" "FPOV5 Transition" "FPOV6") append label
***********************************************************************************************************************************************************

*******************************************************************FPOV5 Trans Poor IV regression****************************************************************************************
***For Unmatched Sample
global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size HHCE_yr ib11.Income_sourcer HH_Massmedia_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_ADI_Index
	
	ivregress2 2sls HH_Dev_change_percent $Indeps (FPOV5_trans_poor = Fuel_cost clean_energy_price_DEF ///
	HH_assets_Quin HHCE_Quin ) if SURVEY==1, first
	est restore first
	outreg2 using "E:\Energy Poverty\Writeups\ FPOV5 Transition IV Regress with Inter temp dev index", word append title("2SLS using External and Internal Instruments for Unmatched Sample") ///
	keep(Fuel_cost clean_energy_price_DEF ) cttop(First Stage) addtext(Internal Instruments, YES) label 
	
	ivregress 2sls HH_Dev_change_percent $Indeps (FPOV5_trans_poor = Fuel_cost clean_energy_price_DEF ///
	HH_assets_Quin HHCE_Quin ) if SURVEY==1
	outreg2 using "E:\Energy Poverty\Writeups\ FPOV5 Transition IV Regress with Inter temp dev index", word append title("2SLS using External and Internal Instruments for Unmatched Sample") ///
	keep(FPOV5_trans_poor) addtext(Controls, YES) cttop(Second Stage) label 

	
	estat first
	estat endogenous

***For Matched Sample
global Indeps HH_Massmedia_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_ADI_Index

	ivregress2 2sls HH_Dev_change_percent $Indeps (FPOV5_trans_poor = Fuel_cost clean_energy_price_DEF ///
	HH_assets_Quin HHCE_Quin ) ///
	[fw=FPOV5_trans_poor_psm_weight], first
	est restore first
	outreg2 using "E:\Energy Poverty\Writeups\ FPOV5 Transition IV Regress with Inter temp dev index", word append title("2SLS using External and Internal Instruments for Matched Sample") ///
	keep(Fuel_cost clean_energy_price_DEF ) cttop(First Stage) addtext(Internal Instruments, YES) label 

	ivregress 2sls HH_Dev_change_percent $Indeps (FPOV5_trans_poor = Fuel_cost clean_energy_price_DEF ///
	HH_assets_Quin HHCE_Quin ) ///
	[fw=FPOV5_trans_poor_psm_weight]
	outreg2 using "E:\Energy Poverty\Writeups\ FPOV5 Transition IV Regress with Inter temp dev index", word append title("2SLS using External and Internal Instruments for Matched Sample") ///
	keep(FPOV5_trans_poor) addtext(Controls, Matched) cttop(Second Stage) label 


	estat first
	estat endogenous
	
	weak IV=  Edu_score   ib0.Urban_4cat HHCE_yr Poor_either_2005_2012
			Kitchen_separate Cook_place_vent Busi2_cooking_place female_edu_score
***********************************************************************************************************************************************************



***Corrections
**FPOV3
br HH_electricity HH_keros_use HH_LPG_Purpose HH_coal_charc_use FPOV3 if HH_electricity ==. & HH_keros_use==. & HH_LPG_Purpose ==. & HH_coal_charc_use ==.  & FPOV3==0
br HH_electricity HH_keros_use HH_LPG_Purpose HH_coal_charc_use FPOV3 if HH_electricity ==. & HH_keros_use==. & HH_LPG_Purpose ==. & HH_coal_charc_use ==.  & FPOV3==0 & SURVEY==1


**FPOV5
br HH_electricity HH_LPG_use FPOV5 if HH_electricity ==. & HH_LPG_use==.
br HH_electricity HH_LPG_use FPOV5 if HH_electricity ==. & HH_LPG_use==. & SURVEY==1



**FPOV5_trans_poor
br HHBASE2 SURVEY HH_electricity HH_LPG_use FPOV5 FPOV5_trans_poor FPOV5_Trans_Verify if FPOV5_Trans_Verify==0
***********************************************************************************************************************************************************



***********************************************************************************************************************************************************
***********************************************************Matched sample Indicators Generation (NEW Model)**********************************************************************************************************************
**Need not do CEM and PSM if for given covariates of new model (Without Quantiles of HH Annual Income DEF)

***CEM
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{
	cem Religion Caste HH_Income_Quin Urban_4cat HH_assets_Quin Poor_2005 STATEID if SURVEY==1 & `var' != ., treatment (`var')
	
	
	rename cem_matched `var'_cem_matched
	
	drop cem_strata cem_weights 
	
	}
	**
	
***PSM
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index

	teffects psmatch ( HH_Dev_change_percent ) (`var' $Indeps, probit) if SURVEY==1 & `var'_cem_matched==1, atet nn(1) gen(`var'_match)
	
	outreg2 using "E:\Energy Poverty\Writeups\ Teffects new model with q_ of HH Indices", word ///
	title("ATT of Fuel Poverty Indicators using Nearest Neighbour Propensity Score Matching upon Inter Temporal HHDI") ct("ATT") label append

	predict `var'_PS_control `var'_PS_treat, ps
	
	psmatch2 `var' $Indeps if SURVEY==1 & `var'_cem_matched==1, outcome(HH_Dev_change_percent) neighbor(1)
	
	rename _weight `var'_psm_weight
	drop `var'_match* `var'_PS_control _pscore _treated _support _HH_Dev_change_percent _id _n1 _nn _pdif
	
	}
***********************************************************************************************************************************************************




*** OLS for robustness check
foreach var in FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6{

	global Indeps ib8.Religion ib7.Caste ib0.Urban_4cat HH_size Edu_score HHCE_yr ib11.Income_sourcer Poor_either_2005_2012 ///
	q_Fuel_cost q_HH_ADI_Index q_HH_Edu_INDEX q_HH_Massmedia_Index q_HH_Trust_Crime_Index q_HH_Dev_Index i.STATEID

	reg HH_Dev_change_percent `var' $Indeps if SURVEY==1
	outreg2 using "E:\Energy Poverty\Writeups\ OLS with and without matching", word ///
	title("Regression Fuel Poverty Indicators upon Inter Temporal HHDI") ct("OLS") ///
	addtext(Controls, YES) keep(`var') label append

	*reg HH_Dev_change_percent `var' $Indeps if SURVEY==1 & `var'_cem_matched==1
	*outreg2 using "E:\Energy Poverty\Writeups\ OLS with and without matching", word ///
	*title("Regression Fuel Poverty Indicators upon Inter Temporal HHDI") ct("Matched") ///
	*addtext(Controls, YES) keep(`var') label append

}
**


***********************************************************************************************************************************************************
















