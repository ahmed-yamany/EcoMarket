//
//  ProductDetailsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var sizeView: CustomSizeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSizeView()
        setupColorView()
    }
    
    private func setupSizeView() {
        sizeView.setSizes(["S", "M", "L", "XL", "XXL"])
        sizeView.defaultColor = AppColor.backgroundColor
        sizeView.selectedColor = AppColor.primaryButton
        sizeView.delegate = self
    }
    
    private func setupColorView() {
        colorView.setColors([AppColor.productColor1,
                             AppColor.productColor2,
                             AppColor.productColor3,
                             AppColor.productColor4])
        colorView.delegate = self
    }
}

extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String) {
        print(size)
    }
}

extension ProductDetailsViewController: ColorViewDelegate {
    func colorView(_ sizeView: ColorView, didSelect color: UIColor) {
        print(color)
    }
}
