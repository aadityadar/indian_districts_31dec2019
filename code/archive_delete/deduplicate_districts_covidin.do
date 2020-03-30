* compare district names from lg directory and covid19india

* preliminaries 
clear all 
set rmsg on 
set more off 
if "`c(username)'" == "aadit" {
	global path = "C:/Users/aadit/Documents/GitHub/covid19-in/district_names"
}
else if "`c(username)'" == "USER" {
	global path = "C:/Users/`c(username)'/Indian School of Business/Aaditya Dar - prohibition"
}
else {
	display as error "Please specify root directory" ///
	"Your username is: `c(username)'" ///
	"Replace yourName with `c(username)'" 
	exit 
}

global path 

* read covid-in data 
import delim using "$path/districts_729.csv", clear varnames(1)

* rename
rename *, lower 
drop geometry* v* 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso_state
clonevar state = propertiesstname 
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"
drop state

* duplicates 
duplicates list propertiesstname propertiesdtname propertiesdt_code
duplicates drop

* sanity check 
isid iso_state propertiesdtname
distinct iso_state propertiesdtname, j 

* are the numeric state codes standard?
list propertiesstname propertiesst_code st_no if propertiesst_code != st_no

* what should the new code be? 
clonevar stc_new = propertiesst_code
replace stc_new = 28 if propertiesstname == "andhra pradesh"
replace stc_new = 37 if propertiesstname == "ladakh"

* sanity check 
assert stc_new == st_no

* save 
compress 
save "$path/districts_727not729_deduplicated_covidin.dta", replace

*************************************************
*** read lgdirectory data
*************************************************

* read lgd data 
import delim using "$path/lgdirectorygovin_districts_729_2020_03_26_01_50_14_830.csv", clear varnames(1) delim(";")

* rename
rename *, lower 
rename districtcode districtcode2020

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso_state
clonevar state = statenameinenglish  
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"
drop state

* sanity check 
destring districtcode2020, replace 
isid districtcode2020 

* save
compress
save "$path/districts_729_lgd.dta", replace 

*************************************************
*** checks in covid-in data 
*************************************************

* read data 
use "$path/districts_727not729_deduplicated_covidin.dta", clear 

* make table for https://github.com/guneetnarula/covid19-in/issues/7
list propertiesstname propertiesst_code stc_new if propertiesst_code != st_no, noobs sepby(iso_state)

*************************************************
*** compare district names across files 
*************************************************

* read covid19-in data
use "$path/districts_727not729_deduplicated_covidin.dta", clear 

* create new standardized district name 
clonevar district = propertiesdtname
clonevar scode_2011 = stc_new
do "C:/Users/aadit/OneDrive - Indian School of Business/prohibition/build/code/scode_dcode_dname_2011/id_dcode_2011_TC_spellingvariationsONLY.do"

* read lgd data 
use "$path/districts_729_lgd.dta", clear 
table iso_state

rename districtnameinenglish propertiesdtname 
merge 1:1 iso_state propertiesdtname using "$path/districts_727not729_deduplicated_covidin"

