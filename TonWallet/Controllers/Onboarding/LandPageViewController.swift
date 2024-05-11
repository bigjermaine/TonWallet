//
//  ViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 21/03/2024.
//

import UIKit

class LandPageViewController: UIViewController {
    
    private let  homeImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tonHomeImage")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let myTonWalletLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyTonWallet"
        label.clipsToBounds = true
        return label
    }()
    
    private let sendWalletLabel :UILabel  = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Securely store and send crypto."
        label.clipsToBounds = true
        return label
    }()
    

    private let  createNewWalletButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Create New Wallet", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let  importNewWalletButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Import Existing Wallet", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.masksToBounds = true
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeImageView.image = UIImage.gifImageWithName("unboarding")
        configureBackground()
        addSubview()
        configureConstraints()
        configureAction()
      
    }
    
    
    
    func configureAction() {
        createNewWalletButton.addTarget(self, action: #selector(navigateToWalletCreatedViewController), for: .touchUpInside)
        importNewWalletButton.addTarget(self, action: #selector(navigateToSeedPhaseController), for: .touchUpInside)
    }
    
  @objc func navigateToSeedPhaseController() {
      let vc = UINavigationController(rootViewController: SeedPhaseViewController())
      vc.modalPresentationStyle = .fullScreen
      vc.modalTransitionStyle = .crossDissolve
      present(vc, animated: true)
    }
    
    @objc func navigateToWalletCreatedViewController() {
          let vc =    UINavigationController(rootViewController:WalletCreatedViewController())
          vc.modalPresentationStyle = .fullScreen
          vc.modalTransitionStyle = .crossDissolve
          present(vc, animated: true)
      }
      
    
  
    func configureBackground() {
        view.backgroundColor = .white
    }

    func addSubview() {
        view.addSubview(sendWalletLabel)
        view.addSubview(createNewWalletButton)
        view.addSubview(importNewWalletButton)
        view.addSubview(myTonWalletLabel)
        view.addSubview(homeImageView)
     
       
    }
    
    func configureConstraints() {
      
        NSLayoutConstraint.activate([
            sendWalletLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sendWalletLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendWalletLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            sendWalletLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        
        
        NSLayoutConstraint.activate([
            createNewWalletButton.topAnchor.constraint(equalTo: sendWalletLabel.bottomAnchor, constant: 30),
            createNewWalletButton.heightAnchor.constraint(equalToConstant: 50),
            createNewWalletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            createNewWalletButton.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -24)
            ])
        
        NSLayoutConstraint.activate([
            importNewWalletButton.topAnchor.constraint(equalTo:    createNewWalletButton.bottomAnchor, constant: 20),
            importNewWalletButton.heightAnchor.constraint(equalToConstant: 50),
            importNewWalletButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 24),
            importNewWalletButton.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -24)
            ])
        NSLayoutConstraint.activate([
            myTonWalletLabel.bottomAnchor.constraint(equalTo:  sendWalletLabel.topAnchor,constant: -15),
            myTonWalletLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTonWalletLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            myTonWalletLabel.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant: -20)
            ])
        NSLayoutConstraint.activate([
            homeImageView.bottomAnchor.constraint(equalTo:   myTonWalletLabel.topAnchor,constant: -20),
            homeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeImageView.widthAnchor.constraint(equalToConstant: 124),
            homeImageView.heightAnchor.constraint(equalToConstant: 124),
            ])
     
      
        
     }
    
}

