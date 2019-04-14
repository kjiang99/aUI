//
//  MaineViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/26/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentDeviceLabel.text = currentDevice()
        
        if UserDefaults.standard.bool(forKey: "redSwitchOn") {
            redSwitch.isOn = true
            changeColorComponent(redSwitch)
        }
    }
    
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    @IBAction func changeColorComponent (_ sender: Any) {
        let r: CGFloat = self.redSwitch.isOn ? 1 : 0
        let g: CGFloat = self.greenSwitch.isOn ? 1 : 0
        let b: CGFloat = self.blueSwitch.isOn ? 1 : 0
        self.colorView.backgroundColor = UIColor (red: r, green: g, blue: b, alpha: 1)
    }
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var colorView2: UIView!
    
    @IBAction func changeColorComponent2 (_ sender: Any) {
        let r: CGFloat = CGFloat (self.redSlider.value)
        let g: CGFloat = CGFloat (self.greenSlider.value)
        let b: CGFloat = CGFloat (self.blueSlider.value)
        let alpha: CGFloat = CGFloat (self.alphaSlider.value)
        self.colorView2.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    @IBAction func redSwitchFlipped(_ sender: Any) {
        if redSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "redSwitchOn")
        } else {
            UserDefaults.standard.set(false, forKey: "redSwitchOn")
        }
    }
    
    @IBOutlet weak var currentDeviceLabel: UILabel!
    
    @IBAction func testActivity(_ sender: Any){
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(nextController, animated: true, completion: nil)
    }
    
    
    @IBAction func testCancelAlert(_ sender: Any) {
        let nextController = UIAlertController()
        nextController.title = "Test Alert"
        nextController.message = "This is a test"
        
//        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.default, handler: {action in self.dismiss(animated: true, completion: nil)})
        
        nextController.addAction(cancelAction)
        self.present(nextController, animated: true, completion: nil)
    }
    
    
    @IBAction func rollTheDiceProg (_ sender: Any) {        
        let nextController = self.storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController
        
        nextController.firstValue = self.randomDiceValue()
        nextController.secondValue = self.randomDiceValue()
        
        self.present(nextController, animated: true, completion: nil)
    }
    
    func randomDiceValue () -> Int {
        let randomValue = 1 + arc4random() % 6
        return Int (randomValue)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rollDiceSegue" {
            if let nextController = segue.destination as? DiceViewController {
                nextController.firstValue = randomDiceValue()
                nextController.secondValue = randomDiceValue()
            }
        }
    }
    
    func currentDevice() -> String {
        var currentDevice = "current device is "
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        switch deviceIdiom {
        case .phone:
            currentDevice += "iPhone"
        case .pad:
            currentDevice += "iPad"
        default:
            currentDevice += "unknow"
        }
        return currentDevice
    }
}

