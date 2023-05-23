//
//  RestApiClient.swift
//  YapeRecipesApp
//
//  Created by Slacker on 22/05/23.
//

import Foundation
import Alamofire

class RestApiClient {
    static func getRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        AF.request(Constants.URL.main+Constants.Endpoints.urlListRecipes).responseDecodable(of: [Recipe].self) { response in
            switch response.result {
            case .success(let recipes):
                completion(.success(recipes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
