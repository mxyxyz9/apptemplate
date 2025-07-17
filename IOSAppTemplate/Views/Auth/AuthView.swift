
import SwiftUI

struct AuthView: View {
    @EnvironmentObject var theme: ThemeManager

    var body: some View {
        TabView {
            SignInView()
                .tabItem {
                    Label("Sign In", systemImage: "person.fill")
                }
            SignUpView()
                .tabItem {
                    Label("Sign Up", systemImage: "person.badge.plus")
                }
        }
        .accentColor(theme.colors.accent)
    }
}
