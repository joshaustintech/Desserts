import SwiftUI

struct LoadingView: View {
    
    @State private var isAnimating = false
    var labelText: String
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(Color.accentColor, lineWidth: 4)
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .onAppear() {
                        withAnimation(Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                                self.isAnimating = true
                            }
                    }
            }
            Text(labelText)
                .bold()
        }
    }
}

#Preview {
    LoadingView(labelText: "Fetching desserts...")
}
