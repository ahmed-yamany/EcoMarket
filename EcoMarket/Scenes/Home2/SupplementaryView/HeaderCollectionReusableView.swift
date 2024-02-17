//
//  HeaderCollectionReusableView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let elementKind = String("header")

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .h2
        titleLabel.textColor = AppColor.primaryText
        
        button.setTitleColor(AppColor.socialButton, for: .normal)
    }
    
    func setupHeader(title: String, buttonTitle: String) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
    }
    
}
