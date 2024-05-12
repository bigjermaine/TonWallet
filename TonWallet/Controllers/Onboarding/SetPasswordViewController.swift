//
//  SetPsswordViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class SetPasswordViewController: UIViewController, OTPDelegate {
   
    private let  setPassWordImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tonhidePasswordImage")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var otpStackView = OTPStackView(numberOfFields: 4)
    private var otpStackView1 = OTPStackView(numberOfFields: 6)
    
    
    private let setPasswordLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Set a Passcode"
        label.clipsToBounds = true
        return label
    }()
    
    private let enterPasswordLabel :UILabel  = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the 4 digits in the passcode."
        label.clipsToBounds = true
        return label
    }()
    

    private let  skipForNowWalletButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Use 6-Digit Passcode", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.masksToBounds = true
        
        return button
    }()

    var check:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBackground()
        addSubview()
        configureConstraints()
        otpStackView.delegate = self
        otpStackView1.delegate = self
        
        setPassWordImageView.image = UIImage.gifImageWithName("password")
        skipForNowWalletButton.addTarget(self, action: #selector(switchNumberOfOTP), for: .touchUpInside)
        otpStackView1.layer.opacity = 0
        
       
    }
    @objc func switchNumberOfOTP() {
        check.toggle()
        skipForNowWalletButton.setTitle( check ? "Use 4-Digit Passcode" : "Use 6-Digit Passcode", for: .normal)
        if !check {
            otpStackView.layer.opacity = 1
            enterPasswordLabel.text =  "Enter the 4 digits in the passcode."
            otpStackView1.layer.opacity = 0
        }else {
            otpStackView.layer.opacity = 0
            enterPasswordLabel.text =  "Enter the 6 digits in the passcode."
            otpStackView1.layer.opacity = 1
        }
    }
    
    func configureBackground() {
        view.backgroundColor = .white
    }
    
   
    
    func getOtp()  ->  String {
        let result =    otpStackView.getOTP()
        return result
    }
    
    func didChangeValidity(isValid: Bool) {
        if isValid &&   setPasswordLabel.text == "Set a Passcode" {
            HapticManager.shared.vibrate(for: .success)
            otpStackView.clearCoins()
            otpStackView1.clearCoins()
            setPasswordLabel.text = "Confirm a Passcode"
            enterPasswordLabel.text = check ?  "Re-enter the 6 digits in the passcode." :  "Re-enter the 4 digits in the passcode."
        }else  if isValid &&   setPasswordLabel.text != "Set a Passcode"  {
            HapticManager.shared.vibrate(for: .success)
            let vc =  MainTableViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle =  .coverVertical
            present(vc, animated: true)
          
            
        }
        
    }
    
    func addSubview() {
        view.addSubview(enterPasswordLabel)
        view.addSubview(skipForNowWalletButton)
        view.addSubview(otpStackView)
        view.addSubview(otpStackView1)
        view.addSubview(setPasswordLabel)
        view.addSubview(setPassWordImageView)
     
       
    }
    
    func configureConstraints() {
      
        NSLayoutConstraint.activate([
            enterPasswordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -40),
            enterPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            enterPasswordLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        
        
        NSLayoutConstraint.activate([
            otpStackView.topAnchor.constraint(equalTo: enterPasswordLabel.bottomAnchor, constant: 30),
            otpStackView.heightAnchor.constraint(equalToConstant: 16),
            otpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            otpStackView1.topAnchor.constraint(equalTo: enterPasswordLabel.bottomAnchor, constant: 30),
            otpStackView1.heightAnchor.constraint(equalToConstant: 16),
            otpStackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        
        NSLayoutConstraint.activate([
            skipForNowWalletButton.topAnchor.constraint(equalTo:    otpStackView.bottomAnchor, constant: 40),
            skipForNowWalletButton.heightAnchor.constraint(equalToConstant: 50),
            skipForNowWalletButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 24),
            skipForNowWalletButton.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -24)
            ])
        NSLayoutConstraint.activate([
            setPasswordLabel.bottomAnchor.constraint(equalTo:  enterPasswordLabel.topAnchor,constant: -15),
            setPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setPasswordLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            setPasswordLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        NSLayoutConstraint.activate([
            setPassWordImageView.bottomAnchor.constraint(equalTo:   setPasswordLabel.topAnchor,constant: -20),
            setPassWordImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setPassWordImageView.widthAnchor.constraint(equalToConstant: 124),
            setPassWordImageView.heightAnchor.constraint(equalToConstant: 124),
            ])
     
      
        
     }
}
