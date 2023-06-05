//
//  ContentViewLaunch.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 1/6/23.
//
import SwiftUI

struct ContentViewLaunch: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("logo-rm")
                            .resizable()
                            .scaledToFit()
                            .hoverEffect(.highlight)
                Text("Hola, te damos la bienvenida")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("Ver Personajes de Rick y Morty")
                        .font(.custom("Bold",
                        fixedSize: 30)
                        .weight(.black))
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        ProgressView()
        .navigationBarBackButtonHidden(false)
        //.preferredColorScheme(ColorScheme.dark)
    }
}

struct ContentViewLaunch_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLaunch()
    }
}
