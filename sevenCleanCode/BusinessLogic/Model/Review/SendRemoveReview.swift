//
//  SendRemoveReview.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

import Foundation

struct SendRemoveReview: Codable {
    var idComment: Int

    enum CodingKeys: String, CodingKey {
        case idComment = "id_comment"
    }
}
