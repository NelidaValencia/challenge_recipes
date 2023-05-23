//
//  ListRecipes.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 16/05/23.
//

import Foundation

struct Recipe: Codable {
    var name : String?
    var image : String?
    var description : String?
    var coordinates : Coordinate?
}

struct Coordinate: Codable {
    var latitude : Double?
    var longitude : Double?
}
