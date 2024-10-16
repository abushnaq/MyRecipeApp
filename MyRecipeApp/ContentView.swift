//
//  ContentView.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var recipies : [Recipe] = [Recipe]()
    var filteredRecipies : [Recipe] {
        if searchText.isEmpty {
            return recipies
        } else {
            return recipies.filter { recipe in
                recipe.name.localizedCaseInsensitiveContains(searchText) ||
                recipe.cuisine.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    @State var searchText = ""
    
    var recipieFetcher = RecipeFetcher()
    
    var body: some View {
        NavigationView
        {
            List() {
                ForEach(filteredRecipies) { recipe in
                        RecipieListRow(recipieImage: recipe.smallPhotoURL, recipieName: recipe.name, cuisine: recipe.cuisine)
                    }
            }.searchable(text: $searchText, prompt: "Search recipes")
        }
            .navigationTitle(Text("My Recipie App"))
            .onAppear()
        {
            Task
            {
                let fetchedRecipies = await recipieFetcher.fetchRecipies()
                recipies = fetchedRecipies
            }
        }
    }
}

#Preview {
    ContentView()
}
