//
//  Thread.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//
import Foundation


struct Thread: Decodable {
    // var id = UUID()
    var thread_id: String = ""
    var last_activity_at: Int = 0
    var users: [User]
    var muted: Bool = false
    var archived: Bool = false
    var thread_type: String = ""
    var thread_title: String = ""
    var items: [Item]
    
    
    
    func parseDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
         
        let date = Date(timeIntervalSince1970: Double(self.last_activity_at)/1000000)
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "pt_PT")
        return dateFormatter.string(from: date)
    }
}
