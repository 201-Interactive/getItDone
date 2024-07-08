//
//  SettingsView.swift
//  getItDone
//
//  Created by Joseph Simeone on 4/11/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    
    func loadAuthProviders() {
        if let providers = try? AuthenticationManager.shared.getProviders() {
            authProviders = providers
        }
    }
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist) //TODO: Custom errors
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws { //TODO: Make user enter their password again or this won't work.
        let email = ""
        try await AuthenticationManager.shared.updateEmail(newEmail: email)
    }
    
    func updatePassword() async throws { //TODO: Make user enter their password again or this won't work.
        let password = ""
        try await AuthenticationManager.shared.updatePassword(newPassword: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    @State private var joinExpanded: Bool = false
    
    var body: some View {
        List {
            Section {
                Button("Log out") {
                    Task {
                        do {
                            try viewModel.logOut()
                            showSignInView = true
                        } catch {
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                }
                if viewModel.authProviders.contains(.email) {
                    emailSection
                }
                // TODO: Add functions for email section defined in extension
            } header: { Text("Log out") }
            
        //––––––––––––––––––––––––if this page does work this is what I added———————————————–––––
        //–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
            
            Section {
                DisclosureGroup( // TODO: this will not be a disclosure group
                    isExpanded: $joinExpanded,
                    content: {
                        Text("scan qr code")
                    },
                    label: { Text("Scan QR Code  \(Image(systemName: "qrcode.viewfinder"))") }
                )
            } header: { Text("Join group") }

            
            Section {
                ShareLink(item: URL(string: "https://www.godaddy.com/")!) {
                    Text("Invite Others  \(Image(systemName: "square.and.arrow.up"))")
                }
            } header: { Text("Create New Group") } // header
            
        //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-–––
        //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-–––
            
        }
        .onAppear {
            viewModel.loadAuthProviders()
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(showSignInView: .constant(false))
}

extension SettingsView {
    private var emailSection: some View {
        Section {
            Button("Reset password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Change password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD CHANGED")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Change email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATE SENT")
                    } catch {
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email functions")
        }
    }
}
