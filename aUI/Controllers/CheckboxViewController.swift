//
//  CheckboxViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 4/5/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit
import Checkbox

class CheckboxViewController: UIViewController {
    @IBOutlet weak var checkbox: Checkbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gesture"
    }
}
