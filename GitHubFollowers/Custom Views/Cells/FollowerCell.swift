//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Archana Kumari on 31/07/25.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    let defaultImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
