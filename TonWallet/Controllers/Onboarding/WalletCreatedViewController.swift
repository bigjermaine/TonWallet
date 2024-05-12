//
//  WalletCreatedViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import Foundation
import UIKit

class WalletCreatedViewController: UIViewController {
    
    private let  walletCreationImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tonWalletCreateWalletImage")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let walletCreationLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wallet Created"
        label.clipsToBounds = true
        return label
    }()
    
    private let createPasswordLabel :UILabel  = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create a passcode to protect it."
        label.clipsToBounds = true
        return label
    }()
    

    private let  setupButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Set Up Password", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let  skipForNowWalletButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Skip for Now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.masksToBounds = true
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBackground()
        addSubview()
        configureConstraints()
        configureAction()
        walletCreationImageView.image = UIImage.gifImageWithName("congratulations")
    }
    
    
    
    func configureAction() {
        setupButton.addTarget(self, action: #selector(navigateToSetPasswordViewController), for: .touchUpInside)
        skipForNowWalletButton.addTarget(self, action: #selector(didChangeValidity), for: .touchUpInside)
    }
    @objc func didChangeValidity() {
        HapticManager.shared.vibrate(for: .success)
            let vc =  MainTableViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle =  .coverVertical
            present(vc, animated: true)
          
    }
  @objc func navigateToSetPasswordViewController() {
       HapticManager.shared.vibrate(for: .success)
        let vc = SetPasswordViewController()
        let navVC = vc
      self.navigationController?.pushViewController(navVC, animated: true)
    }
    
    
    func configureBackground() {
        view.backgroundColor = .white
    }

    func addSubview() {
        view.addSubview(createPasswordLabel)
        view.addSubview(setupButton)
        view.addSubview(skipForNowWalletButton)
        view.addSubview(walletCreationLabel)
        view.addSubview(walletCreationImageView)
     
       
    }
    
    func configureConstraints() {
      
        NSLayoutConstraint.activate([
            createPasswordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            createPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            createPasswordLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        
        
        NSLayoutConstraint.activate([
            setupButton.topAnchor.constraint(equalTo: createPasswordLabel.bottomAnchor, constant: 30),
            setupButton.heightAnchor.constraint(equalToConstant: 50),
            setupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            setupButton.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -24)
            ])
        
        NSLayoutConstraint.activate([
            skipForNowWalletButton.topAnchor.constraint(equalTo:    setupButton.bottomAnchor, constant: 20),
            skipForNowWalletButton.heightAnchor.constraint(equalToConstant: 50),
            skipForNowWalletButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 24),
            skipForNowWalletButton.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -24)
            ])
        NSLayoutConstraint.activate([
            walletCreationLabel.bottomAnchor.constraint(equalTo:  createPasswordLabel.topAnchor,constant: -15),
            walletCreationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            walletCreationLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            walletCreationLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        NSLayoutConstraint.activate([
            walletCreationImageView.bottomAnchor.constraint(equalTo:   walletCreationLabel.topAnchor,constant: -20),
            walletCreationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            walletCreationImageView.widthAnchor.constraint(equalToConstant: 124),
            walletCreationImageView.heightAnchor.constraint(equalToConstant: 124),
            ])
     
      
        
     }
    
}

