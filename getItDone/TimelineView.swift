//
//  TimelineView.swift
//  getItDone
//
//  Created by Jack Graziani on 6/10/24.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack (spacing: 50) {
                    VStack(spacing: 20) {
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
                    
                    VStack(spacing: 20) {
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
            .padding(.bottom, 90)
        } // Zstack
    }
}

#Preview {
    TimelineView()
}
