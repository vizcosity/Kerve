//
//  Country.swif.swift
//  COVIDStats
//
//  Created by Aaron Baw on 20/12/2020.
//

import Foundation

enum Country {
    
    case taiwanOf
    case virginIslands
    case réunion
    case ghana
    case yemen
    case costaRica
    case ethiopia
    case australia
    case egypt
    case belgium
    case mayotte
    case sanMarino
    case cameroon
    case svalbardAndJanMayen
    case turkey
    case luxembourg
    case angola
    case dominicanRepublic
    case timorleste
    case trinidadAndTobago
    case unitedStatesMinorOutlyingIslands
    case belize
    case kazakhstan
    case tokelau
    case malta
    case azerbaijan
    case afghanistan
    case equatorialGuinea
    case uzbekistan
    case isleOfMan
    case jersey
    case frenchPolynesia
    case koreaDemocraticPeoplesRepublic
    case westernSahara
    case togo
    case congoDemocraticRepublicOf
    case iraq
    case micronesiaStates
    case côteDivoire
    case latvia
    case finland
    case pakistan
    case tanzania,UnitedRepublicOf
    case iranRepublic
    case uganda
    case tonga
    case eswatini
    case italy
    case iceland
    case spain
    case montenegro
    case hongKong
    case southGeorgiaAndTheSouthSandwichIslands
    case fiji
    case libya
    case solomonIslands
    case honduras
    case rwanda
    case ukraine
    case vanuatu
    case laoPeoplesDemocraticRepublic
    case republicOfNorthMacedonia
    case southAfrica
    case algeria
    case ecuador
    case bhutan
    case myanmar
    case sudan
    case frenchGuiana
    case mauritius
    case norfolkIsland
    case bosniaAndHerzegovina
    case oman
    case tajikistan
    case caymanIslands
    case grenada
    case netherlands
    case newCaledonia
    case madagascar
    case centralAfricanRepublic
    case wallisAndFutuna
    case saintLucia
    case curaçao
    case cocosIslands
    case gambia
    case mali
    case martinique
    case bermuda
    case monaco
    case holySee
    case britishIndianOceanTerritory
    case suriname
    case malaysia
    case liechtenstein
    case saintKittsAndNevis
    case montserrat
    case serbia
    case southSudan
    case unitedArabEmirates
    case brazil
    case moldovaRepublic
    case nicaragua
    case japan
    case northernMarianaIslands
    case bonaire,SintEustatiusAndSaba
    case bangladesh
    case cambodia
    case chile
    case lesotho
    case guernsey
    case peru
    case mexico
    case panama
    case botswana
    case seychelles
    case georgia
    case koreaRepublic
    case kuwait
    case qatar
    case chad
    case gabon
    case senegal
    case philippines
    case colombia
    case saintBarthélemy
    case cuba
    case saintVincentAndTheGrenadines
    case argentina
    case guatemala
    case israel
    case saintPierreAndMiquelon
    case americanSamoa
    case morocco
    case nepal
    case portugal
    case maldives
    case cookIslands
    case guadeloupe
    case greece
    case romania
    case zambia
    case lebanon
    case unitedStatesOfAmerica
    case croatia
    case heardIslandAndMcdonaldIslands
    case guam
    case marshallIslands
    case turksAndCaicosIslands
    case uruguay
    case benin
    case elSalvador
    case djibouti
    case sriLanka
    case greenland
    case kyrgyzstan
    case tuvalu
    case india
    case saoTomeAndPrincipe
    case bahrain
    case christmasIsland
    case czechia
    case thailand
    case armenia
    case kiribati
    case guyana
    case ireland
    case congo
    case slovakia
    case china
    case tunisia
    case venezuelaRepublic
    case france
    case antarctica
    case palestine,StateOf
    case poland
    case frenchSouthernTerritories
    case falklandIslands
    case caboVerde
    case sierraLeone
    case ålandIslands
    case denmark
    case andorra
    case gibraltar
    case puertoRico
    case austria
    case bruneiDarussalam
    case jamaica
    case somalia
    case bahamas
    case estonia
    case cyprus
    case newZealand
    case burundi
    case sweden
    case samoa
    case switzerland
    case macao
    case faroeIslands
    case indonesia
    case kenya
    case hungary
    case slovenia
    case dominica
    case niger
    case guineaBissau
    case pitcairn
    case mauritania
    case paraguay
    case burkinaFaso
    case comoros
    case nauru
    case papuaNewGuinea
    case boliviaState
    case singapore
    case jordan
    case eritrea
    case norway
    case nigeria
    case saintHelena,AscensionAndTristanDaCunha
    case zimbabwe
    case mozambique
    case palau
    case bulgaria
    case liberia
    case anguilla
    case barbados
    case antiguaAndBarbuda
    case russianFederation
    case saintMartin
    case bouvetIsland
    case guinea
    case mongolia
    case belarus
    case aruba
    case lithuania
    case canada
    case germany
    case syrianArabRepublic
    case niue
    case sintMaarten
    case vietNam
    case turkmenistan
    case malawi
    case namibia
    case unitedKingdomOfGreatBritainAndNorthernIreland
    case albania
    case saudiArabia
    case haiti
    
//    var longName: String {
//        switch self {
//            
//        }
//    }

    static var codes = ["AFG","ALB","DZA","ASM","AND","AGO","AIA","ATA","ATG","ARG","ARM","ABW","AUS","AUT","AZE","BHS","BHR","BGD","BRB","BLR","BEL","BLZ","BEN","BMU","BTN","BOL","BES","BIH","BWA","BVT","BRA","IOT","BRN","BGR","BFA","BDI","CPV","KHM","CMR","CAN","CYM","CAF","TCD","CHL","CHN","CXR","CCK","COL","COM","COD","COG","COK","CRI","HRV","CUB","CUW","CYP","CZE","CIV","DNK","DJI","DMA","DOM","ECU","EGY","SLV","GNQ","ERI","EST","SWZ","ETH","FLK","FRO","FJI","FIN","FRA","GUF","PYF","ATF","GAB","GMB","GEO","DEU","GHA","GIB","GRC","GRL","GRD","GLP","GUM","GTM","GGY","GIN","GNB","GUY","HTI","HMD","VAT","HND","HKG","HUN","ISL","IND","IDN","IRN","IRQ","IRL","IMN","ISR","ITA","JAM","JPN","JEY","JOR","KAZ","KEN","KIR","PRK","KOR","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LIE","LTU","LUX","MAC","MDG","MWI","MYS","MDV","MLI","MLT","MHL","MTQ","MRT","MUS","MYT","MEX","FSM","MDA","MCO","MNG","MNE","MSR","MAR","MOZ","MMR","NAM","NRU","NPL","NLD","NCL","NZL","NIC","NER","NGA","NIU","NFK","MNP","NOR","OMN","PAK","PLW","PSE","PAN","PNG","PRY","PER","PHL","PCN","POL","PRT","PRI","QAT","MKD","ROU","RUS","RWA","REU","BLM","SHN","KNA","LCA","MAF","SPM","VCT","WSM","SMR","STP","SAU","SEN","SRB","SYC","SLE","SGP","SXM","SVK","SVN","SLB","SOM","ZAF","SGS","SSD","ESP","LKA","SDN","SUR","SJM","SWE","CHE","SYR","TWN","TJK","TZA","THA","TLS","TGO","TKL","TON","TTO","TUN","TUR","TKM","TCA","TUV","UGA","UKR","ARE","GBR","UMI","USA","URY","UZB","VUT","VEN","VNM","VGB","VIR","WLF","ESH","YEM","ZMB","ZWE","ALA"]
    
    static var countryToCodeMap = [
        "Afghanistan": "AFG",
        "Albania": "ALB",
        "Algeria": "DZA",
        "American Samoa": "ASM",
        "Andorra": "AND",
        "Angola": "AGO",
        "Anguilla": "AIA",
        "Antarctica": "ATA",
        "Antigua and Barbuda": "ATG",
        "Argentina": "ARG",
        "Armenia": "ARM",
        "Aruba": "ABW",
        "Australia": "AUS",
        "Austria": "AUT",
        "Azerbaijan": "AZE",
        "Bahamas (the)": "BHS",
        "Bahrain": "BHR",
        "Bangladesh": "BGD",
        "Barbados": "BRB",
        "Belarus": "BLR",
        "Belgium": "BEL",
        "Belize": "BLZ",
        "Benin": "BEN",
        "Bermuda": "BMU",
        "Bhutan": "BTN",
        "Bolivia (Plurinational State of)": "BOL",
        "Bonaire, Sint Eustatius and Saba": "BES",
        "Bosnia and Herzegovina": "BIH",
        "Botswana": "BWA",
        "Bouvet Island": "BVT",
        "Brazil": "BRA",
        "British Indian Ocean Territory (the)": "IOT",
        "Brunei Darussalam": "BRN",
        "Bulgaria": "BGR",
        "Burkina Faso": "BFA",
        "Burundi": "BDI",
        "Cabo Verde": "CPV",
        "Cambodia": "KHM",
        "Cameroon": "CMR",
        "Canada": "CAN",
        "Cayman Islands (the)": "CYM",
        "Central African Republic (the)": "CAF",
        "Chad": "TCD",
        "Chile": "CHL",
        "China": "CHN",
        "Christmas Island": "CXR",
        "Cocos (Keeling) Islands (the)": "CCK",
        "Colombia": "COL",
        "Comoros (the)": "COM",
        "Congo (the Democratic Republic of the)": "COD",
        "Congo (the)": "COG",
        "Cook Islands (the)": "COK",
        "Costa Rica": "CRI",
        "Croatia": "HRV",
        "Cuba": "CUB",
        "Curaçao": "CUW",
        "Cyprus": "CYP",
        "Czechia": "CZE",
        "Côte d'Ivoire": "CIV",
        "Denmark": "DNK",
        "Djibouti": "DJI",
        "Dominica": "DMA",
        "Dominican Republic (the)": "DOM",
        "Ecuador": "ECU",
        "Egypt": "EGY",
        "El Salvador": "SLV",
        "Equatorial Guinea": "GNQ",
        "Eritrea": "ERI",
        "Estonia": "EST",
        "Eswatini": "SWZ",
        "Ethiopia": "ETH",
        "Falkland Islands (the) [Malvinas]": "FLK",
        "Faroe Islands (the)": "FRO",
        "Fiji": "FJI",
        "Finland": "FIN",
        "France": "FRA",
        "French Guiana": "GUF",
        "French Polynesia": "PYF",
        "French Southern Territories (the)": "ATF",
        "Gabon": "GAB",
        "Gambia (the)": "GMB",
        "Georgia": "GEO",
        "Germany": "DEU",
        "Ghana": "GHA",
        "Gibraltar": "GIB",
        "Greece": "GRC",
        "Greenland": "GRL",
        "Grenada": "GRD",
        "Guadeloupe": "GLP",
        "Guam": "GUM",
        "Guatemala": "GTM",
        "Guernsey": "GGY",
        "Guinea": "GIN",
        "Guinea-Bissau": "GNB",
        "Guyana": "GUY",
        "Haiti": "HTI",
        "Heard Island and McDonald Islands": "HMD",
        "Holy See (the)": "VAT",
        "Honduras": "HND",
        "Hong Kong": "HKG",
        "Hungary": "HUN",
        "Iceland": "ISL",
        "India": "IND",
        "Indonesia": "IDN",
        "Iran (Islamic Republic of)": "IRN",
        "Iraq": "IRQ",
        "Ireland": "IRL",
        "Isle of Man": "IMN",
        "Israel": "ISR",
        "Italy": "ITA",
        "Jamaica": "JAM",
        "Japan": "JPN",
        "Jersey": "JEY",
        "Jordan": "JOR",
        "Kazakhstan": "KAZ",
        "Kenya": "KEN",
        "Kiribati": "KIR",
        "Korea (the Democratic People's Republic of)": "PRK",
        "Korea (the Republic of)": "KOR",
        "Kuwait": "KWT",
        "Kyrgyzstan": "KGZ",
        "Lao People's Democratic Republic (the)": "LAO",
        "Latvia": "LVA",
        "Lebanon": "LBN",
        "Lesotho": "LSO",
        "Liberia": "LBR",
        "Libya": "LBY",
        "Liechtenstein": "LIE",
        "Lithuania": "LTU",
        "Luxembourg": "LUX",
        "Macao": "MAC",
        "Madagascar": "MDG",
        "Malawi": "MWI",
        "Malaysia": "MYS",
        "Maldives": "MDV",
        "Mali": "MLI",
        "Malta": "MLT",
        "Marshall Islands (the)": "MHL",
        "Martinique": "MTQ",
        "Mauritania": "MRT",
        "Mauritius": "MUS",
        "Mayotte": "MYT",
        "Mexico": "MEX",
        "Micronesia (Federated States of)": "FSM",
        "Moldova (the Republic of)": "MDA",
        "Monaco": "MCO",
        "Mongolia": "MNG",
        "Montenegro": "MNE",
        "Montserrat": "MSR",
        "Morocco": "MAR",
        "Mozambique": "MOZ",
        "Myanmar": "MMR",
        "Namibia": "NAM",
        "Nauru": "NRU",
        "Nepal": "NPL",
        "Netherlands (the)": "NLD",
        "New Caledonia": "NCL",
        "New Zealand": "NZL",
        "Nicaragua": "NIC",
        "Niger (the)": "NER",
        "Nigeria": "NGA",
        "Niue": "NIU",
        "Norfolk Island": "NFK",
        "Northern Mariana Islands (the)": "MNP",
        "Norway": "NOR",
        "Oman": "OMN",
        "Pakistan": "PAK",
        "Palau": "PLW",
        "Palestine, State of": "PSE",
        "Panama": "PAN",
        "Papua New Guinea": "PNG",
        "Paraguay": "PRY",
        "Peru": "PER",
        "Philippines (the)": "PHL",
        "Pitcairn": "PCN",
        "Poland": "POL",
        "Portugal": "PRT",
        "Puerto Rico": "PRI",
        "Qatar": "QAT",
        "Republic of North Macedonia": "MKD",
        "Romania": "ROU",
        "Russian Federation (the)": "RUS",
        "Rwanda": "RWA",
        "Réunion": "REU",
        "Saint Barthélemy": "BLM",
        "Saint Helena, Ascension and Tristan da Cunha": "SHN",
        "Saint Kitts and Nevis": "KNA",
        "Saint Lucia": "LCA",
        "Saint Martin (French part)": "MAF",
        "Saint Pierre and Miquelon": "SPM",
        "Saint Vincent and the Grenadines": "VCT",
        "Samoa": "WSM",
        "San Marino": "SMR",
        "Sao Tome and Principe": "STP",
        "Saudi Arabia": "SAU",
        "Senegal": "SEN",
        "Serbia": "SRB",
        "Seychelles": "SYC",
        "Sierra Leone": "SLE",
        "Singapore": "SGP",
        "Sint Maarten (Dutch part)": "SXM",
        "Slovakia": "SVK",
        "Slovenia": "SVN",
        "Solomon Islands": "SLB",
        "Somalia": "SOM",
        "South Africa": "ZAF",
        "South Georgia and the South Sandwich Islands": "SGS",
        "South Sudan": "SSD",
        "Spain": "ESP",
        "Sri Lanka": "LKA",
        "Sudan (the)": "SDN",
        "Suriname": "SUR",
        "Svalbard and Jan Mayen": "SJM",
        "Sweden": "SWE",
        "Switzerland": "CHE",
        "Syrian Arab Republic": "SYR",
        "Taiwan (Province of China)": "TWN",
        "Tajikistan": "TJK",
        "Tanzania, United Republic of": "TZA",
        "Thailand": "THA",
        "Timor-Leste": "TLS",
        "Togo": "TGO",
        "Tokelau": "TKL",
        "Tonga": "TON",
        "Trinidad and Tobago": "TTO",
        "Tunisia": "TUN",
        "Turkey": "TUR",
        "Turkmenistan": "TKM",
        "Turks and Caicos Islands (the)": "TCA",
        "Tuvalu": "TUV",
        "Uganda": "UGA",
        "Ukraine": "UKR",
        "United Arab Emirates (the)": "ARE",
        "United Kingdom of Great Britain and Northern Ireland (the)": "GBR",
        "United States Minor Outlying Islands (the)": "UMI",
        "United States of America (the)": "USA",
        "Uruguay": "URY",
        "Uzbekistan": "UZB",
        "Vanuatu": "VUT",
        "Venezuela (Bolivarian Republic of)": "VEN",
        "Viet Nam": "VNM",
        "Virgin Islands (British)": "VGB",
        "Virgin Islands (U.S.)": "VIR",
        "Wallis and Futuna": "WLF",
        "Western Sahara": "ESH",
        "Yemen": "YEM",
        "Zambia": "ZMB",
        "Zimbabwe": "ZWE",
        "Åland Islands": "ALA"
      ]
}
