//
//  OnboardingCustomPageControl.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

class ExtendedDotsPageControl: UIPageControl {
    
    let activeDotColor: UIColor = .red
    let inactiveDotColor: UIColor = .green
    let dotSize: CGSize = CGSize(width: 10, height: 10)
    
    let activeDotFrame = CGRect(origin: .zero, size: CGSize(width: 20, height: 6))
    let inActiveDotFrame = CGRect(origin: .zero, size: CGSize(width: 6, height: 6))
    
    lazy var activeView: UIView = {
        let view = UIView(frame: activeDotFrame)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = activeDotFrame.height / 2
        view.clipsToBounds = true
        view.alpha = 1
        view.setNeedsDisplay()
        view.layoutIfNeeded()
        return view
    }()
    lazy var inActiveView: UIView = {
        let view = UIView(frame: inActiveDotFrame)
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.5
        view.setNeedsDisplay()
        view.layoutIfNeeded()
        return view
    }()
    
    override var numberOfPages: Int {
        didSet {
            self.updateDots()
        }
    }
    override var currentPage: Int {
        didSet {
            self.updateDots()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateDots()
    }
    private func updateDots() {
        for(index, dotView) in subviews.enumerated() {
            
//            let newDot = UIView()
            
            if index == currentPage {
                dotView.addSubview(activeView)
                dotView.contentMode = .scaleAspectFill
            }else {
                dotView.addSubview(inActiveView)
                dotView.contentMode = .scaleAspectFill
            }
            
        }
    }
}


