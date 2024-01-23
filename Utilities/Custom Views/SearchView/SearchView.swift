//
//  SearchView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/01/2024.
//

import UIKit
@IBDesignable
class SearchView: UIView {

    // MARK: IBOutlet
    //
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImage: UIImageView!
    
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        applyStyling()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
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
}

private extension SearchView {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
    func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
