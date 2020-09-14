//
//  Helper.swift
//  ParallelUITestsUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import XCTest

func waitForElem(_ element: XCUIElement, timeout: TimeInterval = 2) {
    let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: element)
    XCTWaiter().wait(for: [expectation], timeout: timeout)
}
