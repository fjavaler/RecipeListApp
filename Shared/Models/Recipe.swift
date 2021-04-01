//
//  Recipe.swift
//  Recipe List App
//
//  Created by Fred Javalera on 3/31/21.
//

import Foundation

//Must conform to Identifiable protocol in order to be iterable.
//Must conform to Decodable protocol in order for JSON to be parseable to a Recipe object
class Recipe: Identifiable, Decodable {
  var id: UUID?
  var name: String
  var featured: Bool
  var image: String
  var description: String
  var prepTime: String
  var cookTime: String
  var totalTime: String
  var servings: Int
  var highlights: [String]
  var ingredients: [Ingredient]
  var directions: [String]
}
