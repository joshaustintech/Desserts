import SwiftUI

struct DessertDetails: View {
    var mealId: String
    
    @State private var fetchState: MealsFetchState = .loading
    
    var body: some View {
        switch fetchState {
        case .loading:
            LoadingView(labelText: "Loading details...")
                .onAppear {
                    fetchDessert()
                }
        case .invalid:
            ErrorView()
        case .success(let meals):
            ScrollView {
                VStack(spacing: 12) {
                    AsyncImage(url: URL(string: meals.meals[0].strMealThumb)) { image in
                        image
                            .resizable()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 7)
                            .frame(width: 256, height: 256)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 256, height: 256)
                    
                    Text(meals.meals[0].strMeal)
                        .font(.largeTitle)
                    
                    HStack {
                        Text("Ingredients")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack {
                        ForEach(Array(meals.meals[0].ingredients.keys).sorted(by: <), id: \.self) { ingredient in
                            HStack {
                                Image(systemName: "arrow.right")
                                    .foregroundStyle(Color.accentColor)
                                Text(ingredient)
                                    .frame(alignment: .leading)
                                if let measurement: String = meals.meals[0].ingredients[ingredient]! {
                                    Text("[" + measurement + "]")
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                            }
                        }
                    }
                    if (meals.meals[0].strInstructions != nil)  {
                        Spacer()
                        HStack {
                            Text("Instructions")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack {
                            Text(meals.meals[0].strInstructions!)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
    }
    
    func fetchDessert() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + self.mealId) else {
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
    DessertDetails(mealId: "53049")
}
