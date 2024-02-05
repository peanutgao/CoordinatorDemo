//
// *************************************************
// Created by Joseph Koh on 2024/2/5.
// Author: Joseph Koh
// Email: Joseph0750@gmail.com
// Create Time: 2024/2/5 16:08
// *************************************************
//

import UIKit

class ProfileViewController: UIViewController {
    var coordinator: ProfileCoordinator?


    let settingsBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go to Settings", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        settingsBtn.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)   
        view.addSubview(settingsBtn)
        settingsBtn.frame = .init(x: 100, y: 100, width: 150, height: 50)
    }

    @objc func settingsButtonTapped() {
        coordinator?.showSettings()
    }
}
