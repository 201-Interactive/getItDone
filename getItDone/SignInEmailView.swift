//
//  SignInEmailView.swift
//  getItDone
//
//  Created by Joseph Simeone on 4/11/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Missing email or password")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Missing email or password")
            return
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("email", text: $viewModel.email)
                .padding()
                .background(.gray.opacity(0.4))
                .clipShape(.buttonBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField("password", text: $viewModel.password)
                .padding()
                .background(.gray.opacity(0.4))
                .clipShape(.buttonBorder)
            
            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print("Error")
                    }
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print("Error")
                    }
                }
            } label: {
                Text("Sign in with email")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(.buttonBorder)
            }
        }
        .padding()
        .navigationTitle("Sign In With Email")
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
    }
}
