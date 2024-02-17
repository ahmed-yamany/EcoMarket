//
//  AlertItem.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 17/02/2024.
//

import UIKit

public struct AlertItem {
    let message: String
    let buttonTitle: String
    let image: UIImage?
    let status: AlertStatus
    var buttonAction: ActionHandler?
}
