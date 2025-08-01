//
//  FollowersVC.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 23/07/25.
//

import UIKit

class FollowersVC: UIViewController {
    
    var userName: String!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        conifgureViewController()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func conifgureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print("Followers Count: \(followers.count)")
                print(followers)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
                return
            }
            
        }
    }
    
    func createThreeColumnLayoutFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.frame.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createThreeColumnLayoutFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
    }

}
