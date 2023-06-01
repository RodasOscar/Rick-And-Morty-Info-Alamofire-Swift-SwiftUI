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
            VStack() {
                Text("Personajes de Rick y Morty").font(.custom("Bold", size: 30))
                HStack {
                    TextField("Buscar", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onChange(of: searchText) { text in
                            viewModel.searchCharacters(name: text)
                        }
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
                                        ImageView(url: url)
                                            .frame(width: 70, height: 70)
                                            .cornerRadius(10)
                                    }
                                    VStack(alignment: .listRowSeparatorLeading){
                                        Text(character.name)
                                        Text("Origen: " + character.origin.name)
                                    }
                                    
                                }
                            }
                                                        }
                                                        ProgressView().onAppear(perform: viewModel.nextPage)
                                                    }
                                                }
                                            }
                                        }.navigationBarBackButtonHidden(true)
                                    }
                                }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
