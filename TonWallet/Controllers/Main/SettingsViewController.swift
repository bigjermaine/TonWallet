//
//  SettingsViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class SettingsViewController: UIViewController {
    var reportButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        presentMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HapticManager.shared.vibrateForSelection()
     
    }

    func  presentMenu() {
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
        reportButton?.menu = menu
        reportButton?.showsMenuAsPrimaryAction = true
    }
    
}
