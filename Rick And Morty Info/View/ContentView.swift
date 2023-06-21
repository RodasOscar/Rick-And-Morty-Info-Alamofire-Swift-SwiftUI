//
//  ContentView.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 30/5/23.
//

import SwiftUI
import AlamofireImage

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            Text("Personajes de Rick y Morty").bold()
            VStack{
                HStack {
                    TextField("Buscar", text: $searchText).styleSearch()
                        .onChange(of: searchText) { text in
                            viewModel.searchCharacters(name: text)
                        }
                    Button (action:{
                        self.searchText = ""
                        viewModel.loadCharacters()
                    }, label: {
                        Image(systemName: "house.fill")
                                        })
                }
                
                if viewModel.errorMessage != nil {
                    Text(viewModel.errorMessage!)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.characters) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                HStack {
                                    if let url = URL(string: character.image) {
                                        ImageView(url: url).imageListStyle()
                                    }
                                    VStack(alignment: .listRowSeparatorLeading){
                                        Text(character.name).bold()
                                        Text("Origen: " + character.origin.name)
                                    }
                                    
                                }
                            }
                                                        }
                        ProgressView("Cargando ...")
                            .frame(alignment: .center)
                            .onAppear(perform: viewModel.nextPage)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

