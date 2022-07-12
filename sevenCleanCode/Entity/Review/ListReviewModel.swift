//
//  ListReviewModel.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 10.07.22.
//

import Foundation

struct MainListReviewModel: Codable, Identifiable {
    var id: UUID = UUID()

    var pageNumber: Int
    var review: [ListReviewModel]

    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case review = "review"
    }
}

struct ListReviewModel: Codable, Identifiable {
    var id: UUID = UUID()

    var idReview: Int
    var text: String

    enum CodingKeys: String, CodingKey {
        case idReview = "id_review"
        case text = "description"
    }
}
