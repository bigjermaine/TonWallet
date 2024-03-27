//
//  MainTableViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class MainTableViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSetupTabbarViewController()
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
//
//        nav2.navigationBar.backgroundColor = .clear
//        nav2.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        nav2.navigationBar.shadowImage = UIImage()
//
//     
//        nav3.navigationBar.backgroundColor = .clear
//        nav3.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        nav3.navigationBar.shadowImage = UIImage()
//
//     
//        nav4.navigationBar.backgroundColor = .clear
//        nav4.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        nav4.navigationBar.shadowImage = UIImage()
//
//        UITabBar.appearance().barTintColor = .gray
//        UITabBar.appearance().tintColor  = .white
//        UITabBar.appearance().selectedImageTintColor = .systemBlue
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: false)
        
    }
}
