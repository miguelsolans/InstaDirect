//
//  User.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

struct User: Decodable {
    var pk: Int64 = 0
    var username: String = ""
    var full_name: String = ""
    var profile_pic_url: String = ""
    
}
