
import SwiftUI

struct CustomTextField: View {
    @EnvironmentObject var theme: ThemeManager
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .font(theme.fonts.body)
        .padding()
        .background(theme.colors.secondaryButton)
        .cornerRadius(8)
        .autocapitalization(.none)
    }
}
