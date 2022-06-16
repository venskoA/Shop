//
//  sevenCleanCodeApp.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 13.06.22.
//

import SwiftUI

@main
struct sevenCleanCodeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
