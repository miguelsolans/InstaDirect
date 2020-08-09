//
//  Direct.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

// Aparently, decodable makes it easier to decode JSON
struct Direct: Decodable {
    var status: String = ""
    var viewer: User?
    var inbox: Inbox?
    var pending_requests_total: Int = 0
    
}
