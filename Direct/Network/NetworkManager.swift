//
//  NetworkManager.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation
import Combine


class NetworkManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    // ProcessInfo.processInfo.environment
    var cookie = ProcessInfo.processInfo.environment["cookie"] ?? ""
    var appId = ProcessInfo.processInfo.environment["appId"] ?? ""
    var appClaim = ProcessInfo.processInfo.environment["appClaim"] ?? ""
    
    @Published var loading = false
    @Published var direct = Direct()
    
    init() {
        self.loading = true
        self.loadData()
    }
    func getThread(thread: Thread) -> Void {
        return
    }
    private func loadData() {
        let url = URL(string: "https://www.instagram.com/direct_v2/web/inbox")!
        var request = URLRequest(url: url)
        
        request.setValue(
            self.cookie,
            forHTTPHeaderField: "Cookie"
        )

        request.setValue(
            self.appId,
            forHTTPHeaderField: "X-IG-App-ID"
        )

        request.setValue(
            self.appClaim,
            forHTTPHeaderField: "X-IG-WWW-Claim"
        )
        
        print("Requesting Data")
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            
            let direct = try! JSONDecoder().decode(Direct.self, from: data)
            // print("Data Received")
            // print(direct.viewer?.username)
            DispatchQueue.main.async {
                self.direct = direct
                self.loading = false
            }
        }.resume()
    }
}
