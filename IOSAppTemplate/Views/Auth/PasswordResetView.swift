
import SwiftUI

struct PasswordResetView: View {
    @EnvironmentObject var theme: ThemeManager
    @State private var email = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Reset Password")
                .font(theme.fonts.headline)
                .foregroundColor(theme.colors.text)
            CustomTextField(placeholder: "Email", text: $email)
            Button("Send Reset Link") {
                // Mock password reset
            }
            .buttonStyle(PrimaryButtonStyle())
            Spacer()
        }
        .padding()
        .background(theme.colors.background)
    }
}
