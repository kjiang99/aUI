//
//  ZipCodeTextFieldDelegate.swift
//  aUI
//
//  Created by Haojun Jiang on 1/1/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    //DTMF Tones
    let DEFAULT_TONE = 1000;
    let DTMF_TONE_0 = 1200;
    let DTMF_TONE_1 = 1201;
    let DTMF_TONE_2 = 1202;
    let DTMF_TONE_3 = 1203;
    let DTMF_TONE_4 = 1204;
    let DTMF_TONE_5 = 1205;
    let DTMF_TONE_6 = 1206;
    let DTMF_TONE_7 = 1207;
    let DTMF_TONE_8 = 1208;
    let DTMF_TONE_9 = 1209;
    let DTMF_TONE_STAR = 1210;
    let DTMF_TONE_POUND = 1211;
    
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if(!string.isEmpty) {
        switch (string) {
            case "0":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_0))
            case "1":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_1))
            case "2":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_2))
            case "3":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_3))
            case "4":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_4))
            case "5":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_5))
            case "6":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_6))
            case "7":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_7))
            case "8":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_8))
            case "9":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_9))
            case "*":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_STAR))
            case "#":
                AudioServicesPlaySystemSound(SystemSoundID(DTMF_TONE_POUND))
            default:
                break
        }
    }
    
    var newText = textField.text! as NSString
    newText = newText.replacingCharacters(in: range, with: string) as NSString
    
    return newText.length <= 5
  }
}
