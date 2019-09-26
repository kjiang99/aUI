//
//  CashTextFieldDelegate.swift
//  aUI
//
//  Created by Haojun Jiang on 1/1/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        let newTextString = String (newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        
        for c in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
        
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
        } else {
            newText = "$0.00"
        }
    
        textField.text = newText
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    

    private func dollarStringFromInt(_ value: Int) -> String {
        return String(value / 100)
    }
    
    
    private func centsStringFromInt(_ value: Int) -> String {
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
}
