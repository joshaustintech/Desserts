import SwiftUI

struct DessertDetails: View {
    var meal: Meal
    
    var body: some View {
        VStack(spacing: 64) {
            Text(meal.strMeal)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("\(meal.id)")
                .font(.subheadline)
            
            Spacer()
            
            Text("Source: " + meal.strMealThumb)
                .font(.caption)
        }
        
    }
}

#Preview {
    DessertDetails(meal: 
                    Meal(
                        idMeal: "52893",
                        strMeal: "Apple & Blackberry Crumble",
                        strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
                    )
    )
}
