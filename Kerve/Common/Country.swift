//
//  Country.swif.swift
//  COVIDStats
//
//  Created by Aaron Baw on 20/12/2020.
//

import Foundation

enum Country: String, CaseIterable {
    
    case taiwan = "Taiwan"
    case virginIslands = "Virgin Islands"
    case réunion
    case ghana
    case yemen
    case costaRica = "Costa Rica"
    case ethiopia
    case australia
    case egypt
    case belgium
    case mayotte
    case sanMarino = "San Marino"
    case cameroon
    case svalbardAndJanMayen = "Svalbard and Jan Mayen"
    case turkey
    case luxembourg
    case angola
    case dominicanRepublic = "Dominican Republic"
    case timorleste
    case trinidadAndTobago = "Trinidad and Tobago"
    case unitedStatesMinorOutlyingIslands = "United States Minor Outlying Islands"
    case belize
    case kazakhstan
    case tokelau
    case malta
    case azerbaijan
    case afghanistan
    case equatorialGuinea = "Equitorial Guinea"
    case uzbekistan
    case isleOfMan
    case jersey
    case frenchPolynesia = "French Polynesia"
    case koreaDemocraticPeoplesRepublic = "Korea Democratic Peoples Republic"
    case westernSahara = "Western Sahara"
    case togo
    case congoDemocraticRepublicOf = "Democratic Republic of Congo"
    case iraq
    case micronesiaStates = "Micronesia States"
    case côteDivoire = "Côte Divoire"
    case latvia
    case finland
    case pakistan
    case tanzaniaUnitedRepublicOf = "United Republic of Tanzania"
    case iranRepublic = "Iran Republic"
    case uganda
    case tonga
    case eswatini
    case italy
    case iceland
    case spain
    case montenegro
    case hongKong
    case southGeorgiaAndTheSouthSandwichIslands = "Sough Georgia and the South Sandwich Islands"
    case fiji
    case libya
    case solomonIslands = "Solomon Islands"
    case honduras
    case rwanda
    case ukraine
    case vanuatu
    case laoPeoplesDemocraticRepublic = "Peoples Democratic Republic of Lao"
    case republicOfNorthMacedonia = "Republic of North Macedonia"
    case southAfrica = "South Africa"
    case algeria
    case ecuador
    case bhutan
    case myanmar
    case sudan
    case frenchGuiana = "French Guiana"
    case mauritius
    case norfolkIsland = "Noforlk Island'"
    case bosniaAndHerzegovina = "Bosnia and Herzegovina"
    case oman
    case tajikistan
    case caymanIslands = "Cayman Islands"
    case grenada
    case netherlands
    case newCaledonia = "New Caledonia"
    case madagascar
    case centralAfricanRepublic = "Central African Republic"
    case wallisAndFutuna = "Wallis and Futuna"
    case saintLucia
    case curaçao
    case cocosIslands = "Cocos Islands"
    case gambia
    case mali
    case martinique
    case bermuda
    case monaco
    case holySee
    case britishIndianOceanTerritory = "British Indian Ocean Territory"
    case suriname
    case malaysia
    case liechtenstein
    case saintKittsAndNevis = "Saint Kittis and Nevis"
    case montserrat
    case serbia
    case southSudan
    case unitedArabEmirates = "United Arab Emirates"
    case brazil
    case moldovaRepublic
    case nicaragua
    case japan
    case northernMarianaIslands = "Northern Mariana Islands"
    case bonaireSintEustatiusAndSaba = "Bonaire, Sint Eustatius and Saba"
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
    case koreaRepublic = "Korea Republic"
    case kuwait
    case qatar
    case chad
    case gabon
    case senegal
    case philippines
    case colombia
    case saintBarthélemy
    case cuba
    case saintVincentAndTheGrenadines = "Saint Vincent and The Grenadines"
    case argentina
    case guatemala
    case israel
    case saintPierreAndMiquelon = "Saint Pierre and Miquelon"
    case americanSamoa = "American Samoa"
    case morocco
    case nepal
    case portugal
    case maldives
    case cookIslands = "Cook Islands"
    case guadeloupe
    case greece
    case romania
    case zambia
    case lebanon
    case unitedStates = "United States"
    case croatia
    case heardIslandAndMcdonaldIslands = "Heard Island and Mcdonald Islands"
    case guam
    case marshallIslands = "Marshall Islands"
    case turksAndCaicosIslands = "Turks and Caicos Islands"
    case uruguay
    case benin
    case elSalvador = "El Salvador"
    case djibouti
    case sriLanka
    case greenland
    case kyrgyzstan
    case tuvalu
    case india
    case saoTomeAndPrincipe = "Sao Tome and Principe"
    case bahrain
    case christmasIsland = "Christmas Island"
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
    case venezuelaRepublic = "Venezuela Republic"
    case france
    case antarctica
    case palestineStateOf = "State of Palestine"
    case poland
    case frenchSouthernTerritories = "French Southern Territories"
    case falklandIslands = "Falkland Islands"
    case caboVerde = "Cabo Verde"
    case sierraLeone = "Seirra Leone"
    case ålandIslands = "Aland Islands"
    case denmark
    case andorra
    case gibraltar
    case puertoRico = "Puerto Rico"
    case austria
    case bruneiDarussalam = "Brunei Darussalam"
    case jamaica
    case somalia
    case bahamas
    case estonia
    case cyprus
    case newZealand = "New Zealand"
    case burundi
    case sweden
    case samoa
    case switzerland
    case macao
    case faroeIslands = "Faroe Islands"
    case indonesia
    case kenya
    case hungary
    case slovenia
    case dominica
    case niger
    case guineaBissau = "Guinea Bissau"
    case pitcairn
    case mauritania
    case paraguay
    case burkinaFaso
    case comoros
    case nauru
    case papuaNewGuinea = "Papua New Guinea"
    case boliviaState = "Bolivia State"
    case singapore
    case jordan
    case eritrea
    case norway
    case nigeria
    case saintHelena = "Saint Helena"
    case AscensionAndTristanDaCunha = "Ascension and Tristan Da Cunha"
    case zimbabwe
    case mozambique
    case palau
    case bulgaria
    case liberia
    case anguilla
    case barbados
    case antiguaAndBarbuda = "Antigua and Barbuda"
    case russianFederation = "Russian Federation"
    case saintMartin = "Stain Martin"
    case bouvetIsland = "Bouvet Island"
    case guinea
    case mongolia
    case belarus
    case aruba
    case lithuania
    case canada
    case germany
    case syrianArabRepublic = "Syrian Arab Republic"
    case niue
    case sintMaarten = "Sint Maarten"
    case vietnam
    case turkmenistan
    case malawi
    case namibia
    case unitedKingdom = "United Kingdom"
    case albania
    case saudiArabia = "Saudi Arabia"
    case haiti
    case unknown

    var description: String {
        self.rawValue.split(separator: " ").count > 1 ? self.rawValue : self.rawValue.capitalized
    }

    var code: String? {
        Self.countryToCodeMap[self.rawValue.capitalized]
    }

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

extension Country: Comparable {
    static func < (lhs: Country, rhs: Country) -> Bool {
        lhs.description < rhs.description
    }
}
