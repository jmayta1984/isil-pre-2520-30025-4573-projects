//
//  ContentView.swift
//  EasyNotification
//
//  Created by Alumno on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var notificationManager: NotificationManager
    var body: some View {
        VStack {
            Button {
                notificationManager.scheduleNotification()
            } label: {
                Label("Schedule notification", systemImage: "bell")
            }
            
            Button {
                notificationManager.calendarNotification()
            } label: {
                Label("Calendar notification", systemImage: "calendar")
            }

        }
        .onAppear {
            notificationManager.requestNotificationPermissions()
        }
        
    }
}

