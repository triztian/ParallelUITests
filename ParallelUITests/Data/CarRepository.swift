//
//  CarRepository.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import Combine

protocol CarRepository {
    func list() -> Future<[Car], Error>
    func get(byID: Int) -> Future<Car, Error>
}
