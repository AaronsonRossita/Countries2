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
    
    static let columns: CGFloat = 3
    static let spacing: CGFloat = 10
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    static var cellWidth: CGFloat {(screenWidth - spacing * (columns+1)) / columns}
    
}
