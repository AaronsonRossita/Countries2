//
//  ViewController.swift
//  Countries2
//
//  Created by Rossita on 31/05/2020.
//  Copyright © 2020 Rossita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let countryManager = CountryManager()
    private var layout: UICollectionViewFlowLayout!
    var countries = [CountryData](){
        willSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryManager.delegate = self
        countryManager.getCountries()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: K.identifier)
        configureLayout() 
    }


    func configureLayout(){
        if layout == nil {
            layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: K.cellWidth, height: K.cellWidth * 1.25)
            layout.minimumLineSpacing = K.spacing
            collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
}

//MARK: - CollectionView

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(name: countries[indexPath.row].name, population: countries[indexPath.row].population, flag: countries[indexPath.row].flagImage)
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: K.segue, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segue{
            let cell = sender as! IndexPath
            let destination = segue.destination as! SecondViewController
            destination.country = countries[cell.row]
        }
    }
    
}

//MARK: - CountryManager

extension ViewController: CountryManagerDelegate{
    
    func didDownloadCountries(_ array: [CountryData]) {
        self.countries = array
    }
    
    func failedWithError(_ error: Error) {
        print(error)
    }
    
    
}
