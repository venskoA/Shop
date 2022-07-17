//
//  RequestMainFactory.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation
import Alamofire
import Swinject

class RequestMainFactory {

    let basicUrl: URL

    let session: Session = {
        let configSession = URLSessionConfiguration.default
        configSession.httpShouldSetCookies = false
        configSession.headers = .default
        let sessionAlamofire = Session(configuration: configSession)
        return sessionAlamofire
    }()
    let container: Container = {
        let container = Container()
        container.register(ErrorParserProtocol.self) { _ in
            ErrorParser()
        }
        return container
    }()
    
    init() {
        self.basicUrl = URL(string: "https://murmuring-hamlet-39273.herokuapp.com")!
    }

    init(url: URL) {
        self.basicUrl = url
    }

    func makeErrorParser() -> ErrorParserProtocol {
        ErrorParser()
    }

    func makeGoodsRequest() -> GoodsRequestProtocol {
        container.register(GoodsRequest.self) { resolver in
            GoodsRequest(errorParser: resolver.resolve(ErrorParserProtocol.self)!,
                         session: self.session,
                         begininUrl: self.basicUrl)
        }
        return container.resolve(GoodsRequest.self)!
    }

    func makeAuthenticationRequest() -> AuthenticationRequestProtocol {
        container.register(AuthenticationRequest.self) { resolver in
            AuthenticationRequest(errorParser: resolver.resolve(ErrorParserProtocol.self)!,
                                  session: self.session,
                                  begininUrl: self.basicUrl)
        }
        return container.resolve(AuthenticationRequest.self)!
    }

    func makeReviewRequest() -> ReviewRequestProtocol {
        container.register(ReviewRequest.self) { resolver in
            ReviewRequest(errorParser: resolver.resolve(ErrorParserProtocol.self)!,
                          session: self.session,
                          begininUrl: self.basicUrl)
        }
        return container.resolve(ReviewRequest.self)!
    }

    func makeBaskeyRequest() -> BasketRequestProtocol {
        container.register(BasketRequest.self) { resolver in
            BasketRequest(errorParser: resolver.resolve(ErrorParserProtocol.self)!,
                          session: self.session,
                          begininUrl: self.basicUrl)
        }
        return container.resolve(BasketRequest.self)!
    }
}
