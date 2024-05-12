//
//  secretWordTableViewCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 22/03/2024.
//
import Foundation
import UIKit

class secretWordTableViewCell: UITableViewCell {

    static let identifier = "secretWordTableViewCell"
     
    private let countlabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        
        return label
    }()
   
        let secreteTextInput:  UITextField = {
         let textField = UITextField()
         textField.backgroundColor = Toncolors.seedPhaseCellColor
         textField.font =  .systemFont(ofSize: 17,weight: .bold)
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.layer.masksToBounds = true
         textField.textAlignment = .left
         return textField
     }()
     
     
     override func awakeFromNib() {
         super.awakeFromNib()
        
     }
    override func prepareForReuse() {
        super.prepareForReuse()
        secreteTextInput.text = ""
    }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
         configureBackground()
         addSubview()
         configureLayout()
         
       
     }
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         configureBackground()
         addSubview()
         configureLayout()
         
     }
    
    func configureBackground() {
        backgroundColor = Toncolors.seedPhaseCellColor
    }
    func addSubview() {
        contentView.addSubview( countlabel)
        contentView.addSubview(secreteTextInput)
        contentView.layer.cornerRadius = 10
    }
     func configureLayout() {
         NSLayoutConstraint.activate([
            
            countlabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            countlabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    
            
            secreteTextInput.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            secreteTextInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            secreteTextInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
         ])
         
       
         
     }
    
    func configure( _ viewModel:Int) {
        countlabel.text = "\(viewModel)"
    }
}
