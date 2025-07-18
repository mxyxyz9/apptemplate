
import SwiftUI
import DesignSystem
import Components
import Views.Onboarding
import Views.Auth
import Views.Main

struct AppCoordinator: View {
    @StateObject private var authManager = AuthManager()
    @StateObject private var userManager = UserManager()
    @StateObject private var settingsManager = SettingsManager()
    @EnvironmentObject var theme: AppTheme

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
        .environmentObject(theme)
    }
}
