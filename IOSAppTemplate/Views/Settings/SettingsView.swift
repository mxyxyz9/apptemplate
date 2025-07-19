
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var settingsManager = SettingsManager()
    @State private var showingSignOutAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Preferences") {
                    Toggle("Enable Notifications", isOn: $settingsManager.userSettings.notificationsEnabled)
                        .onChange(of: settingsManager.userSettings.notificationsEnabled) { _ in
                            settingsManager.toggleNotifications()
                        }
                    
                    Toggle("Dark Mode", isOn: $settingsManager.userSettings.darkModeEnabled)
                        .onChange(of: settingsManager.userSettings.darkModeEnabled) { _ in
                            settingsManager.toggleDarkMode()
                            appCoordinator.toggleColorScheme()
                        }
                    
                    Toggle("Biometric Authentication", isOn: $settingsManager.userSettings.biometricAuthEnabled)
                        .onChange(of: settingsManager.userSettings.biometricAuthEnabled) { _ in
                            settingsManager.toggleBiometricAuth()
                        }
                }
                
                Section("Privacy") {
                    Toggle("Share Profile Data", isOn: $settingsManager.userSettings.privacySettings.shareProfileData)
                        .onChange(of: settingsManager.userSettings.privacySettings.shareProfileData) { newValue in
                            var privacy = settingsManager.userSettings.privacySettings
                            privacy.shareProfileData = newValue
                            settingsManager.updatePrivacySettings(privacy)
                        }
                    
                    Toggle("Share Activity Data", isOn: $settingsManager.userSettings.privacySettings.shareActivityData)
                        .onChange(of: settingsManager.userSettings.privacySettings.shareActivityData) { newValue in
                            var privacy = settingsManager.userSettings.privacySettings
                            privacy.shareActivityData = newValue
                            settingsManager.updatePrivacySettings(privacy)
                        }
                }
                
                Section("Account") {
                    Button("Reset Settings") {
                        settingsManager.resetToDefaults()
                    }
                    
                    Button("Sign Out") {
                        showingSignOutAlert = true
                    }
                    .foregroundColor(.red)
                }
                
                Section("About") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Build")
                        Spacer()
                        Text("1")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .alert("Sign Out", isPresented: $showingSignOutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    appCoordinator.signOut()
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AppCoordinator())
}
