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
    
    var body: some View {
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
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
                        NameList(firstName: "James", lastName: "Gallagher", isDone: false)
                        NameList(firstName: "Jack", lastName: "Quinn", isDone: true)
                    } header : {
                        Text("Group activity")
                    }
                } // list
//                VStack {
//                    Spacer()
//                    HStack (spacing: 50) {
//                        VStack (spacing: 10) {
//                            Text("Project timeline:")
//                            //.font(.custom("Georgia", fixedSize: 18))
//                            //.font(.system(size: 18))
//                                .italic()
//                            HStack {
//                                Text("42") // replace with struct/func that calculates number from start and end date
//                                    .fontWeight(.semibold)
//                                
//                                Text("days left")
//                            } // days left HStack
//                        } // VStack
//                        
//                        VStack(spacing: 10) {
//                            Text("Daily timeline:")
//                                .italic()
//                            HStack {
//                                Text("6") // replace with struct/func that calculates number from start and end date
//                                    .fontWeight(.semibold)
//                                
//                                Text("hours left")
//                            } // hours left HStack
//                            
//                        } // VStack
//                    } // Hstack
//                }
//                .padding(.bottom, 40)
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
        .navigationTitle("Group Name")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("\(Image(systemName: "chevron.down"))") {
                }
            }
            
        }

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
    NavigationStack {
        TeamTrackerView()
    }
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
            Spacer()
            HStack {

                if !isDone {
                    Menu("\(Image(systemName: "bell"))") {
                        Button("Poke", action: {})
                        Button("Jab", action: {})
                        Button("Punch", action: {})
                    }
                        .foregroundStyle(Color.blue)

                } // if !isDone
                else {
                    Text("\(Image(systemName: "bell"))")
                        .foregroundStyle(Color.gray)
                        //.font(.system(size: CGFloat(textSize)))
                }
                Image(systemName: "\(iconName)")
                    .foregroundStyle(nameColor)
            }
        }
    } // var body
    
} // struct view

