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
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
                Text("Home")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.top, 40)
                NavigationView {
                    List {
                        Section {
                            DisclosureGroup(
                                isExpanded: $myGroupsIsExpanded,
                                content: {
                                    //TODO: all this can most certainly be class
                                    HStack {
                                        if whichSelection == 0 {
                                            Button("Select group", action: {whichSelection = 0})
                                                .foregroundStyle(Color.black)
                                        } else {
                                            Button("Select group", action: {whichSelection = 0})
                                                .foregroundStyle(Color.gray)
                                        }
                                        
                                        if whichSelection == 0 {
                                            Text("\(Image(systemName: "checkmark"))")
                                                .font(.system(size: 14))
                                        }
                                        
                                    }
                                    HStack {
                                        if whichSelection == 1 {
                                            Button("XC Summer 2024", action: {whichSelection = 1})
                                                .foregroundStyle(Color.black)
                                        } else {
                                            Button("XC Summer 2024", action: {whichSelection = 1})
                                                .foregroundStyle(Color.gray)
                                        }
                                        if whichSelection == 1 {
                                            Text("\(Image(systemName: "checkmark"))")
                                                .font(.system(size: 14))
                                            Spacer()
                                            Text("Go \(Image(systemName: "arrow.right"))").onTapGesture {
                                                test.toggle()
                                            }
                                            .foregroundColor(Color.blue)
                                        }
                                    }
                                    
                                    HStack {
                                        if whichSelection == 2 {
                                            Button("Macro Group Project", action: {whichSelection = 2})
                                                .foregroundStyle(Color.black)
                                        } else {
                                            Button("Macro Group Project", action: {whichSelection = 2})
                                                .foregroundStyle(Color.gray)
                                        }
                                        
                                        if whichSelection == 2 {
                                            Text("\(Image(systemName: "checkmark"))")
                                                .font(.system(size: 14))
                                            Spacer()
                                            Text("Go \(Image(systemName: "arrow.right"))").onTapGesture {
                                                test.toggle()
                                            }
                                            .foregroundColor(Color.blue)
                                        }
                                    }
                                },
                                
                                label: { Text("Select Group  \(Image(systemName: "tray.full"))")
                                    
                                    //.fontWeight(.bold)
                                } // label
                            ) // first disclosure group
                            DisclosureGroup(
                                isExpanded: $joinExpanded,
                                content: {
                                    HStack {
                                        TextField("Type join code here", text: $joinCode)
                                        Spacer()
                                        if joinCode == "" { // TODO: Change condition to check if code format is valid (i.e. if 6 charcaters, only numbers)
                                            Button("Go \(Image(systemName: "arrow.right"))", action: {})
                                                .disabled(true)
                                        }
                                        else {
                                            Button("Go \(Image(systemName: "arrow.right"))", action: {test.toggle()})
                                                .disabled(false)
                                        }
                                    } // hstack
                                    
                                },
                                label: { Text("Join Group      \(Image(systemName: "folder"))") }
                            )
                        } header: {
                            Text("Continue with existing group")
                        }
                        
                        Section {
                            ShareLink(item: URL(string: "https://apps.apple.com/us/app/light-speedometer/id6447198696")!) {
                                Text("Invite Friends  \(Image(systemName: "square.and.arrow.up"))")
                            }
                            
                            
                            
                            
                        } header: {
                            Text("Share")
                        }
                        
                        
                        Section {
                            ShareLink(item: URL(string: "https://medium.com/@jpmtech/swiftui-add-a-share-button-to-your-app-826ef116b61c")!) {
                                Text("Invite Others   \(Image(systemName: "square.and.arrow.up"))")
                            }
                            DisclosureGroup(
                                isExpanded: $friendsExpanded,
                                content: {
                                    MyFriends(first: "Alex", last: "Badami")
                                    MyFriends(first: "Hoe", last: "Simeone")
                                    MyFriends(first: "Eddie", last: "Truck")
                                    MyFriends(first: "James", last: "Gally")
                                    
                                    if true {
                                        Button("Create Group \(Image(systemName: "arrow.right"))", action: {showCreateGroup.toggle()})
                                            .disabled(false)
                                    } else {
                                        Button("Create Group \(Image(systemName: "arrow.right"))", action: {})
                                            .disabled(true)
                                    }
                                    
                                    
                                },
                                label: { Text("My Friends      \(Image(systemName: "list.bullet.rectangle.portrait"))") }
                            )
                            if test {
                                Text("test action")
                            }
                        } header: {
                            Text("Create New Group")
                        }
                    } // overall list
                }
            }
            .fullScreenCover(isPresented: $showCreateGroup) {
                ZStack {
                    CreateGroupView()
                    VStack {
                        HStack {
                            Button("Cancel", action: {
                                showCreateGroup.toggle()
                            })
                            .padding(.leading, 30)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
    } // var body some view
} // struct home view

#Preview {
    HomeView()
}

//struct MyFriends: View {
//    let firstName: String
//    let lastName: String
//
//    
//    var body: some View {
//
//        Text("\(firstName) \(lastName)")
//        
//    }
//}



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


