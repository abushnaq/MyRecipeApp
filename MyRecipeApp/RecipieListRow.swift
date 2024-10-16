//
//  RecipieListRow.swift
//  MyRecipeApp
//
//  Created by Ahmad Remote on 10/16/24.
//

import SwiftUI
import Kingfisher

struct RecipieListRow: View {
    @State var recipieImage : String
    @State var recipieName : String
    @State var cuisine : String
    var body: some View {
        HStack
        {
            KFImage(URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/15d50359-5f62-4583-a9e9-d761bc58fecf/small.jpg")!)
                .scaleFactor(UIScreen.main.scale)
                .clipShape(.circle)
            VStack(alignment: .leading)
            {
                Text(recipieName)
                    .font(.largeTitle)
                Text(cuisine)
                    .font(.headline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#Preview {
    RecipieListRow(recipieImage: "", recipieName: "Burgers", cuisine: "American")
}
