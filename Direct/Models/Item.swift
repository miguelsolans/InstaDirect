//
//  Item.swift
//  Direct
//
//  Created by Miguel Solans on 09/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

struct Item: Decodable {
    var item_id: String = ""
    var user_id: Int64 = 0
    var item_type: String = ""
    var text: String?
    var media: Media?
    
}
