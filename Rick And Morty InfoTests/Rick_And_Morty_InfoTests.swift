//
//  Rick_And_Morty_InfoTests.swift
//  Rick And Morty InfoTests
//
//  Created by Oscar Andrés  Rodas Montoya on 30/5/23.
//

import XCTest
@testable import Rick_And_Morty_Info

final class Rick_And_Morty_InfoTests: XCTestCase {
    var viewModel: ContentViewModel!
    var characterService: MockCharacterService!
    
    override func setUp() {
        super.setUp()
        characterService = MockCharacterService()
        viewModel = ContentViewModel(characterService: characterService)
    }
    
    func testLoadCharacters() {
        // Given
        let expectation = self.expectation(description: "Load characters")
        characterService.characters = [Character(id: 1, name: "Rick Sanchez",status: "Alive", species: "Human", type: "",gender: "Male", origin: CharacterOriginModel: "Earth (C-137)" url: "https://rickandmortyapi.com/api/location/1", location: CharacterLocationModel: name "Citadel of Ricks" url "https://rickandmortyapi.com/api/location/3", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: "https://rickandmortyapi.com/api/episode/1" "https://rickandmortyapi.com/api/episode/2",url: "https://rickandmortyapi.com/api/character/1",created: "2017-11-04T18:48:46.250Z"})]
        
        // When
        viewModel.loadCharacters()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel.characters.count, 1)
            XCTAssertEqual(self.viewModel.characters.first?.id, 1)
            XCTAssertEqual(self.viewModel.characters.first?.name, "Rick Sanchez")
            XCTAssertEqual(self.viewModel.characters.first?.image, "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    // ... other tests ...
}

class MockCharacterService: CharacterServiceProtocol {
    var characters: [Character] = []
    
    func getCharacters(page: Int, name: String?, completion: @escaping (Result<[Character], Error>) -> Void) {
        completion(.success(characters))
    }
}
