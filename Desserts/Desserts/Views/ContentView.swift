import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    var body: some View {
        if isLoading {
            LoadingView()
        } else {
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
