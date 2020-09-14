//
//  ViewController.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/12/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import UIKit

/**
 A view controller that shows the list of cars available for sale. Tapping a cell pushes the details of the car.
 */
final class CarListViewController: UIViewController {
    @IBOutlet weak var carCollection: UICollectionView!

    lazy var carRepository = LocalCarRepository()

    /// The collection of cars loaded from the repository.
    var cars = [Car]()

    override func loadView() {
        super.loadView()
        carCollection.dataSource = self

        _ = carRepository.list().sink(receiveCompletion: {error in
            print("Error", error)
        }) { cars in
            DispatchQueue.main.async {
                print("Cars", cars)
                self.title = "Cars for sale (\(cars.count))"
                self.cars = cars
                self.carCollection.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cars for sale"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsController = segue.destination as? CarDetailsViewController else { return }
        guard let cellSender = sender as? UIView else { return }
        detailsController.car = cars[cellSender.tag]
    }
}

// MARK: UICollectionViewDataSource

extension CarListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionCell", for: indexPath)
            as! CarCollectionCell

        let carIndex = indexPath.row

        cell.tag = carIndex
        cell.pictureImage.image = UIImage(named: cars[carIndex].imageAssetName ?? "")
        cell.nameLabel.text = cars[carIndex].name

        cell.priceLabel.text = sharedCurrencyFormatter.string(from: NSNumber(value: cars[carIndex].price))

        return cell
    }
}

// MARK: - CollectionViewCell

class CarCollectionCell: UICollectionViewCell {
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
