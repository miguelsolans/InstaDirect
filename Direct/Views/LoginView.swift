//
//  LoginView.swift
//  Direct
//
//  Created by Miguel Solans on 16/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import SwiftUI




struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Username", text: $username)
                TextField("Password", text: $password)
                Button(action: {
                    print("Login Button pressed")
                    self.networkManager.login(username: self.username, password: self.password)
                }) {
                    Text("Login")
                }
            }
        }
    }
}
