import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("userName") private var userName = ""
    @AppStorage("userEmail") private var userEmail = ""

    @State private var isCreatingAccount = false
    @State private var nameInput = ""
    @State private var emailInput = ""
    @State private var passwordInput = ""

    var formIsValid: Bool {
        if isCreatingAccount {
            return !nameInput.trimmingCharacters(in: .whitespaces).isEmpty &&
                   !emailInput.trimmingCharacters(in: .whitespaces).isEmpty &&
                   !passwordInput.trimmingCharacters(in: .whitespaces).isEmpty
        } else {
            return !emailInput.trimmingCharacters(in: .whitespaces).isEmpty &&
                   !passwordInput.trimmingCharacters(in: .whitespaces).isEmpty
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.14)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                Image("SafePulse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 135)
                    .shadow(color: .purple.opacity(0.25), radius: 12)

                VStack(spacing: 8) {
                    Text(isCreatingAccount ? "Create Account" : "Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    Text(isCreatingAccount ? "Set up your SafePulse profile." : "Log in to continue your safety experience.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 14) {
                    if isCreatingAccount {
                        TextField("Full name", text: $nameInput)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(14)
                    }

                    TextField("Email", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)

                    SecureField("Password", text: $passwordInput)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)

                    Button(action: {
                        if formIsValid {
                            if isCreatingAccount {
                                userName = nameInput
                            } else {
                                userName = emailInput.components(separatedBy: "@").first ?? "User"
                            }

                            userEmail = emailInput
                            isLoggedIn = true
                        }
                    }) {
                        Text(isCreatingAccount ? "Create Account" : "Log In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(formIsValid ? Color.purple : Color.gray.opacity(0.5))
                            .cornerRadius(16)
                    }
                    .disabled(!formIsValid)

                    Button(action: {
                        isCreatingAccount.toggle()
                        nameInput = ""
                        emailInput = ""
                        passwordInput = ""
                    }) {
                        Text(isCreatingAccount ? "Already have an account? Log In" : "New user? Create Account")
                            .font(.subheadline)
                            .foregroundColor(.purple)
                    }
                }
                .padding(22)
                .background(Color.white.opacity(0.78))
                .cornerRadius(24)
                .shadow(color: .black.opacity(0.08), radius: 8)
                .padding(.horizontal, 24)

                Text("Prototype only: account information is stored locally.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
