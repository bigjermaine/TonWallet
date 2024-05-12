//
//  ReceivedNfTCollectionView.swift
//  TonWallet
//
//  Created by MacBook AIR on 27/03/2024.
//

import Foundation
import UIKit

class ReceivedNfTCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReceivedNfTCollectionViewCell"
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "jUSDTIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "jUSDTIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    private let usernameLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "jUSDT"
         label.font = .systemFont(ofSize: 16, weight: .bold)
         return label
    }()
    
    private let coinToLabel: UILabel = {
         let label = UILabel()
        label.textColor = .black.withAlphaComponent(0.7)
         label.numberOfLines = 0
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .systemFont(ofSize: 13, weight: .regular)
         label.text = "$1.00"
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
    
    private let nftLabel: UILabel = {
         let label = UILabel()
        label.textColor = .systemGreen
         label.numberOfLines = 0
         label.textAlignment = .right
         label.font = .systemFont(ofSize: 14, weight: .semibold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    private let subNftLabel: UILabel = {
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
    
    private let swappedLabel: UILabel = {
         let label = UILabel()
         label.textColor = .gray
         label.numberOfLines = 0
         label.textAlignment = .right
        label.font = .systemFont(ofSize: 13, weight: .regular)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = ""
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
        contentView.addSubview(usernameLabel)
        contentView.addSubview(sentLabel)
        contentView.addSubview(swappedLabel)
        contentView.addSubview(nftLabel)
        contentView.addSubview(subNftLabel)
        contentView.addSubview(divder)
        contentView.addSubview(nftImageView)
   
       
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

            usernameLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
                
            
             
            swappedLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
            swappedLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
              
            nftImageView.widthAnchor.constraint(equalToConstant: 32),
            nftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            nftImageView.heightAnchor.constraint(equalToConstant: 32),
            
            
            nftLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor),
            nftLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -52),
            nftLabel.widthAnchor.constraint(equalToConstant: 50),
            nftLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor),
        

            divder.leadingAnchor.constraint(equalTo: subNftLabel.leadingAnchor),
            divder.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            divder.heightAnchor.constraint(equalToConstant: 1),
            divder.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
          
        ])
    
    }
    func configure(viewModel:SwapCoin) {
        coinImageView.image = UIImage(named: "\(viewModel.coinImage)")
        nftImageView.image =  UIImage(named: "\(viewModel.recievedntNFTImage)")
        usernameLabel.text = viewModel.sentNFTUserNmae
        nftLabel.text = viewModel.recievedNFTName
        subNftLabel.text = viewModel.recievedNFTCategpries
        swappedLabel.text = viewModel.time
       
    }
}
