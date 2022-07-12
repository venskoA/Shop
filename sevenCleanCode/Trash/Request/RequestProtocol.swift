//
//  RequestProtocol.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 26.06.22.
//

import Foundation

protocol RequestProtocol {
    var configureUrl: ConfURLProtocol { get set }
    var session: URLSession  { get set }
    var decoder: JSONDecoder  { get set }
}
