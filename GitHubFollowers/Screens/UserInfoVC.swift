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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        getUserDetail()
        configureDoneButton()
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
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
