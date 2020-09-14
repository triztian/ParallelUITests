//
//  CarListTests.swift
//  ParallelUITestsUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import XCTest

/**
 Test suite that checks that cars are loaded in a specific order. 
 */
class CarListTests: XCTestCase {
    lazy var app = XCUIApplication()

    func test_first_car() throws {
        app.launch()
        let cell = app.descendants(matching: .cell).element(boundBy: 0)
        XCTAssertTrue(cell.descendants(matching: .staticText)["McLaren"].exists)
        sleep(2)
    }

    func test_second_car() throws {
        app.launch()
        let cell = app.descendants(matching: .cell).element(boundBy: 1)
        XCTAssertTrue(cell.descendants(matching: .staticText)["Audi R8"].exists)
        sleep(2)
    }

    func test_third_car() throws {
        app.launch()
        let cell = app.descendants(matching: .cell).element(boundBy: 2)
        XCTAssertTrue(cell.descendants(matching: .staticText)["Maserati"].exists)
        sleep(2)
    }
}
