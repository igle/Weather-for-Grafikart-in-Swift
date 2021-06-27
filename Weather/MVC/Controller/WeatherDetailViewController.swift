//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: - Initialisation des variables
    var weather : ModelWeather!
    
    
    // MARK: -Initialisation des vues
    lazy var tableView : UITableView = {
        let tv : UITableView = UITableView(frame: .zero)
        tv.register(SimpleWeatherTableViewCell.self, forCellReuseIdentifier: SimpleWeatherTableViewCell.reuseIdentifier)
        tv.dataSource = self
        tv.delegate = self
        tv.estimatedRowHeight = UITableView.automaticDimension
        tv.rowHeight = UITableView.automaticDimension
        tv.layoutSubviews()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // On ajoute la tableView au controller
        view.addSubview(tableView)
    }
    
    
    // MARK: - Ajout des contraintes
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
}


// MARK: - tableView delegate
extension WeatherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleWeatherTableViewCell.reuseIdentifier, for: indexPath) as! SimpleWeatherTableViewCell
        cell.weatherList = weather.list[indexPath.row]
        return cell
    }

    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
