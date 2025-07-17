
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var theme: ThemeManager
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(theme.fonts.headline)
                .foregroundColor(theme.colors.text)
            CustomTextField(placeholder: "Email", text: $email)
            CustomTextField(placeholder: "Password", text: $password, isSecure: true)
            CustomTextField(placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
            Button("Sign Up") {
                // For this template, we'll just sign in
                authManager.signIn()
            }
            .buttonStyle(PrimaryButtonStyle())
            Spacer()
        }
        .padding()
        .background(theme.colors.background)
    }
}
