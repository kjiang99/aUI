//
//  EmojiTextFieldDelegate.swift
//  aUI
//
//  Created by Haojun Jiang on 12/31/17.
//  Copyright © 2017 Haojun Jiang. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {
    var translations = [String: String]()
    
    override init() {
        super.init()
        
        translations["qq"] = "\u{0001F472}"
        translations["ml"] = "\u{0001F487}"
//        translations["heart"] = "\u{0001F496}"
//        translations["fish"] = "\u{E522}"
//        translations["bird"] = "\u{E523}"
//        translations["frog"] = "\u{E531}"
//        translations["bear"] = "\u{E527}"
//        translations["dog"] = "\u{E052}"
//        translations["cat"] = "\u{E04F}"
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        for (emojiString, emoji) in translations {
            repeat {
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replacedAnEmoji = true
                }
            } while emojiStringRange.location != NSNotFound
        }
        
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

}
