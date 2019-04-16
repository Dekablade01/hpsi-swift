//
//  Paths.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

struct Paths {
    
    struct Binance {
        
        private enum API {
            case v1, v3
            
            var baseURLString: String { return "https://api.binance.com" }
            
            var path: String {
                switch self {
                case .v1: return baseURLString + "/api/v1"
                case .v3: return baseURLString + "/api/v3"
                }
            }
        }
        
        struct General {

            static var exchangeInfo: String {
                return API.v1.path + "/exchangeInfo"
            }
            
        }
        
    }
    
}
