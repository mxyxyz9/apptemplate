
import SwiftUI

public struct SettingsScreen: View {
    @StateObject var viewModel = SettingsViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        Form {
            Section(header: Text("Profile")) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text(viewModel.profile.name)
                            .font(AppTheme.Typography.headline)
                        Text(viewModel.profile.email)
                            .font(AppTheme.Typography.body)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Section(header: Text("Preferences")) {
                Toggle(isOn: $viewModel.appSettings.notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                Picker("Theme", selection: $viewModel.appSettings.theme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue.capitalized).tag(theme)
                    }
                }
            }
            
            Section(header: Text("About")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text(viewModel.appInfo.version)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
