//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Joseph Koh on 2024/2/5.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
