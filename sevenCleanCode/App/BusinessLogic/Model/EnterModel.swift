//
//  EnterModel.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 26.06.22.
//

import Foundation

enum Gender: String, Codable {
    case mail = "m"
    case femail = "f"
}

struct EnterModel: Codable {
    var id: Int
    var userName: String
    var password: String
    var email: String
    var gender: Gender
    var creditCards: String
    var bio: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case userName = "username"
        case password
        case email
        case gender
        case creditCards = "credit_card"
        case bio
    }
}

