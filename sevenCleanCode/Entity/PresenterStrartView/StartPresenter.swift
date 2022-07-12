//
//  StartPresenter.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 26.06.22.
//

import Foundation
import SwiftUI

enum ErrorStartPresent: Error {
    case errorDecoder
}

protocol StartPresenterProtocol {
    func decodLogin(data: Data) -> Result<LoginResultModel, Error>
    func checkValue(data: LoginResultModel) -> Bool
    
    func decodLogout(data: Data) -> LogoutResultModel 
    func checkValueLogout(data: LogoutResultModel) -> Bool
}

struct StartPresenter: StartPresenterProtocol {
    var decoder = JSONDecoder()

    func decodLogin(data: Data) -> Result<LoginResultModel, Error> {
        do {
            let result = try decoder.decode(LoginResultModel.self, from: data)
            return .success(result)
        } catch {
            return .failure(ErrorStartPresent.errorDecoder)
        }
    }

    func checkValue(data: LoginResultModel) -> Bool {
        if data.user.login == "geekbrains" || data.user.id == 123 {
            return true
        } else {
            return false
        }
    }

    func decodLogout(data: Data) -> LogoutResultModel {
        do {
            let result = try decoder.decode(LogoutResultModel.self, from: data)
            return result
        } catch {
            return LogoutResultModel(result: 0)
        }
    }

    func checkValueLogout(data: LogoutResultModel) -> Bool {
        if data.result == 1 {
            return false
        } else {
            return true
        }
    }
}
