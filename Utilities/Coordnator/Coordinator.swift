//
//  Coordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import UIKit

protocol Coordinator {
    var router: Router { get }
    
    func start()
}

extension Coordinator {
    func dismiss() {
        router.dismiss(animated: true)
    }
}
