import SwiftUI

struct LoadingView: View {
    
    var labelText: String
    
    var body: some View {
        HStack(spacing: 12) {
            ProgressView()
            Text(labelText)
                .bold()
        }
    }
}

#Preview {
    LoadingView(labelText: "Fetching desserts...")
}
