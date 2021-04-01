//
//  RecipeFeaturedView.swift
//  Recipe List App (iOS)
//
//  Created by Fred Javalera on 3/31/21.
//  Copyright © 2021 StarSailor Studios. All rights reserved.
//

import SwiftUI

struct RecipeFeaturedView: View {
  
  @EnvironmentObject var viewModel: RecipeViewModel
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 0) {
      
      Text("Featured Recipes")
        .bold()
        .padding(.leading)
        .padding(.top, 40)
        .font(.largeTitle)
      
      GeometryReader(content: { geometry in
        TabView {
          
          // Loop through each recipe.
          ForEach (0..<viewModel.recipes.count) {index in
            
            // Only show those that should be featured.
            if viewModel.recipes[index].featured == true {
              
              // Recipe card.
              ZStack {
                Rectangle()
                  .foregroundColor(.white)
                VStack (spacing:0) {
                  Image(viewModel.recipes[index].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                  Text(viewModel.recipes[index].name)
                    .padding(5)
                }
              }
              .frame(width: geometry.size.width - 40, height: geometry.size.height - 100, alignment: .center)
              .cornerRadius(15)
              .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            }
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
      })
      
      VStack (alignment: .leading, spacing: 10){
        Text("Preparation Time:")
          .font(.headline)
        Text("1 hour")
        Text("Highlights")
          .font(.headline)
        Text("Healthy, Hearty")
      }
      .padding([.leading, .bottom])
    }
  }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeFeaturedView()
      .environmentObject(RecipeViewModel())
  }
}
