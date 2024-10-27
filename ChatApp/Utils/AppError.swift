//
//  AppError.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-25.
//

import Foundation

public enum AppError: Error {
    public enum FirebaseDBError: Error {
        case firebaseDBNotAvailable
        
        var localizedDescription: String {
            return "Firebase Database Not Available"
        }
    }
    
    case signInRootViewControllerError
    
    var localizedDescription: String {
        return "Cannot Present SignIn View"
    }
}
