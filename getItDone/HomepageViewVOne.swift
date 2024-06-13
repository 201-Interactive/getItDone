//
//  HomepageView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/20/24.
//

import SwiftUI

struct HomepageViewVOne: View {
    @State private var groupSelection: String = "None"
    var myGroups = [
        "Group 1": ["Amanda", "Arman", "Abby"],
        "Group 2": ["Bob", "Beatrice", "Brendan"],
        "Group 3": ["Caroline", "Christian", "Cooper"]
        ]
    
    var myFriends = ["Friend 1", "Friend 2", "Friend 3", "Friend 4"]
    var body: some View {
        Text("Get It Done!")
            .padding()
            .font(.title)



        VStack(spacing: 35) {
            Button("Invite Friends", action: {})
            Menu("My Friends") { // dropdown menu
            }
            Menu("My Groups") {
            }
            Button("Create Group", action: {})
             
            
            Menu("Select a group") {
                if let namesList = myGroups["Group 1"] {
                    Button("\(listToString(groupList: namesList))", action: {})
                }
            } // Menu

            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 170, height: 30)
                    .foregroundStyle(.tint)
                
                Button("Create a GetItDone!", action: {
                    // TODO: Link this to the actual page
                })
                .foregroundStyle(.white)
                .padding(40)
            } // Zstack


            Text("Selected group: \(groupSelection)")
        } // VStack
    } // some view
} // homepage view
#Preview {
    HomepageViewVOne()
}

func listToString(groupList: Array<String>) -> String{
    var the_string = ""
    for item in groupList{
        if item == groupList[groupList.count - 1]{
            the_string = the_string + item
        }
        else {
            the_string = the_string + item + ", "
        }
    }
    return the_string
}


