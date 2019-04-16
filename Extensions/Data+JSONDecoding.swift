//
//  Data+JSONDecoding.swift
//  App
//
//  Created by Issarapong Poesua on 16/4/19.
//

import Foundation
@testable import App

extension Data {
    
    func decode<T: Decodable>(to type: T.type) -> T {
        do {
            return try JSONDecoder().decode(type, from: self)
        } catch {
            fatalError("Fail to decode the mock data")
        }
    }
    
}
