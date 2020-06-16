//
//  ZipcodeTextFieldDelegate.swift
//  TextFielder
//
//  Created by Osama on 6/15/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation
import UIKit


class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // Only allow numebrs to be put into the text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 5
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        
        // Return true as long as string is below 5 digits OR if its empty
        return (newString.length <= maxLength && checkIfFromCharSet(string: string)) || string.isEmpty
    }
    
    
    // Check to make sure inputs are digits
    func checkIfFromCharSet(string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
           return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }

}
