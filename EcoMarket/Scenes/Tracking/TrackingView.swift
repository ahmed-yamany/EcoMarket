//
//  TrackingView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit

class TrackingView: UIStackView {
    
    private var views: [CustomView] = []
    
    var count: Int = 0 {
        didSet {
            addViews(count)
        }
    }
    
    private func addViews(_ count: Int) {
        removeAllSubViews()
        for _ in 0..<count - 1 {
            let viewToAdd = CustomView()
            layoutIfNeeded()
            addArrangedSubview(viewToAdd)
            views.append(viewToAdd)
        }
        
        distribution = .fillEqually
        
        let view = UIView()
        view.backgroundColor = .gray
        view.equalSizeConstraints(14)
        view.layer.cornerRadius = 7
        view.layoutIfNeeded()
        
        addSubview(view)
        view.centerYInSuperview()
        view.makeConstraints(trailingAnchor: trailingAnchor)
    }
    
    private func removeAllSubViews() {
        arrangedSubviews.forEach { view in
            self.removeArrangedSubview(view)
        }
    }
    
    func select(at index: Int) {
        for iii in 0...index {
            views[iii].selectLine()
            views[iii].selectCircule()
        }
        
        if index < views.count - 1 {
            views[index+1].selectCircule()
        } else {
            
        }
    }
}
