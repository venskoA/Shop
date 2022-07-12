//
//  OrderPayResult.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 7.07.22.
//

import Foundation

struct OrderPayResultModel: Codable {
    let result: Int
    let userMessage: String?
    var errorMessoge: String?
}
