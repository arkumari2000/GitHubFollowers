//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Archana Kumari on 02/09/25.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var userName: String!
    var userInfo: User!
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    
    var itemViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureDoneButton()
        getUserDetail()
        layoutUI()
    }
    
    func getUserDetail() {
        NetworkManager.shared.getUserDetails(for: userName) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.userInfo = user
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: self.userInfo), to: self.headerView)
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
                return
            }
            
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

    func configureDoneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func layoutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo]
        let padding: CGFloat = 10
        let itemViewHeight: CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemViewHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemViewHeight)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
