//
//  CountryListResponse.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

struct CountryListResponse: BaseResponse {
    var request: BaseRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: [CountryDataModel]?
    
    public init() {
        self.request = Request()
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
