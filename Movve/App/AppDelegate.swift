//
//  AppDelegate.swift
//  Movve
//
//  Created by Fed on 08.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        let navController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
