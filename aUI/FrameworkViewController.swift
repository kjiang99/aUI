//
//  FrameworkViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 4/5/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit
import Checkbox

class FrameworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var checkbox: Checkbox!

    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view else {
            return
        }
        
        let translation = recognizer.translation(in: view)
        recognizerView.center.x += translation.x
        recognizerView.center.y += translation.y
        recognizer.setTranslation(.zero, in: view)
    }

}
