//
//  AppDelegate.swift
//  FBGroupsSwiftUI
//
//  Created by macbook on 2020/01/26.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        
        
        return true
    }



}

