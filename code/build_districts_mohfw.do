* build district names from mohfw list as on 30march at 4pm

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

* read mohfw data
import excel using "$path/input/districts_158_mohfw.xlsx", clear firstrow

* rename 
rename *, lower 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso state codes 
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"

* standarize districts 
clonevar district_standardized = district
replace district_standardized = "south andamans" if district == "south andaman"
replace district_standardized = "chittoor" if district == "chitoor"
replace district_standardized = "spsr nellore" if district == "nellore"
replace district_standardized = "visakhapatanam" if district == "vizag"
replace district_standardized = "east" if district == "east delhi"
replace district_standardized = "north" if district == "north delhi"
replace district_standardized = "south" if district == "south delhi"
replace district_standardized = "west" if district == "west delhi"
replace district_standardized = "ahmadabad" if district == "ahmedabad"
replace district_standardized = "kachchh" if district == "kutch"
replace district_standardized = "mahesana" if district == "mehsana"
replace district_standardized = "rajouri" if district == "rajauri"
replace district_standardized = "" if district == "bbmp"
replace district_standardized = "dakshina kannada" if district == "dakshin kannada"
replace district_standardized = "kalaburagi" if district == "kalaburgi"
replace district_standardized = "mysuru" if district == "mysore"
replace district_standardized = "tumakuru" if district == "tumkuru"
replace district_standardized = "uttara kannada" if district == "uttar kannada"
replace district_standardized = "kasaragod" if district == "kasargod"
replace district_standardized = "malappuram" if district == "mallapuram"
replace district_standardized = "thiruvananthapuram" if district == "thiruvanthpuram"
replace district_standardized = "leh ladakh" if district == "leh"
replace district_standardized = "aizawl" if district == "aizwal (w)"
replace district_standardized = "khordha" if district == "khurda"
replace district_standardized = "shahid bhagat singh nagar" if district == "nawanshahr"
replace district_standardized = "s.a.s nagar" if district == "sas nagar"
replace district_standardized = "shahid bhagat singh nagar" if district == "sbs nagar"
replace district_standardized = "bhadradri kothagudem" if district == "bhadradri kothagudam"
replace district_standardized = "medchal malkajgiri" if district == "madchal"
replace district_standardized = "mahabubnagar" if district == "mahboobnagar"
replace district_standardized = "medchal malkajgiri" if district == "medchal"
replace district_standardized = "warangal urban" if district == "warangal (u)"
replace district_standardized = "coimbatore" if district == "coimbatoor"
replace district_standardized = "kanchipuram" if district == "kanchipurum"
replace district_standardized = "tirunelveli" if district == "tiruneveli"
replace district_standardized = "tiruppur" if district == "tirupur"
replace district_standardized = "tiruchirappalli" if district == "trichy"
replace district_standardized = "baghpat" if district == "bagpat"
replace district_standardized = "gautam buddha nagar" if district == "gb nagar"
replace district_standardized = "" if district == "kanpur"
replace district_standardized = "kheri" if district == "lakhimpur kheri"
replace district_standardized = "moradabad" if district == "moradabd"
replace district_standardized = "pilibhit" if district == "philibhit"
replace district_standardized = "" if district == "east mirzapur"
replace district_standardized = "24 paraganas north" if district == "north 24 pargana"
replace district_standardized = "24 paraganas south" if district == "south 24 pargana"

* add new line for mohfw 
replace district_standardized = "" if district == "unknown"

* rename 
rename * *_mohfw
rename district_standardized_mohfw district_standardized
rename iso_state_mohfw iso_state 

* save 
isid iso_state district_standardized
compress 
save "$temp/districts_152not158_mohfw.dta", replace

/*
* merge with 31dec2019 district list  
merge m:1 iso_state district_standardized using ///
"$output/indian_districts_31dec2019.dta"
*/
