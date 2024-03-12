struct Meal: Codable, Hashable, Identifiable {
    var id: Int { Int(idMeal)! }
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
}
