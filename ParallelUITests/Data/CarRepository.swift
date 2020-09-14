//
//  CarRepository.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import Combine

/**
 A repository of cars for sale.
 */
protocol CarRepository {
    func list() -> Future<[Car], Error>
}
