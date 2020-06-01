//
//  SecondViewController.swift
//  Countries2
//
//  Created by Rossita on 01/06/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var capitalCity: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var officialLanguages: UILabel!
    
    var country: CountryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillTheFields(country: country)
    }
    
    
    func fillTheFields(country: CountryData?){
        if let safeCountry = country{
            if let safeName = safeCountry.name{
                name.text = safeName
            }else{
                name.text = "name not provided"
            }
            if let safeCurrency = safeCountry.currency{
                currency.text = "Currency : \(String(describing: safeCurrency))"
            }else{
                currency.text = "currency not provided"
            }
            if let safePopulation = safeCountry.population{
                population.text = "Population: \(K.changeNumber(from: safePopulation))"
            }else{
                population.text = "population not provided"
            }
            if let safeCapital = safeCountry.capitalCity{
                capitalCity.text = "Capital city: \(safeCapital)"
            }else{
                capitalCity.text = "capital city not provided"
            }
            if let safeLangs = safeCountry.officialLanguages{
                officialLanguages.text = "Official languages: \(K.languages(langs: safeLangs))"
            }
            if let safeFlag = safeCountry.flagImage{
                loadImage(from: safeFlag)
            }
        }
    }
    
    func loadImage(from url: String?){
        if let imageUrl = url{
            if let url = URL(string: imageUrl){
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }
}
