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
    
    @StateObject var appSession: SessionViewModel = SessionViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appSession)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                        LocalNotificationManager.shared.requestNotificationPermision()
                        LocalNotificationManager.shared.scheduleTestNotification()
                    })
                }
        }
    }
}
