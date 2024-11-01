//
//  ChatListViewModel.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-30.
//

import Foundation

public class ChatListViewModel: ObservableObject {
    
    //---- MARK: Properties
    @Published var isAuthenticationChecking: Bool = true
    
    init() {
        registerNotification()
    }
    
    //---- MARK: Helper Methods
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAuhenticationSuccess(notification: )), name: NSNotification.Name(rawValue: NameSpaces.Notifications.userAuthenticationStatusChecked), object: nil)
    }
    
    @objc private func handleAuhenticationSuccess(notification: Notification) {
        Utils.delayExecution(seconds: 2.0) {
            [weak self] in
            if let self {
                self.isAuthenticationChecking = false
            }
        }
    }
}
