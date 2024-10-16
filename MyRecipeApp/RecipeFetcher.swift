//
//  RecipeFetcher.swift
//  MyRecipeApp
//
//  Created by Ahmad Remote on 10/16/24.
//

import UIKit

enum RecipeError : Error, Equatable {
    case networkError(String)
    case parsingError(String)
}

// Add note here why force unwrap is fine.
let recipeURL = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
let emptyRecipeURL = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
let malformedRecipeURL = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!

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
