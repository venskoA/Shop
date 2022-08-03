//
//  GoodsModel.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation

struct GoodsModel: Codable, Identifiable {
    var id: UUID = UUID()

    var idProduct: Int
    var productName: String
    var price: Int
    var quantity: Int?
    var image: String?
    var description: String?

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
        case quantity
        case image
        case description
    }
}

extension GoodsModel: Equatable {
    static func == (lhs: GoodsModel, rhs: GoodsModel) -> Bool {
        lhs.idProduct == rhs.idProduct
    }
}
