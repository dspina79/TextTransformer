//
//  ROT13.swift
//  TextTransformer
//
//  Created by Dave Spina on 3/22/21.
//

import Foundation

struct ROT13 {
    private static var key = [Character: Character]()
    
    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowercase = Array("abcdefghijklmnopqrstuvwxyz")
    
    static func string(_ string: String) -> String {
        if key.isEmpty {
            for i in 0..<26 {
                key[uppercase[i]] = uppercase[(i + 13) % 26]
                key[lowercase[i]] = lowercase[(i + 13) % 26]
            }
        }
        
        let transformed = string.map {key[$0, default: $0]}
        return String(transformed)
    }
}
