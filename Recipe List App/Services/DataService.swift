//
//  DataService.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 21/06/2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parce local JSON file
        
        // Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil...
        guard pathString != nil else {
            return [Recipe]()
        }
        // Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
