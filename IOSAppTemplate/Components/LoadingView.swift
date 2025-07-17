
import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var theme: ThemeManager

    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
            Text("Loading...")
                .font(theme.fonts.body)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colors.background.opacity(0.8))
    }
}
