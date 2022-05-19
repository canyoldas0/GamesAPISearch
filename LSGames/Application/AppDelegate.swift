//
//  AppDelegate.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        setupTabbar()
       
        return true
    }
    
    private func setupTabbar() {
        let mainTabBar = MainTabBarBuilder.build()
        self.window?.rootViewController = mainTabBar
        self.window?.makeKeyAndVisible()
    }


}

