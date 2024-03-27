//
//  CustomFooterView.swift
//  TonWallet
//
//  Created by MacBook AIR on 27/03/2024.
//

import Foundation
import UIKit

class CustomFooterView: UICollectionReusableView {
    static let identifier = "CustomFooterView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Customize your footer view here
        backgroundColor = Toncolors.lightWhiteColor
        // Add any subviews or configure UI elements as needed
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Layout your subviews here if needed
    }
}
