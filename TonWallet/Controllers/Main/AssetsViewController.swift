//
//  AssetsViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class AssetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HapticManager.shared.vibrateForSelection()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
