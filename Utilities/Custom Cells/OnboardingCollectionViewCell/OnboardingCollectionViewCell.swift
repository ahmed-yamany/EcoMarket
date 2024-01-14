//
//  OnboardingCollectionViewCell.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    private func initUI() {
        title.font = .systemFont(ofSize: 32, weight: .heavy)
        title.numberOfLines = 2
        subTitle.font = .systemFont(ofSize: 16, weight: .regular)
        subTitle.textColor = .darkGray
        subTitle.numberOfLines = 2
    }
    
    func setup(_ obj: Onboarding) {
        self.image.image = UIImage(named: obj.image)
        self.title.text = obj.title
        self.subTitle.text = obj.subtitle
    }

}
