//
//  MessagesView.swift
//  Direct
//
//  Created by Miguel Solans on 11/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    var thread: Thread
    var viewer: User
    @ObservedObject var networkManager = NetworkManager()
    
    init(thread: Thread, viewer: User) {
        self.thread = thread
        self.viewer = viewer
        // self.thread.items.reverse()
    }
    
    var body: some View {
        ScrollView {
            ForEach(self.thread.items, id: \.item_id) { item in
                
                BubbleView(item: item, viewer: /*self.networkManager.direct.viewer!*/ self.viewer).padding()
            }
        }.navigationBarTitle(Text(thread.thread_title), displayMode: .inline)
    }
}
