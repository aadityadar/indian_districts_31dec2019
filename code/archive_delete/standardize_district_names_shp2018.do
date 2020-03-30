* standardize district names from justin's do file
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
	global github = "C:/Users/`c(username)'/Documents/GitHub/"
	global path = "$github/INDIA_2018_DISTRICTS/"
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

* read excel that is exported from arc
import excel using "$path/input/DISTRICTS_2018.xlsx", firstrow clear 

* fill in dname and dcodes for pok and aksai chin
replace D_NAME = "pok" in 219 
replace D_NAME = "aksai chin" in 220
replace D_CODE = "998" in 219 
replace D_CODE = "999" in 220

* rename 
rename *, lower 

* clean string variables
ds, has(type string)
foreach var in `r(varlist)' {
    replace `var' = strtrim(stritrim(lower(`var')))
}

* add iso state code 
clonevar state = s_name
do "C:/Users/aadit/Dropbox/copy/data/census_2001_codes/iso_state_.do"

* add ladakh ut 
replace iso_state = "LA" if d_name == "kargil"
replace iso_state = "LA" if d_name == "leh(ladakh)"

* sanity check 
isid iso_state d_name

* clean up district names 
clonevar district_clean =  d_name

*** cleaning from covid19-in
replace district_clean = "ahmednagar" if d_name == "ahmadnagar"
replace district_clean = "arvalli" if d_name == "aravalli"
replace district_clean = "budgam" if d_name == "badgam"
replace district_clean = "bemetara" if d_name == "bametara"
replace district_clean = "bandipora" if d_name == "bandipore"
replace district_clean = "barabanki" if d_name == "bara banki"
replace district_clean = "baramulla" if d_name == "baramula"
replace district_clean = "boudh" if d_name == "baudh"
replace district_clean = "bengaluru urban" if d_name == "bengaluru"
replace district_clean = "beed" if d_name == "bid"
replace district_clean = "buldhana" if d_name == "buldana"
replace district_clean = "central" if d_name == "central delhi"
replace district_clean = "chittorgarh" if d_name == "chittaurgarh"
replace district_clean = "chhotaudepur" if d_name == "chota udaipur"
replace district_clean = "coochbehar" if d_name == "cooch behar"
replace district_clean = "dadra and nagar haveli" if d_name == "dadra & nagar haveli"
replace district_clean = "dantewada" if d_name == "dakshin bastar dantewada"
replace district_clean = "dinajpur dakshin" if d_name == "dakshin dinajpur"
replace district_clean = "davangere" if d_name == "davanagere"
replace district_clean = "deogarh" if d_name == "debagarh"
replace district_clean = "dholpur" if d_name == "dhaulpur"
replace district_clean = "east" if d_name == "east delhi"
replace district_clean = "ayodhya" if d_name == "faizabad"
replace district_clean = "firozepur" if d_name == "firozpur"
replace district_clean = "pauri garhwal" if d_name == "garhwal"
replace district_clean = "gariyaband" if d_name == "gariaband"
replace district_clean = "gondia" if d_name == "gondiya"
replace district_clean = "haridwar" if d_name == "hardwar"
replace district_clean = "jalore" if d_name == "jalor"
replace district_clean = "janjgir-champa" if d_name == "janjgir - champa"
replace district_clean = "jayashankar bhupalapally" if d_name == "jayashankar"
replace district_clean = "kabirdham" if d_name == "kabeerdham"
replace district_clean = "kamrup metro" if d_name == "kamrup metropolitan"
replace district_clean = "kanchipuram" if d_name == "kancheepuram"
replace district_clean = "koderma" if d_name == "kodarma"
replace district_clean = "korea" if d_name == "koriya"
replace district_clean = "kushi nagar" if d_name == "kushinagar"
replace district_clean = "lahul and spiti" if d_name == "lahul & spiti"
replace district_clean = "lakshadweep district" if d_name == "lakshadweep"
replace district_clean = "leh ladakh" if d_name == "leh"
replace district_clean = "leparada" if d_name == "lepa rada"
replace district_clean = "maharajganj" if d_name == "mahrajganj"
replace district_clean = "marigaon" if d_name == "morigaon"
replace district_clean = "nabarangpur" if d_name == "nabarangapur"
replace district_clean = "narsinghpur" if d_name == "narsimhapur"
replace district_clean = "north and middle andaman" if d_name == "north & middle andaman"
replace district_clean = "24 paraganas north" if d_name == "north 24 parganas"
replace district_clean = "north" if d_name == "north delhi"
replace district_clean = "north east" if d_name == "north east delhi"
replace district_clean = "north west" if d_name == "north west delhi"
replace district_clean = "west singhbhum" if d_name == "pashchimi singhbhum"
replace district_clean = "pondicherry" if d_name == "puducherry"
replace district_clean = "poonch" if d_name == "punch"
replace district_clean = "purbi champaran" if d_name == "purba champaran"
replace district_clean = "medinipur east" if d_name == "purba medinipur"
replace district_clean = "east singhbum" if d_name == "purbi singhbhum"
replace district_clean = "purulia" if d_name == "puruliya"
replace district_clean = "raigad" if d_name == "raigarh" & iso_state == "MH"
replace district_clean = "ri bhoi" if d_name == "ribhoi"
replace district_clean = "rudra prayag" if d_name == "rudraprayag"
replace district_clean = "s.a.s nagar" if d_name == "s.a.s. nagar"
replace district_clean = "spsr nellore" if d_name == "s.p.s. nellore"
replace district_clean = "sahebganj" if d_name == "sahibganj"
replace district_clean = "sant kabeer nagar" if d_name == "sant kabir nagar"
replace district_clean = "saraikela kharsawan" if d_name == "saraikela-kharsawan"
replace district_clean = "shravasti" if d_name == "shrawasti"
replace district_clean = "shopian" if d_name == "shupiyan"
replace district_clean = "siddharth nagar" if d_name == "siddharthnagar"
replace district_clean = "sepahijala" if d_name == "sipahijala"
replace district_clean = "24 paraganas south" if d_name == "south 24 parganas"
replace district_clean = "south andamans" if d_name == "south andaman"
replace district_clean = "south" if d_name == "south delhi"
replace district_clean = "south east" if d_name == "south east delhi"
replace district_clean = "south west" if d_name == "south west delhi"
replace district_clean = "sonepur" if d_name == "subarnapur"
replace district_clean = "dang" if d_name == "the dangs"
replace district_clean = "tuticorin" if d_name == "thoothukkudi"
replace district_clean = "udam singh nagar" if d_name == "udham singh nagar"
replace district_clean = "unakoti" if d_name == "unokoti"
replace district_clean = "dibang valley" if d_name == "upper dibang valley"
replace district_clean = "kanker" if d_name == "uttar bastar kanker"
replace district_clean = "dinajpur uttar" if d_name == "uttar dinajpur"
replace district_clean = "uttar kashi" if d_name == "uttarkashi"
replace district_clean = "villupuram" if d_name == "viluppuram"
replace district_clean = "visakhapatanam" if d_name == "visakhapatnam"
replace district_clean = "west" if d_name == "west delhi"
replace district_clean = "khargone" if d_name == "west nimar"

*** cleaning from INDIA_2018_DISTRICTS 
replace district_clean = "spsr nellore" if district_clean == "sri potti sriramulu nell*"
replace district_clean = "karbi anglong" if district_clean == "karbi anglong east"
replace district_clean = "west karbi anglong" if district_clean == "karbi anglong west"
replace district_clean = "south salmara mancachar" if district_clean == "south salmara-mankachar"
replace district_clean = "devbhumi dwarka" if district_clean == "devbhoomi dwarka"
replace district_clean = "charki dadri" if district_clean == "charkhi dadri"
replace district_clean = "nuh" if district_clean == "mewat"
* replace district_clean = "." if district_clean == "aksai chin"
replace district_clean = "kargil" if district_clean == "kargil"
replace district_clean = "leh ladakh" if district_clean == "leh(ladakh)"
* replace district_clean = "." if district_clean == "pok"
replace district_clean = "bagalkote" if district_clean == "bagalkot"
replace district_clean = "bengaluru urban" if district_clean == "bangalore"
replace district_clean = "bengaluru rural" if district_clean == "bangalore rural"
replace district_clean = "belagavi" if district_clean == "belgaum"
replace district_clean = "ballari" if district_clean == "bellary"
replace district_clean = "vijayapura" if district_clean == "bijapur" & iso_state == "KA"
replace district_clean = "chamarajanagara" if district_clean == "chamarajanagar"
replace district_clean = "chikkamagaluru" if district_clean == "chikmagalur"
replace district_clean = "kalaburagi" if district_clean == "gulbarga"
replace district_clean = "mysuru" if district_clean == "mysore"
replace district_clean = "shivamogga" if district_clean == "shimoga"
replace district_clean = "tumakuru" if district_clean == "tumkur"
replace district_clean = "sri muktsar sahib" if district_clean == "muktsar"
replace district_clean = "s.a.s nagar" if district_clean == "sahibzada ajit singh nag*"
replace district_clean = "jhunjhunu" if district_clean == "jhunjhunun"
replace district_clean = "bhadradri kothagudem" if district_clean == "bhadradri"
replace district_clean = "jagitial" if district_clean == "jagtial"
replace district_clean = "jangoan" if district_clean == "jangaon"
replace district_clean = "jogulamba gadwal" if district_clean == "jogulamba"
replace district_clean = "kumuram bheem asifabad" if district_clean == "komaram bheem"
replace district_clean = "peddapalli" if district_clean == "peddapalle"
replace district_clean = "rajanna sircilla" if district_clean == "rajanna"
replace district_clean = "ranga reddy" if district_clean == "rangareddy"
replace district_clean = "yadadri bhuvanagiri" if district_clean == "yadadri"
replace district_clean = "prayagraj" if district_clean == "allahabad"
replace district_clean = "hathras" if district_clean == "mahamaya nagar"
replace district_clean = "almora" if regexm(district_clean, "almora")
replace district_clean = "darjeeling" if district_clean == "darjiling"
replace district_clean = "24 paraganas north" if district_clean == "north twenty four pargan*"
replace district_clean = "paschim bardhaman" if district_clean == "paschim barddhaman"
replace district_clean = "medinipur west" if district_clean == "paschim medinipur"
replace district_clean = "purba bardhaman" if district_clean == "purba barddhaman"
replace district_clean = "24 paraganas south" if district_clean == "south twenty four pargan*"

* prep to merge 
rename district_clean districtnameinenglish

* merge with lgd data 
merge 1:1 iso_state districtnameinenglish ///
using "$github/covid19-in/district_names/output/districts_729_lgd.dta"

* browse 
sort districtnameinenglish
br districtnameinenglish iso_state _merge if _merge != 3

* 2 districts are from pok 
tab _merge 

/* twelve new districts in 2019?
iso_state	districtnameinenglish 	whenformed 
AR	kamle	Oct2017
AR	leparada	Aug2018
AR	lower siang	Sep2017
AR	pakke kessang	Aug2018
AR	shi yomi	Aug2018
MP	niwari	Oct2018
MZ	hnahthial	Jun2019
MZ	khawzawl	Jun2019
MZ	saitual	Jun2019
TG	mulugu	Feb2019
TG	narayanpet	Feb2019
TN	kallakurichi	Nov2019
*/




* export excel properties* iso_state *_new census* ///
* using "$path/district_names_clean_with_lgdcodes.xlsx", ///
* firstrow(variables) replace 
