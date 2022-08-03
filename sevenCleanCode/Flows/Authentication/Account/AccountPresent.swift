//
//  AccountPresent.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import Foundation

class AccountPresent: PresenterNetworkProtocol {
    private let service = RequestMainFactory()
        .makeAuthenticationRequest()

    func response(_ userData: UserData, completion: @escaping (String) -> ()) {
        service.getLogout(userId: userData.id) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let valueResponse):
                    guard valueResponse.result == 1 else {
                        completion("Wrong user name or password")
                        return
                    }

                    UserDefault.shared.userData = nil
                    completion("Enter completed")
                case .failure(_):
                    break
                }
            }
        }
    }

    func response2(_ userData: UserData, completion: @escaping (String) -> ()) {
        service.getLogout2(userId: userData.id) { data in
            switch data.result {
            case .success(let valueResponse):
                var newValueResponse: LogoutResultModel
                do {
                    newValueResponse = try JSONDecoder().decode(LogoutResultModel.self, from: valueResponse)
                } catch {
                    return
                }

                guard newValueResponse.result == 1 else {
                    completion("Wrong user name or password")
                    return
                }

                UserDefault.shared.userData = nil
                completion("Enter completed")
            case .failure(_):
                break
            }
        }
    }
}
