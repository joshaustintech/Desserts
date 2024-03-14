import SwiftUI

struct DessertDetails: View {
    var mealId: String
    
    @State private var meal: Meal? // TODO: replace with `Meals`
    
    var body: some View {
        if (meal == nil) {
            LoadingView(labelText: "Loading details...")
        } else {
            VStack(spacing: 12) {
                AsyncImage(url: URL(string: meal!.strMealThumb)) { image in
                    image
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay {
                            Circle().stroke(Color.accentColor, lineWidth: 4)
                        }
                        .shadow(radius: 7)
                        .frame(width: 256, height: 256)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 256, height: 256)
                
                Text(meal!.strMeal)
                    .font(.largeTitle)
                
                HStack {
                    Text("Ingredients")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack {
                    ForEach(Array(meal!.ingredients.keys).sorted(by: <), id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(Color.accentColor)
                            Text(ingredient)
                                .frame(alignment: .leading)
                            if let measurement: String = meal!.ingredients[ingredient]! {
                                Text("[" + measurement + "]")
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                    }
                }
                if (meal!.strInstructions != nil)  {
                    Spacer()
                    HStack {
                        Text("Instructions")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Text(meal!.strInstructions!)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                Spacer()
            }.padding()
        }
    }
    
    func fetchData(mealId: String) {
        /*
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealId) else {
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
         */
    }
}

#Preview {
    DessertDetails(mealId: "53049")
}
