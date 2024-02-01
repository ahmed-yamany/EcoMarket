//
//  SearchView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import UIKit
@IBDesignable
class SearchView: UIView {
    static let viewID = String(describing: SearchView.self)

    // MARK: IBOutlet
    //
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImage: UIImageView!
    
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        applyStyling()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
        applyStyling()
    }
    
    // MARK: - UI Configurations
    //
    private func applyStyling() {
        /// TextField UI
        searchTextField.placeholder = L10n.Search.placeholder
        searchTextField.borderStyle = .none
        
        ///  SearchImage UI
        searchImage.tintColor = AppColor.primaryText
        searchImage.image = AppImage.searchImage
        
        /// View UI
        layer.cornerRadius = frame.height / 2
        backgroundColor = AppColor.searchbarBackground
    }

    private func loadFromNib() {
        guard let view = self.loadViewFromNib(nibName: SearchView.viewID) else { return }
        view.frame = self.bounds
        self.addSubview(view)
        }
}
