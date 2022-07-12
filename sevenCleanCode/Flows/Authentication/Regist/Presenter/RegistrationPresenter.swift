//
//  PresenterAuth.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import Foundation

class RegistrationPresenter: PresenterNetworkProtocol {

    private let servive = RequestMainFactory()
                        .makeAuthenticationRequest()

    func response(_ userData: UserData, completion: @escaping (String) -> ()) {
        servive.regist(userData: userData) { rersponse in
            DispatchQueue.main.async {
                switch rersponse.result {
                case .success(let valueResponse):
                    guard valueResponse.result == 1 else {
                        completion(valueResponse.errorMessoge ?? "Nil")
                        return
                    }

                    completion("Registration completed")
                case .failure(_):
                    break
                }
            }
        }
    }

}


