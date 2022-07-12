//
//  ErrorParser.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation

protocol ErrorParserProtocol {
    func parseError(result: Error) -> Error
}
