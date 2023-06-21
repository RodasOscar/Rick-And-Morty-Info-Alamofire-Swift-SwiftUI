//
//  Text.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 3/6/23.
//

import SwiftUI

extension Text {
    
    func titleTextStyle() -> some View {
        self.font(.custom("AmericanTypewriter",
            fixedSize: 40)
            .weight(.heavy))
    }
    
    func titleDescriptionTextStyle() -> some View {
        self.font(.custom("AmericanTypewriter",
            fixedSize: 25)
            .weight(.bold))
    }
    
    func descriptionTextStyle() -> some View {
        self.font(.custom("AmericanTypewriter",
            fixedSize: 25)
            .weight(.semibold))
    }
}

extension TextField {
    
    func styleSearch() -> some View {
        self.textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)
    }
}
