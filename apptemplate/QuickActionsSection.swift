import SwiftUI

public struct QuickActionsSection: View {
    @ObservedObject var viewModel: HomeViewModel
    
    public var body: some View {
        HStack(spacing: AppTheme.Spacing.elementSpacing) {
            ForEach(viewModel.quickActions) { action in
                Button(action: {}) {
                    VStack(spacing: 8) {
                        Image(systemName: action.icon)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                        Text(action.title)
                            .font(AppTheme.Typography.caption)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, AppTheme.Spacing.elementSpacing)
                }
                .buttonStyle(GlassmorphicButtonStyle())
            }
        }
        .padding(.horizontal, AppTheme.Spacing.padding)
    }
}