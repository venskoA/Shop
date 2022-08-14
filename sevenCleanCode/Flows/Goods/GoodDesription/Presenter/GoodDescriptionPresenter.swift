//
//  GoodDescriptionPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 10.07.22.
//

import Foundation
import Combine

class GoodDescriptionPresenter: ObservableObject {
    private let service = RequestMainFactory().makeReviewRequest()
    private let serviceBasket = RequestMainFactory().makeBaskeyRequest()

    var idGoods: Int
    @Published var listReview = [ListReviewModel]()
    @Published var addReview = ""

    init(idGoods: Int) {
        self.idGoods = idGoods
        self.responceListReview(idGood: idGoods)
    }

    func responceAddReview(idUser: Int,
                           idGood: Int,
                           text: String,
                           completion: () -> ()) {
        service
            .getAddReview(userId: idUser, text: text, goodId: idGood) { response in
                DispatchQueue.main.async {
                    switch response.result {
                    case .success(let success):
                        guard let userMessage = success.userMassage else {
                            self.addReview = success.errorMessage ?? "NIL"
                            return
                        }
                        self.responceListReview(idGood: idGood)
                        self.addReview = userMessage
                    case .failure(_):
                        break
                    }
                }
            }

        Deferred {
            Future<Any, Never> { promise in

            }
        }
    }

    func responceRemoveReview(idComment: Int) {
        service.getRemoveReview(idComment: idComment) { response in
            switch response.result {
            case .success(let success):
                guard let userMessage = success.userMassage else {
                    self.addReview = success.errorMessage ?? "NIL"
                    return
                }
                self.responceListReview(idGood: self.idGoods)
                DispatchQueue.main.async {
                    self.addReview = userMessage
                }
            default:
                break
            }
        }
    }

    func responceListReview(idGood: Int) {
        service.getListReview(idGood: idGood) { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.listReview = value.review
                }
            default:
                break
            }
        }
    }

    func addProductInBasket(idProduct: Int,
                            quantity: Int) {
        serviceBasket.addProduct(productId: idProduct,
                                 quantity: quantity) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    guard result.result == 1 else {
                        self.addReview = result.errorMessoge ?? "NIL"
                        return
                    }
                    self.addReview = "Add successful"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.addReview = ""
                    }
                }
            default:
                break
            }
        }
    }
}
