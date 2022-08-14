//
//  Analitics.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 14.08.22.
//

import Foundation
import FirebaseAnalytics

class AnaliticsReport: AnalitycsProtocol {
    func reportMessage(message: String, parameters: [String: Any]) {
        Analytics.logEvent(message, parameters: parameters)
    }
}
