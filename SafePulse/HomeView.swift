import SwiftUI

struct HomeView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("userName") private var userName = ""

    // Extract clean first name
    var firstName: String {
        let cleaned = userName.trimmingCharacters(in: .whitespaces)

        let beforeAt = cleaned.components(separatedBy: "@").first ?? cleaned

        let firstPart = beforeAt
            .components(separatedBy: CharacterSet(charactersIn: ". "))
            .first ?? beforeAt

        return firstPart.capitalized
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.white, Color.purple.opacity(0.12)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 18) {
                    Spacer()

                    // Logo + Title
                    VStack(spacing: 14) {
                        Image("SafePulse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 185, height: 185)
                            .shadow(color: .purple.opacity(0.25), radius: 12)

                        Text("SafePulse")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)

                        Text("Your safety, one tap away.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)

                        if !userName.isEmpty {
                            Text("Hi, \(firstName) 👋")
                                .font(.headline)
                                .foregroundColor(.purple)
                        }
                    }
                    .padding(.bottom, 8)

                    // Buttons
                    VStack(spacing: 14) {

                        NavigationLink(destination: AlertView()) {
                            Label("Send Emergency Alert", systemImage: "exclamationmark.triangle.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(18)
                        }

                        NavigationLink(destination: ContactsView()) {
                            Label("Emergency Contacts", systemImage: "person.2.fill")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.08), radius: 4)
                        }

                        NavigationLink(destination: LocationView()) {
                            Label("Live Location", systemImage: "location.fill")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.08), radius: 4)
                        }

                        NavigationLink(destination: CheckInView()) {
                            Label("Emotional Check-In", systemImage: "heart.fill")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.08), radius: 4)
                        }

                        // ✅ NEW: Support Space
                        NavigationLink(destination: SupportSpaceView()) {
                            Label("Support Space", systemImage: "bubble.left.and.bubble.right.fill")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.08), radius: 4)
                        }

                        NavigationLink(destination: AboutView()) {
                            Label("About SafePulse", systemImage: "info.circle.fill")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.08), radius: 4)
                        }

                        // Logout
                        Button("Log Out") {
                            isLoggedIn = false
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
