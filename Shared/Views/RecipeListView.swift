//
//  ContentView.swift
//  Shared
//
//  Created by Fred Javalera on 3/31/21.
//

import SwiftUI

struct RecipeListView: View {
  //MARK: - VARIABLES
  //Reference the view model as an ObservedObject to let View know that this will need to be observed for state changes.
  @ObservedObject var viewModel = RecipeViewModel()
  
  //MARK: - BODY
  var body: some View {
    NavigationView {
      List(viewModel.recipes) { recipe in
        
        
        NavigationLink (
          destination: RecipeDetailView(recipe: recipe),
          label: {
            
            //MARK: - Row item
            HStack (spacing: 20.0) {
              Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .center)
                .clipped()
                .cornerRadius(5)
              Text(recipe.name)
            }
          })
      }
      .navigationBarTitle("All Recipes")
    }
  }
}

//MARK: - PREVIEW
struct RecipeListView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView()
  }
}
