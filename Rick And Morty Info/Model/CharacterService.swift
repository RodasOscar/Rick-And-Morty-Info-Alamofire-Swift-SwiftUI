//
//  CharacterService.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import Alamofire

protocol CharacterServiceProtocol {
    func getCharacters(page: Int, name: String?, completion: @escaping (Result<[Character], Error>) -> Void)
}

struct CharacterService: CharacterServiceProtocol {
    func getCharacters(page: Int, name: String?, completion: @escaping (Result<[Character], Error>) -> Void) {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com/api/character")!
        var queryItems = [URLQueryItem(name: "page", value: String(page))]
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        
        AF.request(url)
            .validate()
            .responseDecodable(of: CharactersResponse.self) { response in
                switch response.result {
                case .success(let charactersResponse):
                    completion(.success(charactersResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
