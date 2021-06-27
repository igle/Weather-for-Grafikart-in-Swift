//
//  ModelWeather.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import Foundation

// https://app.quicktype.io/ => Flemme de le faire a la mano

struct ModelWeather: Decodable  {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
}

// MARK: - City
struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone: Int
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
}

// MARK: - List
struct List: Decodable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let weather: [Weather]
    let speed: Double
    let deg: Int
    let gust: Double
    let clouds: Int
    let pop: Double
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Decodable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Decodable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}



// MARK: - Chercher les données
extension ModelWeather {
    // Récupération de la météo depuis l'api
    static func fetchWheathers(city: String, days: Int, completion: @escaping (ModelWeather?, Error?) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&appid=(API)&lang=fr&cnt=\(days)&mode=json&units=metric"
        
        if let url = URL(string: urlString) {
            do {
                let jsonData = try Data(contentsOf: url)
                let weather = try JSONDecoder().decode(ModelWeather.self, from: jsonData)
                completion(weather, nil)
            } catch let jsonErr {
                completion(nil, jsonErr)
            }
        }
    }
}
