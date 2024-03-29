//
//  CountryListRequest.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

class CountryListRequest: BaseRequest {
    
    override var url: URL? {
        let urlString = BaseService.countryListEndpoint
        return URL(string: urlString)
    }
}
