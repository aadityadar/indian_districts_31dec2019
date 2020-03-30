* build district names as on 31dec2019 
/*
flag
Within India 7 district names are similar, representing 14 districts:
Aurangabad district, Bihar & Aurangabad district, Maharashtra
Balrampur district, Chhattisgarh & Balrampur district, Uttar Pradesh.
Bijapur district, Chhattisgarh & Bijapur district, Karnataka
Bilaspur district, Chhattisgarh & Bilaspur district, Himachal Pradesh
Hamirpur district, Himachal Pradesh & Hamirpur district, Uttar Pradesh
Lakhimpur district, Assam & Lakhimpur Kheri district, Uttar Pradesh
Pratapgarh district, Rajasthan & Pratapgarh district, Uttar Pradesh
*/

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

* start with the four new districts in tn not in lgd
clear 
set obs 4
gen iso_state = "TN"
gen district_standardized = ""
replace district_standardized = "chengalpattu" in 1
replace district_standardized = "ranipet" in 2
replace district_standardized = "tirupathur" in 3
replace district_standardized = "tenkasi" in 4

* append lgd data
append using "$temp/districts_729_lgd.dta", gen(a_lgd)
* keep(iso_state district_standardized)

* merge in districts from shapefile (two new from j&k)
merge 1:1 iso_state district_standardized using /// 
"$temp/districts_727_shp.dta", gen(mergeshp)

* merge in covid19india districts 
merge 1:1 iso_state district_standardized using /// 
"$temp/districts_727_cov19ind.dta", gen(mergecov19ind)

exit 

export excel iso_state district_standardized ///
n_cov19ind state_cov19ind district_cov19ind ///
dtname_shp districtcode_lgd census* using /// 
"$output/indian_districts_31dec2019.xlsx", replace ///
firstrow(variables)

