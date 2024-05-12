//
//  WalletViewController.swift
//  TonWallet
//
//  Created by MacBook AIR on 23/03/2024.
//

import UIKit
import SwiftUI

class WalletViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ActionButtonsCollectionViewCellProtocol {
  
    
 
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    private lazy var homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Toncolors.lightBlueColor
        return collectionView
    }()
    
    lazy var adjustButtonLeftButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "Settings")?.withRenderingMode(.alwaysOriginal), style:.plain, target: self, action:nil)
        return button
   }()
    
    var isScrollingDown = false
    lazy var adjustButtonRightButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal), style:.plain, target: self, action:#selector(inboxTapped))
        return button
   }()
    
    lazy var  walletBalanceLabel:UILabel = {
        let label = UILabel()
        label.text = "$546 027.5"
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
    private let stackView1: UIView  = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.maskedCorners =    [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackView.layer.cornerRadius = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let  walletEmptyImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let walletEmptyLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font =  .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You have no\n transactions yet."
        return label
    }()
    
    let addButton = TransactionCustomButton()
    let sendButton = TransactionCustomButton()
    let earnButton = TransactionCustomButton()
    let swapButton = TransactionCustomButton()
    
    
    var editorialSectionType:[listSection] = dummyData
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        centerTitle()
        configureCollectionView()
        configureConstraints()
        configureDelegateAndDataSource()
        setupNavBar()
      
        sendButton.addTarget(self, action: #selector(didTapSend1), for: .touchUpInside)
        swapButton.addTarget(self, action: #selector(didTapSwap1), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(didTapBuy1), for: .touchUpInside)
        earnButton.addTarget(self, action: #selector(didTapEarn1), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEditorialSectionTypeChange), name: Notification.Name("EditorialSectionTypeDidChange"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEditorialSectionTypeChange1), name: Notification.Name("EditorialSectionTypeDidChange1"), object: nil)
    }
    
   
    @objc func handleEditorialSectionTypeChange() {
        // Change the variable here
        editorialSectionType = dummyData
        
        HapticManager.shared.vibrateForSelection()
        if editorialSectionType.count > 2 {
            
            walletBalanceLabel.text = "$546 027.5"
            homeCollectionView.layer.opacity = 1
           // homeCollectionView.reloadData()
        }else {
            walletBalanceLabel.text = "$0"
            homeCollectionView.layer.opacity = 0
        }
        configureStack()
    }

    @objc func handleEditorialSectionTypeChange1() {
        // Change the variable here
        editorialSectionType = dummyData1
        HapticManager.shared.vibrateForSelection()
        if editorialSectionType.count > 2 {
            walletBalanceLabel.text = "$546 027.5"
            homeCollectionView.layer.opacity = 1
           // homeCollectionView.reloadData()
        }else {
            walletBalanceLabel.text = "$0"
            homeCollectionView.layer.opacity = 0
        }
        configureStack()
    }

  
    override func viewWillAppear(_ animated: Bool) {
        HapticManager.shared.vibrateForSelection()
        if editorialSectionType.count > 2 {
            walletBalanceLabel.text = "$546 027.5"
            homeCollectionView.layer.opacity = 1
        }else {
            walletBalanceLabel.text = "$0"
            homeCollectionView.layer.opacity = 0
        }
       configureStack()

    }
  
    
    func configureStack() {
        if editorialSectionType.count < 3 {
            let stackView1 = UIStackView(arrangedSubviews: [walletBalanceLabel,mainWalletText])
            walletBalanceLabel.font = .systemFont(ofSize: 34)
            mainWalletText.font = .systemFont(ofSize: 17)
            stackView1.axis = .vertical
            stackView1.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackView1)
            view.backgroundColor = Toncolors.lightBlueColor
            
            
            NSLayoutConstraint.activate([
                stackView1.topAnchor.constraint(equalTo:  view.topAnchor,constant: 100),
                stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
                stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
                
                
            ])
            let stackView = UIStackView(arrangedSubviews: [addButton, sendButton, earnButton, swapButton])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.spacing = 10
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo:  stackView1.bottomAnchor,constant: 40),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
                stackView.heightAnchor.constraint(equalToConstant: 60),
                
            ])
            
            let stackView3 = UIView()
            stackView3.backgroundColor = .white
            stackView3.translatesAutoresizingMaskIntoConstraints = false
            stackView3.layer.maskedCorners =    [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            stackView3.layer.cornerRadius = 16
            view.addSubview(stackView3)
            NSLayoutConstraint.activate([
                stackView3.topAnchor.constraint(equalTo:  stackView.bottomAnchor,constant: 20),
                stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
                stackView3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
                stackView3.bottomAnchor.constraint(equalTo:view.bottomAnchor),
                
            ])
            
            
            view.addSubview(walletEmptyImageView)
            NSLayoutConstraint.activate([
                walletEmptyImageView.centerXAnchor.constraint(equalTo: stackView3.centerXAnchor, constant: 0),
                walletEmptyImageView.centerYAnchor.constraint(equalTo: stackView3.centerYAnchor,constant: -100),
                walletEmptyImageView.widthAnchor.constraint(equalToConstant:124),
                walletEmptyImageView.heightAnchor.constraint(equalToConstant: 124)
                
            ])
            
            
            walletEmptyImageView.image = UIImage.gifImageWithName("created")
            
            view.addSubview(walletEmptyLabel)
            
            NSLayoutConstraint.activate([
                walletEmptyLabel.centerXAnchor.constraint(equalTo: stackView3.centerXAnchor, constant: 0),
                walletEmptyLabel.topAnchor.constraint(equalTo: walletEmptyImageView.bottomAnchor,constant: 10),
                walletEmptyLabel.widthAnchor.constraint(equalToConstant:180),
                
                
            ])
            
            
            if editorialSectionType.count > 2 {
                stackView.layer.opacity = 0
                stackView3.layer.opacity = 0
                stackView1.layer.opacity = 0
                walletEmptyImageView.layer.opacity = 0
                walletEmptyLabel.layer.opacity = 0
            }else {
                stackView.layer.opacity = 1
                stackView1.layer.opacity = 1
                stackView3.layer.opacity = 1
                walletEmptyImageView.layer.opacity = 1
                walletEmptyLabel.layer.opacity = 1
            }
            
            
            
            configureButton()
        }
        
        
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

    @objc func inboxTapped() {
        let vc = UIHostingController(rootView:ScannerView2())
        present(vc, animated: true)
    }
    
    func setupNavBar() {
      
      
        let width = view.frame.width
        stackView.frame =  .init(x: 0, y: 0, width: width, height: 600)
        stackView.isHidden = true
        navigationItem.titleView = stackView
        
       
    
    }
   
    func centerTitle(){

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
                    let vc = UIHostingController(rootView:RecivedNfT2())
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
            
            
            let color = Toncolors.darkBlueColor
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
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:ReceivedNfTCollectionViewCell.identifier, for: indexPath) as? ReceivedNfTCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(viewModel: viewModel[indexPath.row])
          
            
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
            } else if viewModel[indexPath.row].senfNFTCategpries != "" {
                    
                    guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:ReceivedNfTCollectionViewCell.identifier, for: indexPath) as? ReceivedNfTCollectionViewCell else {
                        return UICollectionViewCell()
                    }
                    
                    cell.configure(viewModel: viewModel[indexPath.row])
                    return cell
                
                
            }
            return cell
        case .button(_):
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:ActionButtonsCollectionViewCell.identifier, for: indexPath) as? ActionButtonsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            return cell
        case .walletBalance(_):
            guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:BalanceCollectionViewCell.identifier, for: indexPath) as? BalanceCollectionViewCell else {
                return UICollectionViewCell()
            }
            if editorialSectionType.count > 2 {
                cell.configureCell(x: "$546 027.5")
            }else{
                cell.configureCell(x: "$O")
            }
            return cell
        }
       
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: 0, section: 0)
        guard let cell = self.homeCollectionView.cellForItem(at: indexPath) as? BalanceCollectionViewCell else {
            return
        }
        
        let safeAreaTop = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let magicalSafeAreaTop = safeAreaTop + navigationBarHeight
        
        let offset = scrollView.contentOffset.y + magicalSafeAreaTop
        let newAlpha: CGFloat = 1 - offset / magicalSafeAreaTop
        
        if offset > 0 && offset < magicalSafeAreaTop {
            // Scrolling up
            if !isScrollingDown {
                UIView.animate(withDuration: 0.3) {
                    DispatchQueue.main.async{[weak self ] in
                        cell.walletBalanceLabel.transform = CGAffineTransform(scaleX: newAlpha, y: newAlpha)
                        cell.mainWalletText.transform = CGAffineTransform(scaleX: newAlpha, y: newAlpha)
                        print(newAlpha)
                        if  newAlpha < 0.3559870550161811 {
                            
                            self?.stackView.isHidden = false
                            self?.walletBalanceLabel.transform = CGAffineTransform(scaleX: 1 - newAlpha - 0.1, y: 1 - newAlpha)
                            self?.mainWalletText.transform = CGAffineTransform(scaleX: 1 - newAlpha - 0.1, y: 1 - newAlpha)
                        }else {
                            self?                                                                                                                                                                                                                            .stackView.isHidden = true
                        }
                        
                        
                    }
                }
            }
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
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(60)),subitem:item2,count: 1)
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
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.absolute(60)),subitem:item2,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading), .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(10)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
        ]
       
        
        return section
    }
    func didTapAdd() {
        HapticManager.shared.vibrate(for: .success)
        present(self.createActionSheet(), animated: true, completion: nil)
    }
    
    func didTapSend() {
        HapticManager.shared.vibrate(for: .success)
        let vc = UIHostingController(rootView:ChooseCurrencyView())
        present(vc, animated: true)
    }
    
    func didTapEarn() {
        HapticManager.shared.vibrate(for: .success)
        let vc = UIHostingController(rootView:EarnView())
        present(vc, animated: true)
      
      
    }
    
    func didTapSwap() {
        HapticManager.shared.vibrate(for: .success)
        let vc = UIHostingController(rootView:  SwapView())
        present(vc, animated: true)
      
    }
    
     @objc func didTapEarn1() {
         
         UIView.animate(withDuration: 0.2) {[weak self] in
             self?.earnButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
             HapticManager.shared.vibrate(for: .success)
             let vc = UIHostingController(rootView:EarnView())
             self?.present(vc, animated: true)
         }completion: {[weak self]  _ in
             self?.earnButton.backgroundColor = Toncolors.darkBlueColor
         }
     }
     @objc func didTapBuy1() {
         
         UIView.animate(withDuration: 0.2) {[weak self] in
             self?.addButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
             HapticManager.shared.vibrate(for: .success)
             self?.present(self!.createActionSheet(), animated: true, completion: nil)
         }completion: { [weak self] _  in
             self?.addButton.backgroundColor = Toncolors.darkBlueColor
         }
     }
     @objc func didTapSwap1() {
         
         UIView.animate(withDuration: 0.2) {[weak self] in
             self?.swapButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
             HapticManager.shared.vibrate(for: .success)
             let vc = UIHostingController(rootView:  SwapView())
             self?.present(vc, animated: true)
           
             
         }completion: { [weak self]  _ in
             self?.swapButton.backgroundColor = Toncolors.darkBlueColor
         }
     }
     
     @objc func didTapSend1() {
         
         UIView.animate(withDuration: 0.2) {[weak self] in
             self?.sendButton.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
             HapticManager.shared.vibrate(for: .success)
             let vc = UIHostingController(rootView:ChooseCurrencyView())
             self?.present(vc, animated: true)
         }completion: { [weak self]  _ in
             self?.sendButton.backgroundColor =  Toncolors.darkBlueColor
         }
     }
    
    private func createActionSheet()  -> UIAlertController {
            let actionSheet = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
            
            let buyWithCardAction = UIAlertAction(title: "Buy with Card", style: .default) { _ in
                // Handle Buy with Card action
                let vc = UIHostingController(rootView:  BuyCardQRView2(url: "https://ton.org/buy-toncoin?filters[exchange_groups][slug][$eq]=buy-with-card&pagination[page]=1&pagination[pageSize]=100"))
                self.present(vc, animated: true)
               
               
            }
            actionSheet.addAction(buyWithCardAction)
            
            let buyWithCryptoAction = UIAlertAction(title: "Buy with Crypto", style: .default) { _ in
                HapticManager.shared.vibrate(for: .success)
                let vc = UIHostingController(rootView:   QrSendView())
                self.present(vc, animated: true)
            }
            actionSheet.addAction(buyWithCryptoAction)
            
            let receiveQRInvoiceAction = UIAlertAction(title: "Receive with QR or Invoice", style: .default) { _ in
                HapticManager.shared.vibrate(for: .success)
                let vc = UIHostingController(rootView:   CrossChainQrSwap())
                self.present(vc, animated: true)
            }
            actionSheet.addAction(receiveQRInvoiceAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            
            return actionSheet
        }
}


