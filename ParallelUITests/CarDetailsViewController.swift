//
//  CarDetailsViewController.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import UIKit

final class CarDetailsViewController: UIViewController {
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var specsTable: UITableView!

    var car: Car?
    let currencyFormatter = CurrencyFormatter()

    var specifications: [(String, String)] {
        guard let car = car else { return [] }
        return [
            ("Name", car.name),
            ("Price", currencyFormatter.string(from: NSNumber(value: car.price)) ?? ""),
            ("Engine Type", car.specifications.engine.type),
            ("Engine Capacity", car.specifications.engine.capacity),
            ("Engine Technology", car.specifications.engine.technology)
        ]
    }

    override func loadView() {
        super.loadView()
        pictureImage.image = UIImage(named: car?.imageAssetName ?? "")
        specsTable.dataSource = self
        specsTable.reloadData()
    }
}

extension CarDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        specifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CarSpecCell")
        cell.textLabel?.text = specifications[indexPath.row].0
        cell.detailTextLabel?.text = specifications[indexPath.row].1
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}

