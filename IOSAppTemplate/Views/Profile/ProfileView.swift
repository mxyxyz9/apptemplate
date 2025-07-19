
import SwiftUI

struct ProfileView: View {
    @StateObject private var userManager = UserManager()
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile Header
                VStack(spacing: 16) {
                    // Profile Image
                    AsyncImage(url: URL(string: userManager.currentUser?.profileImageURL ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    
                    // User Info
                    VStack(spacing: 4) {
                        Text(userManager.currentUser?.username ?? "Username")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(userManager.currentUser?.email ?? "email@example.com")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // Edit Profile Button
                    Button("Edit Profile") {
                        showingEditProfile = true
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.top)
                
                // Profile Stats (Placeholder)
                HStack(spacing: 40) {
                    VStack {
                        Text("0")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Posts")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack {
                        Text("0")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Following")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack {
                        Text("0")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Followers")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView()
            }
        }
    }
}

// Placeholder Edit Profile View
struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Profile Information") {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Section("Profile Picture") {
                    Button("Change Profile Picture") {
                        // TODO: Implement image picker
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Save changes
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
