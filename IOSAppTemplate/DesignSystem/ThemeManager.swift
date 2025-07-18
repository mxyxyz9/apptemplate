import SwiftUI

public struct AppTheme {
    static let cornerRadius: CGFloat = 16
    static let cornerRadiusSmall: CGFloat = 8
    static let cornerRadiusLarge: CGFloat = 24
    
    public struct Typography {
        static let title: Font = .system(size: 28, weight: .bold, design: .rounded)
        static let headline: Font = .system(size: 20, weight: .semibold, design: .rounded)
        static let body: Font = .system(size: 16, weight: .medium, design: .rounded)
        static let caption: Font = .system(size: 12, weight: .bold, design: .rounded)
    }
    
    public struct Spacing {
        static let padding: CGFloat = 16
        public static let elementSpacing: CGFloat = 12
    }
}

public struct RoundedCorner: Shape {
    public var radius: CGFloat = AppTheme.cornerRadius
    var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        Path(UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath)
    }
}