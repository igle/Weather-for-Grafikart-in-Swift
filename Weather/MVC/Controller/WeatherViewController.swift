//
//  WeatherViewController.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: -Initialisation des vues
    let textFieldCity : SimpleTextField = SimpleTextField(frame: .zero, placeholder: "Rechercher une ville")
    
    let buttonSearch : SearchButton = SearchButton(frame: .zero, title: "RECHERCHER")
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuration du navigation controller
        navigationController?.navigationBar.barTintColor = UIColor.colorPrimary()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = "Rechercher une ville"

        // Ajout des vues sur le ViewController
        view.addSubview(textFieldCity)
        view.addSubview(buttonSearch)
        
        // Ajout de l'action sur le bouton
        buttonSearch.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        
        // Desactive le clavier du textfield
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    //MARK: - Desactiver le clavier
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //MARK: - Bouton recherché clické
    @objc func clickButton(sender: UIButton) {
        print("Yeah Click")
        self.performSegue(withIdentifier: "detailWeather", sender: Weathers)
    }
    
    // MARK: - Changement du controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailWeather" {
            let controller = segue.destination as! WeatherDetailViewController
            controller.title = "Météo \(textFieldCity.text!)"
            let backItem = UIBarButtonItem()
            backItem.title = ""
            backItem.tintColor = UIColor.white
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    // MARK: - Ajout des contraintes
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        NSLayoutConstraint.activate([
            
            textFieldCity.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            textFieldCity.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldCity.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            textFieldCity.heightAnchor.constraint(equalToConstant: 40),
            
            buttonSearch.topAnchor.constraint(equalTo: textFieldCity.bottomAnchor, constant: 20),
            buttonSearch.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonSearch.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
        ])
        
    }
}
