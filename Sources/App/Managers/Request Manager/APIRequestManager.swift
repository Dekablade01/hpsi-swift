//
//  APIRequestManager.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

final class APIRequestManager: RequestManager {
    
    var sessionManager: SessionManager
    
    init(retrier: RequestRetrier? = nil, adapter: RequestAdapter? = nil) {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        sessionManager = SessionManager(configuration: configuration)
        sessionManager.retrier = retrier
        sessionManager.adapter = adapter
    }
    
    func perform<T: Decodable>(_ requestable: Request<T>,
                               callback: Callback<(Swift.Result<T, Error>)>?) {
        perform(requestable, responseHandler: ResponseHandler<T>(), callback: callback)
    }
    
    func perform<T: Decodable>(_ requestable: CollectionRequest<T>,
                               callback: Callback<(Swift.Result<[T], Error>)>?) {
        perform(requestable, responseHandler: ResponseHandler<[T]>(), callback: callback)
    }
    
    private func perform<Handler: ResponseHandlable>(
        _ request: Requestable,
        responseHandler: Handler,
        callback: Callback<Swift.Result<Handler.ResponseType, Error>>?) {
        sessionManager
            .request(request.path,
                     method: request.method,
                     parameters: request.parameters,
                     encoding: request.encoding,
                     headers: request.headers)
            .responseData { responseHandler.handleResponse($0) { callback?($0) }
        }
    }
}

