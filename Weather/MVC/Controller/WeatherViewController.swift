//
//  WeatherViewController.swift
//  Weather
//
//  Created by Jules Dubois on 27/06/2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Initialisation des vues
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
    
    
    //MARK: - Click du Bouton recherche
    @objc func clickButton(sender: UIButton) {
        // On vérifie que le textfield est bien rempli
        if textFieldCity.text == "" {
            let alert = UIAlertController(title: "Erreur", message: "Vous devez saisir une ville!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // On désactive l'utilisation du bouton pour eviter les spams
        buttonSearch.isUserInteractionEnabled = false
        
        // On va chercher les datas
        ModelWeather.fetchWheathers(city: textFieldCity.text!, days: 7) { (Weathers, error) in
            // On reactive le bouton
            self.buttonSearch.isUserInteractionEnabled = true
            
            // Si il y a une erreur on l'affiche
            if let error = error {
                // On affiche l'alert
                let alert = UIAlertController(title: "Problème lors de la récupération des données", message: "\(error.localizedDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            
            // Sinon on ouvre le nouveau controller
            self.performSegue(withIdentifier: "detailWeather", sender: Weathers)
        }
    }
    
    
    // MARK: - Changement du controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailWeather" {
            let controller = segue.destination as! WeatherDetailViewController
            controller.title = "Météo / \(textFieldCity.text!)"
            controller.weather = (sender as! ModelWeather)
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
