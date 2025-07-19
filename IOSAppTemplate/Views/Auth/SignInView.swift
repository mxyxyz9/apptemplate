
import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @Binding var showSignUp: Bool
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // App Logo/Title
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            // Email Field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            // Password Field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Sign In Button
            Button(action: signIn) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Sign In")
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.primary)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isLoading)
            
            // Forgot Password
            NavigationLink("Forgot Password?", destination: PasswordResetView())
                .foregroundColor(.primary)
            
            Spacer()
            
            // Sign Up Link
            HStack {
                Text("Don't have an account?")
                Button("Sign Up") {
                    showSignUp = true
                }
                .foregroundColor(.primary)
            }
        }
        .padding()
        .alert("Error", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func signIn() {
        isLoading = true
        appCoordinator.signIn(email: email, password: password) { success, error in
            isLoading = false
            if !success {
                errorMessage = error ?? "Sign in failed"
                showingAlert = true
            }
        }
    }
}

#Preview {
    NavigationView {
        SignInView(showSignUp: .constant(false))
            .environmentObject(AppCoordinator())
    }
}
