//
//  AppDelegate.swift
//  ExpressBus
//
//  Created by macbook on 2020/01/08.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = FirstViewController()
        
        window?.rootViewController = firstVC
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

}

