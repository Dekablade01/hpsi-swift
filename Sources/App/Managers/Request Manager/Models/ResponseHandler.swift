//
//  ResponseHandler.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

struct ResponseHandler<ObjectType: Decodable>: ResponseHandlable {
    
    typealias ResponseType = ObjectType
    
    func handleResponse(_ response: DataResponse<Data>,
                        callback: Callback<(Swift.Result<ResponseType, Error>)>?) {
        
        switch response.result {
        case .success(let data):
            do {
                let result = try decode(ResponseType.self, from: data)
                callback?(.success(result))
            } catch {
                // handle custom error
                // handle cannot decode
            }
            
        case .failure: break
            // handle http error
        }
    }
    
    private func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
    
}
