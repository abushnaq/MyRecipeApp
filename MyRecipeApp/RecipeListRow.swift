//
//  RecipeListRow.swift
//  MyRecipeApp
//
//  Created by Ahmad Remote on 10/16/24.
//

import SwiftUI
import Kingfisher

struct RecipeListRow: View {
    @State var recipeImage : String
    @State var recipeName : String
    @State var cuisine : String
    var body: some View {
        HStack
        {
            KFImage(URL(string: recipeImage)!)                
                .placeholder { Image("placeholder") }
                .scaleFactor(UIScreen.main.scale)
                .clipShape(.circle)
                
            VStack(alignment: .leading)
            {
                Text(recipeName)
                    .font(.title2)
                Text(cuisine)
                    .font(.headline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#Preview {
    RecipeListRow(recipeImage: "", recipeName: "Burgers", cuisine: "American")
}
