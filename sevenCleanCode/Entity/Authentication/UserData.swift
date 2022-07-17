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

struct UserData: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var login: String
    var password: String
    var email: String
    var gender: Gender
    var creditCards: String
    var bio: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case firstName = "first_name"
        case lastName = "last_name"
        case login = "user_login"
        case password
        case email
        case gender
        case creditCards = "credit_card"
        case bio
    }
}

