//
//  MainTableViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class MainTableViewController: UITabBarController, UITabBarControllerDelegate {
    var reportButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSetupTabbarViewController()
        configureTabbar()
        presentMenu()
        self.delegate = self
    }
    
   
    func configureSetupTabbarViewController() {
        let Vc1 =  WalletViewController()
        let Vc2 =  AssetsViewController()
        let Vc3 =  BrowseViewController()
        let Vc4 =  SettingsViewController()
        
        
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
        nav4.tabBarItem = UITabBarItem(title: "Settings", image:UIImage(named: "settingIcon"), tag: 3)
        
        nav1.navigationBar.backgroundColor = .clear
        nav1.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav1.navigationBar.shadowImage = UIImage()
        
        
        let tapmeitems = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: "Like", image: UIImage(named: "sharelike"), handler: {[weak self] _ in
                
            }),
            UIAction(title: "Dowload", image: UIImage(named: "sharedowload2"), handler: {[weak self] _ in
                
            }),
            UIAction(title: "Comment", image: UIImage(named: "sharecomment"), handler: {[weak self] _ in
                
            }),
            UIAction(title: "Share", image: UIImage(named: "shareshare"), handler: {[weak self] _ in
                
            }),
        ])
        
       let menu = UIMenu(title: "", children: [tapmeitems])
      setViewControllers([nav1,nav2,nav3,nav4], animated: false)
    
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 3 {
            presentMenu()
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
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
    
    
    func  presentMenu() {
       
    }
    
}
