//
//  GeneralRequestProtocol.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation
import Alamofire

protocol GeneralRequestProtocol {
    var errorParser: ErrorParserProtocol { get set }
    var session: Session { get }
    var queue: DispatchQueue { get }
    var begininUrl: URL { get set }

    @discardableResult
    func request<T: Decodable>(request: URLRequestConvertible,
                               completion: @escaping (AFDataResponse<T>) -> ()) -> DataRequest
}

extension GeneralRequestProtocol {
    @discardableResult
    public func request<T: Decodable>(request: URLRequestConvertible,
                                      completion: @escaping (AFDataResponse<T>) -> ()) -> DataRequest {
        return session
            .request(request)
            .responseDecodable(queue: queue,
                               completionHandler: completion)
    }
}
