//
//  OtpStackViewController.swift
//  JammitUikit
//
//  Created by Apple on 02/05/2023.
//

import UIKit

import Foundation
import UIKit
import SwiftUI

protocol OTPDelegate: AnyObject {
    //always triggers when the OTP field is valid
    func didChangeValidity(isValid: Bool)
}


class OTPStackView: UIStackView {
    
    //Customise the OTPField here
    var numberOfFields:Int {
        didSet{
//            
            setupStackView()
            addOTPFields()
        }
    }
     
    var textFieldsCollection: [OTPTextField] = []
    weak var delegate: OTPDelegate?
    var showsWarningColor = false
    let inactiveFieldBorderColor = UIColor(white: 1, alpha: 0.3)
    let textBackgroundColor = UIColor.white
    let activeFieldBorderColor = UIColor.white
    var remainingStrStack: [String] = []
    
    required init(coder: NSCoder) {
            self.numberOfFields = 4// Default value for number of fields
            super.init(coder: coder)
            setupStackView()
            addOTPFields()
        }
        
        init(numberOfFields: Int) {
            self.numberOfFields = numberOfFields
            super.init(frame: .zero)
            setupStackView()
            addOTPFields()
        }
        
    //Customisation and setting stackView
    private final func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 8
    }
    
    //Adding each OTPfield to stack view
    private final func addOTPFields() {
     
        textFieldsCollection.removeAll()
        for index in 0..<numberOfFields{
            
            let field = OTPTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        textFieldsCollection[0].becomeFirstResponder()
    }
    
    //Customisation and setting OTPTextFields
    private final func setupTextField(_ textField: OTPTextField){
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 16).isActive = true
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font =  .systemFont(ofSize: 25)
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor =  Toncolors.grayColor?.cgColor
        textField.keyboardType = .phonePad
        textField.autocorrectionType = .yes
        textField.textContentType = .oneTimeCode
    }
    
    //checks if all the OTPfields are filled
    private final func checkForValidity(){
        for fields in textFieldsCollection{
            if (fields.text?.trimmingCharacters(in: CharacterSet.whitespaces) == ""){
                delegate?.didChangeValidity(isValid: false)
                return
            }
        }
        delegate?.didChangeValidity(isValid: true)
    }
    
    //gives the OTP text
    final func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }

    //set isWarningColor true for using it as a warning color
    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor){
        for textField in textFieldsCollection{
            textField.layer.borderColor = color.cgColor
        }
        showsWarningColor = isWarningColor
    }
    
    func clearCoins() {
        for textField in textFieldsCollection{
            DispatchQueue.main.async {
                textField.text = ""
                textField.layer.borderColor =  Toncolors.grayColor?.cgColor
                textField.backgroundColor = .white
            }
        }
        
    }
    
    //autofill textfield starting from first
    private final func autoFillTextField(with string: String) {
        remainingStrStack = string.reversed().compactMap{String($0)}
        for textField in textFieldsCollection {
            if let charToAdd = remainingStrStack.popLast() {
                textField.text = String(charToAdd)
            } else {
                break
            }
        }
        checkForValidity()
        remainingStrStack = []
    }
    
}

//MARK: - TextField Handling
extension OTPStackView: UITextFieldDelegate {
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
            setAllFieldColor(color: inactiveFieldBorderColor)
            showsWarningColor = false
        }
        if textField.text == "" {
            textField.backgroundColor  = .white
        }else {
            textField.backgroundColor  = .black
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            textField.backgroundColor  = .white
            // textField.layer.borderColor =  Color.white.cg
        }else {
            textField.backgroundColor  = .black
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
        if textField.text == "" {
            textField.backgroundColor  = .white
            // textField.layer.borderColor =  Color.white.cg
        }else {
            textField.backgroundColor  = .black
        }
        
    }
    
    //switches between OTPTextfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,
                   replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        } else {
            if (range.length == 0 && string == "") {
                return false
            } else if (range.length == 0){
                if textField.nextTextField == nil {
                    textField.text? = string
                    textField.resignFirstResponder()
                }else{
                    textField.text? = string
                    textField.nextTextField?.becomeFirstResponder()
                }
                return false
            }
            return true
        }
    }
    
}
