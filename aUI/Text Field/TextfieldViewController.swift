//
//  TextfieldViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/31/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import UIKit

class TextfieldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterCountLabel.isHidden = true
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        
        self.textField4.delegate = zipCodeDelegate
        self.textField5.delegate = cashTextFieldDelegate
        self.textField6.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        self.characterCountLabel.isHidden = newText.length == 0
        
        self.characterCountLabel.text = String (newText.length)
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func toggleTheTextEditor (_ sender: Any) {
        if !(sender as! UISwitch).isOn {
            self.textField6.resignFirstResponder()
        }
    }
}
