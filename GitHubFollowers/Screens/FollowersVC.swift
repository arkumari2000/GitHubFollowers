//
//  FollowersVC.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 23/07/25.
//

import UIKit

class FollowersVC: UIViewController {
    
    var userName: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
