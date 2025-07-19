import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @State private var currentPage = 0
    private let totalPages = 3
    
    var body: some View {
        VStack {
            // Skip Button
            HStack {
                Spacer()
                Button("Skip") {
                    appCoordinator.completeOnboarding()
                }
                .foregroundColor(.primary)
                .padding()
            }
            
            // Page Content
            TabView(selection: $currentPage) {
                OnboardingPageView(
                    title: "Welcome",
                    subtitle: "Welcome to your new iOS app template",
                    description: "A modern, minimalistic template built with SwiftUI",
                    systemImage: "hand.wave.fill"
                )
                .tag(0)
                
                OnboardingPageView(
                    title: "Features",
                    subtitle: "Everything you need to get started",
                    description: "Authentication, profile management, settings, and more",
                    systemImage: "star.fill"
                )
                .tag(1)
                
                OnboardingPageView(
                    title: "Get Started",
                    subtitle: "Ready to begin your journey?",
                    description: "Create your account and start exploring",
                    systemImage: "rocket.fill"
                )
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Page Indicators
            HStack(spacing: 8) {
                ForEach(0..<totalPages, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.primary : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            .padding()
            
            // Navigation Buttons
            HStack {
                if currentPage > 0 {
                    Button("Previous") {
                        withAnimation {
                            currentPage -= 1
                        }
                    }
                    .foregroundColor(.primary)
                }
                
                Spacer()
                
                if currentPage < totalPages - 1 {
                    Button("Next") {
                        withAnimation {
                            currentPage += 1
                        }
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    Button("Get Started") {
                        appCoordinator.completeOnboarding()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
    }
}

struct OnboardingPageView: View {
    let title: String
    let subtitle: String
    let description: String
    let systemImage: String
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: systemImage)
                .font(.system(size: 80))
                .foregroundColor(.primary)
            
            VStack(spacing: 16) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(subtitle)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppCoordinator())
}