//
//  RequestRouter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 6.07.22.
//

import Foundation
import Alamofire

//https://raw.githubusercontent.com

protocol RequestRouter: URLRequestConvertible {
    var url: URL { get set }
    var method: HTTPMethod { get }
    var path: TypeMetodJson { get set }
    var parametrs: Parameters? { get }
}

extension RequestRouter {
    func asURLRequest() throws -> URLRequest {
        let allUrl = url.appendingPathComponent(path.rawValue)
        var urlRequest = URLRequest(url: allUrl)
        urlRequest.httpMethod = method.rawValue

        return try URLEncoding.default.encode(urlRequest, with: parametrs)
    }
}
