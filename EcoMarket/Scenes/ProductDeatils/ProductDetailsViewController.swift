//
//  ProductDetailsViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    // MARK: - Outlets
    //
    @IBOutlet weak var stapper: CustomStapper!
    @IBOutlet weak var sizeView: CustomSizeView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addToCartButton: PrimaryButton!
    
    // MARK: - View Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSizeView()
        setupColorView()
        configureUI()
    }
    
    // MARK: - Private Methods
    //
    /// UI Configuration
    private func configureUI() {
        productImage.makeCustomShape()
        stapper.stapperDelegate = self
        setupLabelsUI()
        setupButtonsUI()
        setupdata()
    }
    
    private func setupLabelsUI() {
        // Labels Font
        productName.font = .h2
        productBrand.font = .regular
        titleLabel.font = .h2
        subtitleLabel.font = .regular
        subtitleLabel.font = .regular
        sizeLabel.font = .h2

        // Labels TextColor
        productBrand.textColor = AppColor.socialButton
        subtitleLabel.textColor = AppColor.socialButton
        
    }
    
    private func setupButtonsUI() {
        // Add To Cart Button UI
        addToCartButton.title = L10n.Product.Details.cart
        addToCartButton.setImage(AppImage.cartIcon, for: .normal)
        addToCartButton.tintColor = .white
        
        // Favourite Button UI
        favouriteButton.setImage(AppImage.favIcon, for: .normal)
        favouriteButton.setTitle("", for: .normal)
    }
    
    // MARK: - Data Setup
    //
    private func setupdata() {
        productImage.image = ProductModel.mockData.image
        productName.text = ProductModel.mockData.name
        productBrand.text = ProductModel.mockData.brand
        titleLabel.text = ProductModel.mockData.descriptionTitle
        subtitleLabel.text = ProductModel.mockData.description
        sizeLabel.text = ProductModel.mockData.sizeTitle
    }
    
    // MARK: - Setup Size and Color Views
    //
    private func setupSizeView() {
        sizeView.setSizes(ProductSize.allCases.map { $0.rawValue })
        sizeView.sizeDelegate = self
    }
    
    private func setupColorView() {
        colorView.setColors(ProductColor.allCases.map { $0.uiColor })
        colorView.delegate = self
    }
}

// MARK: - SizeViewDelegate
//
extension ProductDetailsViewController: SizeViewDelegate {
    func sizeView(didSelect size: String) {
        print(size)
    }
    
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String) {
        print(size)
    }
}

// MARK: - ColorViewDelegate
//
extension ProductDetailsViewController: ColorViewDelegate {
    func colorView(_ sizeView: ColorView, didSelect color: UIColor) {
        print(color)
    }
}

// MARK: - StapperDelegate
//
extension ProductDetailsViewController: StapperDelegate {
    func getCount(_ stapper: CustomStapper, for count: String) {
        print(count)
    }
}

// MARK: - UIView Extension
//
extension UIView {
    /// this function aims to create a custom shape for the product image
    func makeCustomShape() {
        // Set the corner radius for the rounded corners
        let cornerRadius: CGFloat = 20.0
        let deletedSpace: CGFloat = 60
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        // Move to the starting point and add a quadratic curve for the top-left corner
        path.move(to: CGPoint(x: bounds.minX, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, 
                                      y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.minX,
                                                y: bounds.minY))
        
        // Add a line and quadratic curve for the top-right corner
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, 
                                 y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, 
                                      y: cornerRadius),
                          controlPoint: CGPoint(x: bounds.maxX,
                                                y: bounds.minY))
        
        // Add a line and quadratic curve for the (bottom-right - space) corner
        path.addLine(to: CGPoint(x: bounds.maxX, 
                                 y: bounds.maxY - deletedSpace - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - cornerRadius, 
                                      y: bounds.maxY - deletedSpace),
                          controlPoint: CGPoint(x: bounds.maxX,
                                                y: bounds.maxY - deletedSpace))
        
        // Add a line and quadratic curve for the (bottom-right - space) corner
        path.addLine(to: CGPoint(x: bounds.maxX - deletedSpace, 
                                 y: bounds.maxY - deletedSpace))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - deletedSpace - cornerRadius, 
                                      y: bounds.maxY - deletedSpace + cornerRadius),
                          controlPoint: CGPoint(x: bounds.maxX - deletedSpace - cornerRadius,
                                                y: bounds.maxY - deletedSpace))
        
        // Add a line and quadratic curve for the bottom-right corner
        path.addLine(to: CGPoint(x: bounds.maxX - deletedSpace - cornerRadius, 
                                 y: bounds.maxY - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - deletedSpace - cornerRadius - cornerRadius, 
                                      y: bounds.maxY), 
                          controlPoint: CGPoint(x: bounds.maxX - deletedSpace - cornerRadius,
                                                y: bounds.maxY))
        
        // Add a line and quadratic curve for the bottom-left corner
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, 
                                 y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX,
                                      y: bounds.maxY - cornerRadius), 
                          controlPoint: CGPoint(x: bounds.minX,
                                                y: bounds.maxY))
        
        // Add a line to the top left corner
        path.addLine(to: CGPoint(x: bounds.minX, y: cornerRadius))
        
        path.close()
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
        layer.mask = shapeLayer
    }
}
