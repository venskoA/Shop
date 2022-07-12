//
//  ConfURLAll.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

class ConfURLAll: ConfURLProtocol {
    var scheme = "https"
    var host = "raw.githubusercontent.com"
    var confURL: ConfURLProtocol

    init(_ confURL: ConfURLProtocol) {
        self.confURL = confURL
        self.confURL.host = host
        self.confURL.scheme = scheme
    }

    func configure(param: [String : String], path: TypeMetodJson) throws -> URL {
        return try confURL.configure(param: param, path: path)
    }
}
