//
//  AddReview.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

import Foundation

struct SendAddReview: Codable {
    var idUser: Int?
    var text: String

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case text
    }
}

