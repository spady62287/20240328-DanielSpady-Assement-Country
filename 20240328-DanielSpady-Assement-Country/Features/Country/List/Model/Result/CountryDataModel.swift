//
//  CountryDataModel.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

struct CountryDataModel: BaseCodable {
    let code: String?
    let capital: String?
    let currency: CountryCurrencyDataModel?
    let flag: String?
    let language: CountryLanguageDataModel?
    let name: String?
    let region: String?
}

struct CountryCurrencyDataModel: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct CountryLanguageDataModel: Codable {
    let code: String?
    let name: String?
}

/*
 // Example JSON Model
 {
   "capital": "Saint John's",
   "code": "AG",
   "currency": {
     "code": "XCD",
     "name": "East Caribbean dollar",
     "symbol": "$"
   },
   "flag": "https://restcountries.eu/data/atg.svg",
   "language": {
     "code": "en",
     "name": "English"
   },
   "name": "Antigua and Barbuda",
   "region": "NA"
 },
*/
