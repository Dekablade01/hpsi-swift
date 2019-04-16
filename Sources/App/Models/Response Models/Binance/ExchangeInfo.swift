//
//  ExchangeInfo.swift
//  Alamofire
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

struct ExchangeInfo: Decodable {
    
    var serverTime: Date
    var symbols: [SymbolInfo]
    
    private enum CodingKeys: String, CodingKey {
        case symbol, serverTime
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        symbols = try container.decode([SymbolInfo].self, forKey: .symbol)
        
        let timeStamp = try container.decode(Double.self, forKey: .serverTime)
        serverTime = Date(timeIntervalSince1970: timeStamp)
    }
    
}
