//
//  LoginPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import Foundation

class LoginPresenter: PresenterNetworkProtocol {

    private let service = RequestMainFactory()
                        .makeAuthenticationRequest()

    func response(_ userData: UserData, completion: @escaping (String) -> ()) {
        service.getLogin(userName: userData.userName,
                         password: userData.password) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let valueResponse):
                    guard valueResponse.result == 1 else {
                        completion("Wrong user name or password ")
                        return
                    }

                    let value = valueResponse.user

                    UserDefault.shared.userData = UserData(id: value.id,
                                                           userName: (value.name + value.lastname),
                                                           password: "",
                                                           email: "",
                                                           gender: .mail,
                                                           creditCards: "",
                                                           bio: "")
                    completion("Enter completed")
                case .failure(_):
                    break
                }
            }
        }
    }
}
