//
//  ParallelUITestsUITests.swift
//  ParallelUITestsUITests
//
//  Created by Tristian Azuara on 9/12/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import XCTest

class ContactSellerTests: XCTestCase {
    lazy var app = XCUIApplication()

    func test_type_name() {
        app.launch()

        let cell = app.descendants(matching: .cell).element(boundBy: 0)
        cell.tap()

        let contactSellerButton = app.descendants(matching: .button)["Contact Seller"]
        waitForElem(contactSellerButton, timeout: 5)
        contactSellerButton.tap()

        let nameTextField = app.descendants(matching: .textField)["ContactSeller.NameTextField"]
        waitForElem(nameTextField, timeout: 5)
        nameTextField.tap()
        nameTextField.typeText("John Doe")
        sleep(2)

        XCTAssertEqual(nameTextField.value as? String, "John Doe")
    }
    
    func test_type_email() {
        app.launch()

        let cell = app.descendants(matching: .cell).element(boundBy: 0)
        cell.tap()

        let contactSellerButton = app.descendants(matching: .button)["Contact Seller"]
        waitForElem(contactSellerButton, timeout: 5)
        contactSellerButton.tap()

        let nameTextField = app.descendants(matching: .textField)["ContactSeller.EmailTextField"]
        waitForElem(nameTextField, timeout: 5)
        nameTextField.tap()
        nameTextField.typeText("john.doe@supercars.com")
        sleep(2)

        XCTAssertEqual(nameTextField.value as? String, "john.doe@supercars.com")
    }
    
    func test_type_message() {
        app.launch()

        let cell = app.descendants(matching: .cell).element(boundBy: 0)
        cell.tap()

        let contactSellerButton = app.descendants(matching: .button)["Contact Seller"]
        waitForElem(contactSellerButton, timeout: 5)
        contactSellerButton.tap()

        let nameTextField = app.descendants(matching: .textField)["ContactSeller.MessageTextField"]
        waitForElem(nameTextField, timeout: 5)
        nameTextField.tap()
        nameTextField.typeText("Hello I want to buy the car!!")
        sleep(2)

        XCTAssertEqual(nameTextField.value as? String, "Hello I want to buy the car!!")
    }
}
