//
//  HomepageViewVThree.swift
//  getItDone
//
//  Created by Jack Graziani on 5/29/24.
//



import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var joinCode = "" // TODO: Double variable declaration?
    @State private var selectedTab : Int = 1// default tab -- should be team tracker
    @State private var showSendGroup:Bool = false
    
    @State private var showNavigationBar = false
    @Binding var showSignInView: Bool

    
    var body: some View {

        TabView(selection: $selectedTab) {
            SettingsView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }.tag(1)
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(2)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }.tag(3)
            TeamTrackerView()
                .tabItem {
                    Label("Team Tracker", systemImage: "list.clipboard")
                }.tag(4)
        } // end TabView

    }
}

#Preview {
    ContentView(showSignInView: .constant(false))
}

