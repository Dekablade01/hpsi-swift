//
//  SymbolInfo.swift
//  Alamofire
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

struct SymbolInfo: Decodable {
    
    enum Status {
        case preTrading, trading, postTrading, endOfday, halt, auctionMatch, `break`
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case baseAsset
        case baseAssetPrecision
        case quoteAsset
        case quotePrecision
        case orderTypes
        case icebergAllowed
        case filters
    }
    
    var symbol: String { return baseAsset + quoteAsset }
    var status: Status
    var baseAsset: String
    var quoteAsset: String
    var baseAssetPrecision: Int
    var quotePrecision: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let statusString = try container.decode(String.self, forKey: .status)
        
        switch statusString {
        case "PRE_TRADING":     status = .preTrading
        case "TRADING":         status = .trading
        case "POST_TRADING":    status = .postTrading
        case "END_OF_DAY":      status = .endOfday
        case "HALT":            status = .halt
        case "AUCTION_MATCH":   status = .auctionMatch
        case "BREAK":           status = .break
        default:                status = .break
        }
        
        baseAsset = try container.decode(String.self, forKey: .baseAsset)
        quoteAsset = try container.decode(String.self, forKey: .quoteAsset)
        
        baseAssetPrecision = try container.decode(Int.self, forKey: .baseAssetPrecision)
        quotePrecision = try container.decode(Int.self, forKey: .quotePrecision)
        
    }
}
