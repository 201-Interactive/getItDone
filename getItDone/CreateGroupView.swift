//
//  CreateGroupView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/24/24.
//

import SwiftUI

struct CreateGroupView: View {
    @State private var groupName: String = ""
    
    @State private var disableCreate: Bool = true
    
    @State private var test: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightGray
                    .ignoresSafeArea()
                List {
                    HStack {
                        TextField("Group Name", text: $groupName)
                        Spacer()
                    } // hstack
                    
                    .onChange(of: groupName) {
                        if disableCreate || groupName == "" {
                            disableCreate.toggle()
                        }
                    }
                    DatePicker("Start date:", selection: .constant(Date()), displayedComponents: .date)
                    
                    //  \(Image(systemName: "play.circle"))
                    //.font(.system(size: 19))
                    
                    DatePicker("End date:", selection: .constant(Date()), displayedComponents: .date)
                    
                    
                    //(Image(systemName: "stop.circle"))
                    //.font(.custom("Georgia", fixedSize: 18))
                    //.font(.system(size: 19))
                    if disableCreate {
                        Button("Invite Group  \(Image(systemName: "square.and.arrow.up"))", action: {})
                            .disabled(true)
                    } else {
                        ShareLink(item: URL(string: "https://www.godaddy.com/")!) {
                            Text("Invite Group  \(Image(systemName: "square.and.arrow.up"))")
                        }
                            .fontWeight(.medium)
                    }
                    //TODO: on close: exit this page
                }
            } // ZStack
            .navigationTitle("Create Group")
        } // Nav stack
        
    } // var body some view
} // creategroupview

#Preview {
    CreateGroupView()
}


