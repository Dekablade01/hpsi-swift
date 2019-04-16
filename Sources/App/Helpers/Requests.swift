//
//  Requests.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

struct Requests {
    
    struct Binance {
        
        struct General {
            
            static var exchangeInfo: Request<ExchangeInfo> {
                return Request<ExchangeInfo>(path: Paths.Binance.General.exchangeInfo)
            }
            
        }
    }
    
}
