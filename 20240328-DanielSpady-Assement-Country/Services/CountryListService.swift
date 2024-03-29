//
//  CountryListService.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

class CountryListService: BaseService {
    @discardableResult static func countryListJSONObject(_ request: BaseRequest = BaseRequest(),
                                                         dispatchQueue: DispatchQueue? = BaseService.dispatchQueue,
                                                         completionHandler: @escaping (CountryListResponse) -> Void) -> URLSessionDataTask? {
        var task: URLSessionDataTask?
        
        task = BaseService.makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
            let response = CountryListResponse(request: request,
                                               result: CountryDataModel.fromJSON(data),
                                               task: task,
                                               data: data,
                                               response: response as? HTTPURLResponse,
                                               error: error)
            completionHandler(response)
        }
        
        task?.resume()
        
        return task
    }
}
