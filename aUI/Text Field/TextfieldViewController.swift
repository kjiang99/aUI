//
//  TextfieldViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/31/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import UIKit

class TextfieldViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField3CountLabel: UILabel!
    @IBOutlet weak var textField3TextLabel: UILabel!
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    @IBAction func toggleTheTextEditor (_ sender: Any) {
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField3CountLabel.isHidden = true
        self.textField3TextLabel.isHidden = true
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        self.textField4.delegate = zipCodeDelegate
        self.textField5.delegate = cashTextFieldDelegate
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTouch))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTapTouch(sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func addCustomAlert (_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let alertController = storyboard.instantiateViewController(withIdentifier: "ChildViewController1") as? ChildViewController1 {
            alertController.onCancelButtonTapped = { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
            alertController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            alertController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


extension TextfieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        self.textField3CountLabel.isHidden = newText.length == 0
        self.textField3CountLabel.text = String (newText.length)
        
        self.textField3TextLabel.isHidden = newText.length == 0
        self.textField3TextLabel.text = String(newText)
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}

