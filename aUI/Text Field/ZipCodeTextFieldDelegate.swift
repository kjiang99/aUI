//
//  ZipCodeTextFieldDelegate.swift
//  aUI
//
//  Created by Haojun Jiang on 1/1/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length <= 5
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if text.count > 3 {
                textField.text = String(text.prefix(text.count - 3)) + "***"
            } else {
                textField.text = String(repeating: "*", count: text.count)
            }
        }
    }
}
