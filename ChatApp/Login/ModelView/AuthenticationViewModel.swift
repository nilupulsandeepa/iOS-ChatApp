//
//  AuthenticationViewModel.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

public class AuthenticationManager {
    
    //---- MARK: Properties
    public static var shared: AuthenticationManager = AuthenticationManager()
    
    private var authStateChangeListener: NSObjectProtocol? = nil
    
    //---- MARK: Initialization
    init() {
        addFirAuthStateChangeListener()
    }
    
    
    //---- MARK: Action Methods
    public func startGoogleSignInFlow() {
        guard let m_WindowScene: UIWindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let m_RootViewController: UIViewController = m_WindowScene.windows.first?.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: m_RootViewController) {
            [weak self]
            (gidResult, error) in
            
            guard error == nil else {
                return
            }
            
            guard let authentication = gidResult?.user, let idToken = authentication.idToken?.tokenString else {
                return
            }
            
            let firGoogleCredential: AuthCredential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken.tokenString)
            if let self {
                self.startFirebaseSignIn(credential: firGoogleCredential)
            }
        }
    }
    
    public func signOutGoogleSignIn() {
        try? Auth.auth().signOut()
    }
    
    public func checkAuthentication() {

    }
    
    //---- MARK: Helper Methods
    private func startFirebaseSignIn(credential: AuthCredential) {
        if let authStateChangeListener {
            Auth.auth().removeStateDidChangeListener(authStateChangeListener)
        }
        
        Auth.auth().signIn(with: credential) {
            [weak self]
            (firResult, error) in
            
            guard let firResult else {
                return
            }
            
            var loggedInUserData: [String: Any?] = [:]
            loggedInUserData["id"] = firResult.user.uid
            loggedInUserData["name"] = firResult.user.displayName
            loggedInUserData["email"] = firResult.user.email
            
            guard let jsonData: Data = try? JSONSerialization.data(withJSONObject: loggedInUserData) else {
                return
            }
            
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: NameSpaces.Notifications.userDidLogInSuccessfully),
                object: nil,
                userInfo: [NameSpaces.Notifications.UserInfoKeys.loggedInUserData : jsonData])
            
            if let self {
                self.addFirAuthStateChangeListener()
                self.saveUserInDatabase(loggedInUser: loggedInUserData)
            }
        }
    }
    
    private func saveUserInDatabase(loggedInUser: [String: Any?]) {
        let userPath: String = "/users/\(loggedInUser["id"]!!)"
        FIRDatabaseManager.shared.setValueAtPath(path: userPath, value: loggedInUser) {
            (error) in
            print(error?.localizedDescription ?? "No Errors")
        }
    }
    
    private func userLoginStateChanged(isLoggedIn: Bool) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: NameSpaces.Notifications.userLoginStateChanged),
            object: nil,
            userInfo: [NameSpaces.Notifications.UserInfoKeys.isUserLoggedIn : isLoggedIn])
    }
    
    private func addFirAuthStateChangeListener() {
        //---- Setup Authentication Listener
        authStateChangeListener = Auth.auth().addStateDidChangeListener {
            [weak self]
            auth, user in
            
            if let self {
                self.userLoginStateChanged(isLoggedIn: user != nil)
            }
            
        }
    }
}
