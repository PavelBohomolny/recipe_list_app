//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 28/06/2022.
//

import SwiftUI

struct RecipeDetailView: View {

    var recipe:Recipe

    @State var selectedServingSize = 2

    var body: some View {

        ScrollView {

            VStack(alignment: .leading) {

                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)

                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()

                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(15)
                        .textCase(.uppercase)

                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()

        RecipeDetailView(recipe: model.recipes[0])
    }
}
