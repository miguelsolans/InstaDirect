//
//  NetworkManager.swift
//  Direct
//
//  Created by Miguel Solans on 08/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//


/// TODO: Re-arrange code in order to re-use request headers and parameters (if this last one is possible at any kind)

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
    @Published var loaded = false
    @Published var logged = false
    
    init() {
        self.loading = true
        self.error = false
    }
    
    func getThread(thread: Thread) -> Void {
        return
    }
    
    func loadMore(cursor: String) -> Void {
        
        let url = URL(string: "https://www.instagram.com/direct_v2/web/inbox/?persistentBadging=true&limit=50&thread_message_limit=10&cursor=\(cursor)")!
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
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let direct = try JSONDecoder().decode(Direct.self, from: data)
                    
                DispatchQueue.main.async {
                    
                    self.direct.inbox?.update(inbox: direct.inbox!)
                    self.loading = false
                }
                
            } catch {
                print(error)
                self.loading = false
                self.error = true
            }
            
        }.resume()
    }
    
    /// Initial Loading
    private func loadData() {
        let url = URL(string: "https://www.instagram.com/direct_v2/web/inbox/?persistentBadging=true&limit=50&thread_message_limit=10")!
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
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let direct = try JSONDecoder().decode(Direct.self, from: data)
                print("Request")
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


    func login(username: String, password: String) -> Void {
        
        /*print("===== Login Function =====")
        print(username)*/
        
        /*DispatchQueue.main.async {
            self.logged = true
        }*/
        self.credentials = Credentials(username: username, password: password, verifyBy: .text)
        self.handler = APIHandler()
        
        self.handler!.authenticate(with: .user(credentials!)) {
            switch $0 {
            case .success(let response, _):
                print("Login successful.")
                // persist cache safely in the keychain for logging in again in the future.
                guard let key = response.persist() else { return print("`Authentication.Response` could not be persisted.") }
                // store the `key` wherever you want, so you can access the `Authentication.Response` later.
                // `UserDefaults` is just an example.
                UserDefaults.standard.set(key, forKey: "current.account")
                UserDefaults.standard.synchronize()
            case .failure(let error):
                if error.requiresInstagramCode {
                    /* update interface to ask for code */
                } else {
                    /* notify the user */
                    print("Unknown Error")
                    print(error)
                }
            }
        }
    }
}
