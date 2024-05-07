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
        addButton.addTarget(self, action: #selector(didTapBuy), for: .touchUpInside)
        earnButton.addTarget(self, action: #selector(didTapEarn), for: .touchUpInside)
    }
    @objc func didTapEarn() {
        delegate?.didTapEarn()
        UIView.animate(withDuration: 0.2) {
            self.earnButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        }completion: { _ in
            self.earnButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        }
    }
    @objc func didTapBuy() {
        delegate?.didTapAdd()
        UIView.animate(withDuration: 0.2) {
            self.addButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        }completion: { _ in
            self.addButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        }
    }
    @objc func didTapSwap() {
        delegate?.didTapSwap()
        UIView.animate(withDuration: 0.2) {
            self.swapButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        }completion: { _ in
            self.swapButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        }
    }
    
    @objc func didTapSend() {
        delegate?.didTapSend()
        UIView.animate(withDuration: 0.2) {
            self.sendButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        }completion: { _ in
            self.sendButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        }
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
