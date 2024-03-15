import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    @State private var meals: Meals?
    
    var body: some View {
        if isLoading {
            LoadingView(labelText: "Fetching desserts...")
                .onAppear{
                    self.meals = fetchDesserts()
                    isLoading = false
                }
        } else if meals == nil {
                ErrorView()
        } else {
            DessertNavigation(meals: meals!)
        }
    }
}

#Preview {
    ContentView()
}
