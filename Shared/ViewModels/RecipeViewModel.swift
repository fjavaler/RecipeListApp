//
//  RecipeViewModel.swift
//  Recipe List App
//
//  Created by Fred Javalera on 3/31/21.
//

import Foundation

class RecipeViewModel: ObservableObject {
  //MARK: - VARIABLES
  @Published var recipes = [Recipe]()
  
  init() {
    // Call static method found in service and get the data
    self.recipes = DataService.getLocalData()
    
    // Set the recipes property.
  }
}
