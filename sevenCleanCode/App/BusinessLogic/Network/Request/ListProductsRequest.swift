//
//  ListProductsRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 28.06.22.
//

import Foundation

class ListProductsRequest: RequestProtocolEnterExit {
    static func == (lhs: ListProductsRequest, rhs: ListProductsRequest) -> Bool {
        return lhs == rhs
    }

    var configureUrl: ConfURLProtocol
    var session: URLSession

    init(configUrl: ConfURLProtocol, urlMethod: ConfMethodURL) {
        self.configureUrl = configUrl
        self.session = {
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            return session
        }()
    }

    func load(data: EnterModel,
              completion: @escaping ((Result<Data, Error>) -> ())) {
        var url: URL
        let param: [String: String] = ["username": data.userName,
                                       "password": data.password]

        do {
            url = try configureUrl.configure(param: param, path: .change)
        } catch {
            completion(.failure(ErrorMyCastom.errorListProducts))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(ErrorMyCastom.enterLoginAndPassword))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }
}
