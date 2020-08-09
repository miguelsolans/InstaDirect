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
    // @ObservedObject var image:UIImage = UIImage()
    // @State var image:UIImage = UIImage()
    
    
    // var threads = networkManager.direct
        var body: some View {
        NavigationView {
            
            VStack {
                
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    /*List {
                        ForEach((networkManager.direct.inbox?.threads)!, id: \.thread_id) { thread in
                            
                            ThreadRow(thread: thread)
                        }
                    }*/
                    List((networkManager.direct.inbox?.threads)!, id: \.thread_id) { thread in
                        NavigationLink(destination: ThreadView(thread: thread)) {
                            ThreadRow(thread: thread)
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("Direct"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
