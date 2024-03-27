//
//  SecondCollectionViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 26/03/2024.
//

import Foundation
import UIKit


class SecondSectionCollectionViewCell: UICollectionViewCell {
    static let identifier = "SecondSectionCollectionViewCell"
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "jUSDTIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let walletLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "jUSDT"
         label.font = .systemFont(ofSize: 16, weight: .bold)
         return label
    }()
  
    
    private let sentLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black.withAlphaComponent(0.45)
         label.numberOfLines = 0
         label.textAlignment = .right
        label.font = .systemFont(ofSize: 13, weight: .regular)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "+0.01%"
         return label
    }()
    
    private let coinAmoutLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.numberOfLines = 0
         label.textAlignment = .right
         label.font = .systemFont(ofSize: 16, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "10 527,527,527,527,527527,527,527 USDT"
         return label
    }()
    
    private let coinAmountIncreaseLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black.withAlphaComponent(0.7)
         label.font = .systemFont(ofSize: 13, weight: .regular)
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "$10 527"
         return label
    }()
    
    
    private var divder:UIView = {
        let divider = UIView()
        divider.backgroundColor = .black.withAlphaComponent(0.1)
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configureLayout()
        backgroundColor = .white
   
    }
    
    func addSubview() {
        contentView.addSubview(coinImageView)
        contentView.addSubview(walletLabel)
        contentView.addSubview( sentLabel)
        contentView.addSubview( coinAmoutLabel)
        contentView.addSubview( coinAmountIncreaseLabel)
        contentView.addSubview(divder)
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
     }
        
    func configureLayout() {
        NSLayoutConstraint.activate([
            coinImageView.widthAnchor.constraint(equalToConstant: 40),
            coinImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            coinImageView.heightAnchor.constraint(equalToConstant: 40),
            
            
            walletLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            walletLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
          
  
            walletLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            walletLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
          
  
        
            sentLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            sentLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
           
            
            coinAmoutLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            coinAmoutLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmoutLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            coinAmoutLabel.bottomAnchor.constraint(equalTo: coinImageView.centerYAnchor),
            
            coinAmountIncreaseLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            coinAmountIncreaseLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmountIncreaseLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
           
            
            divder.leadingAnchor.constraint(equalTo: walletLabel.leadingAnchor),
            divder.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            divder.heightAnchor.constraint(equalToConstant: 2),
            divder.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
          
        ])
    
    }
    func configure(viewModel:SwapCoin) {
        coinImageView.image = UIImage(named: "\(viewModel.coinImage)")
        walletLabel.text = viewModel.walletID
        sentLabel.text = viewModel.time
        coinAmoutLabel.text = viewModel.sentCoin
        coinAmountIncreaseLabel.text = viewModel.sentAmount
    }
}
