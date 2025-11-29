//
//  NotificationManager.swift
//  EasyNotification
//
//  Created by Alumno on 28/11/25.
//

import UserNotifications

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    
    override init() {
        super.init()
        configure()
    }
    
    
    func configure() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
    }
    
    
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
        
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
        
    }
    
    func calendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Calendar notification"
        content.body = "This is a calendar notification"
        content.sound = .defaultCritical
        
        var date = DateComponents()
        date.hour = 20
        date.minute = 31
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
}
