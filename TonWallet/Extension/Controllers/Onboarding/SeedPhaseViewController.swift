//
//  SeedPhaseViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 22/03/2024.
//

import UIKit
import SwiftUI

class SeedPhaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UITextFieldDelegate {
    

    private let  seedPhasestableView:UITableView =  {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.register( secretWordTableViewCell.self, forCellReuseIdentifier: secretWordTableViewCell.identifier)
        tableView.backgroundColor =  .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    

    private let  continueButton:UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        button.titleLabel?.font = label.font
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()

    
    var valuesArray = [String](repeating: "", count: 24)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureBackground()
        addSubview()
        configureConstraints()
        setDelegate()
        setupHeaderAndFooter()
        addAction()
      
    }
    
    func addAction() {
        continueButton.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
    }
   @objc func didTapContinue(){
        Alert.showBasic(title: "Wrong Phrase", message: "Looks like you entered an invalid mnemonic phrase.", actionText: "Close", vc: self)
    }
    func  configureBackground() {
        view.backgroundColor = .white
    }
    
    func addSubview() {
         view.addSubview(seedPhasestableView)
    }
    
    func setDelegate() {
        seedPhasestableView.delegate = self
        seedPhasestableView.dataSource = self
        }
    
    func setupHeaderAndFooter() {
        let headerView = SeedPhaseHeaderView()
        headerView.frame.size.height = 150
        headerView.backgroundColor = .white
 
        continueButton.frame.size.height = 50
        self.seedPhasestableView.tableFooterView = continueButton
        self.seedPhasestableView.tableHeaderView = headerView
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            seedPhasestableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            seedPhasestableView.leadingAnchor.constraint(equalTo:   view.leadingAnchor,constant: 20),
            seedPhasestableView.trailingAnchor.constraint(equalTo: view
                .trailingAnchor,constant:-20),
            seedPhasestableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valuesArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  secretWordTableViewCell.identifier,for:indexPath)  as?  secretWordTableViewCell else {
            return UITableViewCell()}
        
        cell.layer.masksToBounds = true
        cell.layer.borderColor = Color.white.cgColor
        cell.layer.borderWidth = 4
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.secreteTextInput.tag = indexPath.row
        cell.selectionStyle = .none
        cell.secreteTextInput.text = valuesArray[indexPath.row]
        cell.secreteTextInput.delegate = self
        cell.configure(indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 48
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        valuesArray[textField.tag] = textField.text ?? ""
       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        if offset == 20.0 || offset == 0 {
            title = ""
        } else {
            title = "Import Wallet"
        }
        // Add other navigation bar transformations if needed
    }
    
}
