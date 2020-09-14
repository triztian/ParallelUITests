//
//  CarSpecifications.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation

/**
 Car specifications, such as engine and body.
 */
struct CarSpecifications: Decodable {
    let engine: EngineSpecification
    let body: BodySpecification
}
