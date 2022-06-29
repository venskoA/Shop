//
//  Factory.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 23.06.22.
//

import Foundation

enum ConfMethodURL {
    case login
    case logout
}

class FactoryLogin {
    func configFactory(caseFactory: ConfMethodURL) -> RequestProtocolEnterExit {
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
