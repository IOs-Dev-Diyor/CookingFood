

import Foundation

class Recipe: Codable {
    let id: String
    let url: String
    let image: String
    let name: String
    let description: String
    let author: String
    let rattings: Int
    let ingredients: [String]
    let steps: [String]
    let times: Times
    let serves: Int
    let difficult: String
    let vote_count: Int
    let subcategory: String
    let dish_type: String
    let maincategory: String

    static func loadJson(fileName: String) -> [Recipe]? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: url)
                let recipes = try JSONDecoder().decode([Recipe].self, from: jsonData)
                
//                for recipe in recipes {
//                    print(recipe.name, "\(recipes.count)")
//                }
                return recipes
            } catch {
                print("JSON faylni o'qishda xatolik: \(error)")
            }
        } else {
            print("JSON fayl topilmadi")
        }
        
        return nil
    }
    

}
struct Times: Codable {
    let preparation: String?
    let cooking: String?

    enum CodingKeys: String, CodingKey {
        case preparation = "Preparation"
        case cooking = "Cooking"
    }
}

struct Nutrients: Codable {
    let kcal: String?
    let fat: String?
    let saturates: String?
    let carbs: String?
    let sugars: String?
    let fibre: String?
    let protein: String?
    let salt: String?
}
