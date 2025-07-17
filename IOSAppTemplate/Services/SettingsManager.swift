
import Foundation

class SettingsManager: ObservableObject {
    @Published var userSettings: UserSettings

    init() {
        self.userSettings = UserSettings(notificationsEnabled: false)
        loadSettings()
    }

    func loadSettings() {
        // Mock loading settings
    }

    func saveSettings() {
        // Mock saving settings
    }
}
