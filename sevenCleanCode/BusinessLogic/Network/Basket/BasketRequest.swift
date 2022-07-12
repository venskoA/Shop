//
//  Basket.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 7.07.22.
//

import Foundation
import Alamofire

protocol BasketRequestProtocol: GeneralRequestProtocol {
    func getBasketUser(userId: Int,
                       completion: @escaping (AFDataResponse<GetBasketUserModel>) -> ())
    func addProduct(productId: Int,
                    quantity: Int,
                    completion: @escaping (AFDataResponse<AddRemoveGoodsBasketModel>) -> ())
    func removeProduct(productId: Int,
                       completion: @escaping (AFDataResponse<AddRemoveGoodsBasketModel>) -> ())
    func payProducr(total: Int,
                    completion: @escaping (AFDataResponse<OrderPayResultModel>) -> ())
}

class BasketRequest: GeneralRequestProtocol {
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

extension BasketRequest: BasketRequestProtocol {
    func getBasketUser(userId: Int, completion: @escaping (AFDataResponse<GetBasketUserModel>) -> ()) {
        let modelReguest = GetBasker(url: begininUrl,
                                     path: .getBasketProduct,
                                     userId: userId)
        request(request: modelReguest,
                completion: completion)
    }

    func addProduct(productId: Int,
                    quantity: Int,
                    completion: @escaping (AFDataResponse<AddRemoveGoodsBasketModel>) -> ()) {
        let modelReguest = AddProduct(url: begininUrl,
                                      path: .addReview,
                                      productId: productId,
                                      quantity: quantity)
        request(request: modelReguest,
                completion: completion)
    }

    func removeProduct(productId: Int,
                       completion: @escaping (AFDataResponse<AddRemoveGoodsBasketModel>) -> ()) {
        let modelReguest = RemoveProduct(url: begininUrl,
                                         path: .removeReview,
                                         productId: productId)
        request(request: modelReguest,
                completion: completion)
    }

    func payProducr(total: Int,
                    completion: @escaping (AFDataResponse<OrderPayResultModel>) -> ()) {
        let modelReguest = OrderPey(url: begininUrl,
                                    path: .payForProduct,
                                    total: total)
        request(request: modelReguest,
                completion: completion)
    }
}

extension BasketRequest {
    struct GetBasker: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var userId: Int

        var parametrs: Parameters? {
            return ["id_user": String(userId)]
        }
    }

    struct AddProduct: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var productId: Int
        var quantity: Int

        var parametrs: Parameters? {
            return ["id_product": String(productId),
                    "quantity": String(quantity)]
        }
    }

    struct RemoveProduct: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var productId: Int

        var parametrs: Parameters? {
            return ["id_product": String(productId)]
        }
    }

    struct OrderPey: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var total: Int

        var parametrs: Parameters? {
            return ["total": String(total)]
        }
    }
}
