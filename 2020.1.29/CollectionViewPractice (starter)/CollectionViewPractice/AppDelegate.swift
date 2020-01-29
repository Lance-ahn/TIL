//
//  AppDelegate.swift
//  CollectionViewPractice
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let vc = ViewController()
    
    let navigationViewController = UINavigationController(rootViewController: vc)
    window?.rootViewController = navigationViewController
    window?.makeKeyAndVisible()
    return true
  }



}

