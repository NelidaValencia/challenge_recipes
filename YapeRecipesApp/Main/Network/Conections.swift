//
//  Conections.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 18/05/23.
//

import Alamofire

protocol ConectionsDelegate {
    func getRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void)
}

class Conections : ConectionsDelegate{
    func getRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        RestApiClient.getRecipes(completion: completion)
    }
   
}
