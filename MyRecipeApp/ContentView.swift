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
    @State var recipes : [Recipe] = [Recipe]()
    @State var showEmptyDataView : Bool = false
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
