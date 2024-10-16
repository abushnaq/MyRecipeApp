//
//  RecipeFetcher.swift
//  MyRecipeApp
//
//  Created by Ahmad Remote on 10/16/24.
//

import UIKit

// Add note here why force unwrap is fine.
let recipieURL = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!

class RecipeFetcher: NSObject {

    func fetchRecipies() async -> [Recipe] {
        do
        {
            // TODO: fix me there is a problem here somewhere
            let (data, response) = try await URLSession.shared.data(from: recipieURL)
            let recipieDictionary = try JSONDecoder().decode([String : [Recipe]].self, from: data)
            return recipieDictionary["recipes"]!
        } catch {
            print(error)
            return [Recipe]()
        }
    }
}
