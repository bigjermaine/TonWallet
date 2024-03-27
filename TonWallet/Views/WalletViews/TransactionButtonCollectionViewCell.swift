//
//  TransactionButtonCollectionViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 26/03/2024.
//

import UIKit

class TransactionCustomButton:UIButton{
 
    
    private  let buttonActionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private  let coinAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "rrrrrr"
        return label
    }()
    
    

    var coinImage: UIImage? {
          didSet {
              buttonActionImageView.image = coinImage
              buttonActionImageView.tintColor = .black
          }
      }
      
      var coinAmountText: String? {
          didSet {
              coinAmountLabel.text = coinAmountText
          }
      }
    
     var buttonBackgroundColor: UIColor? {
         didSet {
             backgroundColor = buttonBackgroundColor
         }
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(buttonActionImageView)
        addSubview(coinAmountLabel)
        configureLayout()
        let color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        backgroundColor = color
        layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()

      
        
    }
    
    func configureLayout() {
        NSLayoutConstraint.activate([
            buttonActionImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            buttonActionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonActionImageView.widthAnchor.constraint(equalToConstant:22),
            buttonActionImageView.heightAnchor.constraint(equalToConstant: 22)
        ])
        NSLayoutConstraint.activate([
            coinAmountLabel.topAnchor.constraint(equalTo:  buttonActionImageView.bottomAnchor,constant:2),
            coinAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

        ])
        
           
    }
    
    
    
}


