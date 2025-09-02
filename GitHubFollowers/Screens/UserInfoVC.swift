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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        getUserDetail()
        configureDoneButton()
    }
    
    func getUserDetail() {
        NetworkManager.shared.getUserDetails(for: userName) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.userInfo = user
                
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
}
