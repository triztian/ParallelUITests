//
//  LocalCarRepository.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import Combine
import UIKit

/**
 A car repository that loads it's data from `*.xcasset` catalogs.
 - Important: I currently always loads `4` cars. Hardcoded.
 */
class LocalCarRepository: CarRepository {
    let decoder = JSONDecoder()

    func list() -> Future<[Car], Error> {
        Future { promise in
            var cars = [Car]()
            for i in 1...4 {
                do {
                    if let asset = NSDataAsset(name: "Car\(i).json") {
                        cars.append(try self.decoder.decode(Car.self, from: asset.data))
                    }
                } catch {
                    promise(.failure(error))
                }
            }

            promise(.success(cars))
        }
    }
}
