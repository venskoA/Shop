//
//  Goods.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation
import Alamofire

protocol GoodsRequestProtocol {
    func getCatalogGoods(completion: @escaping (AFDataResponse<[GoodsModel]>) -> ())
}

class GoodsRequest: GeneralRequestProtocol {
    var errorParser: ErrorParserProtocol
    var session: Session
    var queue: DispatchQueue
    var begininUrl: URL

    init(errorParser: ErrorParserProtocol,
         session: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility),
         begininUrl: URL) {
        self.errorParser = errorParser
        self.session = session
        self.queue = queue
        self.begininUrl = begininUrl
    }
}

extension GoodsRequest: GoodsRequestProtocol {
    func getCatalogGoods(completion: @escaping (AFDataResponse<[GoodsModel]>) -> ()) {
        let modelRequest = Catalog(url: begininUrl,
                                   path: .listProduct,
                                   page: "1")
        request(request: modelRequest,
                completion: completion)
    }
}

extension GoodsRequest {
    struct Catalog: RequestRouter {
        var url: URL
        var method: HTTPMethod = .post
        var path: TypeMetodJson
        var page: String

        var parametrs: Parameters? {
            ["page" : page]
        }
    }
}

class MockGoodsRequest: GeneralRequestProtocol {
    var errorParser: ErrorParserProtocol
    var session: Session
    var queue: DispatchQueue
    var begininUrl: URL

    var success = false
    var result: AFDataResponse<[GoodsModel]>?

    init(errorParser: ErrorParserProtocol,
         session: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility),
         begininUrl: URL) {
        self.errorParser = errorParser
        self.session = session
        self.queue = queue
        self.begininUrl = begininUrl
    }
}

extension MockGoodsRequest: GoodsRequestProtocol {

    func getCatalogGoods(completion: @escaping (AFDataResponse<[GoodsModel]>) -> ()) {
        success = true
        result.map(completion)
    }
}

class FakeService {
    let httpClient: GoodsRequestProtocol

    init(httpClient: GoodsRequestProtocol) {
        self.httpClient = httpClient
    }

    func getData(completion: @escaping (AFDataResponse<[GoodsModel]>) -> ()) {
        httpClient.getCatalogGoods { data in
            completion(data)
        }
    }
}
