//
//  UIViewController+extension.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 24/07/25.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String?, message: String?, buttonTitle: String?) {
        DispatchQueue.main.async {
            let alertView = GFCustomAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertView.modalPresentationStyle = .overFullScreen
            alertView.modalTransitionStyle = .crossDissolve
            self.present(alertView, animated: true)
        }
    }
}
