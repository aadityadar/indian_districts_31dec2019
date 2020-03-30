* standardize district names from covid19india

* preliminaries 
clear all 
set rmsg on 
set more off 
if "`c(username)'" == "aadit" {
	global path = "C:/Users/aadit/Documents/GitHub/covid19-in/csv"
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


* read covid19-in data
use "$path/districts_727not729_deduplicated_covidin.dta", clear 

clonevar district_clean =  propertiesdtname
replace district_clean = "ahmednagar" if propertiesdtname == "ahmadnagar"
replace district_clean = "arvalli" if propertiesdtname == "aravalli"
replace district_clean = "budgam" if propertiesdtname == "badgam"
replace district_clean = "bemetara" if propertiesdtname == "bametara"
replace district_clean = "bandipora" if propertiesdtname == "bandipore"
replace district_clean = "barabanki" if propertiesdtname == "bara banki"
replace district_clean = "baramulla" if propertiesdtname == "baramula"
replace district_clean = "boudh" if propertiesdtname == "baudh"
replace district_clean = "bengaluru urban" if propertiesdtname == "bengaluru"
replace district_clean = "beed" if propertiesdtname == "bid"
replace district_clean = "buldhana" if propertiesdtname == "buldana"
replace district_clean = "central" if propertiesdtname == "central delhi"
replace district_clean = "chittorgarh" if propertiesdtname == "chittaurgarh"
replace district_clean = "chhotaudepur" if propertiesdtname == "chota udaipur"
replace district_clean = "coochbehar" if propertiesdtname == "cooch behar"
replace district_clean = "dadra and nagar haveli" if propertiesdtname == "dadra & nagar haveli"
replace district_clean = "dantewada" if propertiesdtname == "dakshin bastar dantewada"
replace district_clean = "dinajpur dakshin" if propertiesdtname == "dakshin dinajpur"
replace district_clean = "davangere" if propertiesdtname == "davanagere"
replace district_clean = "deogarh" if propertiesdtname == "debagarh"
replace district_clean = "dholpur" if propertiesdtname == "dhaulpur"
replace district_clean = "east" if propertiesdtname == "east delhi"
replace district_clean = "ayodhya" if propertiesdtname == "faizabad"
replace district_clean = "firozepur" if propertiesdtname == "firozpur"
replace district_clean = "pauri garhwal" if propertiesdtname == "garhwal"
replace district_clean = "gariyaband" if propertiesdtname == "gariaband"
replace district_clean = "gondia" if propertiesdtname == "gondiya"
replace district_clean = "haridwar" if propertiesdtname == "hardwar"
replace district_clean = "jalore" if propertiesdtname == "jalor"
replace district_clean = "janjgir-champa" if propertiesdtname == "janjgir - champa"
replace district_clean = "jayashankar bhupalapally" if propertiesdtname == "jayashankar"
replace district_clean = "kabirdham" if propertiesdtname == "kabeerdham"
replace district_clean = "kamrup metro" if propertiesdtname == "kamrup metropolitan"
replace district_clean = "kanchipuram" if propertiesdtname == "kancheepuram"
replace district_clean = "koderma" if propertiesdtname == "kodarma"
replace district_clean = "korea" if propertiesdtname == "koriya"
replace district_clean = "kushi nagar" if propertiesdtname == "kushinagar"
replace district_clean = "lahul and spiti" if propertiesdtname == "lahul & spiti"
replace district_clean = "lakshadweep district" if propertiesdtname == "lakshadweep"
replace district_clean = "leh ladakh" if propertiesdtname == "leh"
replace district_clean = "leparada" if propertiesdtname == "lepa rada"
replace district_clean = "maharajganj" if propertiesdtname == "mahrajganj"
replace district_clean = "marigaon" if propertiesdtname == "morigaon"
replace district_clean = "nabarangpur" if propertiesdtname == "nabarangapur"
replace district_clean = "narsinghpur" if propertiesdtname == "narsimhapur"
replace district_clean = "north and middle andaman" if propertiesdtname == "north & middle andaman"
replace district_clean = "24 paraganas north" if propertiesdtname == "north 24 parganas"
replace district_clean = "north" if propertiesdtname == "north delhi"
replace district_clean = "north east" if propertiesdtname == "north east delhi"
replace district_clean = "north west" if propertiesdtname == "north west delhi"
replace district_clean = "west singhbhum" if propertiesdtname == "pashchimi singhbhum"
replace district_clean = "pondicherry" if propertiesdtname == "puducherry"
replace district_clean = "poonch" if propertiesdtname == "punch"
replace district_clean = "purbi champaran" if propertiesdtname == "purba champaran"
replace district_clean = "medinipur east" if propertiesdtname == "purba medinipur"
replace district_clean = "east singhbum" if propertiesdtname == "purbi singhbhum"
replace district_clean = "purulia" if propertiesdtname == "puruliya"
replace district_clean = "raigad" if propertiesdtname == "raigarh" & iso_state == "MH"
replace district_clean = "ri bhoi" if propertiesdtname == "ribhoi"
replace district_clean = "rudra prayag" if propertiesdtname == "rudraprayag"
replace district_clean = "s.a.s nagar" if propertiesdtname == "s.a.s. nagar"
replace district_clean = "spsr nellore" if propertiesdtname == "s.p.s. nellore"
replace district_clean = "sahebganj" if propertiesdtname == "sahibganj"
replace district_clean = "sant kabeer nagar" if propertiesdtname == "sant kabir nagar"
replace district_clean = "saraikela kharsawan" if propertiesdtname == "saraikela-kharsawan"
replace district_clean = "shravasti" if propertiesdtname == "shrawasti"
replace district_clean = "shopian" if propertiesdtname == "shupiyan"
replace district_clean = "siddharth nagar" if propertiesdtname == "siddharthnagar"
replace district_clean = "sepahijala" if propertiesdtname == "sipahijala"
replace district_clean = "24 paraganas south" if propertiesdtname == "south 24 parganas"
replace district_clean = "south andamans" if propertiesdtname == "south andaman"
replace district_clean = "south" if propertiesdtname == "south delhi"
replace district_clean = "south east" if propertiesdtname == "south east delhi"
replace district_clean = "south west" if propertiesdtname == "south west delhi"
replace district_clean = "sonepur" if propertiesdtname == "subarnapur"
replace district_clean = "dang" if propertiesdtname == "the dangs"
replace district_clean = "tuticorin" if propertiesdtname == "thoothukkudi"
replace district_clean = "udam singh nagar" if propertiesdtname == "udham singh nagar"
replace district_clean = "unakoti" if propertiesdtname == "unokoti"
replace district_clean = "dibang valley" if propertiesdtname == "upper dibang valley"
replace district_clean = "kanker" if propertiesdtname == "uttar bastar kanker"
replace district_clean = "dinajpur uttar" if propertiesdtname == "uttar dinajpur"
replace district_clean = "uttar kashi" if propertiesdtname == "uttarkashi"
replace district_clean = "villupuram" if propertiesdtname == "viluppuram"
replace district_clean = "visakhapatanam" if propertiesdtname == "visakhapatnam"
replace district_clean = "west" if propertiesdtname == "west delhi"
replace district_clean = "khargone" if propertiesdtname == "west nimar"

* prep to merge 
rename district_clean districtnameinenglish

* merge with lgd data 
merge 1:1 iso_state districtnameinenglish using "$path/districts_729_lgd"

* rename 
rename stc_new stcode_new
rename districtnameinenglish dtname_new
rename districtcode2020 dtcode_2020_new 

export excel properties* iso_state *_new census* ///
using "$path/district_names_clean_with_lgdcodes.xlsx", ///
firstrow(variables) replace 
