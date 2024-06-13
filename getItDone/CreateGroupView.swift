//
//  CreateGroupView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/24/24.
//

import SwiftUI

struct CreateGroupView: View {
    @State private var groupName: String = ""
    
    @State private var disableAfterSubmit: Bool = false
    
    @State private var test: Bool = false
    
    var body: some View {
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack () {
                Text("Group Details:")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.top, 40)
                List {
                    HStack {
                        TextField("Type group name here", text: $groupName)
                        Spacer()
                        if groupName == "" || disableAfterSubmit == true {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .frame(width: 115)
//                                    .foregroundStyle(.lightGray)
//                                Button("Submit", action: {})
//                                    .disabled(true)
//                            }
                            Button("Submit", action: {})
                                .disabled(true)
                        }
                        else {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .frame(width: 115)
//                                    .foregrounfdStyle(.tint)
//                                Button("Submit", action: {test.toggle(); disableAfterSubmit.toggle()})
//                                    .disabled(false)
//                                    .foregroundStyle(.white)
//                                
//                            }
                            Button("Submit", action: {test.toggle(); disableAfterSubmit.toggle()})
                                .disabled(false)
                        }
                    } // hstack
                    
                    .onChange(of: groupName) {
                        if disableAfterSubmit {
                            disableAfterSubmit.toggle()
                        }
                    }
                    DatePicker("Start date", selection: .constant(Date()), displayedComponents: .date)
                    
                    //  \(Image(systemName: "play.circle"))
                    //.font(.system(size: 19))
                    
                    DatePicker("End date", selection: .constant(Date()), displayedComponents: .date)
                    
                    
                    //(Image(systemName: "stop.circle"))
                    //.font(.custom("Georgia", fixedSize: 18))
                    //.font(.system(size: 19))
                    if disableAfterSubmit {
                        Button("Create Group", action: {test.toggle()})
                            .disabled(false)
                    } else {
                        Button("Create Group", action: {})
                            .disabled(true)
                    }
                    if test {
                        DisclosureGroup(
                            content: { Text("Content") },
                            label: { Text("Test") }
                        )
                    }
                    
                }
                
                
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
           
        } // ZStack
    } // var body some view
} // creategroupview

#Preview {
    CreateGroupView()
}


