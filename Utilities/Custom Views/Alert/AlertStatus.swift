//
//  AlertStatus.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 17/02/2024.
//

import Foundation

public enum AlertStatus {
    case success, warning, error
    
    var title: String {
        switch self {
            case .success: return "Success"
            case .warning: return "Warning"
            case .error: return "Error"
        }
    }
}
