//
//  SeedPhaseHeaderView.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import Foundation
import UIKit

class SeedPhaseHeaderView:UIView {
    
    private var wordTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "24 Secret Words"
        return label
    }()
    
    private var restoreMessage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "You can restore access to your wallet by entering the 24 secret words that you wrote down when creating the wallet."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configureConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  func addSubview() {
        addSubview(wordTitle)
        addSubview(restoreMessage)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        wordTitle.topAnchor.constraint(equalTo:topAnchor, constant: 0),
        wordTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
        wordTitle.widthAnchor.constraint(equalTo: widthAnchor),
       
        restoreMessage.topAnchor.constraint(equalTo:wordTitle.bottomAnchor, constant: 20),
        restoreMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
        restoreMessage.widthAnchor.constraint(equalTo: widthAnchor),
       
        ])
    }
}
