//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by GPS Dev on 3/31/21.
//

import SwiftUI

struct RecipeDetailView: View {
  
  var recipe: Recipe
  
  var body: some View {
    ScrollView {
      VStack (alignment: .leading){
        //MARK: - Recipe Image
        Image(recipe.image)
          .resizable()
          .scaledToFill()
        
        //MARK: - Ingredients
        VStack (alignment: .leading) {
          Text("Ingredients")
            .font(.headline)
            .padding(.vertical, 5)
          
          ForEach (recipe.ingredients) {ingredient in
            Text("• \(ingredient.name)")
          }
        }
        .padding(.horizontal)
        
        //MARK: - Divider
        Divider()
        
        //MARK: - Directions
        VStack(alignment: .leading) {
          Text("Directions")
            .font(.headline)
            .padding(.bottom, 5)
          
          ForEach(0..<recipe.directions.count, id: \.self) {index in
            Text(String(index+1) + ". " + recipe.directions[index])
              .padding(.vertical, 5)
          }
        }
        .padding(.horizontal)
      }
    }
    .navigationBarTitle(recipe.name)
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    
    // Create a dummy recipe and pass it into the detail view so that we can see a review
    let viewModel = RecipeViewModel()
    
    RecipeDetailView(recipe: viewModel.recipes[0])
  }
}
