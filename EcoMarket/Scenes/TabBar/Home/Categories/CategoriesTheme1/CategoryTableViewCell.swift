//
//  CategoryTableViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var productCount: UILabel!

    func setup(category: CategoryModel) {
        categoryImage.image = UIImage(named: category.image)
        categoryName.text = category.name
        productCount.text = category.productNumber
    }
}
