import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Unable to load.")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Image(systemName: "circle.slash")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.red)
            Text("Please check your Internet connection before trying again.")
                .font(.footnote)
                .foregroundStyle(.placeholder)
        }
    }
}

#Preview {
    ErrorView()
}
