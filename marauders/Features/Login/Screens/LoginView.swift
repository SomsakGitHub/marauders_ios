//
//  ContentView.swift
//  Marauders
//
//  Created by somsak on 17/10/2567 BE.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()

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
            Button(
                action: handleLogin
            ){
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
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Login"), message: Text(loginMessage), dismissButton: .default(Text("OK")))
//        }
    }
    
    func handleLogin() {

//        if username.isEmpty || password.isEmpty {
//            loginMessage = "Please enter both username and password."
//        } else if username == "user" && password == "password" {
//            loginMessage = "Login successful!"
//        } else {
//            loginMessage = "Invalid username or password."
//        }
        
//        isLoggedIn = true
//        showingAlert = true
        
        viewModel.login()
        
        appRootManager.currentRoot = .home
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

struct LoginViewContentView: View {
    var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            HomeView()
        } else {
            LoginView()
        }
    }
}


#Preview {
    LoginViewContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(AppRootManager())
}

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case home
    }
}
