//
//  ThreadRow.swift
//  Direct
//
//  Created by Miguel Solans on 09/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import SwiftUI

struct ThreadRow: View {
    var thread: Thread?
    init(thread: Thread) {
        self.thread = thread
    }
    
    func parseDate(date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
         
        let date = Date(timeIntervalSince1970: date/1000000)
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "pt_PT")
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            AvatarView(withURL: thread!.users[0].profile_pic_url)
            
            VStack {
                Text(thread!.thread_title)
                Text(self.parseDate(date: Double(thread!.last_activity_at)))
            }
        }
    }
}
