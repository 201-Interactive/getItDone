//
//  GetItDoneView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/23/24.
//

import SwiftUI

struct TeamTrackerView: View {
    
    @State private var showSheet = false
    @State private var onTab: Bool = true
    @State private var iAmDone: Bool = false
    @State private var myName: String = "Jack Graziani"
    
    @State var fakeIsGreen: Bool = false
    
    //@Binding var circleIsGreen: Bool
    //why the fuck does this not work


    
    //@State private var detent: PresentationDetent = .fraction(0.2)
    
    // // @State private var showBubble: Bool = false
    var body: some View {
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
                Text("Team Tracker")
                //.font(.custom("Georgia", fixedSize: 30))
                    .font(.title)
                //.fontWeight(.heavy)
                    .fontWeight(.bold)
                //.padding(30)
                
                    .padding(.top, 40)
                List {
                    NameList(firstName: "Alex", lastName: "Badami", isDone: false)
                    NameList(firstName: "Joe", lastName: "Simeone", isDone: true)
                    NameList(firstName: "Eddie", lastName: "Trenk", isDone: false)
                    NameList(firstName: "James", lastName: "Gallagher", isDone: false)
                    NameList(firstName: "Jack", lastName: "Quinn", isDone: true)
                    Button("click to Get it done", action: {fakeIsGreen.toggle()})
                    
                    HStack {
                        Button(myName, action: {showSheet.toggle()})
                        Spacer()
                        HStack {
                            if fakeIsGreen {
                                Text("\(Image(systemName: "checkmark.circle"))")
                                    .foregroundStyle(Color.green)
                            } else {
                                Text("\(Image(systemName: "xmark.circle"))")
                                    .foregroundStyle(Color.red)
                            }
                            Text("\(Image(systemName: "bell"))")
                                .foregroundStyle(Color.white)
                        }
                    }
                } // list
                
                VStack {
                    Spacer()
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
                }
                .padding(.bottom, 40)
            } // VStack
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
            
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            //.padding()
            
//            .sheet(isPresented: $showSheet) {
//                ZStack {
//                    //Color.green
//                        //.ignoresSafeArea()
//                    .presentationDetents([.fraction(0.15), .large], selection: $detent)
//                    
//                    .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.15)))
//                    .interactiveDismissDisabled()
//                    
//                    Divider()
//                        .offset(y: 260)
//
//
//                    if detent == .large {
//                        FillBubbleView()
//                        }
//                } // sheet ZStack
//            } // .sheet
            
//            .fullScreenCover(isPresented: $showBubble, content: {
//                FillBubbleView()
//            })
//                        
                             

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
    
    var hasNotif: String {
        if isDone {
            return ""
        }
        else {
            return "gear"
        }
    }
    
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
//                .padding(.leading)
//                //.font(.custom("Georgia", fixedSize: CGFloat(textSize)))
                //.font(.system(size: CGFloat(textSize)))
            Spacer()
            HStack {
                
                Text("\(Image(systemName: "\(iconName)"))")
                    .foregroundStyle(nameColor)
                    //.font(.custom("", fixedSize: CGFloat(textSize)))
                
                if !isDone {
//                    Button("\(Image(systemName: "bell"))", action: {})
//                        .foregroundStyle(Color.blue)
//                        .font(.system(size: CGFloat(textSize)))
                    Menu("\(Image(systemName: "bell"))") {
                        Button("Poke", action: {})
                        Button("Jab", action: {})
                        Button("Punch", action: {})
                    }
                        .foregroundStyle(Color.blue)
                        //.font(.system(size: CGFloat(textSize)))
                } // if !isDone
                else {
                    Text("\(Image(systemName: "bell"))")
                        .foregroundStyle(Color.gray)
                        //.font(.system(size: CGFloat(textSize)))
                }
            }
            //Spacer()
        
        }
    } // var body
    
} // struct view

func typaBell(isComplete: Bool) -> Any {
    if isComplete {
        return Text("\(Image(systemName: "bell"))")
    } else {
        return {
            Menu("\(Image(systemName: "bell"))") {
                Button("Tap", action: {})
                Button("Prod", action: {})
                Button("Jab", action: {})
            }
        }
    }
}
