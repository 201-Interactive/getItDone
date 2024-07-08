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
            TeamTrackerView()
                .tabItem {
                    Label("Team Tracker", systemImage: "list.clipboard")
                }.tag(1)
            SettingsView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }.tag(2)
        } // end TabView
// add to settings: profile, necessary home page componenets

    }
}

#Preview {
    ContentView(showSignInView: .constant(false))
}

