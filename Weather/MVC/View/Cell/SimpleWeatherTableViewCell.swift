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
            
            imageWeather.downloaded(from: "https://openweathermap.org/img/wn/\(weatherList.weather[0].icon)@2x.png")
        }
    }
    
    
    // MARK: -Init frame
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Ajout de l'image
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageWeather)
        // Ajout des labels
        labelDateText.font = UIFont.preferredFont(forTextStyle: .title2)
        addSubview(labelDateText)
        labelDate.textColor = UIColor(named: "ColorText")
        labelDate.font = UIFont.preferredFont(forTextStyle: .title2)
        addSubview(labelDate)
        labelTemperature.font = UIFont.preferredFont(forTextStyle: .title2)
        addSubview(labelTemperature)
        
        
        // Change type cell
        accessoryType = .none
        selectionStyle = .none
        backgroundColor = UIColor(named: "ColorSecondary")
        
        // Ajout une constraint
        NSLayoutConstraint.activate([
            imageWeather.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageWeather.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageWeather.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            labelDateText.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10),
            labelDateText.leadingAnchor.constraint(equalTo: imageWeather.trailingAnchor),
            labelDateText.centerYAnchor.constraint(equalTo: imageWeather.centerYAnchor),
            labelDateText.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10),
            
            labelDate.leadingAnchor.constraint(equalTo: labelDateText.trailingAnchor, constant: 10),
            labelDate.centerYAnchor.constraint(equalTo: labelDateText.centerYAnchor),
            
            labelTemperature.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            labelTemperature.centerYAnchor.constraint(equalTo: labelDate.centerYAnchor),
        ])
    }
    
    
    // MARK: - Init coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
