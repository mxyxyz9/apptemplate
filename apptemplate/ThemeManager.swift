import SwiftUI

public struct AppTheme {
    static let cornerRadius: CGFloat = 16
    static let cornerRadiusSmall: CGFloat = 8
    static let cornerRadiusLarge: CGFloat = 24
    
    public struct Typography {
        public static let title: Font = .system(size: 28, weight: .bold, design: .rounded)
        public static let headline: Font = .system(size: 20, weight: .semibold, design: .rounded)
        public static let body: Font = .system(size: 16, weight: .medium, design: .rounded)
        public static let caption: Font = .system(size: 12, weight: .bold, design: .rounded)
    }
    
    public struct Spacing {
        public static let padding: CGFloat = 16
        public static let elementSpacing: CGFloat = 12
    }
}

