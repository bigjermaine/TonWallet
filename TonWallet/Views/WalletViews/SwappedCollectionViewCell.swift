//
//  SwappedCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 26/03/2024.
//

import Foundation
import UIKit

class SwappedCollectionViewCell: UICollectionViewCell {
    static let identifier = "SwappedCollectionViewCell"
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "jUSDTIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    private let exhangedLabel: UILabel = {
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
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
         return label
    }()
    
    private let coinAmoutLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .right
        label.textColor = .systemGreen
         label.font = .systemFont(ofSize: 16, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "100 USDT"
         return label
    }()
    
    private let coinAmountIncreaseLabel: UILabel = {
         let label = UILabel()
         label.textColor = .gray
         label.font = .systemFont(ofSize: 13, weight: .regular)
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "$10 527"
         return label
    }()
    private let chevronImage:UIImageView =  {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var divder:UIView = {
        let divider = UIView()
        divider.backgroundColor = .black.withAlphaComponent(0.1)
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    
    private let swappedLabel: UILabel = {
         let label = UILabel()
        label.textColor = .gray
         label.numberOfLines = 0
         label.textAlignment = .right
        label.font = .systemFont(ofSize: 13, weight: .regular)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "+0.01%"
         return label
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
        contentView.addSubview(exhangedLabel)
         contentView.addSubview(chevronImage)
        contentView.addSubview( sentLabel)
        contentView.addSubview( swappedLabel)
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

            exhangedLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            exhangedLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
          
  
            chevronImage.centerYAnchor.constraint(equalTo: exhangedLabel.centerYAnchor),
            chevronImage.leadingAnchor.constraint(equalTo: exhangedLabel.trailingAnchor,constant: 10),
            chevronImage.widthAnchor.constraint(equalToConstant:10),
            chevronImage.heightAnchor.constraint(equalToConstant: 15),

  
        
            sentLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            sentLabel.leadingAnchor.constraint(equalTo: chevronImage.trailingAnchor,constant: 10),
//           
            
            
            swappedLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            swappedLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
            
            
            
            coinAmoutLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            coinAmoutLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmoutLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            coinAmoutLabel.bottomAnchor.constraint(equalTo: coinImageView.centerYAnchor),
            
            coinAmountIncreaseLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
            coinAmountIncreaseLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            coinAmountIncreaseLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
           
            
            divder.leadingAnchor.constraint(equalTo: exhangedLabel.leadingAnchor),
            divder.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            divder.heightAnchor.constraint(equalToConstant: 1),
            divder.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
          
        ])
    
    }
    func configure(viewModel:SwapCoin) {
        coinImageView.image = UIImage(named: "\(viewModel.coinImage)")
        exhangedLabel.text = viewModel.mainCoin
        sentLabel.text = viewModel.exchangedCoin
        swappedLabel.text = viewModel.time
        coinAmoutLabel.text = viewModel.mainCoinAmount
        coinAmountIncreaseLabel.text = viewModel.exchangeCoinAmount 
    }
}
