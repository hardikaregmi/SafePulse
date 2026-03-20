import SwiftUI

struct HomeView: View {
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
                    }
                    .padding(.bottom, 8)

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
