//
//  ImageView.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import SwiftUI

struct ImageView: UIViewRepresentable {
    let url: URL
    static let imageCache = NSCache<NSURL, UIImage>()
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        
       
        if let cachedImage = Self.imageCache.object(forKey: url as NSURL) {
            imageView.image = cachedImage
        } else {
            imageView.af.setImage(withURL: url, completion: { response in
                if let image = response.value {
                    Self.imageCache.setObject(image, forKey: url as NSURL)
                }
            })
        }
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}
