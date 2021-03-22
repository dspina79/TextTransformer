//
//  ZalgoCharacters.swift
//  TextTransformer
//
//  Created by Dave Spina on 3/21/21.
//

import Foundation

struct ZalgoCharacters: Codable {
    let above: [String]
    let inline: [String]
    let below: [String]
    
    init() {
        let url = Bundle.main.url(forResource: "zalgo", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        self = try! decoder.decode(ZalgoCharacters.self, from: data)
    }
}
