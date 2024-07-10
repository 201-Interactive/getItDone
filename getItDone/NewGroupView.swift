//
//  WelcomeView.swift
//  getItDone
//
//  Created by Jack Graziani on 7/9/24.
//

import SwiftUI

struct NewGroupView: View {
    
    @State private var joinExpanded: Bool = false
    
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
                    ShareLink(item: URL(string: "https://www.godaddy.com/")!) {
                        Text("Invite Others  \(Image(systemName: "square.and.arrow.up"))")
                    }
                } header: { Text("Create New Group") } // header
            } //list
            .navigationTitle("New Group")
            //.navigationBarTitleDisplayMode(.inline)
        } // nav stack
        
    }// var body some view
}

#Preview {
    NewGroupView()
}
