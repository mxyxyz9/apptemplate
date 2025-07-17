
import SwiftUI

struct AppCoordinator: View {
    @StateObject private var authManager = AuthManager()
    @StateObject private var userManager = UserManager()
    @StateObject private var settingsManager = SettingsManager()
    @StateObject private var themeManager = ThemeManager()

    var body: some View {
        Group {
            switch authManager.authState {
            case .onboarding:
                OnboardingView()
            case .unauthenticated:
                AuthView()
            case .authenticated:
                MainTabView()
            }
        }
        .environmentObject(authManager)
        .environmentObject(userManager)
        .environmentObject(settingsManager)
        .environmentObject(themeManager)
    }
}
