
import Foundation

class AuthManager: ObservableObject {
    @Published var authState: AuthState = .onboarding

    func completeOnboarding() {
        authState = .unauthenticated
    }

    func signIn() {
        // Mock sign-in logic
        authState = .authenticated
    }

    func signOut() {
        authState = .unauthenticated
    }
}
