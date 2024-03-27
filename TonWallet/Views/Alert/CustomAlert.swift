//
//  CustomAlert.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import Foundation
import UIKit

class Alert {
    class func showBasic(title: String, message: String, actionText:String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionText, style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
