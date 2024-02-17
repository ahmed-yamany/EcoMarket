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
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var buttonTitle: String? {
        get {""}
        set { button.setTitle(newValue, for: .normal)}
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .h2
        titleLabel.textColor = AppColor.primaryText
        
        button.setTitleColor(AppColor.socialButton, for: .normal)
    }
    
}
