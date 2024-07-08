//
//  ProfileView.swift
//  getItDone
//
//  Created by Jack Graziani on 6/13/24.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: TTUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    
}
struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    if let user = viewModel.user {
                        Text("UserId: \(user.userId)")
                    Text("email: \(user.email ?? "no email broke ahh")")
                    Text("photo: \(user.photoUrl ?? "no PFP lookin ahh")")
                        Text("date created: \(user.dateCreated?.description ?? "how do you not have a create date??")")


                    }
                    
                }
                .task {
                    try? await viewModel.loadCurrentUser()
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
