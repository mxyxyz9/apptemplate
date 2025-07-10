import SwiftUI

public struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isRefreshing = false
    @State private var selectedTab = 0
    
    public var body: some View {
        ScrollView {
            RefreshableView(isRefreshing: $isRefreshing) {
                // Simulate refresh
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isRefreshing = false
                }
            }
            
            VStack(spacing: AppTheme.Spacing.padding) {
                FeaturedCarouselSection(viewModel: viewModel, selectedTab: $selectedTab)
                QuickActionsSection(viewModel: viewModel)
                
                ContentSectionsView(viewModel: viewModel)
            }
            .padding(.vertical, AppTheme.Spacing.padding)
            .animation(.easeInOut(duration: 0.3), value: viewModel.contentSections)
        }
        .navigationTitle("Home")
        .font(AppTheme.Typography.body)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "bell.badge")
                        .foregroundColor(.primary)
                        .font(.system(size: 18, weight: .medium))
                }
            }
        }
        .refreshable {
            // Simulate refresh
            try? await Task.sleep(nanoseconds: 1_500_000_000)
        }
    }
}

// MARK: - Preview
public struct HomeScreen_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            NavigationStack {
                HomeScreen()
            }
            .preferredColorScheme(.light)
            .previewDisplayName("Light Mode")
            
            NavigationStack {
                HomeScreen()
            }
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
        }
        // Navigation styling updates
        .scrollIndicators(.hidden)
        .padding(.top, 1) // Prevent navigation bar content clipping
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Material.regularMaterial, for: .navigationBar)
        .navigationBarTitleDisplayMode(.large)
    }
}