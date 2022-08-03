//
//  SevenCleanCodeTests.swift
//  SevenCleanCodeTests
//
//  Created by Andrey Vensko on 29.06.22.
//

import XCTest
import Alamofire
@testable import sevenCleanCode

class SevenCleanCodeTests: XCTestCase {
    var mainFactory: RequestMainFactory?

    var session: Session?

    var basicUrl: URL?

    override func setUpWithError() throws {
        try super.setUpWithError()
        mainFactory = RequestMainFactory()
        session = {
            let configSession = URLSessionConfiguration.default
            configSession.httpShouldSetCookies = false
            configSession.headers = .default
            let sessionAlamofire = Session(configuration: configSession)
            return sessionAlamofire
        }()
    }

    override func tearDownWithError() throws {
        mainFactory = nil
        session = nil
        basicUrl = nil

        try super.tearDownWithError()
    }

    func testGoodsPresenter() {
        let promiseOne = expectation(description: "testMainFactory1")
        let promiseTwo = expectation(description: "testMainFactory2")


        basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

        let goodRequest = GoodsRequest(errorParser: ErrorParser(),
                                       session: session!,
                                       begininUrl: basicUrl!)
        let result = mainFactory!.makeGoodsRequest()

        var goodRequestModel = [GoodsModel]()
        var resultModel = [GoodsModel]()

        goodRequest.getCatalogGoods { data in
            switch data.result {
            case .success(let responseGoods):
                goodRequestModel = responseGoods
                promiseOne.fulfill()
            case .failure(_):
                break
            }
        }

        result.getCatalogGoods { data in
            switch data.result {
            case .success(let responseGoods):
                resultModel = responseGoods
                promiseTwo.fulfill()
            case .failure(_):
                break
            }
        }

        wait(for: [promiseOne, promiseTwo], timeout: 8)
        XCTAssertEqual(goodRequestModel, resultModel)
    }

    func testLoginPresenter() {
        let promiseOne = expectation(description: "testLoginPresenter")

        basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

        let result = LoginPresenter()
        var dataMain = String()

        let resultModel = UserData(id: 0,
                                   firstName: "",
                                   lastName: "",
                                   login: "Admin",
                                   password: "Admin",
                                   email: "",
                                   gender: .mail,
                                   creditCards: "",
                                   bio: "")


        result.response(resultModel) { data in
            dataMain = data
            promiseOne.fulfill()
        }

        wait(for: [promiseOne], timeout: 8)

        XCTAssertNotEqual("Wrong user name or password", dataMain)
        XCTAssertEqual("Enter completed", dataMain)
    }


    func testLogin() {
        let promiseOne = expectation(description: "testLoginPresenter")

        basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

        let result = AuthenticationRequest(errorParser: ErrorParser(),
                                           session: session!,
                                           begininUrl: basicUrl!)

        let resultModel = UserData(id: 567,
                                   firstName: "Andre",
                                   lastName: "",
                                   login: "Admin",
                                   password: "Admin",
                                   email: "",
                                   gender: .mail,
                                   creditCards: "",
                                   bio: "")

        result.getLogin(userName: resultModel.login,
                        password: resultModel.password) { data in
            switch data.result {
            case .success(let responseGoods):
                XCTAssertNotEqual(0, responseGoods.result)
                XCTAssertEqual(1, responseGoods.result)
                promiseOne.fulfill()
            case .failure(_):
                break
            }
        }

        wait(for: [promiseOne], timeout: 8)
    }

    //MARK: Using mock service
    func testGoodsRequest() {
        let expectationOne = expectation(description: "testGoodsRequest")


        let serviceOriginal = RequestMainFactory().makeGoodsRequest()
        let network = FakeService(httpClient: serviceOriginal)

        var resultModel: AFDataResponse<[GoodsModel]>?

        network.getData { data in
            resultModel = data
            expectationOne.fulfill()
        }

        wait(for: [expectationOne], timeout: 5)

        switch resultModel!.result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("\(error)")
        }
    }

    func testMockGoodsRequest() {
        basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

        let mockServise = MockGoodsRequest(errorParser: ErrorParser(),
                                           session: session!,
                                           begininUrl: basicUrl!)
        let network = FakeService(httpClient: mockServise)

        network.getData { _ in }

        XCTAssertTrue(mockServise.success)
    }

    func testGetMockGoodsRequest() {
        basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

        let goodModel = GoodsModel(id: UUID(),
                                   idProduct: 0,
                                   productName: "",
                                   price: 1,
                                   quantity: 1,
                                   image: "",
                                   description: "")
        let mockServise = MockGoodsRequest(errorParser: ErrorParser(),
                                           session: session!,
                                           begininUrl: basicUrl!)
        let network = FakeService(httpClient: mockServise)

        mockServise.result = .init(request: nil,
                                   response: nil,
                                   data: nil,
                                   metrics: nil,
                                   serializationDuration: 1,
                                   result: .success([goodModel]))

        var resultModel: AFDataResponse<[GoodsModel]>?

        network.getData { resultModel = $0 }

        switch resultModel!.result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("\(error)")
        }
    }

    //MARK: Performance func
    func testPerformanceExample() throws {
        self.measure {
            var statusResult = Int()

            basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!

            let result = AuthenticationRequest(errorParser: ErrorParser(),
                                               session: session!,
                                               begininUrl: basicUrl!)

            let resultModel = UserData(id: 567,
                                       firstName: "Andre",
                                       lastName: "",
                                       login: "Admin",
                                       password: "Admin",
                                       email: "",
                                       gender: .mail,
                                       creditCards: "",
                                       bio: "")

            result.getLogin(userName: resultModel.login,
                            password: resultModel.password) { data in
                switch data.result {
                case .success(let responseGoods):
                    statusResult = responseGoods.result
                case .failure(_):
                    break
                }
            }
        }
    }
}
