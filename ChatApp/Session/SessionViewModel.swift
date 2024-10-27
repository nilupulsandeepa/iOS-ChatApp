//
//  SessionViewModel.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import Foundation

public class SessionViewModel: ObservableObject {
    
    //---- MARK: Properties
    @Published public var user: User? = nil
    
    //---- MARK: Initialization
    init() {
        registerNotifications()
    }
    
    //---- MARK: Action Methods
    
    //---- MARK: Helper Methods
    private func registerNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userLoginSuccess(notification:)),
            name: NSNotification.Name(rawValue: NameSpaces.Notifications.userDidLogInSuccessfully),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userLoginStateChanged(notification:)),
            name: NSNotification.Name(rawValue: NameSpaces.Notifications.userLoginStateChanged),
            object: nil
        )
    }
    
    @objc private func userLoginSuccess(notification: Notification) {
        let loggedInUserData: Data = notification.userInfo![NameSpaces.Notifications.UserInfoKeys.loggedInUserData] as! Data
        guard let userObject: User = try? JSONDecoder().decode(User.self, from: loggedInUserData) else {
            return
        }
        
        UserDefaultsManager.shared.sessionUser = userObject
        user = userObject
        print("User Logged In")
    }
    
    @objc private func userLoginStateChanged(notification: Notification) {
        let isUserLoggedIn: Bool = notification.userInfo![NameSpaces.Notifications.UserInfoKeys.isUserLoggedIn] as! Bool
        
        if (isUserLoggedIn) {
            if let user {
                UserDefaultsManager.shared.sessionUser = user
                print("First Time Logged In: \(user.name)")
            } else {
                user = UserDefaultsManager.shared.sessionUser
                if let user {
                    print("App Open Loaded: \(user.name)")
                } else {
                    print("User Logged In called from listener")
                }
            }
        } else {
            UserDefaultsManager.shared.sessionUser = nil
            user = nil
            print("User Logged Out")
        }
    }
}
