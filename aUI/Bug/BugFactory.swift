//
//  BugFactory.swift
//  aUI
//
//  Created by Haojun Jiang on 1/2/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit
import Foundation



class BugFactory {
    
    // MARK: Properties
    
    static let bugTints: [UIColor] = [.black, .brightBlueColor, .brightRedColor, .brightGreenColor]
    static let shakeRotations = [Double.pi/16, Double.pi/8, Double.pi/8, Double.pi/24]
    static let shakeDurations = [0.3, 3.0, 0.1, 0.5]
    static let bugSize = CGSize(width: 128, height: 128)
    
    enum BugType: Int {
        case basic, slow, fast, smooth
    }
    
    var currentBugType = BugType.basic
    
    // MARK: Create Bug
    
    func createBug() -> UIImageView {
        let bug = UIImageView(frame: CGRect(x: -100, y: -100, width: 128, height: 128))
        bug.image = UIImage(named: "spider")
        bug.tintColor = BugFactory.bugTints[currentBugType.rawValue]
        
        // add simple "shake" key-frame animation
        // for explanation, see http://www.objc.io/issue-12/animations-explained.html
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.toValue = 0.0
        shakeAnimation.fromValue = BugFactory.shakeRotations[currentBugType.rawValue] //Rotate degree
        shakeAnimation.duration = BugFactory.shakeDurations[currentBugType.rawValue] //Rotate speed
        shakeAnimation.repeatCount = Float.infinity
        shakeAnimation.autoreverses = true
        shakeAnimation.isRemovedOnCompletion = false
        bug.layer.add(shakeAnimation, forKey: "shake")
        
        return bug
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> BugFactory {
        
        struct Singleton {
            static var sharedInstance = BugFactory()
        }
        
        return Singleton.sharedInstance
    }
}


extension UIColor {
    open class var brightRedColor: UIColor {
        return UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    }
    open class var brightGreenColor: UIColor {
        return UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    }
    open class var brightBlueColor: UIColor {
        return UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
    }
}

