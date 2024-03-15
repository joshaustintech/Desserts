import SwiftUI

struct DessertDetails: View {
    var mealId: String
    
    @State private var meal: Meal?
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            LoadingView(labelText: "Loading details...")
                .onAppear {
                    self.meal = fetchDessertById(mealId)
                    isLoading = false
                }
        } else if meal == nil {
            ErrorView()
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
}

#Preview {
    DessertDetails(mealId: "53049")
}
