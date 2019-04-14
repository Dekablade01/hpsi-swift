//
//  ResponseHandlable.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

protocol ResponseHandlable {
    
    associatedtype ResponseType: Decodable
    
    func handleResponse(_ response: DataResponse<Data>,
                        callback: Callback<(Swift.Result<ResponseType, Error>)>?)
    
}

