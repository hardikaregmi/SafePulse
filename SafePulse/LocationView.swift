import SwiftUI
import MapKit

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.08)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 22) {
                Text("Live Location")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .padding(.top, 10)

                Text("Your current location can be viewed and refreshed here for emergency sharing.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 24)

                Map(coordinateRegion: $locationManager.region)
                    .frame(height: 340)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.08), radius: 5)
                    .padding(.horizontal, 24)

                Text("Your live location is active.")
                    .font(.headline)
                    .foregroundColor(.green)

                Button(action: {
                    locationManager.requestLocation()
                }) {
                    Text("Refresh Location")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(18)
                }
                .padding(.horizontal, 24)

                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
    }
}

#Preview {
    NavigationStack {
        LocationView()
    }
}
