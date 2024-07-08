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
                        TextField("Type group name here", text: $groupName)
                        Spacer()
                    } // hstack
                    
                    .onChange(of: groupName) {
                        if disableCreate || groupName == "" {
                            disableCreate.toggle()
                        }
                    }
                    DatePicker("Start date", selection: .constant(Date()), displayedComponents: .date)
                    
                    //  \(Image(systemName: "play.circle"))
                    //.font(.system(size: 19))
                    
                    DatePicker("End date", selection: .constant(Date()), displayedComponents: .date)
                    
                    
                    //(Image(systemName: "stop.circle"))
                    //.font(.custom("Georgia", fixedSize: 18))
                    //.font(.system(size: 19))
                    if disableCreate {
                        Button("Create Group", action: {test.toggle()})
                            .disabled(true)
                    } else {
                        Button("Create Group", action: {})
                            .disabled(false)
                    }
                }
            } // ZStack
            .navigationTitle("Create Group")
        } // Nav stack
        
    } // var body some view
} // creategroupview

#Preview {
    CreateGroupView()
}


