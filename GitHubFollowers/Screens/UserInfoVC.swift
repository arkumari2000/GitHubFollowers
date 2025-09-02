//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Archana Kumari on 02/09/25.
//

import UIKit

class UserInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureDoneButton()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

    func configureDoneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
}
