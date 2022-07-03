//
//  Factory.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

enum ConfFactory {
    case login
    case logout
}

class FactoryLogin {
    func configFactory(caseFactory: ConfFactory) -> RequestProtocolEnterExit {
        let url = ConfigURLLogin()
        let urlAll = ConfURLAll(url)

        switch caseFactory {
        case .login:
            return LoginRequest(configUrl: urlAll)
        case .logout:
            return LogoutRequest(configUrl: urlAll)
        }
    }
}
