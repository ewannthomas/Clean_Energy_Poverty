
**IHDS1 HH Merging to Individuals
use "E:\Energy Poverty\Mother\IHDS 1 HH\ICPSR_22626\DS0002\22626-0002-Data.dta" 
isid STATEID DISTID PSUID HHID HHSPLITID
merge 1:m STATEID DISTID PSUID HHID HHSPLITID using"E:\Energy Poverty\Mother\IHDS 1 Individual\ICPSR_22626\DS0001\22626-0001-Data.dta"
drop _merge
save "E:\Energy Poverty\IHDS 1 Merged.dta", replace


use "E:\Energy Poverty\IHDS 1 Merged.dta"

