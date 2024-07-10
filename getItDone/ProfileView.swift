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
    
//    @Binding var showSignInView: Bool
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @State private  var myGroupsExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    Section {
                        if let user = viewModel.user {
                            Text("UserId: \(user.userId)")
                            Text("email: \(user.email ?? "no email broke ahh")")
                            Text("photo: \(user.photoUrl ?? "no PFP lookin ahh")")
                            Text("date created: \(user.dateCreated?.description ?? "how do you not have a create date??")")
                        }
                    } header : {Text("User info")}
                    
                    Section {
                        DisclosureGroup( // TODO: this will not be a disclosure group
                            isExpanded: $myGroupsExpanded,
                            content: {
                                Text("group 1")
                                Text("group 2")
                                Text("group 3")
                            },
                            label: { Text("My Groups  \(Image(systemName: "folder"))") }
                        )
                    } header: { Text("My groups") }
                }
                .task {
                    try? await viewModel.loadCurrentUser()
                }
            }
            .navigationTitle("Profile")
            .navigationBarItems(trailing: Button("\(Image(systemName: "gear"))") {})
            // TODO: lead this splish to settings view
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
