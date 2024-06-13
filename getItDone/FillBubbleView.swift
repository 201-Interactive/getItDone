//
//  FillBubbleView.swift
//  getItDone
//
//  Created by Jack Graziani on 6/7/24.
//

import SwiftUI
struct FillBubbleView: View {
    @State private var circleIsGreen: Bool = false
    
    @State private var trimValue: CGFloat = 0.0
    
    
    
    var body: some View {
        
//        TeamTrackerView(circleIsGreen: $circleIsGreen)
        //fuck this shit
        
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Circle()
                        //.frame(width: 300.0)
                        //.padding(.top, 30)
                        .foregroundColor(circleColor(circleIsGreen: circleIsGreen))
                        .overlay(
                            Circle()
                                .strokeBorder(Color.black,lineWidth: 3)
                            )
                    

                        .onTapGesture {
                            circleIsGreen.toggle()
                        }
                    if circleIsGreen {
                        Text("\(Image(systemName: "checkmark"))")
                            .foregroundStyle(.white)
                            //.font(.system(size: 100))
    
                    }
                    else {
                        Text("Hold down to complete")
                            .italic()
                    }
                }
                
                List {
                    TaskItem(theTask: "Run 8 miles")
                    TaskItem(theTask: "Lifts day 3")
                    TaskItem(theTask: "Stretch")
                    TaskItem(theTask: "add task here")
                        .italic()

                } // list
                
                HStack (spacing: 50) {
                    VStack (spacing: 10) {
                        Text("Project timeline:")
                        //.font(.custom("Georgia", fixedSize: 18))
                        //.font(.system(size: 18))
                            .italic()
                        HStack {
                            Text("42") // replace with struct/func that calculates number from start and end date
                                .fontWeight(.semibold)
                            
                            Text("days left")
                        } // days left HStack
                    } // VStack
                    
                    VStack(spacing: 10) {
                        Text("Daily timeline:")
                            .italic()
                        HStack {
                            Text("6") // replace with struct/func that calculates number from start and end date
                                .fontWeight(.semibold)
                            
                            Text("hours left")
                        } // hours left HStack
                        
                    } // VStack
                } // Hstack
                .padding(.bottom, 40)
            } // vstack
            .padding(.top, 20)

    
        }// zstack
        
        

    } // var body some view
    
    
    
}// struct fill bubble view

    

#Preview {
    FillBubbleView()
}

func checkListTask(task: String) -> String {
    return "\(task)"
}



func boolIcon(isComplete: Bool) -> String {
    if isComplete {
        return "checkmark.square"
    }
    else {
        return "square"
    }
}

func boolColor(isComplete: Bool) -> Color {
    if isComplete {
        return Color.gray
    }
    else {
        return Color.black
    }
}


struct TaskItem: View {
    @State private var isDone: Bool = false
    @State var theTask: String
    
    var body: some View {

        HStack {
            Button("\(Image(systemName: "\(boolIcon(isComplete: isDone))"))", action: {isDone.toggle()})
                .foregroundStyle(boolColor(isComplete: isDone))
            
            Text("\(checkListTask(task: theTask))")
                .strikethrough(isDone)
                .foregroundStyle(boolColor(isComplete: isDone))
        }// HStack
        
    }
}

func circleColor(circleIsGreen: Bool) -> Color {
    if circleIsGreen {
        return Color.green
    } else {
        return Color.lightGray
    }
}

func borderColor(circleIsGreen: Bool) -> Color {
    if circleIsGreen {
        return Color.green
    } else {
        return Color.black
    }
}
