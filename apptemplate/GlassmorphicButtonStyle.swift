import SwiftUI

public struct GlassmorphicButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) public var colorScheme
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, AppTheme.Spacing.elementSpacing)
            .padding(.horizontal, AppTheme.Spacing.padding)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                    .fill(Color.blue.opacity(0.8))
                    .overlay(
                        RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}