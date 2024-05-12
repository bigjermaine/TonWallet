//
//  BalanceCollectionViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 26/03/2024.
//

import UIKit

protocol BalanceCollectionViewCellDelgate:AnyObject  {
    func  didFontIncrese(animation: Int)
}



class BalanceCollectionViewCell: UICollectionViewCell {
    static let identifier = "BalanceCollectionViewCell"
      var  walletBalanceLabel:UILabel = {
        let label = UILabel()
        label.text = "$546 027.5"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
      var mainWalletText:UILabel = {
        let label = UILabel()
        label.text = "Main Wallet"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white.withAlphaComponent(0.66)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
      lazy var stackView: UIStackView  = {
        let stackView = UIStackView(arrangedSubviews: [walletBalanceLabel,mainWalletText])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        contentView.addSubview(stackView)
   
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
     }
        
    func configureLayout() {
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo:  topAnchor,constant: 10),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
        stackView.heightAnchor.constraint(equalToConstant: 60),
        
        ])
    }
    
    func configureCell(x:String) {
        walletBalanceLabel.text = x
    }
}
