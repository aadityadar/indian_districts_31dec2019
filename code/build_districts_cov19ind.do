* build district names from cov19india

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

* read covid19-in data
import excel using "$path/input/districts_727_cov19ind.xlsx", clear firstrow

* rename 
rename *, lower 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso state codes 
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"

* standardize district names 
clonevar district_standardized =  district
replace district_standardized = "ahmednagar" if district == "ahmadnagar"
replace district_standardized = "arvalli" if district == "aravalli"
replace district_standardized = "budgam" if district == "badgam"
replace district_standardized = "bemetara" if district == "bametara"
replace district_standardized = "bandipora" if district == "bandipore"
replace district_standardized = "barabanki" if district == "bara banki"
replace district_standardized = "baramulla" if district == "baramula"
replace district_standardized = "boudh" if district == "baudh"
replace district_standardized = "bengaluru urban" if district == "bengaluru"
replace district_standardized = "beed" if district == "bid"
replace district_standardized = "buldhana" if district == "buldana"
replace district_standardized = "central" if district == "central delhi"
replace district_standardized = "chittorgarh" if district == "chittaurgarh"
replace district_standardized = "chhotaudepur" if district == "chota udaipur"
replace district_standardized = "coochbehar" if district == "cooch behar"
replace district_standardized = "dadra and nagar haveli" if district == "dadra & nagar haveli"
replace district_standardized = "dantewada" if district == "dakshin bastar dantewada"
replace district_standardized = "dinajpur dakshin" if district == "dakshin dinajpur"
replace district_standardized = "davangere" if district == "davanagere"
replace district_standardized = "deogarh" if district == "debagarh"
replace district_standardized = "dholpur" if district == "dhaulpur"
replace district_standardized = "east" if district == "east delhi"
replace district_standardized = "ayodhya" if district == "faizabad"
replace district_standardized = "firozepur" if district == "firozpur"
replace district_standardized = "pauri garhwal" if district == "garhwal"
replace district_standardized = "gariyaband" if district == "gariaband"
replace district_standardized = "gondia" if district == "gondiya"
replace district_standardized = "haridwar" if district == "hardwar"
replace district_standardized = "jalore" if district == "jalor"
replace district_standardized = "janjgir-champa" if district == "janjgir - champa"
replace district_standardized = "jayashankar bhupalapally" if district == "jayashankar"
replace district_standardized = "kabirdham" if district == "kabeerdham"
replace district_standardized = "kamrup metro" if district == "kamrup metropolitan"
replace district_standardized = "kanchipuram" if district == "kancheepuram"
replace district_standardized = "koderma" if district == "kodarma"
replace district_standardized = "korea" if district == "koriya"
replace district_standardized = "kushi nagar" if district == "kushinagar"
replace district_standardized = "lahul and spiti" if district == "lahul & spiti"
replace district_standardized = "lakshadweep district" if district == "lakshadweep"
replace district_standardized = "leh ladakh" if district == "leh"
replace district_standardized = "leparada" if district == "lepa rada"
replace district_standardized = "maharajganj" if district == "mahrajganj"
replace district_standardized = "marigaon" if district == "morigaon"
replace district_standardized = "nabarangpur" if district == "nabarangapur"
replace district_standardized = "narsinghpur" if district == "narsimhapur"
replace district_standardized = "north and middle andaman" if district == "north & middle andaman"
replace district_standardized = "24 paraganas north" if district == "north 24 parganas"
replace district_standardized = "north" if district == "north delhi"
replace district_standardized = "north east" if district == "north east delhi"
replace district_standardized = "north west" if district == "north west delhi"
replace district_standardized = "west singhbhum" if district == "pashchimi singhbhum"
replace district_standardized = "pondicherry" if district == "puducherry"
replace district_standardized = "poonch" if district == "punch"
replace district_standardized = "purbi champaran" if district == "purba champaran"
replace district_standardized = "medinipur east" if district == "purba medinipur"
replace district_standardized = "east singhbum" if district == "purbi singhbhum"
replace district_standardized = "purulia" if district == "puruliya"
replace district_standardized = "raigad" if district == "raigarh" & iso_state == "MH"
replace district_standardized = "ri bhoi" if district == "ribhoi"
replace district_standardized = "rudra prayag" if district == "rudraprayag"
replace district_standardized = "s.a.s nagar" if district == "s.a.s. nagar"
replace district_standardized = "spsr nellore" if district == "s.p.s. nellore"
replace district_standardized = "sahebganj" if district == "sahibganj"
replace district_standardized = "sant kabeer nagar" if district == "sant kabir nagar"
replace district_standardized = "saraikela kharsawan" if district == "saraikela-kharsawan"
replace district_standardized = "shravasti" if district == "shrawasti"
replace district_standardized = "shopian" if district == "shupiyan"
replace district_standardized = "siddharth nagar" if district == "siddharthnagar"
replace district_standardized = "sepahijala" if district == "sipahijala"
replace district_standardized = "24 paraganas south" if district == "south 24 parganas"
replace district_standardized = "south andamans" if district == "south andaman"
replace district_standardized = "south" if district == "south delhi"
replace district_standardized = "south east" if district == "south east delhi"
replace district_standardized = "south west" if district == "south west delhi"
replace district_standardized = "sonepur" if district == "subarnapur"
replace district_standardized = "dang" if district == "the dangs"
replace district_standardized = "tuticorin" if district == "thoothukkudi"
replace district_standardized = "udam singh nagar" if district == "udham singh nagar"
replace district_standardized = "unakoti" if district == "unokoti"
replace district_standardized = "dibang valley" if district == "upper dibang valley"
replace district_standardized = "kanker" if district == "uttar bastar kanker"
replace district_standardized = "dinajpur uttar" if district == "uttar dinajpur"
replace district_standardized = "uttar kashi" if district == "uttarkashi"
replace district_standardized = "villupuram" if district == "viluppuram"
replace district_standardized = "visakhapatanam" if district == "visakhapatnam"
replace district_standardized = "west" if district == "west delhi"
replace district_standardized = "khargone" if district == "west nimar"

* rename 
rename * *_cov19ind
rename district_standardized_cov19ind district_standardized
rename iso_state_cov19ind iso_state 

* save 
isid iso_state district_standardized
compress 
save "$temp/districts_727_cov19ind.dta", replace

/*
* prep to merge 
rename district_standardized districtnameinenglish

* merge with lgd data 
merge 1:1 iso_state districtnameinenglish using ///
"$temp/districts_729_lgd"
