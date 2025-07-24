//
//  GFCustomAlertVC.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 24/07/25.
//

import UIKit

class GFCustomAlertVC: UIViewController {
    
    let containerView = UIStackView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(alertTitle: String?, message: String?, buttonTitle: String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureTitleLabel()
        configureBodyLabel()
        configureActionButton()
        configureContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// Views Configuration
private extension GFCustomAlertVC {
    
    func configureContainerView() {
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        
        containerView.axis = .horizontal
        containerView.spacing = 10
        containerView.axis = .vertical
        containerView.alignment = .fill
        containerView.distribution = .fillProportionally
        
        view.addSubview(containerView)
        
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(bodyLabel)
        containerView.addArrangedSubview(actionButton)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something Went Wrong"
    }
    
    func configureBodyLabel() {
        bodyLabel.text = message ?? "Unable to Complete Request"
        bodyLabel.numberOfLines = 4
    }
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
}
