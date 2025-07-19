
import SwiftUI

struct PasswordResetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var isLoading = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isSuccess = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Text("Enter your email address and we'll send you a link to reset your password.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            // Email Field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            // Send Reset Link Button
            Button(action: sendResetLink) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Send Reset Link")
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.primary)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isLoading || email.isEmpty)
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .alert(isSuccess ? "Success" : "Error", isPresented: $showingAlert) {
            Button("OK") {
                if isSuccess {
                    dismiss()
                }
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func sendResetLink() {
        isLoading = true
        
        // Mock password reset - in a real app, this would call a service
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
            
            if email.contains("@") {
                isSuccess = true
                alertMessage = "Password reset instructions have been sent to your email."
            } else {
                isSuccess = false
                alertMessage = "Please enter a valid email address."
            }
            
            showingAlert = true
        }
    }
}

#Preview {
    NavigationView {
        PasswordResetView()
    }
}
