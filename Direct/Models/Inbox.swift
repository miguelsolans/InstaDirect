//
//  Inbox.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

struct Inbox: Decodable {
    var oldest_cursor: String = ""
    var threads: [Thread]?
}
