//
//  ListProductGetModel.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 29.06.22.
//

import Foundation

struct ListProductGetModel: Codable {
    var pageNumber: Int
    var idCategory: Int

    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case idCategory = "id_category"
    }
}
