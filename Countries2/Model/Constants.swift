//
//  Constants.swift
//  Countries2
//
//  Created by Rossita on 31/05/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import Foundation
import UIKit

struct K {
    
    static let identifier = "MyCollectionViewCell"
    
    static let columns: CGFloat = 2
    static let spacing: CGFloat = 10
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    static var cellWidth: CGFloat {(screenWidth - spacing * (columns+1)) / columns}
    
    static let segue = "segue"
    
    struct Color {
        
        static let black = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        static let white = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        static let red = CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 0.5)
        static let blue = CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 0.5)
        static let green = CGColor(srgbRed: 0, green: 1, blue: 0, alpha: 0.5)
        static let orange = CGColor(srgbRed: 1, green: 0.5, blue: 0, alpha: 0.5)
        
        static func populationColor(population: Int) -> CGColor{
            switch population / 1000000 {
            case 0...19:
                return green
            case 21...79:
                return orange
            default:
                return red
            }
        }
    }
 
    
    struct Image{
        
        static let width = "imageWidth"
        static let height = "imageHeight"
        
    }
    
    
    static func changeNumber(from this: Int) -> String{
           let formater = NumberFormatter()
           formater.numberStyle = .decimal
           let string = formater.string(from: NSNumber(value: this))
           return "  \(string!)  "
       }
    
    static func languages(langs: [String]) -> String{
        var str = ""
        for index in 0...langs.count-1 {
            if index == langs.count-1{
                str += "\(langs[index])"
            }else{
                str += "\(langs[index]), "
            }
        }
        return str
    }
}
