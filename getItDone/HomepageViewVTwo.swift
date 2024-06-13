//
//  HomepageDesign.swift
//  getItDone
//
//  Created by Jack Graziani on 5/22/24.
//

import SwiftUI
import UIKit

struct HomepageViewVTwo: View {
    
    
    
    var body: some View {
        ZStack {
            Color(hex: "dbdbdb")
                .ignoresSafeArea()
            
            VStack(spacing: 70) {
                
                Text("Get It Done!™")
                    .font(.custom("Georgia", fixedSize: 36))
                    .fontWeight(Font.Weight.heavy)
                
                VStack (spacing: 50) {
                    
                    Button("Invite Friends  \(Image(systemName: "square.and.arrow.up"))", action: {}) // insert share menu here
                        .foregroundStyle(Color.black)
                        .font(.custom("Georgia", fixedSize: 21))
                    
                    Button("Create Group  \(Image(systemName: "plus.rectangle.on.folder"))", action: {}) // insert create group action here
                        .foregroundStyle(Color.black)
                        .font(.custom("Georgia", fixedSize: 21))
                    
                    Menu("Join Group  \(Image(systemName: "folder"))") {
                        Text("example 123")
                            .font(.custom("Georgia", fixedSize: 18))
                    }
                    .foregroundStyle(Color.black)
                    .font(.custom("Georgia", fixedSize: 21))
                    
                    Menu("My Friends  \(Image(systemName: "list.bullet.rectangle.portrait"))") {
                        Friends(firstName: "Alex", lastName: "Badami")
                        Friends(firstName: "Joe", lastName: "Simeone")
                        Friends(firstName: "Eddie", lastName: "Trenk")
                    }
                    .foregroundStyle(Color.black)
                    .font(.custom("Georgia", fixedSize: 21))
                    
    
                    Menu("Select Group  \(Image(systemName: "tray.full"))") {
                        Button("Macro group project", action: {})
                        Button("XC Summer 2024   ✓", action: {})
                        Button ("Select group", action: {})

                    }
                    .foregroundStyle(Color.black)
                    .font(.custom("Georgia", fixedSize: 21))
                    
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 210, height: 40)
                            .foregroundStyle(.tint)
                        
                        Button("Get It Done! \(Image(systemName: "arrowshape.right.circle"))", action: {}) // insert create group action here
                            .foregroundStyle(Color.white)
                            .font(.custom("Georgia", fixedSize: 23))
                    }
                }
                HStack(spacing: 100) {
                    
                    Button("\(Image(systemName: "person.circle"))", action: {}) // insert create group action here
                        .foregroundStyle(Color.black)
                        .font(.system(size: 30))
                    
                    Button("\(Image(systemName: "star"))", action: {}) // insert create group action here
                        .foregroundStyle(Color.black)
                        .font(.system(size: 30))
                    
                    Button("\(Image(systemName: "gear"))", action: {}) // insert create group action here
                        .foregroundStyle(Color.black)
                        .font(.system(size: 30))
                    
                }
            }
        }
    }
}

#Preview {
    HomepageViewVTwo()
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}


    //.font(.system(size: 70))

struct Friends: View {
    let firstName: String
    let lastName: String
    let textSize:Int = 25
    
    var body: some View {
        Text("\(firstName) \(lastName)")
            .font(.custom("Georgia", fixedSize: CGFloat(textSize)))

    } // var body
    
} // struct view
