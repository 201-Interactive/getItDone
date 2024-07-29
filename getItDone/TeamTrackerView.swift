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
    
//    @State private var groupSelection: String = "fake ahh group"
    
    let myGroups: [String] = ["XC Summer 2024", "Group 2", "Group 3"]
    
    @State private var groupSelection: String = "myGroups[0]"
    
    var body: some View {
        NavigationStack {
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
                    NameList(name: "Alex Badami", isDone: false)
                    NameList(name: "Joe Simp", isDone: true)
                    NameList(name: "Eddie Truck", isDone: false)
                    NameList(name: "Jack Quinnathon", isDone: true)

                } header : {Text("Group activity")}
            } // list
            .fullScreenCover(isPresented: $showSheet, content: {
                ZStack {
                    NavigationStack {
                        FillBubbleView()
                            .toolbar {
                                Button("Done", action: {showSheet.toggle()})
                                    .fontWeight(.medium)
                                
                        //TODO: using toolbar / nav stack = messes up fillbubbleview
                                //i think there's a more offical way to do this?? because it's a toolbar
                            }
                    }
                }
            })
            .navigationTitle("\(groupSelection)")
            
//            .toolbar {
//                Picker(
//                    selection: $groupSelection,
//                    label: Text("filter"),
//                    content: {
//                        ForEach(myGroups, id: \.self) { option in
//                            Text(option)
//                                .tag(option)
//                        }
//                    })
//                .pickerStyle(MenuPickerStyle())
//            }
            .toolbar {
                Menu {
                    Picker(selection: $groupSelection, label: Text("")) {
                        ForEach(myGroups, id: \.self) { group in
                            Text(group)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(InlinePickerStyle())
                } label: {
                    HStack {
                        Text("\(Image(systemName: "plus"))")
                    }
                }
            }
        }
    } // var body some View
} // GetItDoneView

#Preview {
    TeamTrackerView()
}

struct NameList: View {
    let name: String
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
            Text("\(name)")
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
