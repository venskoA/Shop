//
//  Review.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 6.07.22.
//

import Foundation
import Alamofire

protocol ReviewRequestProtocol {
    func getAddReview(userId: Int,
                      text: String,
                      goodId: Int,
                      completion: @escaping (AFDataResponse<ResponseChangeModel>) -> ())

    func getRemoveReview(idComment: Int,
                         completion: @escaping (AFDataResponse<ResponseChangeModel>) -> ())
    func getListReview(idGood: Int,
                       completion: @escaping (AFDataResponse<MainListReviewModel>) -> ())
}

class ReviewRequest: GeneralRequestProtocol {
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

extension ReviewRequest: ReviewRequestProtocol {
    func getAddReview(userId: Int,
                      text: String,
                      goodId: Int,
                      completion: @escaping (AFDataResponse<ResponseChangeModel>) -> ()) {
        let modelRequest = AddReview(url: begininUrl,
                                     path: .addReview,
                                     userId: userId,
                                     text: text,
                                     goodId: goodId)
        request(request: modelRequest,
                completion: completion)
    }

    func getRemoveReview(idComment: Int, completion: @escaping (AFDataResponse<ResponseChangeModel>) -> ()) {
        let modelRequest = RemoveReview(url: begininUrl,
                                        path: .removeReview,
                                        idComment: idComment)
        request(request: modelRequest,
                completion: completion)
    }

    func getListReview(idGood: Int, completion: @escaping (AFDataResponse<MainListReviewModel>) -> ()) {
        let modelRequest = ListReview(url: begininUrl,
                                      path: .listReview,
                                      idGoods: idGood)
        request(request: modelRequest,
                completion: completion)
    }
}

extension ReviewRequest {
    struct AddReview: RequestRouter {
        var url: URL
        var method: HTTPMethod = .post
        var path: TypeMetodJson
        var userId: Int
        var text: String
        var goodId: Int

        var parametrs: Parameters? {
            return ["id_use" : userId,
                    "text" : text,
                    "id_product" : goodId]
        }
    }

    struct ListReview: RequestRouter {
        var url: URL
        var method: HTTPMethod = .post
        var path: TypeMetodJson
        var idGoods: Int

        var parametrs: Parameters? {
            return ["id_product" : idGoods]
        }
    }

    struct RemoveReview: RequestRouter {
        var url: URL
        var method: HTTPMethod = .post
        var path: TypeMetodJson
        var idComment: Int

        var parametrs: Parameters? {
            return ["id_comment" : idComment]
        }
    }
}
