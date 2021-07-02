//
//  MaxWeatherTableViewCell.swift
//  Weather
//
//  Created by Jules Dubois on 02/07/2021.
//

import UIKit

class MaxWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Initialisation variable
    static let reuseIdentifier: String = "CellMaxWeather"
    
    
    // MARK: -Initialisation views
    var imageWeather : UIImageView = UIImageView(frame: .zero)
    var labelDateText : TitleLeftLabel = TitleLeftLabel(frame: .zero, title: "")
    var labelDate : TitleLeftLabel = TitleLeftLabel(frame: .zero, title: "")
    var labelTemperature : TitleRightLabel = TitleRightLabel(frame: .zero, title: "")
    
    
    // MARK: -Setup data
    var weatherList: List! {
        didSet {
            labelDateText.text = weatherList.dt.convertTimeStampToDate(dateFormatter: "EEE").capitalizingFirstLetter().replacingOccurrences(of: ".", with: "")
            labelDate.text = weatherList.dt.convertTimeStampToDate(dateFormatter: "dd/MM")
            labelTemperature.text = "\(Int(weatherList.temp.day.round(to: 0)))°C"
            
            imageWeather.downloaded(from: "https://openweathermap.org/img/wn/\(weatherList.weather[0].icon)@2x.png", contentMode: .scaleAspectFill)
        }
    }
    
    
    // MARK: -Init frame
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Ajout des labels
        labelDateText.font = UIFont.preferredFont(forTextStyle: .title2)
        labelDateText.textColor = .white
        addSubview(labelDateText)
        
        // Ajout de l'image
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageWeather)
        
        labelDate.textColor = .white
        labelDate.font = UIFont.preferredFont(forTextStyle: .title2)
        addSubview(labelDate)
        
        labelTemperature.textColor = .white
        addSubview(labelTemperature)
        
        
        // Change type cell
        accessoryType = .none
        selectionStyle = .none
        backgroundColor = UIColor(named: "ColorBk")
        
        // Ajout une constraint
        NSLayoutConstraint.activate([
            
            labelDateText.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            labelDateText.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            imageWeather.topAnchor.constraint(equalTo: labelDateText.bottomAnchor, constant: 5),
            imageWeather.leadingAnchor.constraint(equalTo: labelDateText.leadingAnchor),
            imageWeather.heightAnchor.constraint(equalTo: labelDateText.heightAnchor, multiplier: 2.5),
            imageWeather.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            labelDate.leadingAnchor.constraint(equalTo: labelDateText.trailingAnchor, constant: 10),
            labelDate.centerYAnchor.constraint(equalTo: labelDateText.centerYAnchor),
            
            labelTemperature.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            labelTemperature.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    
    // MARK: - Init coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
