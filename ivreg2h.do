






global Indeps Religion Caste Urban_4cat HH_size HHCE_yr Income_sourcer HH_Massmedia_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_ADI_Index


global Indeps HH_Massmedia_Index HH_Edu_INDEX HH_Trust_Crime_Index HH_ADI_Index
	
ivreg2h HH_Dev_change_percent $Indeps (FPOV5_trans_poor = Fuel_cost clean_energy_price_DEF HH_assets_Quin HHCE_Quin) if SURVEY==1, z($Indeps) small gmm2s robust










****Iv regress
	global Indeps Religion Caste Urban_4cat HH_size Edu_score HHCE_yr Income_sourcer Land_holding_max
	ivreg2h Trans_Poor $Indeps (FPOV5_trans_poor = clean_energy_price_DEF Dist_to_fuel)
	*outreg2 using "E:\Energy Poverty\Writeups\ IV FPOV5_trans", word append title("2SLS using     External and Internal Instruments") ///
	*keep(FPOV5_trans_poor) addtext(Controls, YES) cttop(Second Stage) label 
	
	
	
	
	
	
	
	
	
	

 