import Foundation


struct UserSettings: Codable {
    var notificationsEnabled: Bool

    var darkModeEnabled: Bool
    var biometricAuthEnabled: Bool
    var privacySettings: PrivacySettings
    
    init() {
        self.notificationsEnabled = true
        self.darkModeEnabled = false
        self.biometricAuthEnabled = false
        self.privacySettings = PrivacySettings()
    }
}

struct PrivacySettings: Codable {
    var shareProfileData: Bool
    var shareActivityData: Bool
    
    init() {
        self.shareProfileData = false
        self.shareActivityData = false
    }
}

// MARK: - Authentication State
enum AuthState {
    case onboarding
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