//
//  ExistingGroupLoadingView.swift
//  getItDone
//
//  Created by Jack Graziani on 5/23/24.
//

import SwiftUI

struct ExistingGroupLoadingView: View {
    var body: some View {
        ZStack {
            Color(hex: "dbdbdb")
                .ignoresSafeArea()
            VStack (spacing: 30) {
                Text("Joining existing Get It Done…")
                    .font(.custom("Georgia", fixedSize: 19))
                    .italic()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(1.2)
            }
        }
    }
}

#Preview {
    ExistingGroupLoadingView()
}
