//
//  SubHeaderViewCollectionView.swift
//  TonWallet
//
//  Created by MacBook AIR on 27/03/2024.
//

import Foundation
import UIKit



class subHeaderCollectionView:UICollectionReusableView {
    
    static let identifier = "subHeaderCollectionView"
    
    private let label:UILabel =   {
        let label = UILabel()
        label.textColor =  .black
        label.text = "February 21"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
       return label
    }()
    
    private let stackView: UIView  = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(stackView)
    
       // configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = CGRect(x: 0, y: 20, width: frame.size.width, height: 40)
       
        
    }
    
    
    func configure(with title:String) {
        label.text = title
    }
}
