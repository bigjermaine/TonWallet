//
//  WalletViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit
import SwiftUI

class WalletViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private lazy var homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBlue
        return collectionView
    }()
    
    lazy var adjustButtonLeftButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "Settings")?.withRenderingMode(.alwaysOriginal), style:.plain, target: self, action:#selector(inboxTapped))
        return button
   }()
    
    
    lazy var adjustButtonRightButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal), style:.plain, target: self, action:#selector(inboxTapped))
        return button
   }()
    
    lazy var  walletBalanceLabel:UILabel = {
        let label = UILabel()
        label.text = "$12 229.5"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var mainWalletText:UILabel = {
        let label = UILabel()
        label.text = "Main Wallet"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white.withAlphaComponent(0.66)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView  = {
        let stackView = UIStackView(arrangedSubviews: [walletBalanceLabel,mainWalletText])
        stackView.axis = .vertical
        return stackView
    }()
    
    
    var editorialSectionType:[listSection] = dummyData
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        centerTitle()
       
        configureCollectionView()
        configureConstraints()
        configureDelegateAndDataSource()
        setupNavBar()
    }
    
    @objc func inboxTapped() {
        
    }
    
    func setupNavBar() {
      
      
        let width = view.frame.width
        stackView.frame =  .init(x: 0, y: 0, width: width, height: 600)
        stackView.isHidden = true
        navigationItem.titleView = stackView
        
       
    
    }
   
    func centerTitle(){
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.navigationBar.backgroundColor = .systemBlue
//        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//    
//            // Set navigation bar title attributes
////            navigationController?.navigationBar.titleTextAttributes = [
////                .font: UIFont.systemFont(ofSize: 40)
////            ]
//            // Set navigation item title
//            title = "$12 229.5"
//           for navItem in(self.navigationController?.navigationBar.subviews)! {
//                for itemSubView in navItem.subviews {
//                    if let largeLabel = itemSubView as? UILabel {
//                       largeLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2)
//                       return;
//                    }
//                }
//           }
//        
        navigationItem.rightBarButtonItem  = adjustButtonRightButtonItem
        navigationItem.leftBarButtonItem = adjustButtonLeftButtonItem
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
        homeCollectionView.register( ActionButtonsCollectionViewCell.self, forCellWithReuseIdentifier:  ActionButtonsCollectionViewCell.identifier)
        homeCollectionView.register( BalanceCollectionViewCell.self, forCellWithReuseIdentifier:  BalanceCollectionViewCell.identifier)
        homeCollectionView.register(TitleHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionView.identifier)
      
        homeCollectionView.register(subHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: subHeaderCollectionView.identifier)
      
       
        homeCollectionView.register( SecondSectionCollectionViewCell
            .self, forCellWithReuseIdentifier:  SecondSectionCollectionViewCell.identifier)
 
        homeCollectionView.register( SwappedCollectionViewCell
            .self, forCellWithReuseIdentifier:  SwappedCollectionViewCell.identifier)
        
        homeCollectionView.register( ReceivedNfTCollectionViewCell
            .self, forCellWithReuseIdentifier:  ReceivedNfTCollectionViewCell.identifier)
 
        
        
        homeCollectionView.register( SentNftCollectionViewCell
            .self, forCellWithReuseIdentifier:  SentNftCollectionViewCell.identifier)
        
        homeCollectionView.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.identifier)
       
        
    }
    
    
    
    
}

    
extension WalletViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch editorialSectionType[section] {
            
        case .first(let viewModel):
            return viewModel.count
        case .second(let viewModel):
            return viewModel.count
        case .button(_):
            return 1
        case .walletBalance(_):
            return 1
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return   editorialSectionType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch editorialSectionType[indexPath.section] {
            
        case .first(let viewModel):
             break
        case .second(let viewModel):
            if viewModel[indexPath.row].exchangedCoin != "" {
                let vc = UIHostingController(rootView:SwappedView())
                present(vc, animated: true)
            }else if viewModel[indexPath.row].walletID != "" {
                let vc = UIHostingController(rootView:SentView())
                present(vc, animated: true)
            }else if viewModel[indexPath.row].sentNFTImage != "" {
                let vc = UIHostingController(rootView:RecivedNfT())
                present(vc, animated: true)
            } else{
                    let vc = UIHostingController(rootView:RecivedNfT())
                    present(vc, animated: true)
            }
        case .button(_):
            break
        case .walletBalance(_):
            break
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch editorialSectionType[indexPath.section] {
            
        case .first(let viewModel):
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            
            let color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            cell.backgroundColor = color
            cell.clipsToBounds = true
            let isFirstItem = indexPath.item == 0
            let isLastItem = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1
            
                if  isLastItem {
                    cell.layer.cornerRadius = 8
                    cell.layer.maskedCorners =
                    [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                } else if isFirstItem {
                    cell.layer.cornerRadius = 8
                    cell.layer.maskedCorners =
                    [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                }else {
                    cell.layer.cornerRadius = 0
                }
            cell.configure(viewModel: viewModel[indexPath.row])
        
            return cell
        case .second(let viewModel):
            
            if viewModel[indexPath.row].exchangedCoin != "" {
                guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:SwappedCollectionViewCell.identifier, for: indexPath) as? SwappedCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(viewModel: viewModel[indexPath.row])
                return cell
            }else if viewModel[indexPath.row].walletID != "" {
                
                guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:SecondSectionCollectionViewCell.identifier, for: indexPath) as? SecondSectionCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(viewModel: viewModel[indexPath.row])
                return cell
                
            }else if viewModel[indexPath.row].sentNFTImage != "" {
                
                guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:SentNftCollectionViewCell.identifier, for: indexPath) as? SentNftCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(viewModel: viewModel[indexPath.row])
                return cell
            } else  {
                    
                    guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:ReceivedNfTCollectionViewCell.identifier, for: indexPath) as? ReceivedNfTCollectionViewCell else {
                        return UICollectionViewCell()
                    }
                    
                    cell.configure(viewModel: viewModel[indexPath.row])
                    return cell
                
                
            }
        case .button(_):
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:ActionButtonsCollectionViewCell.identifier, for: indexPath) as? ActionButtonsCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .walletBalance(_):
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:BalanceCollectionViewCell.identifier, for: indexPath) as? BalanceCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: 0, section: 0)
        guard let cell = self.homeCollectionView.cellForItem(at: indexPath) as? BalanceCollectionViewCell else {
               return
           }
        
        let safeAreaTop = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        
        let magicalSafeAreaTop:CGFloat = safeAreaTop + (navigationController?.navigationBar.frame.height ?? 0)
        
        let offset = scrollView.contentOffset.y + magicalSafeAreaTop
        
        
        let alpha:CGFloat =  1 - (scrollView.contentOffset.y + magicalSafeAreaTop)/magicalSafeAreaTop
        print(alpha)
        if alpha <= 0.94  {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                DispatchQueue.main.async {
                    self.stackView.isHidden = false
                    cell.stackView.alpha = 0.00
                    self.stackView.alpha = 1.0
                  
                }
               }, completion: nil)
           }else if alpha ==  0.9482200647249192 {
               UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
             
                   DispatchQueue.main.async {
                       self.stackView.isHidden = false
                       self.stackView.alpha = 0.0
                       cell.stackView.alpha = 1.00
                   }
                  
                  }, completion: nil)
               
           }else {
               UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                   DispatchQueue.main.async {
                       self.stackView.isHidden = false
                       cell.stackView.alpha = 0.00
                       self.stackView.alpha = 1.0
                      
                   }
                  }, completion: nil)
           }
           
    }
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, layoutEnvironment in
            switch self?.editorialSectionType[section] {
            case .first(_):
                return self?.firstCollectionViewLayout()
            case .second(_):
                return  self?.secondCollectionViewLayout() 
            case .none:
                return  self?.firstCollectionViewLayout()
            case .button(_):
                return  self?.buttonCollectionViewLayout()
            case .some(.walletBalance(_)):
                return  self?.walletCollectionViewLayout()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        switch editorialSectionType[indexPath.section] {
        case .walletBalance(_):
            break
        case .button(_):
            break
        case .first(_):
            break
        case .second(let viewModel):
            guard let vM = viewModel.first else {
                return UICollectionReusableView()
            }
            if vM == viewModel[0] {
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionView.identifier, for: indexPath) as? TitleHeaderCollectionView else {
                        return UICollectionReusableView()
                    }
                    return header
                } else if kind == UICollectionView.elementKindSectionFooter {
                    guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.identifier, for: indexPath) as? CustomFooterView else {
                        return UICollectionReusableView()
                    }
                    return footer
                }
            }else {
                
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionView.identifier, for: indexPath) as? TitleHeaderCollectionView else {
                        return UICollectionReusableView()
                    }
                    return header
                    if kind == UICollectionView.elementKindSectionFooter {
                        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: subHeaderCollectionView.identifier, for: indexPath) as? subHeaderCollectionView else {
                            return UICollectionReusableView()
                        }
                        return footer
                    }
                }
            }
           
        }
        return UICollectionReusableView()
        
    }

    private func firstCollectionViewLayout() -> NSCollectionLayoutSection  {
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(80)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func buttonCollectionViewLayout() -> NSCollectionLayoutSection  {
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(80)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func walletCollectionViewLayout() -> NSCollectionLayoutSection  {
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(88)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    
    
    private func secondCollectionViewLayout() -> NSCollectionLayoutSection  {
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(88)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading), .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(10)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
        ]
       
        
        return section
    }
}


