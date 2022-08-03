//
//  BasketPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 12.07.22.
//

import Foundation
import SwiftUI

class BasketPresenter: ObservableObject {

    @Published var totalPrice = 0

    @Published var goods = [ProductBasket]() {
        willSet {
            totalPrice = 0
            newValue.forEach { prod in
                self.totalPrice += prod.price * prod.quantity
            }
        }
    }

    @Published var errorMessage: String = ""

    let userId: Int = {
        guard let id = UserDefault.shared.userData?.id else {
            return 0
        }
        return id
    }()


    private let service = RequestMainFactory().makeBaskeyRequest()

    init() {
        featchBaskey()
    }

    func featchBaskey() {
        service.getBasketUser(userId: userId) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    self.goods = result.contents
                default:
                    break
                }
            }
        }
    }

    func removeProducts(idProduct: Int) {
        service.removeProduct(productId: idProduct) { response in
            switch response.result {
            case .success(let result):
                guard result.result == 1 else {
                    self.errorMessage = result.errorMessoge ?? "NIL removeProducts"
                    return
                }
                self.featchBaskey()
            default:
                break
            }
        }
    }

    func payForProducts() {
        service.payProducr(total: totalPrice) { response in
            switch response.result {
            case .success(let result):
                guard result.result == 1 else {
                    self.errorMessage = result.errorMessoge ?? "NIL payForProducts"
                    return
                }

                DispatchQueue.main.async {
                    self.errorMessage = result.userMessage ?? "YYYps"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.goods = []
                }
            default:
                break
            }
        }
    }
}
