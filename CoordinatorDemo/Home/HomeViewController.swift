//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:05
// *************************************************
//

import UIKit

class HomeViewController: UIViewController {
    var coordinator: HomeCoordinator?

    let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(loginBtn)
        loginBtn.frame = .init(x: 100, y: 100, width: 100, height: 50)
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(userDidLogin),
                                               name: NSNotification.Name("UserDidLogin"),
                                               object: nil)
    }

    @objc func userDidLogin(notification _: Notification) {
        debugPrint(" 更新UI为“已登录”状态")
    }

    @objc func loginButtonTapped() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator?.presentLogin()
    }
}
