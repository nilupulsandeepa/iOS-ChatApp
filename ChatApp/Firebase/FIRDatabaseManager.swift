//
//  FIRDatabaseManager.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-26.
//

import Foundation
import FirebaseDatabase

public class FIRDatabaseManager {
    
    //---- MARK: Properties
    public static var shared: FIRDatabaseManager = FIRDatabaseManager()
    
    public var dbReference: DatabaseReference? = nil
    
    //---- MARK: Initialization
    init() {
        print("FIRDatabaseManager Initialized")
        dbReference = Database.database().reference()
    }
    
    //---- MARK: Action Methods
    public func setValueAtPath(path: String, value: Any?, completion: @escaping (Error?) -> Void) {
        if let dbReference {
            dbReference.child(path).setValue(value) {
                (error, dbRef) in
                if let error {
                    completion(error)
                } else {
                    completion(nil)
                }
            }
        } else {
            completion(AppError.FirebaseDBError.firebaseDBNotAvailable)
        }
    }
    
    //---- MARK: Deinitialization
    deinit {
        print("FIRDatabaseManager Deinitialized")
    }
}
