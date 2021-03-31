//
//  ContentView.swift
//  Shared
//
//  Created by Fred Javalera on 3/31/21.
//

import SwiftUI

struct RecipeListView: View {
  //MARK: - VARIABLES
  //Reference the view model
  @ObservedObject var viewModel = RecipeViewModel()
  
  //MARK: - BODY
  var body: some View {
    List(viewModel.recipes) { recipe in
      HStack (spacing: 20.0) {
        
        Image(recipe.image)
          .resizable()
          .scaledToFill()
          .frame(width: 50, height: 50, alignment: .center)
          .clipped()
          .cornerRadius(5)
        
        Text(recipe.name)
      }
    }
  }
}

//MARK: - PREVIEW
struct RecipeListView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView()
  }
}