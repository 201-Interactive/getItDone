//
//  GetItDoneView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/23/24.
//

import SwiftUI

struct TeamTrackerView: View {
    
    @State private var showSheet = false
    @State private var myName: String = "Jack Graziani"
    @State var iAmDone: Bool = false
    
    @State private var groupSelection = "Group 1"
    let myGroups = ["Group 1", "Group 2", "Group 3"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                //            Color.lightGray
                //                .ignoresSafeArea()
                List {
                    Section {
                        HStack {
                            Button(myName, action: {showSheet.toggle()})
                            Spacer()
                            HStack {
                                if iAmDone {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundStyle(Color.green)
                                } else {
                                    Image(systemName: "xmark.circle")
                                        .foregroundStyle(Color.red)
                                }
                            }
                        }
                    } header: {
                        Text("My activity")
                    }
                    Section {
                        NameList(firstName: "Alex", lastName: "Badami", isDone: false)
                        NameList(firstName: "Joe", lastName: "Simeone", isDone: true)
                        NameList(firstName: "Eddie", lastName: "Trenk", isDone: false)
                        NameList(firstName: "Jack", lastName: "Quinn", isDone: true)
                    } header : {Text("Group activity")}
                } // list
            }
            .fullScreenCover(isPresented: $showSheet, content: {
                ZStack {
                    FillBubbleView()
                    VStack {
                        HStack {
                            Spacer()
                            Button("Done", action: {showSheet.toggle()})
                                .padding(.trailing, 30)
                                .fontWeight(.medium)
                            
                        }
                        Spacer()
                    }
                }
            })
            .navigationTitle("\(groupSelection)")
            
            .navigationBarItems(trailing: 
                
                Picker("\(Image(systemName: "plus"))",
                    selection: $groupSelection,
                    content: {
                    ForEach(myGroups, id: \.self) {Text($0)}
                })
                    .pickerStyle(MenuPickerStyle())
            ) // navbaritems(trailing
        }
    } // var body some View
} // GetItDoneView

#Preview {
    TeamTrackerView()
}

struct NameList: View {
    let firstName: String
    let lastName: String
    let isDone: Bool
    
    var iconName: String {
        if isDone {
            return "checkmark.circle"
        }
        else {
            return "xmark.circle"
        }
    } // var icon name
    
    var nameColor: Color {
        if isDone {
            return Color.green
        }
        else {
            return Color.red
        }
    } // var nameColor
    
    var body: some View {
        HStack {
            Text("\(firstName) \(lastName)")
            Spacer()
            if !isDone {
                Menu("\(Image(systemName: "bell"))") {
                    Button("Poke", action: {})
                    Button("Jab", action: {})
                    Button("Punch", action: {})
                }
                    .foregroundStyle(Color.blue)
            } else {Image(systemName: "bell").foregroundStyle(Color.gray)}
            Image(systemName: "\(iconName)").foregroundStyle(nameColor)
        } // hstack
    } // var body
    
} // struct view
