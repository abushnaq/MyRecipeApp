//
//  MyRecipeAppTests.swift
//  MyRecipeAppTests
//
//  Created by Ahmad Remote on 10/16/24.
//

import Testing
import Foundation
@testable import MyRecipeApp

struct MyRecipeAppTests {
    @Test func testRecipesFetch() async throws {
        let recipeFetcher = RecipeFetcher(recipeURL)
        let results = try! await recipeFetcher.fetchRecipes()
        #expect(!results.isEmpty,"Received empty result for regular URL.")
    }
    @Test func testEmptyRecipes() async throws {
        let recipeFetcher = RecipeFetcher(emptyRecipeURL)
        let results = try! await recipeFetcher.fetchRecipes()
        #expect(results.isEmpty,"Received non-empty result for empty URL.")
    }
    
    @Test func testMalformedRecipes() async throws {
        await #expect(throws: RecipeError.parsingError("Malformed recipes.")) {
            let recipeFetcher = RecipeFetcher(malformedRecipeURL)
            _ = try await recipeFetcher.fetchRecipes()
          }
    }

}
