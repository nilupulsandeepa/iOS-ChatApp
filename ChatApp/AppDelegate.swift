//
//  AppDelegate.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-25.
//

import Foundation
import UIKit
import FirebaseCore

public class AppDelegate: NSObject, UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //---- Firebase config
        FirebaseApp.configure()
        
        return true
    }
}
