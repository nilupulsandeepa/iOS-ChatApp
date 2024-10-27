//
//  UserDefaultsManager.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-26.
//

import Foundation

public class UserDefaultsManager {
    
    //---- MARK: Properties
    public static var shared: UserDefaultsManager = UserDefaultsManager()
    
    public var sessionUser: User? {
        get {
            if let userData: Data = UserDefaults.standard.data(forKey: NameSpaces.UserDefaultKeys.sessionUserData) {
                if let user = try? JSONDecoder().decode(User.self, from: userData) {
                    return user
                }
            }
            return nil
        }
        
        set {
            let userData: Data? = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.setValue(userData, forKey: NameSpaces.UserDefaultKeys.sessionUserData)
        }
    }
    
    //---- MARK: Initialization
    init() {
        print("UserDefaultsManager Initialized")
    }
    
    
    //---- MARK: Deinitialization
    deinit {
        print("UserDefaultsManager Deinitialized")
    }
}
