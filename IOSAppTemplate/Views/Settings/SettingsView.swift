
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var theme: ThemeManager

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $settingsManager.userSettings.notificationsEnabled) {
                        Text("Enable Notifications")
                    }
                    .toggleStyle(CustomToggleStyle())
                }

                Section {
                    Button("Sign Out") {
                        authManager.signOut()
                    }
                    .foregroundColor(theme.colors.text)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
