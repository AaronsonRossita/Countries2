//
//  CountryManager.swift
//  Countries2
//
//  Created by Rossita on 30/05/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import Foundation

protocol CountryManagerDelegate {
    func didDownloadCountries(_ array: [CountryData])
    func failedWithError(_ error: Error)
}

class CountryManager {
    
    let countryURL = "https://raw.githubusercontent.com/ItzikBarNoy/developwithswiftios/master/countries.json"
    
    var delegate: CountryManagerDelegate?
    
     func getCountries(){
        
        if let url = URL(string: countryURL){
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print("get countries error")
                    print(error!)
                }else{
                    if let safeData = data{
                        if let countries = self.parseJSON(countryData: safeData){
                            self.delegate?.didDownloadCountries(countries)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(countryData: Data) -> [CountryData]?{
        let decoder = JSONDecoder()
        do{
            let countries = try decoder.decode([CountryData].self, from: countryData)
            return countries
        }catch{
            delegate?.failedWithError(error)
            return nil
        }
    }
}
