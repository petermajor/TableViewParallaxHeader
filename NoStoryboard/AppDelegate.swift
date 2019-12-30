//
//  AppDelegate.swift
//  NoStoryboard
//
//  Created by Peter Major on 30/12/2019.
//  Copyright © 2019 majormojo.co.uk Limited. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = ViewController(nibName: "ViewController", bundle: nil)
        
        return true
    }
}
