//
//  MainTableViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class MainTableViewController: UITabBarController, UITabBarControllerDelegate {
    let Vc1 =  WalletViewController()
    let Vc2 =  AssetsViewController()
    let Vc3 =  BrowseViewController()
    let Vc4 =  SettingsViewController()
    
    private let reportButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        let image = UIImage(named: "")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
       
        
        return button
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSetupTabbarViewController()
        configureTabbar()
        self.delegate = self
        presentMenu()
        reportButtonConfiguration()
    }
    
   
    func configureSetupTabbarViewController() {
     
        Vc1.editorialSectionType = dummyData
        
        Vc1.navigationItem.largeTitleDisplayMode = .never
        Vc2.navigationItem.largeTitleDisplayMode = .never
        Vc3.navigationItem.largeTitleDisplayMode = .never
        Vc4.navigationItem.largeTitleDisplayMode = .never
      
        let nav1 = UINavigationController(rootViewController: Vc1)
        let nav2 = UINavigationController(rootViewController: Vc2)
        let nav3 = UINavigationController(rootViewController: Vc3)
        let nav4 = UINavigationController(rootViewController: Vc4)
     
        
        nav1.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(named: "walletIcon"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Assets", image: UIImage(named:"assetIcon"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Browser", image: UIImage(named: "browserIcon"), tag: 2)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image:UIImage(named: "settingsIcon"), tag: 3)
        
        nav1.navigationBar.backgroundColor = .clear
        nav1.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav1.navigationBar.shadowImage = UIImage()
        setViewControllers([nav1,nav2,nav3,nav4], animated: false)

    }
    
    func reportButtonConfiguration() {
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(reportButton, aboveSubview:tabBar)
        reportButton.rightAnchor.constraint(equalTo: tabBar.rightAnchor,constant: 0).isActive = true
        reportButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor,constant: -10).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        reportButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
   
    func   presentMenu() {
         let tapmeitems = UIMenu(title: "", options: .displayInline, children: [
          
        UIAction(title: "My Wallet", image: UIImage(named: "settingsIcon"), handler: {[weak self] _ in
            self?.dismissBlurView()
            self?.notifcationForData()
        }),
            UIAction(title: "UQafc...3A76", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
                self?.notifcationForNoData()
        }),
            UIAction(title: "UQBKD...iy8I1", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
                self?.notifcationForNoData()
        }),
            UIAction(title: "My Wallet 2", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
        }),
        UIAction(title: "Add Account", image: UIImage(systemName: "plus"), handler: {_ in
            self.present(self.createActionSheet() , animated: true)
            
        })
        ])
        let menu = UIMenu(title: "", children: [tapmeitems])
        reportButton.menu = menu
        reportButton.showsMenuAsPrimaryAction = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        reportButton.addGestureRecognizer(tapGesture)
    
        
    }
   
    func notifcationForData() {
        
        let vc =  MainTableViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle =  .coverVertical
        present(vc, animated: true)
    }
    
    func notifcationForNoData() {
        let vc =  MainTableViewController1()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle =  .coverVertical
        present(vc, animated: true)
    }
    private func createActionSheet()  -> UIAlertController {
            let actionSheet = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
            
            let buyWithCardAction = UIAlertAction(title: "Create New Wallet", style: .default) { _ in
                // Handle Buy with Card action
                let vc = UINavigationController(rootViewController: WalletCreatedViewController())
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            
            }
            actionSheet.addAction(buyWithCardAction)
            
            let buyWithCryptoAction = UIAlertAction(title: "Import Wallet", style: .default) { _ in
                
                let vc = UINavigationController(rootViewController: SeedPhaseViewController())
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true) {[weak self] in
                    self?.dismissBlurView()
                }
            }
            actionSheet.addAction(buyWithCryptoAction)
            
           
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            
            return actionSheet
        }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBlurView))
        blurView.addGestureRecognizer(tapGesture)

    }
    
 
        @objc func dismissBlurView() {
            for subview in view.subviews {
                if let blurView = subview as? UIVisualEffectView {
                    DispatchQueue.main.async {
                        blurView.removeFromSuperview()
                    }
                   
                }
            }
        }
    
    
  
    func configureTabbar() {
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.white
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    
    
}




class MainTableViewController1: UITabBarController, UITabBarControllerDelegate {
    let Vc1 =  WalletViewController()
       
    let Vc2 =  AssetsViewController()
    let Vc3 =  BrowseViewController()
    let Vc4 =  SettingsViewController()
    
    private let reportButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        let image = UIImage(named: "")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
       
        
        return button
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSetupTabbarViewController()
        configureTabbar()
        self.delegate = self
        presentMenu()
        reportButtonConfiguration()
    }
    
   
    func configureSetupTabbarViewController() {
     
        Vc1.editorialSectionType = dummyData1
        
        Vc1.navigationItem.largeTitleDisplayMode = .never
        Vc2.navigationItem.largeTitleDisplayMode = .never
        Vc3.navigationItem.largeTitleDisplayMode = .never
        Vc4.navigationItem.largeTitleDisplayMode = .never
      
        let nav1 = UINavigationController(rootViewController: Vc1)
        let nav2 = UINavigationController(rootViewController: Vc2)
        let nav3 = UINavigationController(rootViewController: Vc3)
        let nav4 = UINavigationController(rootViewController: Vc4)
     
        
        nav1.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(named: "walletIcon"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Assets", image: UIImage(named:"assetIcon"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Browser", image: UIImage(named: "browserIcon"), tag: 2)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image:UIImage(named: "settingsIcon"), tag: 3)
        
        nav1.navigationBar.backgroundColor = .clear
        nav1.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav1.navigationBar.shadowImage = UIImage()
        setViewControllers([nav1,nav2,nav3,nav4], animated: false)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBlurView))
//        view.addGestureRecognizer(tapGesture)

    
    }
    
    func reportButtonConfiguration() {
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(reportButton, aboveSubview:tabBar)
        reportButton.rightAnchor.constraint(equalTo: tabBar.rightAnchor,constant: 0).isActive = true
        reportButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor,constant: -10).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        reportButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
   
    func   presentMenu() {
         let tapmeitems = UIMenu(title: "", options: .displayInline, children: [
          
        UIAction(title: "My Wallet", image: UIImage(named: "settingsIcon"), handler: {[weak self] _ in
            self?.dismissBlurView()
            self?.notifcationForData()
        }),
            UIAction(title: "UQafc...3A76", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
                self?.notifcationForNoData()
        }),
            UIAction(title: "UQBKD...iy8I1", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
                self?.notifcationForNoData()
        }),
            UIAction(title: "My Wallet 2", image: UIImage(named: "account1Icon"), handler: {[weak self] _ in
                self?.dismissBlurView()
        }),
        UIAction(title: "Add Account", image: UIImage(systemName: "plus"), handler: {_ in
            self.present(self.createActionSheet() , animated: true)
            
        })
        ])
        let menu = UIMenu(title: "", children: [tapmeitems])
        reportButton.menu = menu
        reportButton.showsMenuAsPrimaryAction = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        reportButton.addGestureRecognizer(tapGesture)
    
        
    }
   
    
     func notifcationForData() {
         
         let vc =  MainTableViewController()
         vc.modalPresentationStyle = .fullScreen
         vc.modalTransitionStyle =  .coverVertical
         present(vc, animated: true)
     }
     
     func notifcationForNoData() {
         let vc =  MainTableViewController1()
         vc.modalPresentationStyle = .fullScreen
         vc.modalTransitionStyle =  .coverVertical
         present(vc, animated: true)
     }
    private func createActionSheet()  -> UIAlertController {
            let actionSheet = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
            
            let buyWithCardAction = UIAlertAction(title: "Create New Wallet", style: .default) { _ in
                // Handle Buy with Card action
                let vc = UINavigationController(rootViewController: WalletCreatedViewController())
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            
            }
            actionSheet.addAction(buyWithCardAction)
            
            let buyWithCryptoAction = UIAlertAction(title: "Import Wallet", style: .default) { _ in
                
                let vc = UINavigationController(rootViewController: SeedPhaseViewController())
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true) {[weak self] in
                    self?.dismissBlurView()
                }
            }
            actionSheet.addAction(buyWithCryptoAction)
            
           
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            
            return actionSheet
        }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBlurView))
        blurView.addGestureRecognizer(tapGesture)

    }
    
 
        @objc func dismissBlurView() {
            for subview in view.subviews {
                if let blurView = subview as? UIVisualEffectView {
                    DispatchQueue.main.async {
                        blurView.removeFromSuperview()
                    }
                   
                }
            }
        }
    
    
  
    func configureTabbar() {
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.white
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    
    
}
