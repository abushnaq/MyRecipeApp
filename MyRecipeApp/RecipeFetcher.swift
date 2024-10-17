//
//  RecipeFetcher.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import Foundation

// we can expand these as we build out the app.
enum RecipeError : Error, Equatable {
    case networkError(String)
    case parsingError(String)
}

// Force unwrapping here is fine since string is constant.
let recipeURL = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!

class RecipeFetcher: NSObject {
    let recipeURL : URL
    init(_ recipeURL : URL) {
        self.recipeURL = recipeURL
    }
    public func fetchRecipes() async throws -> [Recipe] {
        var data = Data()
        var recipeDictionary = [String : [Recipe]]()
        do
        {
            // second parameter here is the response. For more complex apps we can capture the response and maybe present a different error message depending on what http code we get.
            (data, _) = try await URLSession.shared.data(from: recipeURL)
        } catch
        {
            throw RecipeError.networkError("Error fetching recipes.")
        }
        do
        {
            recipeDictionary = try JSONDecoder().decode([String : [Recipe]].self, from: data)
        } catch
        {
            throw RecipeError.parsingError("Malformed recipes.")
        }
        if let recipes = recipeDictionary["recipes"]
        {
            return recipes
        }
        return [Recipe]()        
    }
}
