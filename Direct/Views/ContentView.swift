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
    
    var body: some View {
        NavigationView {
            
            if networkManager.loading {
                Text("Loading...")
            } else if networkManager.error {
                Text("Error!")
            } else {
                List((networkManager.direct.inbox?.threads)!, id: \.thread_id) { thread in
                    
                    NavigationLink(destination: ThreadView(thread: thread)) {
                        ThreadRow(thread: thread)
                    }
                }
            }
        }.navigationBarTitle("Direct")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
