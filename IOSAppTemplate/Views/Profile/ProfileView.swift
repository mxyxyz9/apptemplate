
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var theme: ThemeManager

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(theme.colors.accent)
            Text(userManager.user?.email ?? "")
                .font(theme.fonts.headline)
                .foregroundColor(theme.colors.text)
            Spacer()
        }
        .padding()
        .background(theme.colors.background)
        .onAppear {
            userManager.loadUser()
        }
    }
}
