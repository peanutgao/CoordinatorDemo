//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:13
// *************************************************
//

import UIKit

class LoginViewController: UIViewController {
    var coordinator: LoginCoordinator?

    let nameTF = UITextField()
    let pwdTF = UITextField()
    let loginBtn = UIButton()
    let findPwdBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        nameTF.frame = .init(x: 100, y: 100, width: 200, height: 50)
        nameTF.placeholder = "usename"
        nameTF.text = "root"
        nameTF.borderStyle = .roundedRect
        view.addSubview(nameTF)

        pwdTF.frame = .init(x: 100, y: 160, width: 200, height: 50)
        pwdTF.placeholder = "password"
        pwdTF.text = "123456"
        pwdTF.borderStyle = .roundedRect
        view.addSubview(pwdTF)

        loginBtn.frame = .init(x: 100, y: 250, width: 200, height: 50)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .red
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginBtn)

        findPwdBtn.frame = .init(x: 100, y: 350, width: 200, height: 50)
        findPwdBtn.setTitle("Find Password", for: .normal)
        findPwdBtn.backgroundColor = .blue
        findPwdBtn.addTarget(self, action: #selector(findPwdButtonTapped), for: .touchUpInside)
        view.addSubview(findPwdBtn)

        // back button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backTapped)
        )
    }

    @objc func loginButtonTapped() {
        if nameTF.text == "root", pwdTF.text == "123456" {
            coordinator?.dismissLogin()
        }
    }

    @objc func findPwdButtonTapped() {
        coordinator?.showFindPassword()
    }

    @objc func backTapped() {
        let alert = UIAlertController(
            title: "Confirm",
            message: "Are you sure you want to go back?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            self.coordinator?.dismissLogin()
        }))
        present(alert, animated: true)
    }
}
