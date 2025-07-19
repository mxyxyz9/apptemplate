import SwiftUI

extension View {
    func cardContainer() -> some View {
        self
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            .contentShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
    }
    
    // Add depth effect with shadow and slight scale
    func depthEffect(isPressed: Bool = false) -> some View {
        self
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .shadow(color: .black.opacity(0.1), radius: isPressed ? 2 : 5, x: 0, y: isPressed ? 1 : 3)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
    }
}

struct PillButtonStyle: ButtonStyle {
    var color: Color = .blue
    var textColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTheme.Typography.headline.weight(.semibold))
            .padding(.vertical, AppTheme.Spacing.elementSpacing)
            .padding(.horizontal, AppTheme.Spacing.padding)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                    .fill(color)
            )
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: configuration.isPressed ? 2 : 4)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}



// Card styles for different purposes
struct CardStyle: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    var cornerRadius: CGFloat = AppTheme.cornerRadiusSmall
    
    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color.white)
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

// Glassmorphic effect for UI elements
public struct GlassmorphicBackground: ViewModifier {
    public var cornerRadius: CGFloat = AppTheme.cornerRadius
    var opacity: Double = 0.7
    
    public func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(Color.blue.opacity(opacity))
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
            )
    }
}