//
//  Media.swift
//  Direct
//
//  Created by Miguel Solans on 11/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

struct Media: Decodable {
    var id: String = ""
    var image_versions2: ImageVersions
    var original_width: Int
    var original_height: Int
    
    
    /// Get the URL for the picture with original quality
    func getOriginalQuality() -> String? {
        
        for img in self.image_versions2.candidates {
            
            if(img.height == self.original_height && img.width == self.original_width) {
                return img.url
            }
        }
        
        return nil
    }
}


struct ImageVersions: Decodable {
    var candidates: [Candidates]
}

struct Candidates: Decodable {
    var width: Int = 0
    var height: Int = 0
    var url: String = ""
}
