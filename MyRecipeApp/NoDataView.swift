//
//  NoDataView.swift
//  MyRecipeApp
//
//  Created by Ahmad Bushnaq on 10/16/24.
//

import SwiftUI

// Simple view to display error or no data state.
struct NoDataView: View {
    var errorMessage : String = ""
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    var body: some View {
        HStack
        {
            Image(systemName: "exclamationmark.warninglight.fill")
                .resizable()
                .frame(width: 50.0, height: 50.0)
            Text(errorMessage)
                .font(.title2)
        }.padding()
    }
}

#Preview {
    NoDataView(errorMessage: kEmptyData)
}
