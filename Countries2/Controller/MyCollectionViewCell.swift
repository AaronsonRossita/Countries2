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

    public func configure(name: String?, population: Int?, flag: String?){
        if let safeName = name{
            label.text = safeName
        }else{
            label.text = ""
        }
        if let safePopulation = population{
            label2.text = K.changeNumber(from: safePopulation)
        }else{
            label2.text = ""
        }
        label2.layer.cornerRadius = 10
        label2.layer.backgroundColor = K.Color.populationColor(population: population!)
        label2.layer.borderColor = K.Color.black
        label2.layer.borderWidth = CGFloat(2.0)
        loadImage(flag: flag)
    }
    
    static func nib() -> UINib{
        return UINib(nibName: K.identifier, bundle: nil)
    }
    
    func loadImage(flag image: String?){
        if let imageUrl = image{
            if let url = URL(string: imageUrl){
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            self.viewImage.image = UIImage(data: data)
                            for cons in self.viewImage.constraints{
                                if cons.identifier == K.Image.height{
                                    cons.constant = K.cellWidth * 0.75
                                }else if cons.identifier == K.Image.width{
                                    cons.constant = K.cellWidth
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
