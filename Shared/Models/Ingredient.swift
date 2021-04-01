//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Fred Javalera on 3/31/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
  var id: UUID?
  var name: String
  var num: Int?
  var denom: Int?
  var unit: String?
}
