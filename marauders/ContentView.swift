//
//  ContentView.swift
//  marauders
//
//  Created by somsak on 13/4/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var loginMessage = ""
    
    // Use @AppStorage to store the login state globally
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // App Title
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            // Username TextField
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            // Password SecureField
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            // Login Button
            Button(action: handleLogin) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Spacer to push the content up
            Spacer()
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Login"), message: Text(loginMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func handleLogin() {
//        if username.isEmpty || password.isEmpty {
//            loginMessage = "Please enter both username and password."
//        } else if username == "user" && password == "password" {
//            loginMessage = "Login successful!"
//        } else {
//            loginMessage = "Invalid username or password."
//        }
        isLoggedIn = true
        showingAlert = true
    }
}

struct ContentView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            TabBarView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

