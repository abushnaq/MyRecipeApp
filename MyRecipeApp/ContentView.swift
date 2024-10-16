//
//  ContentView.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import SwiftUI

let kEmptyData = "No data returned. Please try again later."

struct ContentView: View {
    @State var recipes : [Recipe] = [Recipe]()
    var filteredRecipes : [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { recipe in
                recipe.name.localizedCaseInsensitiveContains(searchText) ||
                recipe.cuisine.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    @State var searchText = ""
    
    var recipeFetcher = RecipeFetcher(recipeURL)
    
    fileprivate func fetchRecipes() async {
        do
        {
            let fetchedRecipes = try await recipeFetcher.fetchRecipes()
            recipes = fetchedRecipes
        } catch {
            recipes = [Recipe]()
        }
    }
    
    fileprivate func refreshToolbarItem() -> ToolbarItem<(), Button<Image>> {
        return ToolbarItem() {
            Button(action: {
                Task
                {
                    await fetchRecipes()
                }
            })
            {
                Image(systemName: "arrow.clockwise")
            }
            
        }
    }
    
    var body: some View {
        NavigationView
        {
            if recipes.count == 0
            {
                // how to remove duplicates
                NoDataView(errorMessage: kEmptyData)
                    .toolbar()
                {
                    refreshToolbarItem()
                }.navigationTitle("My Recipes")
            }
            List() {
                ForEach(filteredRecipes) { recipe in
                    RecipeListRow(recipeImage: recipe.smallPhotoURL, recipeName: recipe.name, cuisine: recipe.cuisine)
                }
            }.searchable(text: $searchText, prompt: "Search recipes")
                .navigationTitle("My Recipes")
            
                .toolbar()
            {
                refreshToolbarItem()
            }
        }
        
            .onAppear()
        {
            Task
            {
                await fetchRecipes()
            }
        }
    }
}

#Preview {
    ContentView()
}
