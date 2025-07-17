
import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var theme: ThemeManager
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In")
                .font(theme.fonts.headline)
                .foregroundColor(theme.colors.text)
            CustomTextField(placeholder: "Email", text: $email)
            CustomTextField(placeholder: "Password", text: $password, isSecure: true)
            Button("Sign In") {
                authManager.signIn()
            }
            .buttonStyle(PrimaryButtonStyle())
            Spacer()
        }
        .padding()
        .background(theme.colors.background)
    }
}
