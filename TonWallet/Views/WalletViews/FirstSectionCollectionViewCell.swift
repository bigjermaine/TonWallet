//
//  FirstSectionCollectionViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 24/03/2024.
//

import UIKit
import SwiftUI

class FirstSectionCollectionViewCell: UICollectionViewCell {
    static let identifier = "FirstSectionCollectionViewCell"
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "jUSDTIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let coinLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "jUSDT"
         label.font = .systemFont(ofSize: 16, weight: .bold)
         return label
    }()
    
    private let coinPriceLabel: UILabel = {
         let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.7)
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .systemFont(ofSize: 13, weight: .regular)
         label.text = "$1.00"
         return label
    }()
    
    private let percentIncreaseLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white.withAlphaComponent(0.45)
         label.numberOfLines = 0
         label.textAlignment = .right
        label.font = .systemFont(ofSize: 13, weight: .regular)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "+0.01%"
         return label
    }()
    
    private let coinAmoutLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.numberOfLines = 0
         label.textAlignment = .right
         label.font = .systemFont(ofSize: 16, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "10 527,527,527,527,527527,527,527 USDT"
         return label
    }()
    
    private let coinAmountIncreaseLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.textColor = .white.withAlphaComponent(0.7)
         label.font = .systemFont(ofSize: 13, weight: .regular)
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "$10 527"
         return label
    }()
    
    
    private var divder:UIView = {
        let divider = UIView()
        divider.backgroundColor = .white.withAlphaComponent(0.1)
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
   
    }
    
    func addSubview() {
        contentView.addSubview(coinImageView)
        contentView.addSubview(coinLabel)
        contentView.addSubview(coinPriceLabel)
        contentView.addSubview( percentIncreaseLabel)
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
            
            
            coinLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            coinLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
          
  
            coinLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            coinLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
          
  
            
            coinPriceLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            coinPriceLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
           
            percentIncreaseLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            percentIncreaseLabel.leadingAnchor.constraint(equalTo: coinPriceLabel.trailingAnchor,constant: 10),
           
            
            coinAmoutLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            coinAmoutLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmoutLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            coinAmoutLabel.bottomAnchor.constraint(equalTo: coinImageView.centerYAnchor),
            
            coinAmountIncreaseLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            coinAmountIncreaseLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmountIncreaseLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
           
            
            divder.leadingAnchor.constraint(equalTo: coinPriceLabel.leadingAnchor),
            divder.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            divder.heightAnchor.constraint(equalToConstant: 2),
            divder.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
          
        ])
    
    }
    func configure(viewModel:FirstSection) {
        coinImageView.image = UIImage(named: "\(viewModel.coinImage)")
        coinLabel.text  = viewModel.coinName
        coinAmoutLabel.text = viewModel.coinAmount
        coinAmountIncreaseLabel.text = viewModel.coinAmountIncrease
        coinPriceLabel.text = viewModel.coinPrice
        percentIncreaseLabel.text = viewModel.coinIncreasePercent
    }
}
