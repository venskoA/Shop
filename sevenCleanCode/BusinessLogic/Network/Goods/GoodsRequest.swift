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
                                   path: .listProduct)
        request(request: modelRequest,
                completion: completion)
    }
}

extension GoodsRequest {
    struct Catalog: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var parametrs: Parameters?
    }
}
