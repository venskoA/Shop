//
//  LogintTest.swift
//  SevenCleanCodeTests
//
//  Created by Andrey Vensko on 30.06.22.
//

import XCTest
@testable import sevenCleanCode

class LoadLoginNetworckTest: XCTestCase {

    var load: RequestProtocolEnterExit?
    var urlAll = ConfURLAll(ConfigURLLogin())
    var defaultValue: Bool?

    let dataModel = EnterModel(id: 123,
                               userName: "aa",
                               password: "123",
                               email: "ooo@gmail.com",
                               gender: .mail,
                               creditCards: "98980-99090-900",
                               bio: "---")

    override func setUpWithError() throws {
        print("--------setUpWithError--------")
    }

    override func tearDownWithError() throws {
        print("--------tearDownWithError--------")
        load = nil
        defaultValue = nil
    }

    func testLoadLogin() {

        load = LoginRequest(configUrl: urlAll)

        let dataModel = EnterModel(id: 123,
                                   userName: "aa",
                                   password: "123",
                                   email: "ooo@gmail.com",
                                   gender: .mail,
                                   creditCards: "98980-99090-900",
                                   bio: "---")

        let expectation = expectation(description: "loginTest")

        load?.load(data: dataModel, completion: { result in
            switch result {
            case .success(_):
                self.defaultValue = true
            case .failure(_):
                self.defaultValue = false
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 3)

        XCTAssertTrue(self.defaultValue!)
    }

    func testLoadLogout() {
        load = LogoutRequest(configUrl: urlAll)

        let expectation = expectation(description: "logoutnTest")

        load?.load(data: dataModel, completion: { result in
            switch result {
            case .success(_):
                self.defaultValue = true
            case .failure(_):
                self.defaultValue = false
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 3)

        XCTAssertTrue(self.defaultValue!)
    }

    func testRegister() {
        let regist = RegisterRequest(configUrl: urlAll)

        let expectation = expectation(description: "registerTest")

        regist.load(data: dataModel) { result in
            switch result {
            case .success(_):
                self.defaultValue = true
            case .failure(_):
                self.defaultValue = false
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)

        XCTAssertTrue(defaultValue!)
    }
}

