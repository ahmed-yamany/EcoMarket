//
//  Model.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

enum ProductSize: String, CaseIterable {
    case small = "S"
    case medium = "M"
    case large = "L"
    case extraLarge = "XL"
    case doubleExtraLarge = "XXL"
}

enum ProductColor: CaseIterable {
    case productColor1
    case productColor2
    case productColor3
    case productColor4

    var uiColor: UIColor {
        switch self {
        case .productColor1: return AppColor.productColor1
        case .productColor2: return AppColor.productColor2
        case .productColor3: return AppColor.productColor3
        case .productColor4: return AppColor.productColor4
        }
    }
}
