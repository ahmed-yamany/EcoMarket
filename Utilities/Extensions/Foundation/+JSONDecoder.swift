//
//  +JSONDecoder.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 17/01/2024.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(forResource fileName: String) -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return try? decode(T.self, from: data)
    }
}
