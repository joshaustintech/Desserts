import SwiftUI

struct ContentView: View {
    @State private var fetchState: MealsFetchState = .loading
    
    var body: some View {
        switch fetchState {
            case .loading:
                LoadingView(labelText: "Fetching desserts...")
                    .onAppear{
                        fetchDesserts()
                    }
            case .invalid:
                ErrorView()
            case .success(let meals):
                DessertNavigation(meals: meals)
        }
    }
    
    func fetchDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            self.fetchState = .invalid
            print("invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let meals: Meals? = try JSONDecoder().decode(Meals.self, from: data)
                        if meals != nil {
                            self.fetchState = .success(meals: meals!)
                        } else {
                            print("empty return")
                            self.fetchState = .invalid
                        }
                    } catch {
                        print(error.localizedDescription)
                        self.fetchState = .invalid
                    }
                }
            } else {
                print("did not get data")
                self.fetchState = .invalid
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
