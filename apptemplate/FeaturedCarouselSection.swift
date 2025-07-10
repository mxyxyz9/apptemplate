import SwiftUI

public struct FeaturedCarouselSection: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var selectedTab: Int
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Array(viewModel.featuredItems.enumerated()), id: \.element.id) { index, item in
                FeaturedCard(item: item)
                    .padding(.horizontal, AppTheme.Spacing.padding)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 220)
        .overlay(
            HStack(spacing: 8) {
                ForEach(0..<viewModel.featuredItems.count, id: \.self) { index in
                    Circle()
                        .fill(selectedTab == index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 8, height: 8)
                        .scaleEffect(selectedTab == index ? 1.2 : 1.0)
                        .animation(.spring(), value: selectedTab)
                }
            }
            .padding(8)
            .background(Color.black.opacity(0.3))
            .cornerRadius(20)
            .padding(8),
            alignment: .bottom
        )
    }
}