import SwiftUI

public struct SectionHeader: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(AppTheme.Typography.headline.weight(.bold))
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, AppTheme.Spacing.elementSpacing)
    }
}