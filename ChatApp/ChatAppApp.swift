//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-23.
//

import SwiftUI

@main
struct ChatAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
