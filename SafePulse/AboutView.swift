import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                Text("About SafePulse")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .padding(.bottom, 4)

                Text("SafePulse is a personal safety app designed to help users feel safer when they are alone or in risky situations. The app allows users to quickly send alerts and share their live location with trusted emergency contacts.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineSpacing(4)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Purpose")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    Text("The purpose of SafePulse is to provide a quick and simple way for users to ask for help during emergencies. It is especially useful for people walking alone, traveling alone, or feeling unsafe in unfamiliar places.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Target Audience")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    Text("SafePulse is mainly designed for women, young adults, college students, and anyone who wants extra safety support while going out alone.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Key Features")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    VStack(alignment: .leading, spacing: 8) {
                        Label("Quick emergency alert", systemImage: "exclamationmark.triangle.fill")
                        Label("Trusted contacts list", systemImage: "person.2.fill")
                        Label("Live location sharing", systemImage: "location.fill")
                    }
                    .font(.body)
                    .foregroundColor(.primary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
            .padding(.bottom, 30)
        }
        .background(Color.white)
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
        AboutView()
    }
}
