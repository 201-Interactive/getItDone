//
//  HomeView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/30/24.
//

import SwiftUI


struct HomeView: View {
    
    // TODO: every thing that has test.toggle() needs to be replaced with an appropiate action
    
    @State private var myGroupsIsExpanded: Bool = false
    @State private var joinExpanded: Bool = false
    @State private var friendsExpanded: Bool = false
    
    @State private var joinCode = ""
    @State private var isSelected: Bool = true
    @State private var whichSelection: Int = 0
    
    @State private var test: Bool = false
    
    @State private var showCreateGroup: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightGray
                    .ignoresSafeArea()
                List {
                    Section {
                        ShareLink(item: URL(string: "https://www.godaddy.com/")!) {
                            Text("Invite Others  \(Image(systemName: "square.and.arrow.up"))")
                        }
                    } header: { Text("Create New Group") } // header
                } // overall list
            } // zstack
        } // nav view
    } // var body some view
} // struct home view

#Preview {
    HomeView()
}

struct MyFriends: View {
    let first: String
    let last: String
    @State var nameCheck: Bool = false
    
    var body: some View {
        if nameCheck {
            HStack {
                Button("\(Image(systemName: "checkmark.square")) \(first) \(last)", action: {nameCheck.toggle()})
                    .foregroundStyle(Color.black)

                
            }
        } else {
            Button("\(Image(systemName: "square")) \(first) \(last)", action: {nameCheck.toggle()})
                .foregroundStyle(Color.gray)
        }
    }
}


