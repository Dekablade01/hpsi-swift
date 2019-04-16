//
//  String+UTF8Data.swift
//  AppTests
//
//  Created by Issarapong Poesua on 14/4/19.
//

import Foundation

extension String {
    
    var utf8Data: Data { return Data(utf8) }
}
