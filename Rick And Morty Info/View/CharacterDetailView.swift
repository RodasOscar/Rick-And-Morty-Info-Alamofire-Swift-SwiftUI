//
//  ImageView.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import AlamofireImage
import SwiftUI

struct CharacterDetailView: View {
    private let contentViewModel = ContentViewModel()
    private let status = "Status: "
    private let species = "Espacie: "
    private let type = "Tipo: "
    private let gender = "Genero: "
    private let origin = "Origen: "
    private let episode = "Primer Episodio"
    let character: Character
    var body: some View {
        NavigationStack{
            VStack {
                if let url = URL(string: character.image) {
                    ImageView(url: url).imageDescriptionStyle()
                }
                Text(character.name).titleTextStyle() 
                HStack(alignment: .center) {
                    VStack{
                        Text(status).titleDescriptionTextStyle()
                        Text(character.status).descriptionTextStyle()
                        Text(species).titleDescriptionTextStyle()
                        Text(character.species).descriptionTextStyle()
                        Text(type).titleDescriptionTextStyle()
                        Text(character.type).descriptionTextStyle()
                        Text(gender).titleDescriptionTextStyle()
                        Text(character.gender).descriptionTextStyle()
                        Text(origin).titleDescriptionTextStyle()
                        Text(character.origin.name).descriptionTextStyle()
                    }
                }
                
            }
        }
            .navigationTitle("Personaje")
    }
}

/*
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: <#Character#>)
    }
}
*/
