* build district names from lgd

* preliminaries 
clear all 
set rmsg on 
set more off 
if "`c(username)'" == "aadit" {
	global path = "C:/Users/`c(username)'/Documents/GitHub/indian_districts_31dec2019"
}
else if "`c(username)'" == "USER" {
	global path = "C:/Users/`c(username)'/Indian School of Business"
}
else {
	display as error "Please specify root directory" ///
	"Your username is: `c(username)'" ///
	"Replace yourName with `c(username)'" 
	exit 
}

* relative paths 
global input $path/input
global code $path/code
global output $path/output
global temp $path/temp

* read lgd data
import delim using "$path/input/districts_729_lgd.csv", clear varnames(1) delim(";")

* rename 
rename *, lower 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso state codes 
rename statenameinenglish state 
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"

* define new var 
clonevar district_standardized = districtnameinenglish

* rename 
rename * *_lgd
rename district_standardized_lgd district_standardized
rename iso_state_lgd iso_state 

* sanity check 
isid iso_state district_standardized

* save 
compress 
save "$temp/districts_729_lgd.dta", replace
