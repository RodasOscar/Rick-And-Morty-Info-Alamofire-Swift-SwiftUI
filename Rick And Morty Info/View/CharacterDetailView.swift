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
                    ImageView(url: url)
                        .frame(width: 200, height: 200)
                        .cornerRadius(15)
                }
                Text(character.name).font(
                    .custom(
                    "AmericanTypewriter",
                    fixedSize: 40)
                    .weight(.heavy)
                    )
                HStack(alignment: .center) {
                    Text(status).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.bold)
                        )
                    Text(character.status).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.semibold)

                    )
                }
                HStack (alignment: .center) {
                    Text(species).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.bold))
                    Text(character.species).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.semibold))
                }
                HStack (alignment: .center) {
                    Text(type).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.bold))
                    Text(character.type).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.semibold))
                }
                HStack (alignment: .center) {
                    Text(gender).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.bold))
                    Text(character.gender).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.semibold))
                }
                HStack (alignment: .center) {
                    Text(origin).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.bold))
                    Text(character.origin.name).font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 25)
                        .weight(.semibold))
                }
                //Text(character.origin.url).font(.title2)
                //Text(episode + character.episode[0]).font(.title2)
                //Text(character.url).font(.title2)
            }//.onAppear(perform: contentViewModel.characters)
        }
    }
}

/*
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: <#Character#>)
    }
}
*/
