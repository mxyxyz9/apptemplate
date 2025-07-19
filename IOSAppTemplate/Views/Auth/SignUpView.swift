
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @Binding var showSignUp: Bool
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var username = ""
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // App Logo/Title
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            // Username Field
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            // Email Field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            // Password Field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Confirm Password Field
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Sign Up Button
            Button(action: signUp) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Sign Up")
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.primary)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isLoading)
            
            Spacer()
            
            // Sign In Link
            HStack {
                Text("Already have an account?")
                Button("Sign In") {
                    showSignUp = false
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
    
    private func signUp() {
        guard password == confirmPassword else {
            errorMessage = "Passwords don't match"
            showingAlert = true
            return
        }
        
        isLoading = true
        appCoordinator.signUp(email: email, password: password, username: username) { success, error in
            isLoading = false
            if !success {
                errorMessage = error ?? "Sign up failed"
                showingAlert = true
            }
        }
    }
}

#Preview {
    NavigationView {
        SignUpView(showSignUp: .constant(true))
            .environmentObject(AppCoordinator())
    }
}
