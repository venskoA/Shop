//
//  ListProductsReceiving.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

import Foundation

struct ListProductsReceiving: Codable {
    var pageNamber: Int
    var products: [Goods1]

    enum CodingKeys: String, CodingKey {
        case pageNamber = "page_number"
        case products
    }
}

struct Goods1: Codable {
    var idProduct: Int
    var productName: String
    var price: Int
    var quantity: Int?

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
        case quantity
    }
}

