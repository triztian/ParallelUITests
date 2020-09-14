//
//  Car.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation

/**
 A car for sale.
 */
struct Car: Decodable {
    let id: Int
    let imageAssetName: String?
    let name: String
    let description: String
    let price: Double
    let specifications: CarSpecifications
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, price, specifications
        case imageAssetName = "image_asset_name"
    }
}
