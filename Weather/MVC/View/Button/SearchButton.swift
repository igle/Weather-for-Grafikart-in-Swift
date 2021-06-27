//
//  SearchButton.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class SearchButton: UIButton {

    // MARK: -Init frame
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        // Active les Anchor constraint
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Configuration du bouton
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.lightGray, for: .highlighted)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel?.adjustsFontForContentSizeCategory = true
        tintColor = .white
        backgroundColor = UIColor.colorPrimary()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    // MARK: - Init coder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
