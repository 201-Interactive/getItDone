//
//  UserManager.swift
//  getItDone
//
//  Created by Jack Graziani on 6/13/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TTUser: Codable {
    let userId: String
    let email : String?
    let photoUrl: String?
    let dateCreated: Date?
}

final class UserManager {
    
    private let userCollection: CollectionReference = Firestore.firestore().collection("users")

    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    
    static let shared = UserManager()
    private init() { }
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData: [String:Any] = [
            "user_id" : auth.uid,
            "date_created" : Timestamp(),
            
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        
        if let photoUrl = auth.photoUrl {
            userData["photo_url"] = photoUrl
        }
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    
    }
    
    func getUser(userId: String) async throws -> TTUser {
        try await userDocument(userId: userId).getDocument(as: TTUser.self)
        

        
    }

    
}
