//
//  CountryTableViewCell.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 19/02/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var cellView: UIView!

    func setup(country: CountryModel){
        flagImage.image = UIImage(named: country.image)
        countryName.text = country.name
        
        setupUI()
    }
    
    private func setupUI(){
        flagImage.layer.cornerRadius = flagImage.bounds.width / 2
        flagImage.layer.masksToBounds = true
        flagImage.contentMode = .scaleAspectFill
        
        countryName.font = .regular
        countryName.textColor = AppColor.primaryText
        
        selectedButton.layer.borderColor = AppColor.primaryText.cgColor
        selectedButton.layer.borderWidth = 0.6
        selectedButton.layer.cornerRadius = selectedButton.bounds.width / 2
        selectedButton.layer.masksToBounds = true
        selectedButton.setTitle("", for: .normal)
        
//        cellView.layer.shadowRadius = 10
//        cellView.layer.shadowOpacity = 0.5
//        cellView.layer.shadowColor = AppColor.primaryText.cgColor
        
        cellView.layer.borderWidth = 0.3
        cellView.layer.borderColor = AppColor.primaryText.cgColor
        cellView.layer.cornerRadius = 10
    }
    
    
}

struct CountryModel: Codable{
    let name: String
    let image: String
}
