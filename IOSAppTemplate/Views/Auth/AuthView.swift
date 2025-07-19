import SwiftUI

struct AuthenticationView: View {
    @State private var showSignUp = false
    
    var body: some View {
        NavigationView {
            if showSignUp {
                SignUpView(showSignUp: $showSignUp)
            } else {
                SignInView(showSignUp: $showSignUp)
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(AppCoordinator())
}