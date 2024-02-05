//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:14
// *************************************************
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var presentingViewController: UIViewController
    var navigationController: UINavigationController?

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }

    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController = UINavigationController(rootViewController: loginVC)
        presentingViewController.present(navigationController!, animated: true, completion: nil)
    }

    func dismissLogin() {
        presentingViewController.dismiss(animated: true, completion: {
            (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator?.userDidLogin()
        })
    }

    
    func showFindPassword(){
        let findPasswordVC = FindPasswordViewController()
        navigationController?.pushViewController(findPasswordVC, animated: true)
    }
}
