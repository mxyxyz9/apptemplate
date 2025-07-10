import SwiftUI
import Combine

// MARK: - Models
struct FeaturedItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    public let image: String
    public let color: Color
}

public public struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    public let icon: String
    public let action: () -> Void
}

public struct ContentItem: Identifiable {
    let id = UUID()
    let title: String
    public let value: String
    public let icon: String
}

public struct ContentSection: Identifiable, Equatable {
    let id = UUID()
    let title: String
    public let items: [ContentItem]
}

// MARK: - ViewModel
public class HomeViewModel: ObservableObject {
    @Published var featuredItems: [FeaturedItem] = [
        FeaturedItem(title: "Summer Collection", subtitle: "New arrivals for the season", image: "sun.max.fill", color: .orange),
        FeaturedItem(title: "Limited Edition", subtitle: "While supplies last", image: "star.fill", color: .purple),
        FeaturedItem(title: "Member Exclusive", subtitle: "Special offers for members", image: "person.fill", color: .blue)
    ]
    
    @Published var quickActions: [QuickAction] = [
        QuickAction(title: "Favorites", icon: "heart.fill", action: {}),
        QuickAction(title: "Trending", icon: "chart.line.uptrend.xyaxis", action: {}),
        QuickAction(title: "Categories", icon: "square.grid.2x2.fill", action: {})
    ]
    
    @Published var contentSections: [ContentSection] = [
        ContentSection(title: "Today's Stats", items: [
            ContentItem(title: "Steps", value: "8,546", icon: "figure.walk"),
            ContentItem(title: "Calories", value: "756", icon: "flame.fill"),
            ContentItem(title: "Distance", value: "3.2 mi", icon: "map.fill"),
            ContentItem(title: "Heart Rate", value: "72 bpm", icon: "heart.fill")
        ]),
        ContentSection(title: "Recent Activity", items: [
            ContentItem(title: "Workouts", value: "3 this week", icon: "dumbbell.fill"),
            ContentItem(title: "Sleep", value: "7.5 hrs", icon: "bed.double.fill")
        ])
    ]
}