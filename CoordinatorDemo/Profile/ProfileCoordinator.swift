//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:07
// *************************************************
//

import UIKit

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ProfileViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func showSettings() {
        let settingVC = SettingsViewController()
        settingVC.coordinator = self
        settingVC.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(settingVC, animated: true)
    }

    /// handle the logout action
    func logout() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator?.logout()
    }
    
    func login() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator?.presentLogin()
    }
}
