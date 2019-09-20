//
//  BugSettingsViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 1/2/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit

class BugSettingsViewController: UIViewController {
    
    let bugFactory = BugFactory.sharedInstance()
    

    @IBOutlet weak var currentBugTypeImageView: UIImageView!
    
    @IBAction func bugTypeSelected (_ sender: UIButton) {
        bugFactory.currentBugType = BugFactory.BugType (rawValue: Int(sender.tag))!
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBugTypeImageView.tintColor = BugFactory.bugTints[bugFactory.currentBugType.rawValue]
    }
}
