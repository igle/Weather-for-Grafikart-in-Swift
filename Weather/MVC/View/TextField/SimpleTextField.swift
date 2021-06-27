//
//  SimpleTextField.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class SimpleTextField: UITextField {

    // MARK: -Init frame
    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        
        // Active Anchor constraint
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Configuration du textfield
        self.textAlignment = .left
        self.borderStyle = .line
        self.adjustsFontForContentSizeCategory = true
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.layer.borderWidth = 1
        self.isUserInteractionEnabled = true
        self.placeholder = placeholder
        self.autocorrectionType = .no
    }
    
    // MARK: - Init coder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
