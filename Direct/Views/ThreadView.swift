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
    }
    
    var body: some View {
        NavigationView {
            VStack {
                //Text(self.thread.thread_type)
                
                List((self.thread.items), id: \.item_id) { item in
                    
                    //Text("Item...")
                    if item.item_type == "text" {
                        
                        if self.networkManager.direct.viewer?.pk != item.user_id {
                            Text("\(self.thread.users[0].username): \(item.text ?? "")")
                        } else {
                            Text("Me: \(item.text ?? "")")
                        }
                        //Text("Text...")
                    } else {
                        Text("Media Type")
                    }
                    
                    // Text("Item")
                    // if(item.)
                    // if(item.type )
                }
                /*List((networkManager.direct.inbox?.threads)!, id: \.thread_id) { thread in
                    NavigationLink(destination: ThreadView(thread: thread)) {
                        ThreadRow(thread: thread)
                    }
                }*/
            }
        }.navigationBarTitle(Text(thread.thread_title), displayMode: .inline)
            .padding()
    }
}
