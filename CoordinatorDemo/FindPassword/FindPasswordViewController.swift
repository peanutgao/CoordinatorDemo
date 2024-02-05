//
//  FindPasswordViewController.swift
//  CoordinatorDemo
//
//  Created by Joseph Koh on 2024/2/5.
//

import UIKit

class FindPasswordViewController: UIViewController {
    let submitBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        submitBtn.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitBtn)
        submitBtn.frame = .init(x: 100, y: 100, width: 150, height: 50)
    }

    @objc func submitButtonTapped() {
//        coordinator?.showSettings()
    }
}
