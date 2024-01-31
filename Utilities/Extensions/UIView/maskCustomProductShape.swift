//
//  maskCustomProductShape.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 28/01/2024.
//

import UIKit

extension UIView {
    func maskCustomProductShape() {
        let cornerRadius: CGFloat = 20.0
        let deleteSpaceX: CGFloat = 80
        let deleteSpaceY: CGFloat = 60
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: bounds.minX, y: bounds.minY + cornerRadius))
        
        path.addQuadCurve(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.minX, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, y: bounds.minY + cornerRadius),
                          controlPoint: CGPoint(x: bounds.maxX, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - deleteSpaceY - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY - deleteSpaceY),
                          controlPoint: CGPoint(x: bounds.maxX, y: bounds.maxY - deleteSpaceY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - deleteSpaceX + cornerRadius, y: bounds.maxY - deleteSpaceY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - deleteSpaceX, y: bounds.maxY - deleteSpaceY + cornerRadius),
                          controlPoint: CGPoint(x: bounds.maxX - deleteSpaceX, y: bounds.maxY - deleteSpaceY))
            
        path.addLine(to: CGPoint(x: bounds.maxX - deleteSpaceX, y: bounds.maxY - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - deleteSpaceX - cornerRadius, y: bounds.maxY),
                          controlPoint: CGPoint(x: bounds.maxX - deleteSpaceX, y: bounds.maxY))
            
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX, y: bounds.maxY - cornerRadius),
                          controlPoint: CGPoint(x: bounds.minX, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY + cornerRadius))
        
        path.close()
        shapeLayer.path = path.cgPath
        layer.masksToBounds = true
        layer.mask = shapeLayer
    }
}
