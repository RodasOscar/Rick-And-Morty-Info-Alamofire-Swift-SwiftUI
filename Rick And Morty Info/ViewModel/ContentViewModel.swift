//
//  ContentViewModel.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import CoreData
import Alamofire
import AlamofireImage

class ContentViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var page = 1
    private var name: String?
    private let characterService: CharacterServiceProtocol
    
    init(characterService: CharacterServiceProtocol = CharacterService()){
        self.characterService = characterService
    }
    
    
    
    func loadCharacters() {
        guard !isLoading else { return }
        isLoading = true
        characterService.getCharacters(page: page, name: name) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters.append(contentsOf: characters)
                self?.page += 1
                print(self?.page as Any)
                print(self?.isLoading as Any)
                self?.isLoading = false
                print(self?.isLoading as Any)
            case .failure(let error):
                self?.isLoading = false
                if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                    self?.errorMessage = "Sin conexión a Internet"
                } else {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func nextPage (){
        if page <= 42 {
            loadCharacters()
            print(page)
        }else if isLoading{
            loadCharacters()
            print(page)
        }else{
            self.errorMessage = "No se encuentran mas resultados"
        }
    }
    
    func searchCharacters(name: String) {
        self.name = name
        characters.removeAll()
        if errorMessage == nil {
            
        }else{
            self.errorMessage = "No se encuentra. Intente de nuevo"
        }
        self.page = 1
        loadCharacters()
    }
    
}
