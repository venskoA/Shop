//
//  Authentication.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 6.07.22.
//

import Foundation
import Alamofire

protocol AuthenticationRequestProtocol {
    func getLogin(userName: String,
                  password: String,
                  completion: @escaping (AFDataResponse<LoginResultModel>) -> ())
    func getLogout(userId: Int,
                   completion: @escaping (AFDataResponse<LogoutResultModel>) -> ())

    func changeData(userData: UserData,
                    completion: @escaping (AFDataResponse<RegistChangeResultModel>) -> ())

    func regist(userData: UserData,
                    completion: @escaping (AFDataResponse<RegistChangeResultModel>) -> ())
}

class AuthenticationRequest: GeneralRequestProtocol {
    var errorParser: ErrorParserProtocol
    var session: Session
    var queue: DispatchQueue
    var begininUrl: URL

    init(errorParser: ErrorParserProtocol,
         session: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility),
         begininUrl: URL) {
        self.errorParser = errorParser
        self.session = session
        self.queue = queue
        self.begininUrl = begininUrl
    }
}

extension AuthenticationRequest: AuthenticationRequestProtocol {
    func getLogin(userName: String,
                  password: String,
                  completion: @escaping (AFDataResponse<LoginResultModel>) -> ()) {
        let modelRequest = Login(url: begininUrl,
                                 path: .login,
                                 userName: userName,
                                 password: password)
        request(request: modelRequest,
                completion: completion)
    }

    func getLogout(userId: Int,
                   completion: @escaping (AFDataResponse<LogoutResultModel>) -> ()) {
        let modelRequest = Logout(url: begininUrl,
                                  path: .lodout,
                                  userId: userId)
        request(request: modelRequest,
                completion: completion)
    }

    func changeData(userData: UserData,
                    completion: @escaping (AFDataResponse<RegistChangeResultModel>) -> ()) {
        let modelRequest = RegistChange(url: begininUrl,
                                        path: .change,
                                        usedData: userData)
        request(request: modelRequest,
                completion: completion)
    }

    func regist(userData: UserData,
                completion: @escaping (AFDataResponse<RegistChangeResultModel>) -> ()) {
        let modelRequest = RegistChange(url: begininUrl,
                                        path: .reist,
                                        usedData: userData)
        request(request: modelRequest,
                completion: completion)
    }
}

extension AuthenticationRequest {
    struct Login: RequestRouter {

        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var userName: String
        var password: String

        var parametrs: Parameters? {
            return ["username" : userName,
                    "password" : password]
        }
    }

    struct Logout: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var userId: Int

        var parametrs: Parameters? {
            return ["id_User" : String(userId)]
        }
    }

    struct RegistChange: RequestRouter {
        var url: URL
        var method: HTTPMethod = .get
        var path: TypeMetodJson
        var usedData: UserData

        var parametrs: Parameters? {
            return ["id_user" : usedData.id,
                    "username" : usedData.userName,
                    "password" : usedData.password,
                    "email" : usedData.email,
                    "gender": usedData.gender.rawValue,
                    "credit_card" : usedData.creditCards,
                    "bio" : usedData.bio]
        }
    }
}
