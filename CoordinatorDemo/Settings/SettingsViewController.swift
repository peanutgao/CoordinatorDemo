//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:09
// *************************************************
//

import UIKit

class SettingsViewController: UIViewController {
    var coordinator: ProfileCoordinator?

    let logoutBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Logout", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()

    let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        logoutBtn.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        view.addSubview(logoutBtn)
        logoutBtn.frame = .init(x: 100, y: 100, width: 150, height: 50)

        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginBtn)
        loginBtn.frame = .init(x: 100, y: 170, width: 150, height: 50)
    }

    @objc func logoutButtonTapped() {
        coordinator?.logout()
    }

    @objc func loginButtonTapped() {
        coordinator?.login()
    }
}
