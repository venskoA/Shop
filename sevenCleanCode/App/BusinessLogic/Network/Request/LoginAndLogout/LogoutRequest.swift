//
//  ExitRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

enum ErrorLogout: Error {
    case errorUrlComponent
    case enterPars
}

class LogoutRequest: RequestProtocolEnterExit {
    
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

    func load(data: EnterModel,
              completion: @escaping ((Result<Data, Error>) -> ())) {
        var url: URL
        let id = data.id

        let param: [String: String] = ["id_user": "\(String(describing: id))"]
        do {
            url = try configureUrl.configure(param: param, path: .lodout)
        } catch {
            completion(.failure(ErrorMyCastom.errorUrlComponent))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(ErrorMyCastom.errorLogout))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }
}
