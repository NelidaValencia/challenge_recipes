//
//  ViewModelListRecipes.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 16/05/23.
//

import Foundation

class ViewModelListRecipes: ObservableObject {
    private let conection: ConectionsDelegate
    init(conection: ConectionsDelegate = Conections()) {
        self.conection = conection
    }
    
    func getRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        conection.getRecipes(completion: completion)
    }
}
