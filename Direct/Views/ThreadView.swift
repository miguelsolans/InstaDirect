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
    var viewer: User
    // @ObservedObject var networkManager = NetworkManager()
    
    init(thread: Thread, viewer: User) {
        self.thread = thread
        self.viewer = viewer
        self.thread.items.reverse()
    }
    
    var body: some View {
        
        TabView {
            MessagesView(thread: self.thread, viewer: self.viewer)
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "rectangle.stack.person.crop")
                    Text("Media")
                }
        }
            
    }
}
