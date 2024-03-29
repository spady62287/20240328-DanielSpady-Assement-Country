//
//  CountryViewModel.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

struct CountryViewModel {
    let name: String?
    let region: String?
    let code: String?
    let capital: String?
    
    init(model: CountryDataModel) {
        self.name = model.name
        self.region = model.region
        self.code = model.code
        self.capital = model.capital
    }
}
