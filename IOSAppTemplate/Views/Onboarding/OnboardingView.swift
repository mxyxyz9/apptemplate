
import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        TabView {
            OnboardingPageView(
                imageName: "figure.wave",
                title: "Welcome to the App",
                description: "This is a template app to get you started with your new project."
            )
            OnboardingPageView(
                imageName: "hand.draw",
                title: "Modern Design",
                description: "A clean and minimalistic design system to build upon."
            )
            OnboardingPageView(
                imageName: "gearshape",
                title: "Ready to Go",
                description: "Start building your app with all the basics already set up.",
                isLastPage: true,
                onComplete: {
                    authManager.completeOnboarding()
                }
            )
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingPageView: View {
    @EnvironmentObject var theme: ThemeManager
    var imageName: String
    var title: String
    var description: String
    var isLastPage: Bool = false
    var onComplete: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .foregroundColor(theme.colors.accent)
            Text(title)
                .font(theme.fonts.headline)
                .foregroundColor(theme.colors.text)
            Text(description)
                .font(theme.fonts.body)
                .foregroundColor(theme.colors.text)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            if isLastPage {
                Button("Get Started") {
                    onComplete?()
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top)
            }
        }
        .padding()
    }
}
