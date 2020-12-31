//
//  KerveApp.swift
//  KerveWatchApp Extension
//
//  Created by Aaron Baw on 31/12/2020.
//

import SwiftUI

@main
struct KerveApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
