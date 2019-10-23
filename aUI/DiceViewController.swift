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
  let codeLabel: UILabel = {
    let codeLabel = UILabel()
    //codeLabel.translatesAutoresizingMaskIntoConstraints = false
    codeLabel.text = "0"
    codeLabel.sizeToFit()
    codeLabel.frame = CGRect.init(x: 120, y: 503, width: 150, height: 150)
    return codeLabel
  }()
  let codeButton: UIButton = {
    let codeButton = UIButton()
    //codeButton.translatesAutoresizingMaskIntoConstraints = false
    codeButton.setTitle("codeClick", for: .normal)
    codeButton.setTitleColor(.brown, for: .normal)
    codeButton.frame = CGRect.init(x: 120, y: 580, width: 80, height: 60)
    codeButton.addTarget(self, action: #selector(codeIncrementCount), for: UIControlEvents.touchUpInside)
    return codeButton
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(codeLabel)
    self.view.addSubview(codeButton)
  }
  
  
  @IBOutlet weak var uiLabel: UILabel!
  
  @IBAction func uiIncreamentCount () {
    self.count = self.count + 1
    self.uiLabel.text = "\(self.count)"
  }
  
  
  @objc func codeIncrementCount () {
    self.count = self.count + 1
    self.codeLabel.text = "\(self.count)"
  }
  
  
  @IBAction func dismiss () {
    self.dismiss(animated: true, completion: nil)
  }
}
