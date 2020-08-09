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
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    var body: some View {
        VStack {
            Text("Thread View")
        }.navigationBarTitle(Text(thread.thread_title), displayMode: .inline)
            .padding()
    }
}
