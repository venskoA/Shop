//
//  AnalitycsProtocol.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 14.08.22.
//

import Foundation

protocol AnalitycsProtocol {
    func reportMessage(message: String, parameters: [String: Any])
}
