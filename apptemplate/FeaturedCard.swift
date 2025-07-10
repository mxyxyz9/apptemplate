import SwiftUI

public struct FeaturedCard: View {
    public let item: FeaturedItem
    
    public var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [item.color, item.color.opacity(0.7)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(AppTheme.cornerRadius)
            
            // Icon overlay
            Image(systemName: item.image)
                .font(.system(size: 120))
                .foregroundColor(.white.opacity(0.15))
                .offset(x: 100, y: -40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(AppTheme.Typography.headline.weight(.bold))
                    .foregroundColor(.white)
                
                Text(item.subtitle)
                    .font(AppTheme.Typography.body)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(AppTheme.Spacing.padding)
        }
        .frame(height: 180)
        .cardContainer()
    }
}