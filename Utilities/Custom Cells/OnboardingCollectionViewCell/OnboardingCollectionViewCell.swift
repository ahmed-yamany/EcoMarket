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
        // Initialization code
    }
    
    func setup(image: UIImage, title: String, subTittle: String){
        self.image.image = image
        self.title.text = title
        self.subTitle.text = subTittle
    }

}
