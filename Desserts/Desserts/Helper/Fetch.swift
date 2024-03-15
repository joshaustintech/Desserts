// Just making Fetch happen. ;-)

import Foundation

// Returns an instance of Meals if successful, nil if unsuccessful
func fetchData(_ urlString: String) -> Meals? {
    var result: Meals?
    guard let url = URL(string: urlString) else {
        print("Invalid url \(urlString)")
        return nil
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print("Expected data, received \(data!)")
            return
        }
        do {
            let fetched: Meals? = try JSONDecoder().decode(Meals.self, from: data)
            DispatchQueue.main.async {
                result = fetched
            }
        } catch {
            print(error.localizedDescription)
        }
    }.resume()
    return result
}

// fetch all desserts from API
func fetchDesserts() -> Meals? {
    return fetchData("https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
}

// fetch desert details by dessert ID from API
func fetchDessertById(_ mealId: String) -> Meal? {
    let meals = fetchData("https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealId)
    if meals != nil {
        return meals?.meals[0]
    }
    return nil
}
