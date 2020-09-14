//
//  ParallelUITestsTests.swift
//  ParallelUITestsTests
//
//  Created by Tristian Azuara on 9/12/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import XCTest
@testable import ParallelUITests

class ParallelUITestsTests: XCTestCase {
    func test_currency_formatter() throws {
        let formatter = CurrencyFormatter()
        
        let tests = [
            99.99: "$99.99",
            100_000: "$100,000.00"
        ]
        
        tests.forEach { input, expected in
            let result = formatter.string(from: NSNumber(value: input))
            XCTAssertEqual(result, expected)
        }
    }
}
