//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 21/06/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingridient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        return String(targetServings)
    }
}
