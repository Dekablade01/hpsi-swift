//
//  Request.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

struct Request<T: Decodable>: Requestable {
    
    typealias ResponseType = T
 
    var path: String
    
    var method: HTTPMethod
    
    var parameters: [String : Any]?
    
    var headers: [String : String]
    
    var encoding: ParameterEncoding
    
    init(path: String,
         method: HTTPMethod = .get,
         parameters: [String: Any]? = nil,
         headers: [String: String] = [:],
         encoding: ParameterEncoding = JSONEncoding.default) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
    }
    
    
}
