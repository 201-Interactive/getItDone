//
//  getItDoneApp.swift
//  getItDone
//
//  Created by Jack Graziani on 3/31/24.
//

// IMPORTS //
import FirebaseCore
import SwiftUI

// SETTING UP FIREBASE //
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

// MAIN FUNCTION //
@main
struct getItDoneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
