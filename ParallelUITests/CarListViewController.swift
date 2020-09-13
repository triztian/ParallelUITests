//
//  ViewController.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/12/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController {
    @IBOutlet weak var carCollection: UICollectionView!
    
    lazy var carRepository = LocalCarRepository()
    var cars = [Car]()

    override func loadView() {
        super.loadView()
        carCollection.dataSource = self

        _ = carRepository.list().sink(receiveCompletion: {error in
            print("Error", error)
        }) { cars in
            DispatchQueue.main.async {
                print("Cars", cars)
                self.cars = cars
                self.carCollection.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CarListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionCell", for: indexPath)
            as! CarCollectionCell
        cell.pictureImage.image = UIImage(named: cars[indexPath.row].imageAssetName ?? "")
        cell.nameLabel.text = cars[indexPath.row].name
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "USD"
        currencyFormatter.currencySymbol = "$"
        currencyFormatter.decimalSeparator = "."
        currencyFormatter.currencyGroupingSeparator = ","
        currencyFormatter.groupingSize = 3
        
        cell.priceLabel.text = currencyFormatter.string(from: NSNumber(value: cars[indexPath.row].price))
        return cell
    }
}

// MARK: CollectionViewCell

class CarCollectionCell: UICollectionViewCell {
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
