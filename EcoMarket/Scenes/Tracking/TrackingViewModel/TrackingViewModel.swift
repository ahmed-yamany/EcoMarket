//
//  TrackingViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 24/02/2024.
//

import Foundation

class TrackingViewModel {
    
    // MARK: - Properties
    let tracking = TrackingSection()
    @Published var shipping: [Shipping] = []
    
    var shippingJSON: [Shipping] {
        JSONDecoder().decode(forResource: "Shipping") ?? []
    }
    
    // MARK: - Public Methods
    func viewDidLoad() {
        fetchData()
    }
    
    // MARK: - Private Methods
    private func fetchData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.shipping = self.loadShippingData()
                self.updateTrackingSection()
            }
        }
    }
    
    private func loadShippingData() -> [Shipping] {
        JSONDecoder().decode(forResource: "Shipping") ?? []
    }
    
    private func updateTrackingSection() {
        tracking.items = shipping
    }
}
