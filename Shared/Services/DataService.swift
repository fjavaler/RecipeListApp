//
//  DataService.swift
//  Recipe List App
//
//  Created by Fred Javalera on 3/31/21.
//

import Foundation

/// The data service class. Contains static methods.
class DataService {
  /// Parses the local JSON file and returns an array of Recipes.
  static func getLocalData() -> [Recipe] {
    
    // Get a URL path to the JSON file (Bundle == Solution in C# nomenclature).
    let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
    
    // Check if pathString is not nil, otherwise...
    guard pathString != nil else {
      return [Recipe]()
    }
    
    // ...create a URL object. Can safely unwrap because we already checked if pathString is nil above.
    let url = URL(fileURLWithPath: pathString!)
    
    do {
      // Create a data object.
      let data = try Data(contentsOf: url)
      
      // Create a JSON decoder.
      let decoder = JSONDecoder()
      
      do {
        // Decode the data with the JSON decoder.
        let recipeData = try decoder.decode([Recipe].self, from: data)
        
        // Add the unique IDs.
        for recipe in recipeData {
          recipe.id = UUID()
        }
        
        // Return the array of recipes.
        return recipeData
      } catch {
        // Error with parsing JSON.
        print(error)
      }
    } catch {
      // error with getting data
      print(error)
    }
    
    // Something went wrong during do/catch and was escaped from. Return empty array of Recipes.
    return [Recipe]()
  }
}
