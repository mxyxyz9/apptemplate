
import Foundation

class UserManager: ObservableObject {
    @Published var user: User?

    func loadUser() {
        // Mock user data
        self.user = User(id: UUID().uuidString, email: "test@example.com", username: "testuser", createdAt: Date(), lastLogin: Date())
    }

    func updateUser(email: String) {
        self.user = User(id: UUID().uuidString, email: email, username: self.user?.username ?? "testuser", createdAt: self.user?.createdAt ?? Date(), lastLogin: Date())
    }
}
