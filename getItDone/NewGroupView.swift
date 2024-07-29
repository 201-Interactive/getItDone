//
//  WelcomeView.swift
//  getItDone
//
//  Created by Jack Graziani on 7/9/24.
//

import SwiftUI

struct NewGroupView: View {
    
    @State private var joinExpanded: Bool = false
    
    @State private var showGroupSheet = false

    @State private var isShareLinkPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    DisclosureGroup( // TODO: this will not be a disclosure group
                        isExpanded: $joinExpanded,
                        content: {
                            Text("scan qr code")
                        },
                        label: { Text("Scan QR Code  \(Image(systemName: "qrcode.viewfinder"))") }
                    )
                } header: { Text("Join group") }

                Section {
                    ZStack {
                        Button("Create New Group  \(Image(systemName: "plus.circle"))", action: {showGroupSheet.toggle()})
                        //TODO: link does not work!
                    }
                } header: { Text("Create New Group") } // header
            } //list
            .navigationTitle("New Group")
            //.navigationBarTitleDisplayMode(.inline)
        } // nav stack
        .fullScreenCover(isPresented: $showGroupSheet, content: {
            ZStack {
                NavigationStack {
                    CreateGroupView()
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button("Cancel", action: {showGroupSheet.toggle()})
                            }
                            
                    //TODO: using toolbar / nav stack = messes up fillbubbleview
                            //i think there's a more offical way to do this?? because it's a toolbar
                        }
                }
            }
        })
        
    }// var body some view
}

#Preview {
    NewGroupView()
}
