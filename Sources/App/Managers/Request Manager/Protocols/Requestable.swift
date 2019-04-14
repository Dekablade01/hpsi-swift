//
//  Request.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//  Copyright © 2019 SwiftLovers.com. All rights reserved.
//

import Alamofire
import Foundation

protocol Requestable {
    
    var path: String { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: Any]? { get set }
    var headers: [String: String] { get set }
    var encoding: ParameterEncoding { get set }
            
}
