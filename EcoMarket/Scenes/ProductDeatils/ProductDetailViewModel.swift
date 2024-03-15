//
//  ProductDetailViewModel.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import UIKit
import Combine

class ProductDetailViewModel {
    
    let productDetailUseCase: ProductDetailRepositories
    private var cancellables: [String: AnyCancellable] = [:]
    
    @Published var product: Product {
        didSet {
            getTotalPrice()
        }
    }
    @Published var productDetail: ProductDetail = .mockData {
        didSet {
            getAvilableSizes()
        }
    }
    @Published var selectedSize: ProductSizes = .l {
        didSet {
            getAvilableColors()
        }
    }
    @Published var availableSizes: [ProductSizes] = [.m, .l, .xl]
    @Published var selectedColor: UIColor = .blue {
        didSet {
            getMaxAvilableProducts()
        }
    }
    @Published var availableColors: [UIColor] = [.blue]
    @Published var maxAvailableProduct: Int = 1 {
        didSet {
            currentStepperValue = 1
            getTotalPrice()
        }
    }
    @Published var currentStepperValue: Int = 1
    
    @Published var totalPrice: Double = 1
    
    var coordinator: DetailsCoordinatorProtocol
    init(
        product: Product,
        productDetailUseCase: ProductDetailRepositories,
        coordinator: DetailsCoordinatorProtocol
    ) {
        self.productDetailUseCase = productDetailUseCase
        self.product = product
        self.coordinator = coordinator
        updateProductDetail()
    }
    
    func updateProductDetail () {
        self.cancellables["productDetail"]?.cancel()
        productDetailUseCase.fetchProductDetail(by: product.id)
        let cancellable = AnyCancellable( productDetailUseCase.getProductDetail()
            .sink { [weak self] productDetail in
                self?.productDetail = productDetail
            })
        self.cancellables["productDetail"] = cancellable
    }
    
    private func getAvilableSizes () {
        self.cancellables["AvilableSizes"]?.cancel()
        let cancellable = AnyCancellable( productDetailUseCase.getAvilableSizes()
            .sink { [weak self] sizes in
                self?.availableSizes = sizes
                if let firstSize = sizes.first {
                    self?.selectedSize = firstSize
                }
            })
        self.cancellables["AvilableSizes"] = cancellable
    }
    
    private func getAvilableColors () {
        self.cancellables["AvilableColors"]?.cancel()
        let cancellable = AnyCancellable( productDetailUseCase.getAvilableColors(forSize: selectedSize)
            .sink { [weak self] colors in
                self?.availableColors = colors
                if let firstColor = colors.first {
                    self?.selectedColor = firstColor
                }
            })
        self.cancellables["AvilableColors"] = cancellable
    }
    
    private func getMaxAvilableProducts () {
        self.cancellables["MaxAvilableProducts"]?.cancel()
        let cancellable = AnyCancellable( productDetailUseCase.getMaxAvilableProducts(size: selectedSize, color: selectedColor)
            .sink { [weak self] maxAvilable in
                self?.maxAvailableProduct = maxAvilable
            })
        self.cancellables["MaxAvilableProducts"] = cancellable
    }
    
    private func getTotalPrice() {
        totalPrice = product.price * Double(currentStepperValue)
    }
    
    func addProductToCart() {
        Task {
            do {
                try await productDetailUseCase.addToCart(
                    productId: product.id,
                    count: currentStepperValue,
                    selectedColor: selectedColor,
                    selectedSize: selectedSize
                )
                coordinator.showAlert(item: .init(message: "Added To Cart", buttonTitle: "Ok", image: .success, status: .success))
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
