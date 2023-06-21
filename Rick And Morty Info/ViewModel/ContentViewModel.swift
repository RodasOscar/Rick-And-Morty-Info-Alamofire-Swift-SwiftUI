//
//  ContentViewModel.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import Alamofire
import AlamofireImage

class ContentViewModel: ObservableObject {
    //variables que cambian durante la ejecución
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    // inicializadores variables privadas
    private var page = 1
    private var name: String?
    private let characterService: CharacterServiceProtocol
    
    init(characterService: CharacterServiceProtocol = CharacterService()){
        self.characterService = characterService
    }
    
    
    //Función que carga los personajes y la información de la API
    func loadCharacters() {
        guard !isLoading else { return }
        isLoading = true
        characterService.getCharacters(page: page, name: name) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters.append(contentsOf: characters)
                self?.page += 1
                self?.isLoading = false
            case .failure(let error):
                if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                    self?.isLoading = false
                    self?.errorMessage = "Sin conexión a Internet"
                }else {
                    self?.isLoading = false
                }
            }
        }
    }
    // Función para cambio de pagina
    func nextPage (){
        if page <= 42 {
            loadCharacters()
        }else if isLoading{
            loadCharacters()
        }else{
            self.errorMessage = "Fin de los resultados"
        }
    }
    //Excepción al buscar 
    func searchCharacters(name: String) {
        self.name = name
        characters.removeAll()
        if errorMessage == nil {
        }else {
            self.errorMessage = "No existe, Intente de Nuevo"
        }
        self.page = 1
        loadCharacters()
    }
    
}
