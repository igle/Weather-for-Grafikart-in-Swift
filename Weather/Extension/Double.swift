//
//  Double.swift
//  Weather
//
//  Created by Jules Dubois on 28/06/2021.
//

import UIKit

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
