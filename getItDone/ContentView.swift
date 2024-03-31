//
//  ContentView.swift
//  getItDone
//
//  Created by Jack Graziani on 3/31/24.
//

import SwiftUI

struct ContentView: View {
    
    //TODO: Remove dummy data
    var peopleList = ["Hebben", "JQuinnathon", "Joe", "Jack"]
    
    var body: some View {
        List(peopleList, id: \.self) { person in
            Text(person)
        }
        .listStyle(.plain)
    }
}
 
#Preview {
    ContentView()
}
