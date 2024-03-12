import SwiftUI

struct DessertNavigation: View {
    
    var meals: Meals
    
    var body: some View {
        VStack() {
            NavigationSplitView {
                List(meals.meals) { meal in
                    NavigationLink {
                        DessertDetails(meal: meal)
                    } label: {
                        Text(meal.strMeal)
                    }
                }
                .navigationTitle("Desserts")
            } detail: {
                Text("Select a dessert.")
            }
        }
        
        
    }
}

struct DessertStackView_Preview: PreviewProvider {
    static var meals: Meals = Meals(meals: [
        Meal(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Meal(idMeal: "52768", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"),
        Meal(idMeal: "52893", strMeal: "Bakewell tart", strMealThumb: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg"),
        Meal(idMeal: "52855", strMeal: "Banana Pancakes", strMealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
    ])
    
    static var previews: some View {
        DessertNavigation(meals: meals)
    }
}
