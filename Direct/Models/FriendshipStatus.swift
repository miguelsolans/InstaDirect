//
//  FriendshipStatus.swift
//  Direct
//
//  Created by Miguel Solans on 10/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation

struct FriendshipStatus: Decodable {
    var following: Bool = false
    var blocking: Bool = false
    var is_bestie: Bool = false
    var is_restricted: Bool = false
}
