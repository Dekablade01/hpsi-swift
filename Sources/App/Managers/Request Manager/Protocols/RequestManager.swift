//
//  RequestManager.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

protocol RequestManager {
    
    var sessionManager: SessionManager { get }
    
    func perform<T>(_ requestable: Request<T>,
                    callback: Callback<(Swift.Result<T, Error>)>?)
    
    func perform<T>(_ requestable: CollectionRequest<T>,
                    callback: Callback<(Swift.Result<[T], Error>)>?)
    
}
