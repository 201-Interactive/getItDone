//
//  FillBubbleView.swift
//  getItDone
//
//  Created by Jack Graziani on 6/7/24.
//

import SwiftUI
struct FillBubbleView: View {
    @State private var circleIsGreen: Bool = false
    @State private var multiSelection = Set<UUID>()

    let tasks = [
        TaskItem(name: "Run 7 miles"),
        TaskItem(name: "Lifts day 2"),
        TaskItem(name: "bands"),
        TaskItem(name: "stretch")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightGray.ignoresSafeArea()
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(circleColor(circleIsGreen: circleIsGreen))
                            .overlay(Circle().strokeBorder(Color.black,lineWidth: 3))
                            .onTapGesture {circleIsGreen.toggle()}
                    }
                    List(tasks, selection: $multiSelection) { taskItem in Text(taskItem.name)
                        
                    } // list
                } // vstack
                .environment(\.editMode, .constant(EditMode.active))
                .padding(.top, 20)
            } // ZStack
        } // Nav view
    } // var body some view
}// struct fill bubble view

#Preview {
    FillBubbleView()
}

func circleColor(circleIsGreen: Bool) -> Color {
    if circleIsGreen {
        return Color.green
    } else {
        return Color.lightGray
    }
}

struct TaskItem: Identifiable {
    let id = UUID()
    let name: String
}
