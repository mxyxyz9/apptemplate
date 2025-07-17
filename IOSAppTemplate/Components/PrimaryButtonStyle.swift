
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @EnvironmentObject var theme: ThemeManager

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(theme.fonts.body)
            .padding()
            .background(theme.colors.primaryButton)
            .foregroundColor(theme.colors.background)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}
