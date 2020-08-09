//
//  AvatarView.swift
//  Direct
//
//  Created by Miguel Solans on 09/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Combine
import SwiftUI

struct AvatarView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(withURL: "")
    }
}
