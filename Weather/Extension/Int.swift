//
//  Int.swift
//  Weather
//
//  Created by Jules Dubois on 02/07/2021.
//

import UIKit

extension Int {
    // Convertir le timeStamp en date
    func convertTimeStampToDate(dateFormatter: String) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.locale = Locale(identifier: "FR-fr")
        return formatter.string(from: date as Date)
    }
}
