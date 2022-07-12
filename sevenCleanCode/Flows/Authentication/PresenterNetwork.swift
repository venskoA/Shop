//
//  PresenterNetwork.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import Foundation

protocol PresenterNetworkProtocol {
    func response(_ userData: UserData,
                  completion: @escaping (String) -> ())
}
