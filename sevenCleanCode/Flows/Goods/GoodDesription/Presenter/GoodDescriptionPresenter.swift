//
//  GoodDescriptionPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 10.07.22.
//

import Foundation

class GoodDescriptionPresenter: ObservableObject {
    private let service = RequestMainFactory().makeReviewRequest()
    private let serviceBasket = RequestMainFactory().makeBaskeyRequest()

    @Published var listReview = [ListReviewModel]()
    @Published var addReview = ""

    init(idGood: Int) {
        self.responceListReview(idGood: idGood)
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
                        self.addReview = userMessage
                    case .failure(_):
                        break
                    }
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
                self.addReview = userMessage
            default:
                break
            }
        }
    }

    func responceListReview(idGood: Int) {
        service.getListReview(idGood: idGood) { response in
            switch response.result {
            case .success(let value):
                self.listReview = value.review
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
                guard result.result == 1 else {
                    self.addReview = result.errorMessoge ?? "NIL"
                    return
                }
                self.addReview = "Add successful"
            default:
                break
            }
        }
    }
}
