import SwiftUI

struct AlertView: View {
    @State private var alertSent = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.08)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                Image(systemName: "location.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
                    .foregroundColor(.purple)
                    .shadow(color: .purple.opacity(0.25), radius: 8)

                Text("Need Help?")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Tap the button below to send an emergency alert and share your current location with trusted contacts.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 24)

                Button(action: {
                    alertSent = true
                }) {
                    Text("Send Emergency Alert")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(18)
                }
                .padding(.horizontal, 24)

                if alertSent {
                    VStack(spacing: 8) {
                        Text("Emergency alert sent.")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)

                        Text("Your trusted contacts have been notified with your live location.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 24)
                    .transition(.opacity)
                }

                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AlertView()
    }
}
