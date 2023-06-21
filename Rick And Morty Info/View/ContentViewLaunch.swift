//
//  ContentViewLaunch.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 1/6/23.
//
import SwiftUI

import SwiftUI

struct ContentViewLaunch: View {
    @State private var progress = 0.0
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo-rm")
                    .resizable()
                    .scaledToFit()
                
                ProgressView(value: progress)
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                            progress += 0.05
                            if progress >= 1.0 {
                                isActive = true
                                timer.invalidate()
                            }
                        }
                    }
            }
            .fullScreenCover(isPresented: $isActive) {
                ContentView()
            }
        }
    }
}


struct ContentViewLaunch_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLaunch()
    }
}
