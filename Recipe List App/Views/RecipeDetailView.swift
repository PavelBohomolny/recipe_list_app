//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 28/06/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {

            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                   
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 160)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(15)
                        .textCase(.uppercase)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingridient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
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
