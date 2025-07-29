//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 22/07/25.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let inputField = GFTextField(placeholderText: "Enter Username", )
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !inputField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViews()
        createKeyboardDismissingGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureViews() {
        configureLogoImageView()
        configureInputField()
        configureActionButton()
    }
    
    func createKeyboardDismissingGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersVC() {
        guard isUsernameEntered else {
            self.presentGFAlertOnMainThread(title: "Empty Username", message: "Please provide username, we need to know who to look for 🧐", buttonTitle: "Ok")
            return
        }
        let followers = FollowersVC()
        followers.userName = inputField.text
        followers.navigationItem.title = inputField.text
        navigationController?.pushViewController(followers, animated: true)
    }
}

// Views Layouting Extension
private extension SearchVC {
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureInputField() {
        view.addSubview(inputField)
        inputField.delegate = self
        
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            inputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            inputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            inputField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushFollowersVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// UITextFieldDelegate
extension SearchVC: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersVC()
        return true
    }
}
