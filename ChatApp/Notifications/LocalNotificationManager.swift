//
//  LocalNotificationManager.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import Foundation
import UserNotifications
import UIKit

public class LocalNotificationManager: NSObject {
    //---- MARK: Properties
    public static var shared: LocalNotificationManager = LocalNotificationManager()
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    //---- MARK: Action Methods
    public func requestNotificationPermision() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {
            (isGranted, error) in
            if (isGranted) {
                print("Notification Granted")
            } else {
                print("Notification Failed")
            }
        })
    }
    
    public func scheduleTestNotification() {
        var tempDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        tempDirectory = tempDirectory.appending(path: "temp.png")
        let image = UIImage(named: "google")!
        let data = image.pngData()
        try? data?.write(to: tempDirectory)
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "This is a local notification"
        content.sound = .default
        content.attachments.append(try! UNNotificationAttachment(identifier: "image", url: tempDirectory))
        content.subtitle = "I don't know"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {
            (error) in
            
            if let error {
                print(error.localizedDescription)
            } else {
                print("Done")
            }
        }
    }
}

//---- MARK: Extension
extension LocalNotificationManager: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge])
    }
}
