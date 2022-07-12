//
//  URLSessionRequest.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 4.07.22.
//

import Foundation

class URLSessionRequest {
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        return session
    }()
}
