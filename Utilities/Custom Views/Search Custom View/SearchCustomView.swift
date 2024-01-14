//
//  SearchCustomView.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit
@IBDesignable
class SearchCustomView: UIView {
    
    // MARK: - Variables
    
    static let viewID = String(describing: SearchCustomView.self)
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var searchIcon: UIImageView!
    // MARK: - LifeCycle
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Common Initialization
    
    private func commonInit() {
        loadFromNib()
        applyStyling()
    }
    
    // MARK: - Apply Styling Method
    
    private func applyStyling() {
        searchTextField.placeholder = "Search...."
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        filterButton.setImage(UIImage(named: "filtter"), for: .normal)
        mainView.layer.cornerRadius = 10
        filterButton.layer.cornerRadius = 10
    }
    
    // MARK: - Load From Nib
    
    private func loadFromNib() {
        guard let view = self.loadViewFromNib(nibName: SearchCustomView.viewID) else { return }
        view.frame = self.bounds
        self.addSubview(view)
        }
}
