import SwiftUI

public struct ContentSectionsView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    public var body: some View {
        ForEach(viewModel.contentSections) { section in
            VStack(alignment: .leading, spacing: AppTheme.Spacing.elementSpacing) {
                HStack {
                    Text(section.title)
                        .modifier(SectionHeader())
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("See All")
                            .font(AppTheme.Typography.caption)
                            .foregroundColor(.blue)
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(section.items) { item in
                        ContentCard(item: item)
                            .transition(.scale)
                    }
                }
            }
            .padding(.horizontal, AppTheme.Spacing.padding)
        }
    }
}