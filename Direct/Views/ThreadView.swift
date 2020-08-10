//
//  ThreadView.swift
//  Direct
//
//  Created by Miguel Solans on 09/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import SwiftUI

struct ThreadView: View {
    var thread: Thread
    @ObservedObject var networkManager = NetworkManager()
    
    init(thread: Thread) {
        self.thread = thread
        self.thread.items.reverse()
    }
    
    var body: some View {
        ScrollView {
            ForEach(self.thread.items, id: \.item_id) { item in
                
                BubbleView(item: item, viewer: self.networkManager.direct.viewer!)
            }
        }.navigationBarTitle(Text(thread.thread_title), displayMode: .inline)
            .padding()
    }
}
