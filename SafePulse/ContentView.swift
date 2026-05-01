import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        Group {
            if isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        .animation(.easeInOut, value: isLoggedIn)
    }
}

#Preview {
    ContentView()
}
