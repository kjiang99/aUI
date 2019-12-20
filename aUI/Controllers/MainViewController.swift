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
        self.title = "Main Menu"
    }
    
    
    @IBAction func testActivity(_ sender: Any){
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(nextController, animated: true, completion: nil)
    }
    
    
    @IBAction func testCancelAlert(_ sender: Any) {
       let alertController = UIAlertController(title: "ToDo Exchange", message: "Do you want to Host or Join a session?", preferredStyle: .actionSheet)
        
//        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func rollTheDiceProg (_ sender: Any) {        
        let nextController = self.storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController
        
        nextController.firstValue = self.randomDiceValue()
        nextController.secondValue = self.randomDiceValue()
        
        self.present(nextController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rollDiceSegue" {
            if let nextController = segue.destination as? DiceViewController {
                nextController.firstValue = randomDiceValue()
                nextController.secondValue = randomDiceValue()
            }
        }
    }
    
    
    func randomDiceValue () -> Int {
        let randomValue = 1 + arc4random() % 6
        return Int (randomValue)
    }
}

