//
//  ContentView.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

/*
 Need to add comments in various places
 swipe action to do source and youtube links
 
 
 test on ipad
 check requirements
 
 */


import SwiftUI

let kEmptyData = "No data returned. Please try again later."

struct ContentView: View {
    // master list of all recipes returned by the API
    @State var recipes : [Recipe] = [Recipe]()
    // We use a boolean rather than check for empty recipes to distinguish between we haven't loaded yet vs we tried to load and got nothing.
    @State var showEmptyDataView : Bool = false
    @State var searchText = ""
    
    // recipeURL is defined in the RecipeFetcher class
    var recipeFetcher = RecipeFetcher(recipeURL)
    
    var filteredRecipes : [Recipe] {
        if searchText.isEmpty {
            // if we're not searching for anythign return the whole list.
            return recipes
        } else {
            // otherwise filter the list based on searches in the cuisine or name
            return recipes.filter { recipe in
                recipe.name.localizedCaseInsensitiveContains(searchText) ||
                recipe.cuisine.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView
        {
            if showEmptyDataView
            {
                NoDataView(errorMessage: kEmptyData)
                    .toolbar()
                {
                    refreshToolbarItem()
                }.navigationTitle("My Recipes")
            }
            else
            {
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
        }.onAppear()
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

// MARK: Helper methods moved to an extension to improve readability.
extension ContentView
{
    fileprivate func fetchRecipes() async {
        do
        {
            let fetchedRecipes = try await recipeFetcher.fetchRecipes()
            recipes = fetchedRecipes
            if recipes.isEmpty
            {
                showEmptyDataView = true
            }
        } catch {
            recipes = [Recipe]()
            showEmptyDataView = true
        }
    }
    
    fileprivate func refreshToolbarItem() -> some View {
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
