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
    
    
    //    func sandboxPlayground() {
    //        let fm = FileManager.default
    //        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
    //        let url = urls.last?.appendingPathComponent("file.txt")
    //
    //        do {
    //            try "Hi There!".write(to: url!, atomically: true, encoding: String.Encoding.utf8)
    //        } catch {
    //            print("Error while writing")
    //        }
    //
    //        do {
    //            let content = try String(contentsOf: url!, encoding: String.Encoding.utf8)
    //            print (url!)
    //            print (content)
    //        } catch {
    //            print("Something went wrong")
    //        }
    //    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        checkIfFirstLaunch()
        //        sandboxPlayground()
        return true
    }
}

