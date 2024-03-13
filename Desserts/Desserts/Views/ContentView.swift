import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    @State private var isInvalid = false
    @State private var meals: Meals?
    
    var body: some View {
        if isLoading {
            LoadingView(labelText: "Fetching desserts...")
                .onAppear{
                    fetchData()
                }
        } else {
            if (isInvalid || meals == nil) {
                ErrorView()
            } else {
                DessertNavigation(meals: meals!)
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("probably invalid url")
            isLoading = false
            isInvalid = true
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                isLoading = false
                isInvalid = true
                print("not even sure what this does")
                return
            }
            do {
                let meals = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.meals = meals
                    isLoading = false
                }
            } catch {
                isLoading = false
                isInvalid = true
                print(error.localizedDescription)
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
