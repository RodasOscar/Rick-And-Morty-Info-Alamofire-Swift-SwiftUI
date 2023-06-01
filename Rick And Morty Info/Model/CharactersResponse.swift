//
//  CharactersResponse.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 30/5/23.
//


/* info
 "count": 826,
 "pages": 42,
 "next": null,
 "prev": "https://rickandmortyapi.com/api/character?page=41"
 
 */
/*
"results": [
{
"id": 821,
"name": "Gotron",
"status": "unknown",
"species": "Robot",
"type": "Ferret Robot",
"gender": "Genderless",
"origin": {
"name": "Earth (Replacement Dimension)",
"url": "https://rickandmortyapi.com/api/location/20"
},
"location": {
"name": "Earth (Replacement Dimension)",
"url": "https://rickandmortyapi.com/api/location/20"
},
"image": "https://rickandmortyapi.com/api/character/avatar/821.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/48"
],
"url": "https://rickandmortyapi.com/api/character/821",
"created": "2021-11-02T17:15:24.788Z"
},
 
 */

import Foundation

struct CharactersResponse: Decodable {
    let info: JsonInfo
    let results: [Character]
    
}

struct JsonInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
}
// Un personaje de la API de Rick y Morty.
struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOriginModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}

struct CharacterOriginModel: Decodable {
    public let name: String
    public let url: String
}

struct CharacterLocationModel: Decodable {
    public let name: String
    public let url: String
}

