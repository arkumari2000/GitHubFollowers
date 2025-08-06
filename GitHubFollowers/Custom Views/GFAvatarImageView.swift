//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Archana Kumari on 31/07/25.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
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
        image = defaultImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString:String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let _ = response else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }

}
