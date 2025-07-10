
import SwiftUI
import Combine

struct Profile {
    public var name: String
    public var email: String
}

public struct AppSettings {
    public var notificationsEnabled: Bool
    public var theme: Theme
}

public enum Theme: String, CaseIterable, Identifiable {
    case light, dark, system
    public var id: Self { self }
}

public struct AppInfo {
    public var version: String
}

public class SettingsViewModel: ObservableObject {
    @Published var profile = Profile(name: "John Doe", email: "john.doe@example.com")
    @Published var appSettings = AppSettings(notificationsEnabled: true, theme: .system)
    @Published var appInfo = AppInfo(version: "1.0.0")
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $appSettings
            .sink { [weak self] settings in
                self?.applyTheme(settings.theme)
            }
            .store(in: &cancellables)
    }
    
    func applyTheme(_ theme: Theme) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.overrideUserInterfaceStyle = {
            switch theme {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return .unspecified
            }
        }()
    }
}
