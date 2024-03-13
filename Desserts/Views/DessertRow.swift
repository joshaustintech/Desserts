import SwiftUI

struct DessertRow: View {
    var meal: Meal

    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12) {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(meal.strMeal)
            Spacer()
        }
    }
    
    private func fetchData() {
        
    }
}

#Preview {
    Group {
        DessertRow(meal: Meal(
            idMeal: "53049",
            strMeal: "Apam balik",
            strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
            )
        )
        DessertRow(meal: Meal(
                idMeal: "52893",
                strMeal: "Apple & Blackberry Crumble",
                strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
            )
        )
        DessertRow(meal: Meal(
            idMeal: "52768",
            strMeal: "Apple Frangipan Tart",
            strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
            )
        )
    }
}
