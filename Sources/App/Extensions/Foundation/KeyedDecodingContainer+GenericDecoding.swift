//
//  KeyedDecodingContainer+GenericDecoding.swift
//  App
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

extension KeyedDecodingContainer {
    
    func decode<T: Decodable>(key: Key) throws -> T {
        return try decode(T.self, forKey: key)
    }
    
    func decodeIfPresent<T: Decodable>(key: Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
    
}
