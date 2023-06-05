//
//  CharacterService.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import Alamofire
// Protocolo que obtiene la información en el API Rick y Morty
protocol CharacterServiceProtocol {
    func getCharacters(page: Int, name: String?, completion: @escaping (Result<[Character], Error>) -> Void)
}
//CharacterService para obtener los datos de forma de request con Alamofire y la funcion GET
struct CharacterService: CharacterServiceProtocol {
    //La función getCharacters se ejecutara de manera asincrona
    func getCharacters(page: Int, name: String?, completion: @escaping (Result<[Character], Error>) -> Void) {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com/api/character")!
        var queryItems = [URLQueryItem(name: "page", value: String(page))]
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        //Request Alamofire
        AF.request(url)
            .validate()
            .responseDecodable(of: CharactersResponse.self) { response in
                switch response.result {
                case .success(let charactersResponse):
                    //En caso de ser afirmativo devuelve y estructura en objetos swift para ser usados
                    completion(.success(charactersResponse.results))
                case .failure(let error):
                    //En caso de error nos muestra el error
                    completion(.failure(error))
                }
            }
    }
}
