//
//  drawOnboardingShape.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 26/01/2024.
//

import UIKit

extension UIView {
    func drawOnboardingShape() {
        let cornerRadius: CGFloat = 25.0
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
                
        path.move(to: CGPoint(x: bounds.minX, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.minX, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, y: cornerRadius),
                          controlPoint: CGPoint(x: bounds.maxX, y: bounds.minY))
        
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - 50 - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.maxY - 45),
                          controlPoint: CGPoint(x: bounds.maxX, y: bounds.maxY - 50))
        
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX, y: bounds.maxY - cornerRadius),
                          controlPoint: CGPoint(x: bounds.minX, y: bounds.maxY))
        
        path.addLine(to: CGPoint(x: bounds.minX, y: cornerRadius))
        
        path.close()
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
        layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.red.cgColor
    }
}
