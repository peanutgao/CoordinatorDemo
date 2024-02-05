//
//  AppDelegate.swift
//  CoordinatorDemo
//
//  Created by Joseph Koh on 2024/2/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        return true
    }

}

