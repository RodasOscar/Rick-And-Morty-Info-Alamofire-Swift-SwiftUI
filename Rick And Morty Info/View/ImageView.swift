//
//  ImageView.swift
//  Rick_And_Morty_Info
//
//  Created by Oscar Andrés  Rodas Montoya on 31/5/23.
//

import Foundation
import SwiftUI
import AlamofireImage

//Cargar una imagen de una URL usando
struct ImageView: UIViewRepresentable {
    let url: URL
    //Constante utilizada para almacenar imagenes en cache
    static let imageCache = NSCache<NSURL, UIImage>()
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        
       //Verificación de que la imagen se encuentra en cache
        if let cachedImage = Self.imageCache.object(forKey: url as NSURL) {
            //Usar la imagen si se encuentra en cache
            imageView.image = cachedImage
        } else {
            //Si la imagen no esta en cache, usa AlamofireImage para cargar la imagen
            imageView.af.setImage(withURL: url, completion: { response in
                if let image = response.value {
                    //y carga la imagen en cache
                    Self.imageCache.setObject(image, forKey: url as NSURL)
                }
            })
        }
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}
