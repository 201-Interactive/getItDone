//
//  RegisterView.swift
//  getItDone
//
//  Created by Joseph Simeone on 4/2/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("enter your email", text: $email)
            TextField("enter a password", text: $password)
            Button("Create account") {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    guard let user = authResult?.user, error == nil else {
                        print("Create user account error: \(error!.localizedDescription)")
                        return
                    }
                    print("\(user.email!) was created!")
                }
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        
        VStack {
            TextField("enter your email", text: $email)
            TextField("enter a password", text: $password)
            Button("Login") {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    guard let user = authResult?.user, error == nil else {
                        print("Login user error: \(error!.localizedDescription)")
                        return
                    }
                    print("\(user.email!) logged in!")
                    if let user = authResult?.user {
                        debugPrint(user)
                    }
                }
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    RegisterView()
}
