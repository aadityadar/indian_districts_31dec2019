* standardize district names from justin's shapefile

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

* read excel that is exported from arc
import excel using "$input/districts_727_shp.xlsx", firstrow clear 

* rename 
rename *, lower 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso state code 
clonevar state = stname
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"
drop state 

* sanity check 
isid iso_state dtname

* clean up district names 
clonevar district_standardized =  dtname

*** cleaning 
replace district_standardized = "ahmednagar" if dtname == "ahmadnagar"
replace district_standardized = "arvalli" if dtname == "aravalli"
replace district_standardized = "budgam" if dtname == "badgam"
replace district_standardized = "bemetara" if dtname == "bametara"
replace district_standardized = "bandipora" if dtname == "bandipore"
replace district_standardized = "barabanki" if dtname == "bara banki"
replace district_standardized = "baramulla" if dtname == "baramula"
replace district_standardized = "boudh" if dtname == "baudh"
replace district_standardized = "bengaluru urban" if dtname == "bengaluru"
replace district_standardized = "beed" if dtname == "bid"
replace district_standardized = "buldhana" if dtname == "buldana"
replace district_standardized = "central" if dtname == "central delhi"
replace district_standardized = "chittorgarh" if dtname == "chittaurgarh"
replace district_standardized = "chhotaudepur" if dtname == "chota udaipur"
replace district_standardized = "coochbehar" if dtname == "cooch behar"
replace district_standardized = "dadra and nagar haveli" if dtname == "dadra & nagar haveli"
replace district_standardized = "dantewada" if dtname == "dakshin bastar dantewada"
replace district_standardized = "dinajpur dakshin" if dtname == "dakshin dinajpur"
replace district_standardized = "davangere" if dtname == "davanagere"
replace district_standardized = "deogarh" if dtname == "debagarh"
replace district_standardized = "dholpur" if dtname == "dhaulpur"
replace district_standardized = "east" if dtname == "east delhi"
replace district_standardized = "ayodhya" if dtname == "faizabad"
replace district_standardized = "firozepur" if dtname == "firozpur"
replace district_standardized = "pauri garhwal" if dtname == "garhwal"
replace district_standardized = "gariyaband" if dtname == "gariaband"
replace district_standardized = "gondia" if dtname == "gondiya"
replace district_standardized = "haridwar" if dtname == "hardwar"
replace district_standardized = "jalore" if dtname == "jalor"
replace district_standardized = "janjgir-champa" if dtname == "janjgir - champa"
replace district_standardized = "jayashankar bhupalapally" if dtname == "jayashankar"
replace district_standardized = "kabirdham" if dtname == "kabeerdham"
replace district_standardized = "kamrup metro" if dtname == "kamrup metropolitan"
replace district_standardized = "kanchipuram" if dtname == "kancheepuram"
replace district_standardized = "koderma" if dtname == "kodarma"
replace district_standardized = "korea" if dtname == "koriya"
replace district_standardized = "kushi nagar" if dtname == "kushinagar"
replace district_standardized = "lahul and spiti" if dtname == "lahul & spiti"
replace district_standardized = "lakshadweep district" if dtname == "lakshadweep"
replace district_standardized = "leh ladakh" if dtname == "leh"
replace district_standardized = "leparada" if dtname == "lepa rada"
replace district_standardized = "maharajganj" if dtname == "mahrajganj"
replace district_standardized = "marigaon" if dtname == "morigaon"
replace district_standardized = "nabarangpur" if dtname == "nabarangapur"
replace district_standardized = "narsinghpur" if dtname == "narsimhapur"
replace district_standardized = "north and middle andaman" if dtname == "north & middle andaman"
replace district_standardized = "24 paraganas north" if dtname == "north 24 parganas"
replace district_standardized = "north" if dtname == "north delhi"
replace district_standardized = "north east" if dtname == "north east delhi"
replace district_standardized = "north west" if dtname == "north west delhi"
replace district_standardized = "west singhbhum" if dtname == "pashchimi singhbhum"
replace district_standardized = "pondicherry" if dtname == "puducherry"
replace district_standardized = "poonch" if dtname == "punch"
replace district_standardized = "purbi champaran" if dtname == "purba champaran"
replace district_standardized = "medinipur east" if dtname == "purba medinipur"
replace district_standardized = "east singhbum" if dtname == "purbi singhbhum"
replace district_standardized = "purulia" if dtname == "puruliya"
replace district_standardized = "raigad" if dtname == "raigarh" & iso_state == "MH"
replace district_standardized = "ri bhoi" if dtname == "ribhoi"
replace district_standardized = "rudra prayag" if dtname == "rudraprayag"
replace district_standardized = "s.a.s nagar" if dtname == "s.a.s. nagar"
replace district_standardized = "spsr nellore" if dtname == "s.p.s. nellore"
replace district_standardized = "sahebganj" if dtname == "sahibganj"
replace district_standardized = "sant kabeer nagar" if dtname == "sant kabir nagar"
replace district_standardized = "saraikela kharsawan" if dtname == "saraikela-kharsawan"
replace district_standardized = "shravasti" if dtname == "shrawasti"
replace district_standardized = "shopian" if dtname == "shupiyan"
replace district_standardized = "siddharth nagar" if dtname == "siddharthnagar"
replace district_standardized = "sepahijala" if dtname == "sipahijala"
replace district_standardized = "24 paraganas south" if dtname == "south 24 parganas"
replace district_standardized = "south andamans" if dtname == "south andaman"
replace district_standardized = "south" if dtname == "south delhi"
replace district_standardized = "south east" if dtname == "south east delhi"
replace district_standardized = "south west" if dtname == "south west delhi"
replace district_standardized = "sonepur" if dtname == "subarnapur"
replace district_standardized = "dang" if dtname == "the dangs"
replace district_standardized = "tuticorin" if dtname == "thoothukkudi"
replace district_standardized = "udam singh nagar" if dtname == "udham singh nagar"
replace district_standardized = "unakoti" if dtname == "unokoti"
replace district_standardized = "dibang valley" if dtname == "upper dibang valley"
replace district_standardized = "kanker" if dtname == "uttar bastar kanker"
replace district_standardized = "dinajpur uttar" if dtname == "uttar dinajpur"
replace district_standardized = "uttar kashi" if dtname == "uttarkashi"
replace district_standardized = "villupuram" if dtname == "viluppuram"
replace district_standardized = "visakhapatanam" if dtname == "visakhapatnam"
replace district_standardized = "west" if dtname == "west delhi"
replace district_standardized = "khargone" if dtname == "west nimar"

*** cleaning from INDIA_2018_DISTRICTS 
replace district_standardized = "spsr nellore" if dtname == "sri potti sriramulu nell*"
replace district_standardized = "karbi anglong" if dtname == "karbi anglong east"
replace district_standardized = "west karbi anglong" if dtname == "karbi anglong west"
replace district_standardized = "south salmara mancachar" if dtname == "south salmara-mankachar"
replace district_standardized = "devbhumi dwarka" if dtname == "devbhoomi dwarka"
replace district_standardized = "charki dadri" if dtname == "charkhi dadri"
replace district_standardized = "nuh" if dtname == "mewat"
replace district_standardized = "kargil" if dtname == "kargil"
replace district_standardized = "leh ladakh" if dtname == "leh(ladakh)"
replace district_standardized = "bagalkote" if dtname == "bagalkot"
replace district_standardized = "bengaluru urban" if dtname == "bangalore"
replace district_standardized = "bengaluru rural" if dtname == "bangalore rural"
replace district_standardized = "belagavi" if dtname == "belgaum"
replace district_standardized = "ballari" if dtname == "bellary"
replace district_standardized = "vijayapura" if dtname == "bijapur" & iso_state == "KA"
replace district_standardized = "chamarajanagara" if dtname == "chamarajanagar"
replace district_standardized = "chikkamagaluru" if dtname == "chikmagalur"
replace district_standardized = "kalaburagi" if dtname == "gulbarga"
replace district_standardized = "mysuru" if dtname == "mysore"
replace district_standardized = "shivamogga" if dtname == "shimoga"
replace district_standardized = "tumakuru" if dtname == "tumkur"
replace district_standardized = "sri muktsar sahib" if dtname == "muktsar"
replace district_standardized = "s.a.s nagar" if dtname == "sahibzada ajit singh nag*"
replace district_standardized = "jhunjhunu" if dtname == "jhunjhunun"
replace district_standardized = "bhadradri kothagudem" if dtname == "bhadradri"
replace district_standardized = "jagitial" if dtname == "jagtial"
replace district_standardized = "jangoan" if dtname == "jangaon"
replace district_standardized = "jogulamba gadwal" if dtname == "jogulamba"
replace district_standardized = "kumuram bheem asifabad" if dtname == "komaram bheem"
replace district_standardized = "peddapalli" if dtname == "peddapalle"
replace district_standardized = "rajanna sircilla" if dtname == "rajanna"
replace district_standardized = "ranga reddy" if dtname == "rangareddy"
replace district_standardized = "yadadri bhuvanagiri" if dtname == "yadadri"
replace district_standardized = "prayagraj" if dtname == "allahabad"
replace district_standardized = "hathras" if dtname == "mahamaya nagar"
replace district_standardized = "almora" if regexm(district_standardized, "almora")
replace district_standardized = "darjeeling" if dtname == "darjiling"
replace district_standardized = "24 paraganas north" if dtname == "north twenty four pargan*"
replace district_standardized = "paschim bardhaman" if dtname == "paschim barddhaman"
replace district_standardized = "medinipur west" if dtname == "paschim medinipur"
replace district_standardized = "purba bardhaman" if dtname == "purba barddhaman"
replace district_standardized = "24 paraganas south" if dtname == "south twenty four pargan*"

* rename 
rename * *_shp
rename district_standardized_shp district_standardized
rename iso_state_shp iso_state 

* save 
isid iso_state district_standardized
compress 
save "$temp/districts_727_shp.dta", replace

exit 

* prep to merge 
rename district_standardized districtnameinenglish

* merge with lgd data 
merge 1:1 iso_state districtnameinenglish ///
using "$github/covid19-in/district_names/output/districts_729_lgd.dta"

* browse 
sort districtnameinenglish
br districtnameinenglish iso_state _merge if _merge != 3

* 2 districts are from pok 
tab _merge 
