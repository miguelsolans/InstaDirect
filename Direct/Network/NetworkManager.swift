//
//  NetworkManager.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import Foundation
import Combine
import SwiftyInsta


class NetworkManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    // ProcessInfo.processInfo.environment
    var cookie = ""
    var appId = ""
    var appClaim = ""
    var credentials: Credentials?
    var handler: APIHandler?
    
    @Published var loading = false
    @Published var error = false
    @Published var direct = Direct()
    
    init() {
        self.loading = true
        self.error = false
        self.loadData()
    }
    
    func login(username: String, password: String) {
        self.credentials = Credentials(username: username, password: password, verifyBy: .text)
        self.handler = APIHandler()
        
        self.handler?.authenticate(with: .user(self.credentials!)) {
            switch $0 {
                case .success(let response, _):
                    print("Login successfull!")
                case .failure(let error):
                    print("Error!")
                
            }
        }
    }
    
    func getThread(thread: Thread) -> Void {
        return
    }
    
    func loadMore(cursor: String) -> Void {
        print("Next Cursor: \(cursor)")
        
        // TODO: apend to threads
        
        
        // TODO: update oldest_cursor
    }
    
    private func loadData() {
        let url = URL(string: "https://www.instagram.com/direct_v2/web/inbox/?persistentBadging=true&limit=10&thread_message_limit=10")!
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
            do {
                let direct = try JSONDecoder().decode(Direct.self, from: data)
                    
                DispatchQueue.main.async {
                    self.direct = direct
                    self.loading = false
                }
                
            } catch {
                print(error)
                self.loading = false
                self.error = true
            }
            
        }.resume()
    }
}
