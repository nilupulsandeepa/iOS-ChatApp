//
//  Utils.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-31.
//

import Foundation

public class Utils {
    public static func delayExecution(seconds: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
