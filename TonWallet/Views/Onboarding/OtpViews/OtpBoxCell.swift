//
//  OtpBoxCell.swift
//  JammitUikit
//
//  Created by Apple on 02/05/2023.
//

import UIKit

import Foundation
import UIKit

class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
    
}
