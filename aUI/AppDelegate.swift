//
//  AppDelegate.swift
//  aUI
//
//  Created by Haojun Jiang on 12/26/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func checkIfFirstLaunch() {        
        if UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
            print("App has launched before")
        } else {
            print("This is the first launch ever!")
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.set(false, forKey: "redSwitchOn")
            UserDefaults.standard.synchronize()
        }
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        checkIfFirstLaunch()
        //        sandboxPlayground()
        return true
    }
}

