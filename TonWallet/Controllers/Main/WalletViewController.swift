//
//  WalletViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit

class WalletViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private lazy var homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBlue
        return collectionView
    }()
    
    var editorialSectionType:[listSection] = dummyData
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureCollectionView()
        configureConstraints()
        configureDelegateAndDataSource()
    }
    
    func configureCollectionView() {
        view.addSubview(homeCollectionView)
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo:view.bottomAnchor),
        ])
        
    }
    
    
    
    func configureDelegateAndDataSource() {
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register( FirstSectionCollectionViewCell.self, forCellWithReuseIdentifier:  FirstSectionCollectionViewCell.identifier)
    }
    
    
    
    
}

    
extension WalletViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else {
            return UICollectionViewCell()
        }
       
        cell.clipsToBounds = true
        return cell
    }
    
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, layoutEnvironment in
            switch self?.editorialSectionType[section] {
            case .first(_):
                return self?.firstCollectionViewLayout()
            case .second(_):
                return  self?.firstCollectionViewLayout()
            case .none:
                return  self?.firstCollectionViewLayout()
            }
        }
    }
    
    
    private func firstCollectionViewLayout() -> NSCollectionLayoutSection  {
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 1, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(80)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
}


