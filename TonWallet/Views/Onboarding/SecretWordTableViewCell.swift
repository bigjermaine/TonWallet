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
        label.textColor = Toncolors.grayColor
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        return label
    }()
   
     private let secretelabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 13,weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "word"
         return label
     }()
     
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
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
        contentView.addSubview( secretelabel)
        contentView.layer.cornerRadius = 10
    }
     func configureLayout() {
         NSLayoutConstraint.activate([
            
            countlabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            countlabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            secretelabel.leadingAnchor.constraint(equalTo: countlabel.trailingAnchor, constant: 14),
            
            secretelabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            secretelabel.leadingAnchor.constraint(equalTo: countlabel.leadingAnchor, constant: 10),
        
            
         ])
         
       
         
     }
    
     
//    
//    func configure( _ viewModel:BalancereleasesCellViewModel) {
//        
//        
//        
//    }
}
