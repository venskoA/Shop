//
//  FirstUITests.swift
//  FirstUITests
//
//  Created by Andrey Vensko on 2.08.22.
//

import XCTest

class FirstUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

//    func testOpenItemsInList() {
//
//        let app = XCUIApplication()
//        app.launch()
//
//        print(app.debugDescription)
//        app.tables.images["goodCell2"].tap()
//        let addReview = app.staticTexts["Add review"]
//
//        app.tables.staticTexts["5"].tap()
//
//        XCTAssert(app.staticTexts["Remove good"].exists)
//    }

    func testEnterLoginAndPassword() {
        let app = XCUIApplication()

        continueAfterFailure = false
        setupSnapshot(app)

        app.launch()

        print(app.debugDescription)


        app.tabBars
            .buttons["Account"]
            .firstMatch
            .tap()
        snapshot("Account")

        let login = app.textFields["Enter name"].firstMatch
        let password = app.secureTextFields["Enter password"].firstMatch

        login.tap()
        login.typeText("Admin")

        password.tap()
        password.typeText("Admin")

        app.buttons["Enter"].tap()

        XCTAssert(app.otherElements["Account"].waitForExistence(timeout: 10))


    }
}
