//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Himanshu Bhati on 23/07/25.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor,
         title: String,
         font: UIFont? = nil,
         titleColor: UIColor? = nil,
         cornerRadius: CGFloat? = nil) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure(font: font,
                  titleColor: titleColor,
                  cornerRadius: cornerRadius)
    }
    
    private func configure(font: UIFont?,
                           titleColor: UIColor?,
                           cornerRadius: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = cornerRadius ?? 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = font ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
}
