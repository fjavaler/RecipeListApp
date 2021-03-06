//
//  ContentView.swift
//  Shared
//
//  Created by Fred Javalera on 3/31/21.
//

import SwiftUI

struct RecipeListView: View {
  //MARK: - VARIABLES
  
  //MARK: - IMPORTANT!
  //This is how you reference the EnvironmentObject that was injected in the RecipeTabView!
  @EnvironmentObject var viewModel: RecipeViewModel
  
  //MARK: - BODY
  var body: some View {
    
    NavigationView {
      
      VStack (alignment: .leading) {
        Text("All Recipes")
          .bold()
          .padding(.top, 40)
          .font(.largeTitle)
        
        ScrollView {
          
          LazyVStack (alignment: .leading) {
            
            ForEach(viewModel.recipes) { recipe in
              
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
                      .foregroundColor(.black)
                  }
                })
            }
          }
        }
      }
      .navigationBarHidden(true)
      .padding(.leading)
    }
  }
}

//MARK: - PREVIEW
struct RecipeListView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView()
      .environmentObject(RecipeViewModel())
  }
}
