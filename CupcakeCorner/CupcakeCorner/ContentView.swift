//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mariana Yamamoto on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
        //            image.resizable()
        //                .scaledToFit()
        //        } placeholder: {
        //            ProgressView()
        //        }
        //        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
