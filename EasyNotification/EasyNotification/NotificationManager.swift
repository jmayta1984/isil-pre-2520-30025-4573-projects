//
//  NotificationManager.swift
//  EasyNotification
//
//  Created by Alumno on 28/11/25.
//

import UserNotifications

class NotificationManager: ObservableObject {
    
    func requestNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Permission: \(granted)")
            }
        }
    }
    
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Schedule notification"
        content.body = "This is a schedule notification"
        content.sound = .defaultRingtone
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
        
    }
}
