//
//  ConfURL.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

protocol ConfURLProtocol {
    var scheme: String { get set }
    var host: String { get set }
    func configure(param: [String : String], path: TypeMetod) throws -> URL
}

final class ConfigURLLogin: ConfURLProtocol {
    var scheme: String
    var host: String

    init() {
        self.scheme = "scheme"
        self.host = "host"
    }

    func configure(param: [String : String], path: TypeMetod) throws -> URL {
        var urlComponent = URLComponents()

        var queryItem = [URLQueryItem]()
        for (param, value) in param {
            queryItem.append(URLQueryItem(name: param, value: value))
        }

        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path.rawValue
        urlComponent.queryItems = queryItem

        guard let url = urlComponent.url else {
            throw ErrorMyCastom.errorUrlComponent
        }
        
        print(url)
        return url
    }
}


