//
//  LoginResultModel.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

struct LoginResultModel: Codable {
    let result: Int
    let user: UserData
}

struct User: Codable {
    let id: Int
    var login: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}

