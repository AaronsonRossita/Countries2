//
//  MyCollectionViewCell.swift
//  Countries2
//
//  Created by Rossita on 31/05/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(name: String, color: UIColor, population: Int, flag: UIImage){
        label.text = name
        label2.backgroundColor = color
        label2.text = String(population)
        viewImage.image = flag
    }
    
    static func nib() -> UINib{
        return UINib(nibName: K.identifier, bundle: nil)
    }
}
