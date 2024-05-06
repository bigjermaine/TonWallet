//
//  ActionButtonsCollectionViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 26/03/2024.
//

import UIKit

protocol ActionButtonsCollectionViewCellProtocol:AnyObject {
    func didTapAdd()
    func didTapSend()
    func didTapEarn()
    func didTapSwap()
}


class ActionButtonsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ActionButtonsCollectionViewCell"
    let addButton = TransactionCustomButton()
    let sendButton = TransactionCustomButton()
    let earnButton = TransactionCustomButton()
    let swapButton = TransactionCustomButton()
    
    weak var delegate:ActionButtonsCollectionViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
        configureStack()
        sendButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)
        swapButton.addTarget(self, action: #selector(didTapSwap), for: .touchUpInside)
       
    }
    @objc func didTapSwap() {
        delegate?.didTapSwap()
    }
    
    @objc func didTapSend() {
        delegate?.didTapSend()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    
    func configureButton() {
      
        earnButton.coinImage = UIImage(named: "earnIcon")
        earnButton.coinAmountText = "earn"
        
        
        swapButton.coinImage = UIImage(named: "swapIcon")
        swapButton.coinAmountText = "swap"
  
        
        sendButton.coinImage = UIImage(named: "sendIcon")
        sendButton.coinAmountText = "send"
  
        
        
        addButton.coinImage = UIImage(named: "addIcon")
        addButton.coinAmountText = "add"
    
    }
    
    
    
    func configureStack() {
        
        let stackView = UIStackView(arrangedSubviews: [addButton, sendButton, earnButton, swapButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo:  topAnchor,constant: 0),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
        stackView.heightAnchor.constraint(equalToConstant: 60),
        
        ])
    }
        
    
}
