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
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HapticManager.shared.vibrateForSelection()
     
    }

  
    
}
