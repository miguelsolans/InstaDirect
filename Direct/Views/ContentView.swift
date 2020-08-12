//
//  ContentView.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        NavigationView {
            
            if networkManager.loading {
                Text("Loading...")
            } else if !networkManager.error && networkManager.direct.status != "fail" {
                
                List((networkManager.direct.inbox?.threads)!, id: \.thread_id) { thread in
                    
                    NavigationLink(destination: ThreadView(thread: thread)) {
                        ThreadRow(thread: thread)
                    }
                }.navigationBarTitle(Text("Direct"))
                    .navigationBarItems(leading:
                        Button(action: {
                            
                            self.networkManager.loadMore(cursor: self.networkManager.direct.inbox!.oldest_cursor)
                            
                            print("Load more...")
                        }) {
                            Text("More")
                        }
                    )
            
            
            } else {
                Text("Error!")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
