//
//  SimpleWeatherTableViewCell.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class SimpleWeatherTableViewCell: UITableViewCell {

    // MARK: - Initialisation variable
    static let reuseIdentifier: String = "CellSimpleWeather"
    
    
    // MARK: -Initialisation views
    var labelDateText : TitleLeftLabel = TitleLeftLabel(frame: .zero, title: "")
    var labelDate : TitleLeftLabel = TitleLeftLabel(frame: .zero, title: "")
    var labelTemperature : TitleRightLabel = TitleRightLabel(frame: .zero, title: "")
    
    
    // MARK: -Setup data
    var weatherList: List! {
        didSet {
            labelDateText.text = convertTimeStamp(timeStamp: weatherList.dt, dateFormatter: "EEE").capitalizingFirstLetter().replacingOccurrences(of: ".", with: "")
            labelDate.text = convertTimeStamp(timeStamp: weatherList.dt, dateFormatter: "dd/MM")
            labelTemperature.text = "\(Int(weatherList.temp.day.round(to: 0)))°C"
        }
    }
    
    
    // MARK: -Init frame
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Ajout des labels
        addSubview(labelDateText)
        labelDate.textColor = UIColor(named: "ColorText")
        addSubview(labelDate)
        addSubview(labelTemperature)
        
        
        // Change type cell
        accessoryType = .none
        selectionStyle = .none
        backgroundColor = UIColor(named: "ColorSecondary")
        
        // Ajout une constraint
        NSLayoutConstraint.activate([
            labelDateText.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            labelDateText.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            labelDateText.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5),
            
            labelDate.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            labelDate.leadingAnchor.constraint(equalTo: labelDateText.trailingAnchor, constant: 10),
            labelDate.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5),
            
            labelTemperature.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            labelTemperature.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            labelTemperature.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5),
            
        ])
    }
    
    
    // Convertir le timeStamp en date
    func convertTimeStamp(timeStamp: Int, dateFormatter: String) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp))
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.locale = Locale(identifier: "FR-fr")
        return formatter.string(from: date as Date)
    }
    
    
    // MARK: - Init coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
