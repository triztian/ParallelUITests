//
//  CarListTests.swift
//  ParallelUITestsUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import XCTest

class CarListTests: XCTestCase {
    lazy var app = XCUIApplication()

    func test_first_car() throws {
        app.launch()
    }

    func test_second_car() throws {
        app.launch()
    }

    func test_third_car() throws {
        app.launch()
    }
}
