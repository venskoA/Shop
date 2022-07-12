//
//  GoodsPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import Foundation

class GoodsPresenter: ObservableObject {

    @Published var goods = [GoodsModel]()

    private let service = RequestMainFactory().makeGoodsRequest()

    init() {
        featchGoods()
    }

    func featchGoods() {
        service.getCatalogGoods { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let responseGoods):
                    self.goods = responseGoods
                    self.objectWillChange.send()
                case .failure(_):
                    break
                }
            }
        }
    }
}
