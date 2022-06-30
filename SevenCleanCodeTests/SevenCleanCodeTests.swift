//
//  SevenCleanCodeTests.swift
//  SevenCleanCodeTests
//
//  Created by Andrey Vensko on 29.06.22.
//

import XCTest
@testable import sevenCleanCode

class TestuURL: XCTestCase {

    var url: ConfigURLLogin!

    override func setUpWithError() throws {
        url = ConfigURLLogin()
    }

    override func tearDownWithError() throws {
        url = nil
    }

    func testUrl() {
        var result: URL!
        var trueUrl: URL!

        let expection = expectation(description: "testUrl")

        do {
            result = try url.configure(param: ["password": "123"], path: .login)
            trueUrl = URL(string: "scheme://host/GeekBrainsTutorial/online-store-api/master/responses/login.json?password=123")!
        } catch {}

        expection.fulfill()
        waitForExpectations(timeout: 5)

        XCTAssertTrue(result == trueUrl, result.description)
    }
}


