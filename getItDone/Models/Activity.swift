//
//  Activity.swift
//  getItDone
//
//  Created by Jack Graziani on 7/7/24.
//

import Foundation

struct Activity: Codable {
    let name: String
    let isDone: Bool
    let userId: String
    let notificationsEnabled: Bool?
    let creationDate: Date
    
    init(name: String, isDone: Bool, userId: String, notificationsEnabled: Bool? = nil, creationDate: Date) {
        self.name = name
        self.isDone = isDone
        self.userId = userId
        self.notificationsEnabled = notificationsEnabled
        self.creationDate = creationDate

    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case isDone = "complete"
        case userId = "user_id"
        case notificationsEnabled = "notifications_enabled"
        case creationDate = "creation_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.isDone = try container.decode(Bool.self, forKey: .isDone)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.notificationsEnabled = try container.decodeIfPresent(Bool.self, forKey: .notificationsEnabled)
        self.creationDate = try container.decode(Date.self, forKey: .creationDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isDone, forKey: .isDone)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
        try container.encode(self.creationDate, forKey: .creationDate)

    }
}
