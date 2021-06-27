//
//  BodyRightLabel.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class TitleRightLabel: UILabel {
    
    // MARK: -Init frame
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        // Active Anchor constraint
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Configuration du lable
        self.font = UIFont.preferredFont(forTextStyle: .title1)
        self.adjustsFontForContentSizeCategory = true
        self.text = title
        self.textAlignment = .right
        
        // Ajout de la taille automatique
        self.numberOfLines = 1
        self.adjustsFontSizeToFitWidth = true
        self.baselineAdjustment = .alignCenters
        self.sizeToFit()
    }
    
    // MARK: - Init coder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
