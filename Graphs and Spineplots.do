
		use "E:\Energy Poverty\Household - Reduced.dta", clear

	

**Graph by Survey
	graph pie HH_ADI_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_Massmedia_Index, by(SURVEY) plabel(4 per) plabel(1 per) plabel(2 per) plabel(3 per) ///
	legend(label(1 "HHADI" ) label(2 "HHAEI")  label(3 "CTCI" ) label(4 "HHMI") position(6) ring(0) rows(2)) xsize (6)

**Graph by caste
	graph pie HH_ADI_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_Massmedia_Index, by(SURVEY) plabel(4 per) plabel(1 per) plabel(2 per) plabel(3 per) ///
	legend(label(1 "HHADI" ) label(2 "HHAEI")  label(3 "CTCI" ) label(4 "HHMI") position(6) ring(0) rows(2)) xsize (6)

	graph pie HH_ADI_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_Massmedia_Index if SURVEY==1, by( Caste  ) plabel(4 per) plabel(1 per) plabel(2 per) plabel(3 per) ///
	legend(label(1 "HHADI" ) label(2 "HHAEI")  label(3 "CTCI" ) label(4 "HHMI") position(6) ring(0) rows(2)) xsize (6)
*************************************************************





*********************************************************Spineplots by Caste**********************************************************************************

**Spineplot of FPOV2 by CASTE
	spineplot FPOV2 Caste if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by Caste in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(4000"Forward" 16000"OBC" 25000"Dalits" 32000"Adivasi" 36500"Muslims" 40000"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")
	
**Spineplot of FPOV3 by CASTE (dont draw, graph is not nice)
	spineplot FPOV3 Caste if SURVEY==1, xsize(7) ///
	bar1(color(cyan)) bar2(color(sienna)) perc ///
	title("FPOV3 by Caste in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(4000"Forward" 16000"OBC" 25000"Dalits" 32000"Adivasi" 36500"Muslims" 40000"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")
	
**Spineplot of FPOV4 by CASTE
	spineplot FPOV4 Caste if SURVEY==2, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by Caste in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(4000"Forward" 16000"OBC" 25000"Dalits" 32000"Adivasi" 36500"Muslims" 40000"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")
	
**Spineplot of FPOV5 by CASTE
	spineplot FPOV5 Caste if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by Caste", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(5000"Forward" 15000"OBC" 26000"Dalits" 32000"Adivasi" 36200"Muslims" 40017"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")
	
**Spineplot of FPOV5 Transition by CASTE
	spineplot FPOV5_trans_poor Caste if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(midgreen)) perc ///
	title("FPOV5 Transition by Caste", size(medium)) ///
	ytitle("Percentage of FPOV5 Transition Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(400"Forward" 2500"OBC" 5000"Dalits" 6500"Adivasi" 7800"Muslims" 8520"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")
	
**Spineplot of FPOV6 by CASTE
	spineplot FPOV5_trans_poor Caste if SURVEY==1, xsize(7) ///
	bar1(color(sienna)) bar2(color(navy)) perc ///
	title("FPOV6 by Caste", size(medium)) ///
	ytitle("Percentage of FPOV6 Households", axis(2)) ///
	xtitle("Caste", axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(400"Forward" 2500"OBC" 5000"Dalits" 6500"Adivasi" 7800"Muslims" 8520"Others", labsize(small) angle(0) axis(2)) ///
	legend( pos(3)) ///
	note("Others includes Christians, Sikhs & Jains")

*****************************************************************************************************************************************************************************************






*********************************************************Spineplots by Quantile of HH Annual Income DEF**********************************************************************************

*creating quantiles for IHDS 2 (original quantiles has been created only for IHDS 1) (Erase after done)
foreach var in HH_annual_income_DEF Fuel_cost HH_ADI_Index HH_Edu_INDEX HH_Massmedia_Index HH_Trust_Crime_Index HH_Dev_Index{
egen q2_`var' = cut(`var') if SURVEY==2, group(10) label
}
**

**Spineplot of FPOV2 by Quantile of HH Annual Income DEF in 2005
	spineplot FPOV2 q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Annual Income Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")
**Spineplot of FPOV2 by Quantile of HH Annual Income DEF in  2012 
	spineplot FPOV2 q2_HH_annual_income_DEF if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Annual Income Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")


**Spineplot of FPOV3 by Quantile of HH Annual Income DEF in 2005 (Dont draw)
	spineplot FPOV3 q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(cyan)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Annual Income Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")
**Spineplot of FPOV3 by Quantile of HH Annual Income DEF in  2012  (Dont draw)
	spineplot FPOV3 q2_HH_annual_income_DEF if SURVEY==2, xsize(7) ///
	bar1(color(cyan)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Annual Income Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")


**Spineplot of FPOV4 by Quantile of HH Annual Income DEF in 2005
	spineplot FPOV4 q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Annual Income Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")
**Spineplot of FPOV4 by Quantile of HH Annual Income DEF in  2012 
	spineplot FPOV4 q2_HH_annual_income_DEF if SURVEY==2, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Annual Income Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")
	
	

**Spineplot of FPOV5 by Quantile of HH Annual Income DEF in 2005
	spineplot FPOV5 q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Annual Income Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")
**Spineplot of FPOV5 by Quantile of HH Annual Income DEF in  2012 
	spineplot FPOV5 q2_HH_annual_income_DEF if SURVEY==2, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Annual Income Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")

	
**Spineplot of FPOV5_trans_poor by Quantile of HH Annual Income DEF (trans poor only has 2005)
	spineplot FPOV5_trans_poor q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(midgreen)) perc ///
	title("FPOV5 Transition by HH Annual Income Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV5 Transition Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(750"1" 2500"2" 3800"3" 5000"4" 6100"5" 7000"6" 7600"7" 8100"8" 8400"9" 8600"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")

	
**Spineplot of FPOV6 by Quantile of HH Annual Income DEF (FPOV6 only has 2005)
	spineplot FPOV6 q_HH_annual_income_DEF if SURVEY==1, xsize(7) ///
	bar1(color(sienna)) bar2(color(navy)) perc ///
	title("FPOV6 by HH Annual Income Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV6 Households", size(medium) axis(2)) ///
	xtitle("HH Annual Income Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(750"1" 2500"2" 3800"3" 4800"4" 5700"5" 6500"6" 7100"7" 7500"8" 7700"9" 7900"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Annual Income in 2012 prices" "First quantile also includes negative income values")


	
*****************************************************************************************************************************************************************************************






*********************************************************Spineplots by Quantile of HH Development Index**********************************************************************************

**Spineplot of FPOV2 by Quantile of HH Development Index in 2005
	spineplot FPOV2 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Development Index Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV2 by Quantile of HH Development Index in 2012
	spineplot FPOV2 q2_HH_Dev_Index if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Development Index Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
	
	
**Spineplot of FPOV3 by Quantile of HH Development Index in 2005
	spineplot FPOV3 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Development Index Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV3 by Quantile of HH Development Index in 2012
	spineplot FPOV3 q2_HH_Dev_Index if SURVEY==2, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Development Index Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
	
	

**Spineplot of FPOV4 by Quantile of HH Development Index in 2005
	spineplot FPOV4 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Development Index Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV4 by Quantile of HH Development Index in 2012
	spineplot FPOV4 q2_HH_Dev_Index if SURVEY==2, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Development Index Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
		
	

**Spineplot of FPOV5 by Quantile of HH Development Index in 2005
	spineplot FPOV5 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Development Index Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV5 by Quantile of HH Development Index in 2012
	spineplot FPOV5 q2_HH_Dev_Index if SURVEY==2, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Development Index Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
	
**Spineplot of FPOV5_trans_poor by Quantile of HH Development Index (FPOV6 only has 2005)
	spineplot FPOV5_trans_poor q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(midgreen)) perc ///
	title("FPOV5 Transition by HH Development Index Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV5 Transition Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(750"1" 2800"2" 4500"3" 5700"4" 6800"5" 7600"6" 8100"7" ///
	8350"8" 8500"9" 8650"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
	
**Spineplot of FPOV6 by Quantile of HH Development Index (FPOV6 only has 2005)
	spineplot FPOV6 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(sienna)) bar2(color(navy)) perc ///
	title("FPOV6 by HH Development Index Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV6 Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(750"1" 2700"2" 4100"3" 5400"4" 6500"5" 7100"6" 7500"7" 7700"8" 7850"9" 8000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))

	
*****************************************************************************************************************************************************************************************






*********************************************************Spineplots by Region**********************************************************************************

**Spineplot of FPOV2 by Region in 2005
	spineplot FPOV2 Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by Region in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV2 by Region in 2012
	spineplot FPOV2 Urban_4cat if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by Region in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) 

	
**Spineplot of FPOV3 by Region in 2005
	spineplot FPOV3 Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by Region in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV3 by Region in 2012
	spineplot FPOV3 Urban_4cat if SURVEY==2, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by Region in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) 
	

**Spineplot of FPOV4 by Region in 2005
	spineplot FPOV4 Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by Region in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV4 by Region in 2012
	spineplot FPOV4 Urban_4cat if SURVEY==2, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by Region in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) 

	
**Spineplot of FPOV5 by Region in 2005
	spineplot FPOV5 Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by Region in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
**Spineplot of FPOV5 by Region in 2012
	spineplot FPOV5 Urban_4cat if SURVEY==2, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by Region in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1600"Metro_Urban" 8000"Other_Urban" 18000"More_Developed_Village" 35000"Less_Developed_Village", labsize(vsmall) angle(0) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) 
	
**Spineplot of FPOV5_trans_poor by Region in 2005
	spineplot FPOV5_trans_poor Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(midgreen)) perc ///
	title("FPOV5 Transition by Region", size(medium)) ///
	ytitle("Percentage of FPOV5 Transition Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(30"Metro_Urban" 500"Other_Urban" 2000"More_Developed_Village" 5000"Less_Developed_Village", ///
	labsize(vsmall) angle(-25) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))

**Spineplot of FPOV6 by Region in 2005
	spineplot FPOV6 Urban_4cat if SURVEY==1, xsize(7) ///
	bar1(color(sienna)) bar2(color(navy)) perc ///
	title("FPOV6 by Region", size(medium)) ///
	ytitle("Percentage of FPOV6 Households", size(medium) axis(2)) ///
	xtitle("Region Categories", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(30"Metro_Urban" 500"Other_Urban" 2000"More_Developed_Village" 5000"Less_Developed_Village", ///
	labsize(vsmall) angle(-25) axis(2)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3))
	
*****************************************************************************************************************************************************************************************






*********************************************************Spineplots by HH Total Fuel Cost Quantiles**********************************************************************************

**Spineplot of FPOV2 by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV2 q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Total Fuel Cost Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
**Spineplot of FPOV2 by HH Total Fuel Cost Quantiles in 2012
	spineplot FPOV2 q2_Fuel_cost if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Total Fuel Cost Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")

	
	
**Spineplot of FPOV3 by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV3 q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Total Fuel Cost Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
**Spineplot of FPOV3 by HH Total Fuel Cost Quantiles in 2012
	spineplot FPOV3 q2_Fuel_cost if SURVEY==2, xsize(7) ///
	bar1(color(navy)) bar2(color(sienna)) perc ///
	title("FPOV3 by HH Total Fuel Cost Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
	
	
**Spineplot of FPOV4 by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV4 q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Total Fuel Cost Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
**Spineplot of FPOV4 by HH Total Fuel Cost Quantiles in 2012
	spineplot FPOV4 q2_Fuel_cost if SURVEY==2, xsize(7) ///
	bar1(color(edkblue)) bar2(color(forest_green)) perc ///
	title("FPOV4 by HH Total Fuel Cost Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")

	
**Spineplot of FPOV5 by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV5 q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Total Fuel Cost Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
**Spineplot of FPOV5 by HH Total Fuel Cost Quantiles in 2012
	spineplot FPOV5 q2_Fuel_cost if SURVEY==2, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	title("FPOV5 by HH Total Fuel Cost Quantiles in 2012", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(1500"1" 6000"2" 10000"3" 14000"4" 18000"5" 22000"6" 26000"7" 30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")
	
**Spineplot of FPOV5_trans_poor by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV5_trans_poor q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(midgreen)) perc ///
	title("FPOV5 Transition by HH Total Fuel Cost Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV5 Transition Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(950"1" 3500"2" 5500"3" 6700"4" 7400"5" 7900"6" 8200"7" ///
	8400"8" 8500"9" 8600"10", labsize(vsmall) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")

	
**Spineplot of FPOV6 by HH Total Fuel Cost Quantiles in 2005
	spineplot FPOV6 q_Fuel_cost if SURVEY==1, xsize(7) ///
	bar1(color(sienna)) bar2(color(navy)) perc ///
	title("FPOV6 by HH Total Fuel Cost Quantiles", size(medium)) ///
	ytitle("Percentage of FPOV6 Households", size(medium) axis(2)) ///
	xtitle("HH Total Fuel Cost Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(950"1" 3500"2" 5300"3" 6300"4" 6800"5" 7300"6" 7600"7" ///
	7700"8" 7800"9" 7900"10", labsize(vsmall) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) ///
	note("Household Total Fuel Cost in 2012 prices")

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	**Spineplot of FPOV5 by Religion (ignore)
	spineplot FPOV5 Religion if SURVEY==1, xsize(7) ///
	bar1(color(dkorange)) bar2(color(dknavy)) perc ///
	ytitle("Percentage of Fuel Poor Households", axis(2)) ///
	xtitle("Religion", axis(2)) xtitle("Population Percentage", axis(1)) legend( pos(6))
	xla(25000"Hindu" 33000"Muslim" 37000"Christian" 32000"Adivasi" 38000"Sikh", labsize(small) angle(0) axis(2)) ///
	 ///
	*note("Others includes Christians, Sikhs & Jains")


*****TRy catplot
STATEID Religion Income_sourcer 

	catplot Urban FPOV2 FPOV3 FPOV4 FPOV5 FPOV5_trans_poor FPOV6 if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	title("FPOV2 by HH Development Index Quantiles in 2005", size(medium)) ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1))
	
	
	
	
	**Spineplot of FPOV2 by Quantile of HH Development Index in 2005
	spineplot FPOV2 q_HH_Dev_Index if SURVEY==1, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	ytitle("Percentage of Fuel Poor Households", size(medium) axis(2)) ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2))  legend(off) ///
 saving("E:\Energy Poverty\Writeups\FPOV Graphs\a", replace) nodraw
	
**Spineplot of FPOV2 by Quantile of HH Development Index in 2012
	spineplot FPOV2 q2_HH_Dev_Index if SURVEY==2, xsize(7) ///
	bar1(color(teal)) bar2(color(orange_red)) perc ///
	xtitle("HH Development Index Quantiles", size(small) axis(2)) xtitle("Population Percentage", size(small) axis(1)) ///
	xla(2500"1" 6500"2" 10500"3" 14000"4" 18000"5" 22000"6" 26000"7" ///
	30000"8" 34000"9" 38000"10", labsize(small) angle(0) axis(2)) ///
	xla(,labsize(small) axis(1)) ///
	yla(,labsize(small) axis(2)) ///
	legend( pos(3)) saving("E:\Energy Poverty\Writeups\FPOV Graphs\b", replace) nodraw

	graph combine "E:\Energy Poverty\Writeups\FPOV Graphs\a.gph" "E:\Energy Poverty\Writeups\FPOV Graphs\b.gph", ycommon xcommon

	
	
***box plota

graph hbox  HH_Dev_Index, over(FPOV2) ///
title("FPOV2 over Region") ///
l1title("Region", size(small)) ///
over(Urban_4cat, relabel(1 "Metro Urban" 2"Other Urban" 3"More Developed Village" 4"Less Developed Village") label(labsize(small))) ///
by( SURVEY, label(1 "2005" 2 "2012") ) ///
note("Graphs by Year") ///
asyvars xsize(7)
