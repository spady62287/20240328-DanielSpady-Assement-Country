//
//  BaseRequest.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import Foundation

class BaseRequest {
    var url: URL? {
        // NOTE: Implement this in subclasses
        return nil
    }

    var request: URLRequest? {
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            return request
        }
        
        return nil
    }
    
    var getRequest: URLRequest? {
        return request
    }
}
