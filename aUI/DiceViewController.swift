//
//  DiceViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/27/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    var firstValue: Int?
    var secondValue: Int?
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstValue = self.firstValue {
            self.firstDice.image = UIImage(named: "d\(firstValue)")
        } else {
            self.firstDice.image = nil
        }
        
        if let secondValue = self.secondValue {
            self.secondDice.image = UIImage (named: "d\(secondValue)")
        } else {
            self.secondDice.image = nil
        }
        
        self.firstDice.alpha = 0
        self.secondDice.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2) {
            self.firstDice.alpha = 1
            self.secondDice.alpha = 1
        }
    }
    
    var count  = 0
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.frame = CGRect.init(x: 120, y: 503, width: 150, height: 150)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        
        let button = UIButton()
        button.frame = CGRect.init(x: 120, y: 580, width: 80, height: 60)
        button.setTitle("codeClick", for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(self.incrementCount), for: UIControlEvents.touchUpInside)
    }

    
    @IBOutlet weak var uiLabel: UILabel!
    
    @IBAction func uiIncreamentCount () {
        self.count = self.count + 1
        self.uiLabel.text = "\(self.count)"
    }
    
    
    @objc func incrementCount () {
        self.count = self.count + 1
        self.label.text = "\(self.count)"
    }
    
    
    @IBAction func dismiss () {
        self.dismiss(animated: true, completion: nil)
    }
}
