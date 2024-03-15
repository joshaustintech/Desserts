enum MealsFetchState {
    case loading
    case invalid
    case success(meals: Meals)
}
