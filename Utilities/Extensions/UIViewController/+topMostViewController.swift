//
//  Created by Ahmed Yamany on 29/10/2023.
//

import UIKit

public extension UIViewController {
    // This function recursively searches for the topmost view controller.
    func topMostViewController() -> UIViewController {
        // If the current view controller has no presented view controller, it is the topmost one.
        if self.presentedViewController == nil {
            return self
        }
        // If the presented view controller is a UINavigationController, check for its visible view controller.
        if let navigation = self.presentedViewController as? UINavigationController,
           let visibleViewController = navigation.visibleViewController {
            return visibleViewController.topMostViewController()
        }
        // If the presented view controller is a UITabBarController, check its selected view controller.
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            // If no selected view controller is available, check the tab bar controller itself.
            return tab.topMostViewController()
        }
        // If none of the above conditions are met,
        // raise a fatal error with a message indicating that the presentedViewController is not found.
        guard let presentedViewController else {
            fatalError("Couldn't find presentedViewController for \(self.self) ")
        }
        // If none of the conditions above match, continue the search in the presented view controller.
        return presentedViewController.topMostViewController()
    }
}
