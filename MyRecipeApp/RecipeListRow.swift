//
//  RecipeListRow.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
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
            KFImage(URL(string: recipeImage))
                .placeholder { Image("placeholder") }
                .scaleFactor(UIScreen.main.scale)
                .resizable()
                .border(.gray, width: 2.0)
                .clipShape(.circle)
                .frame(width: 75.0, height: 75.0)
                .clipped()
                
                .aspectRatio(contentMode: .fit)
                
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
    RecipeListRow(recipeImage: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", recipeName: "Burgers", cuisine: "American")
}
