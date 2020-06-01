//
//  CountryData.swift
//  Countries2
//
//  Created by Rossita on 30/05/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import Foundation

struct CountryData: Decodable {
    
    let name: String?
    let officialLanguages: [String]?
    let population: Int?
    let currency: String?
    let capitalCity: String?
    let flagImage: String?
    
}
