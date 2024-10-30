//
//  NameSpaces.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-26.
//

import Foundation

public struct NameSpaces {
    public struct Notifications {
        public static let userDidLogInSuccessfully: String = "com.nilupulsandeepa.chatapp.notifications.userloginsuccess"
        public static let userLoginStateChanged: String = "com.nilupulsandeepa.chatapp.notifications.userloginstatechanged"
        public static let userAuthenticationStatusChecked: String = "com.nilupulsandeepa.chatapp.notifications.userAuthenticationStatusChecked"
        
        public struct UserInfoKeys {
            public static let loggedInUserData: String = "notification.loggedInUserData"
            public static let isUserLoggedIn: String = "notification.isUserLoggedIn"
        }
    }
    
    public struct UserDefaultKeys {
        public static let sessionUserData: String = "com.nilupulsandeepa.chatapp.userdefaults.sessionuserdata"
    }
}
