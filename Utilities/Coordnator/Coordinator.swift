//
//  Coordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import Foundation

protocol Coordinator {
    var router: Router { get }
    
    func start()
}
