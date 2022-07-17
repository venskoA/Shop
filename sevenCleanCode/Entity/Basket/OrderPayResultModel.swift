//
//  OrderPayResult.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 7.07.22.
//

import Foundation

struct OrderPayResultModel: Codable {
    var result: Int
    var userMessage: String?
    var errorMessoge: String?
}
