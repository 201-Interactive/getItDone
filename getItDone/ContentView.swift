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
    @State private var selectedTab : Int = 3// default tab -- should be team tracker
    @State private var showSendGroup:Bool = false
    
    @State private var showNavigationBar = false

    
    var body: some View {
            TabView(selection: $selectedTab) {
//––––––––––––––––––––––– Settings Tab - Tab 1 –––––––––––––––––––––––––––––––
                ZStack {
                    Text("Settings view")
                    Divider()
                        .offset(y: 340)
                }
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }.tag(1)
//––––––––––––––––––––––– Home Tab - Tab 2 –––––––––––––––––––––––––––––––-–––––
                ZStack { // TAB 2

                    HomeView()
                    Divider()
                        .offset(y: 340)
                }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.tag(2)

//––––––––––––––––––––––– Team Tracker Tab - Tab 3 –––––––––––––––––––––––––––––––
                ZStack {
                    if selectedTab == 3 {
                        ZStack {
                            TeamTrackerView()
                            Divider()
                                .offset(y: 340)
                            
                            VStack {
                                Spacer()
                                HStack (spacing: 50) {
                                    VStack (spacing: 10) {
                                        Text("Project timeline:")
                                        //.font(.custom("Georgia", fixedSize: 18))
                                        //.font(.system(size: 18))
                                            .italic()
                                        HStack {
                                            Text("42") // replace with struct/func that calculates number from start and end date
                                                .fontWeight(.semibold)
                                            
                                            Text("days left")
                                        } // days left HStack
                                    } // VStack
                                    
                                    VStack(spacing: 10) {
                                        Text("Daily timeline:")
                                            .italic()
                                        HStack {
                                            Text("6") // replace with struct/func that calculates number from start and end date
                                                .fontWeight(.semibold)
                                            
                                            Text("hours left")
                                        } // hours left HStack
                                        
                                    } // VStack
                                } // Hstack
                            }
                            .padding(.bottom, 40)
                        }
                            //.interactiveDismissDisabled()
                    }
                    

//                    VStack {
//                        HStack {
//                            Button("\(Image(systemName: "chevron.backward")) Back", action: {
//                                selectedTab = 2
//                                showNavigationBar.toggle()
//                            })
//                            .padding(.leading, 30)
//                            Spacer()
//                        }
//                        Spacer()
//                    }

                    
                }

                
                    .tabItem {
                        Label("Team Tracker", systemImage: "list.clipboard")
                    }.tag(3)


                
//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
        }
        
    }
}

#Preview {
    ContentView()
}

// FRIENDS STRUCT IS IN V2

struct CustomDivider: View {
    var body: some View {
        Text("") // divider
            .frame(width: 1000, height: 1/3)
            .background(Color.black)
            .offset(y: 340)
    }
}

