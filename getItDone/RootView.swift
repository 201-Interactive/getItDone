//
//  RootView.swift
//  getItDone
//
//  Created by Joseph Simeone on 4/11/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
//                NavigationStack {
                ContentView(showSignInView: $showSignInView)
//                }
            }
        }
        .onAppear() {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
//            NavigationStack {
            AuthenticationView(showSignInView: $showSignInView)
//            }
        })
    }
}

#Preview {
    RootView()
}
