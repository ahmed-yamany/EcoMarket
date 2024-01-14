//
//  LaunchViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 14/01/2024.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    private func initUI() {
        backgroundImage.image = UIImage.splash01
        logoImage.image = UIImage.logoVector
        backgroundImage.contentMode = .scaleAspectFill
        logoImage.contentMode = .scaleAspectFill
    }

}
