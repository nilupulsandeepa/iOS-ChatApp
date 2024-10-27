//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-23.
//

import SwiftUI

@main
struct ChatAppApp: App {
    
    //---- MARK: Properties
    //---- App delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var appSession: SessionViewModel = SessionViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appSession)
                .onAppear {
                    AuthenticationManager.shared.checkAuthentication()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                        LocalNotificationManager.shared.requestNotificationPermision()
                        LocalNotificationManager.shared.scheduleTestNotification()
                    })
                }
        }
    }
}
