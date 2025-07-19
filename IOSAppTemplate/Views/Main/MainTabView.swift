
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(.primary)
    }
}

// Placeholder Home View
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("This is a placeholder for the home screen")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

// Placeholder Discover View
struct DiscoverView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Discover")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("This is a placeholder for the discover screen")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    MainTabView()
}
