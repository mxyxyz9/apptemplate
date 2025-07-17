
import Foundation

class UserManager: ObservableObject {
    @Published var user: User?

    func loadUser() {
        // Mock user data
        self.user = User(id: UUID(), email: "test@example.com")
    }

    func updateUser(email: String) {
        self.user = User(id: UUID(), email: email)
    }
}
