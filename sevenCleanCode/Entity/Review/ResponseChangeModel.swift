//
//  GetReview.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

import Foundation

struct ResponseChangeModel: Codable {
    var result: Int
    var userMassage: String?
    var errorMessage: String?
}
