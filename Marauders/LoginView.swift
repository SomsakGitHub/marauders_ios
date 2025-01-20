//
//  LoginView.swift
//  Marauders
//
//  Created by somsak on 8/1/2568 BE.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        VStack(spacing: 20) {
            // App Logo or Title
            Text("Login!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            // Login Buttons
            VStack(spacing: 15) {
                
                // Facebook Login Button
                Button(action: {
                    handleFacebookSignIn()
                }) {
                    HStack {
                        Image(systemName: "facebook")
                            .foregroundColor(.white)
                        Text("Sign in with Facebook")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                .frame(height: 50)
                .cornerRadius(10)
            }
            
            Spacer()
            
            // Footer
            Text("By signing in, you agree to our Terms & Privacy Policy.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    func handleFacebookSignIn() {
        // Add Facebook Sign-In logic here
        print("Facebook Sign-In")
        appRootManager.currentRoot = .home
    }
    
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at index \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
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
}

#Preview {
//        .modelContainer(for: Item.self, inMemory: true)
    LoginView()
}
