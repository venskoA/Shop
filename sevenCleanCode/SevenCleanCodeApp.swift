//
//  sevenCleanCodeApp.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 13.06.22.
//

import SwiftUI

@main
struct SevenCleanCodeApp: App {
    let persistenceController = PersistenceController.shared
    var dataModel = UserData(id: 123, userName: "aa", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")

    var body: some Scene {
        WindowGroup {
            let presenter = StartPresenter()
            StartView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
