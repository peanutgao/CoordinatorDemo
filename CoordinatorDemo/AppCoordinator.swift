//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:03
// *************************************************
//

import UIKit

// MARK: - AppCoordinator

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let window: UIWindow
    let tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .lightGray
        return tabBarController
    }()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        tabBarController.viewControllers = buildTabBarControllers()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    /// show login page by global module
    func presentLogin() {
        let loginCoordinator = LoginCoordinator(presentingViewController: tabBarController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }

    func userDidLogin() {
        NotificationCenter.default.post(name: Notification.Name("UserDidLogin"), object: nil)
        UserDefaults.standard.setValue("1", forKey: "isLoggedIn")
    }

    func logout() {
        // 登出时重置所有相关的导航控制器
        if let viewControllers = tabBarController.viewControllers {
            for viewController in viewControllers {
                if let navigationController = viewController as? UINavigationController {
                    navigationController.popToRootViewController(animated: false)
                }
            }
        }

        NotificationCenter.default.post(name: Notification.Name("UserDidlogout"), object: nil)
        UserDefaults.standard.setValue("0", forKey: "isLoggedIn")
        tabBarController.selectedIndex = 0
        presentLogin()
    }
}

private extension AppCoordinator {
    func buildTabBarControllers() -> [UIViewController] {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

        childCoordinators.append(homeCoordinator)
        childCoordinators.append(profileCoordinator)

        homeCoordinator.start()
        profileCoordinator.start()

        return [homeNavigationController, profileNavigationController]
    }
}
