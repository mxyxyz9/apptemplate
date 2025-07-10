
import SwiftUI
import Combine

public struct SearchResult: Identifiable, Equatable {
    public let id = UUID()
    let title: String
    let subtitle: String
    public let icon: String
}

public class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [SearchResult] = []
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.performSearch(query: searchText)
            }
            .store(in: &cancellables)
    }
    
    func performSearch(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        
        isLoading = true
        
        // Simulate network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
            self.searchResults = [
                SearchResult(title: "Result 1", subtitle: "Subtitle for result 1", icon: "star.fill"),
                SearchResult(title: "Result 2", subtitle: "Subtitle for result 2", icon: "heart.fill"),
                SearchResult(title: "Result 3", subtitle: "Subtitle for result 3", icon: "pin.fill")
            ]
        }
    }
}
