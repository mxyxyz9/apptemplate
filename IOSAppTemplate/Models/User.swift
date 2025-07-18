import Foundation

struct User: Codable, Identifiable {
    let id: String
    var email: String
    var username: String
    var profileImageURL: String?
    let createdAt: Date
    var lastLogin: Date
    
    init(id: String, email: String, username: String, profileImageURL: String? = nil, createdAt: Date, lastLogin: Date) {
        self.id = id
        self.email = email
        self.username = username
        self.profileImageURL = profileImageURL
        self.createdAt = createdAt
        self.lastLogin = lastLogin
    }
}

// MARK: - Mock Data
extension User {
    static let mockUser = User(
        id: "mock-user-id",
        email: "user@example.com",
        username: "mockuser",
        profileImageURL: nil,
        createdAt: Date().addingTimeInterval(-86400 * 30), // 30 days ago
        lastLogin: Date()
    )
}