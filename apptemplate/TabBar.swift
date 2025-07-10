
import SwiftUI

public struct TabBar: View {
    @State private var selectedTab = 0
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeScreen()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            NavigationStack {
                SearchScreen()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(1)
            
            NavigationStack {
                SettingsScreen()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
            .tag(2)
        }
    }
}
