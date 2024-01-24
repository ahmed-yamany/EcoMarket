//
//  ProductDetailsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var sizeView: CustomSizeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSizeView()
    }
    
    private func setupSizeView() {
        sizeView.setSizes(["S", "M", "L", "XL", "XXL"])
        sizeView.defaultColor = AppColor.backgroundColor
        sizeView.selectedColor = AppColor.primaryButton
        sizeView.delegate = self
    }
}

extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String) {
        print(size)
    }
}
