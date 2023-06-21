//
//  Image.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 4/6/23.
//

import SwiftUI

extension ImageView {
    func imageDescriptionStyle() -> some View {
        self.frame(width: 200, height: 200)
            .cornerRadius(15)
    }
    
    func imageListStyle() -> some View {
        self.frame(width: 70, height: 70)
            .cornerRadius(10)
    }
}
