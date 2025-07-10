import SwiftUI

public struct ContentCard: View {
    public let item: ContentItem
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPressed = false
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // Icon with background
                ZStack {
                    Circle()
                        .fill(colorScheme == .dark ? Color.black.opacity(0.3) : Color.blue.opacity(0.1))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: item.icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                // Trend indicator
                Image(systemName: "arrow.up.right")
                    .font(.caption)
                    .foregroundColor(.green)
            }
            .padding(.bottom, 8)
            
            Spacer()
            
            Text(item.title)
                .font(AppTheme.Typography.caption.weight(.medium))
                .foregroundColor(.secondary)
                
            Text(item.value)
                .font(AppTheme.Typography.headline.weight(.bold))
                .foregroundColor(.primary)
        }
        .padding(AppTheme.Spacing.padding)
        .frame(height: 140)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color.white)
        .cornerRadius(AppTheme.cornerRadiusSmall)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .onTapGesture {
            withAnimation {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }
            }
        }
    }
}