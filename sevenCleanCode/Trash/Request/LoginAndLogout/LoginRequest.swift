//
//  LoginRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

enum ErrorMyCastom: Error {
    case errorUrlComponent
    case enterLoginAndPassword
    case errorLogout
    case errorListProducts
    case errorParth
    case errorAddReview
}

protocol RequestProtocolEnterExit {
    var configureUrl: ConfURLProtocol { get set }
    var session: URLSession  { get set }
    func load(data: UserData,
              completion: @escaping ((Result<Data, Error>) -> ()))
}


class LoginRequest: RequestProtocolEnterExit {
    var configureUrl: ConfURLProtocol
    var session: URLSession

    init(configUrl: ConfURLProtocol) {
        self.configureUrl = configUrl
        self.session = {
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            return session
        }()
    }

    func load(data: UserData,
              completion: @escaping ((Result<Data, Error>) -> ())) {
        var url: URL
        let param: [String: String] = ["username": data.userName,
                                       "password": data.password]
        do {
            url = try configureUrl.configure(param: param, path: .login)
        } catch {
            completion(.failure(ErrorMyCastom.errorUrlComponent))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(ErrorMyCastom.enterLoginAndPassword))
                return
            }

            print(data)

            completion(.success(data))
        }
        task.resume()
    }
}
