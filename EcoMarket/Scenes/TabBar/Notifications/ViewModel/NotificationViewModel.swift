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
    let notificationSection = NotificationsSection()
    @Published var notifications: [Notification] = []
    var cancellable = Set<AnyCancellable>()
    let tabBarViewModelInterface: EMTabBarViewModelInterface
    
    init(tabBarViewModelInterface: EMTabBarViewModelInterface) {
        self.tabBarViewModelInterface = tabBarViewModelInterface
    }
    
    // MARK: - Public Methods
    func viewDidLoad() {
        bindNotifications()
    }
    
    // MARK: - Private Methods
    private func bindNotifications() {
        tabBarViewModelInterface
            .notificationsPublisher
            .sink { [weak self] notifications in
                self?.notifications = notifications
                self?.notificationSection.items = notifications
            }
            .store(in: &cancellable)
    }
}
