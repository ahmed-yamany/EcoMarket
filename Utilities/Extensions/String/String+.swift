//
//  String+.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit

extension String {
    mutating func replace(by symbol: String, after minCount: Int) {
        var formattedDate = ""
        var index = self.startIndex
        
        while index < self.endIndex {
            let nextIndex = self.index(index, offsetBy: min(minCount, self.distance(from: index, to: self.endIndex)))
            formattedDate += String(self[index..<nextIndex])
            if nextIndex != self.endIndex {
                formattedDate += symbol
            }
            
            index = nextIndex
        }
        self = formattedDate
    }
}
