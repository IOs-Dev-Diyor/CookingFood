//
//  AppDelegate.swift
//  Esca Sanitatis
//
//  Created by Shohzod Rajabov on 30/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let vc = ViewController()
//        let nav = UINavigationController(rootViewController: vc)
//        window?.rootViewController = nav
//        window?.makeKeyAndVisible()
        
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.makeKeyAndVisible()
        let vc = TabBarVc()
        let navVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = navVC
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
        } else {
            // Fallback on earlier versions
        }
        
        return true
    }
}

