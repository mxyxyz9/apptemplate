
import SwiftUI

public struct SearchScreen: View {
    @StateObject var viewModel = SearchViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding(.horizontal, AppTheme.Spacing.padding)
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            } else if viewModel.searchResults.isEmpty {
                Text("No results found.")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                List(viewModel.searchResults) { result in
                    SearchResultRow(result: result)
                }
                .listStyle(.plain)
            }
            
            Spacer()
        }
        .navigationTitle("Search")
    }
}

public struct SearchBar: View {
    @Binding public var text: String
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search...", text: $text)
                .textFieldStyle(.plain)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(AppTheme.Spacing.elementSpacing)
        .background(Color(.systemGray6))
        .cornerRadius(AppTheme.cornerRadiusSmall)
    }
}

public struct SearchResultRow: View {
    public let result: SearchResult
    
    public var body: some View {
        HStack {
            Image(systemName: result.icon)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 40)
            
            VStack(alignment: .leading) {
                Text(result.title)
                    .font(AppTheme.Typography.headline)
                Text(result.subtitle)
                    .font(AppTheme.Typography.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, AppTheme.Spacing.elementSpacing)
    }
}
