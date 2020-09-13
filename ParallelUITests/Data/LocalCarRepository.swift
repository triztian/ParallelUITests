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

class LocalCarRepository: CarRepository {
    let decoder = JSONDecoder()

    func list() -> Future<[Car], Error> {
        Future { promise in
            var cars = [Car]()
            for i in 1...2 {
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
    
    func get(byID id: Int) -> Future<Car, Error> {
        Future { promise in
            do {
                if let asset = NSDataAsset(name: "Car\(1).json") {
                    promise(.success(try self.decoder.decode(Car.self, from: asset.data)))
                }
            } catch {
                promise(.failure(error))
            }
        }
    }
}
