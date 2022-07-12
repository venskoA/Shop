//
//  File.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 5.07.22.
//

import Foundation

class ErrorParser: ErrorParserProtocol {
    func parseError(result: Error) -> Error {
        return result
    }
}
