import Foundation

// MARK: - Authentication State
enum AuthState {
    case authenticated
    case unauthenticated
    case inProgress
    case error(String)
}

// MARK: - Onboarding State
struct OnboardingState {
    var hasCompletedOnboarding: Bool
    var currentPage: Int
    var totalPages: Int
    
    init() {
        self.hasCompletedOnboarding = false
        self.currentPage = 0
        self.totalPages = 3 // Default number of onboarding pages
    }
}