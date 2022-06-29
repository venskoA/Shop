//
//  RegisterRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 26.06.22.
//

import Foundation


protocol RegisterRequestProtocol: RequestProtocol {
    func load(data: EnterModel,
              completion: @escaping ((Result<RegistModel, Error>) -> ()))
}

class RegisterRequest : RegisterRequestProtocol {

    var configureUrl: ConfURLProtocol
    var session: URLSession
    var decoder = JSONDecoder()

    init(configUrl: ConfURLProtocol) {
        self.configureUrl = configUrl
        self.session = {
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            return session
        }()
    }

    func load(data: EnterModel,
              completion: @escaping ((Result<RegistModel, Error>) -> ())) {
        
        var url: URL
        let id = Int.random(in: 1...300)
        let param: [String: String] = ["id": "\(id)",
                                       "username": data.userName,
                                       "password": data.password,
                                       "email": data.email,
                                       "gender": data.gender.rawValue,
                                       "credit_card": data.creditCards,
                                       "bio": data.bio]
        do {
            url = try configureUrl.configure(param: param, path: .reist)
            print(url)
        } catch {
            completion(.failure(ErrorMyCastom.errorUrlComponent))
            return
        }

        let task = session.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else { return }

            guard let data = data else { return }

            do {
                let result = try self.decoder.decode(RegistModel.self, from: data)
                return completion(.success(result))
            } catch {
                return completion(.failure(ErrorMyCastom.enterLoginAndPassword))
            }
        }
        task.resume()
    }
}
