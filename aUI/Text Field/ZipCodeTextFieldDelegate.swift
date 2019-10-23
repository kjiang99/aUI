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
      textField.text = text.maskStringWithDotsAtEnd(i: 3)
    }
  }
}

extension String {
  func maskStringWithDotsAtEnd (i: Int) -> String {
    var maskedString = ""
    let passwordDot = "\u{000025CF}" //●
    
    if i > 0 {
      if self.count > i {
        maskedString = String(self.prefix(self.count - i)) + String(repeating: passwordDot, count: i)
      }
      else {
        maskedString = String(repeating: passwordDot, count: self.count)
      }
    }
    
    return maskedString
  }
}
