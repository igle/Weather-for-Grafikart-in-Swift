//
//  UIColor.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import Foundation
import UIKit

extension UIColor {
    // Utilisation des couleurs Hex
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    static func colorPrimary() -> UIColor {
        return  UIColor.init(hex: 0xa9273e)
    }
    
    static func colorSecondary() -> UIColor {
        return  UIColor.init(hex: 0x374161)
    }
}
