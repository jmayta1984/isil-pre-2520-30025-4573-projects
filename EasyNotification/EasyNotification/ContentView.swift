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
            
        }
        .onAppear {
            notificationManager.requestNotificationPermissions()
        }
        
    }
}

