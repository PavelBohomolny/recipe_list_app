//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 28/06/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {

            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(15)
                        .textCase(.uppercase)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                            .padding(5)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(15)
                        .textCase(.uppercase)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(5)
                    }
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
