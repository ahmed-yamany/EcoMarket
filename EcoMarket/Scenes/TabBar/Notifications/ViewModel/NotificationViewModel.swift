//
//  NotificationViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import Foundation
import Combine

class NotificationViewModel {
    // MARK: - Properties
        
    /// Published property holding the array of notifications.
    @Published var notifications: [NotificationModel] = []
    
    // MARK: - Public Methods
    //
    func viewDidLoad() {
        getData()
    }
    
    // MARK: - Private Methods
    //
    private func getData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 4) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.notifications = NotificationModel.mockData
            }
        }
    }
}
