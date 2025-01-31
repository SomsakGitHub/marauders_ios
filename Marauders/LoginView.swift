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
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
            VStack {
                Text("Login")

                // Email Field
                CustomTextField(style: .emailField)

                // Password Field
                CustomTextField(style: .secureTextField)

                // Login Button
                Button(action: {
                    loginUser()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
        }

        private func loginUser() {
            // Implement login logic here
            appRootManager.currentRoot = .home
            print("Logging in with: \(email) and \(password)")
        }
}

#Preview {
//        .modelContainer(for: Item.self, inMemory: true)
    LoginView()
}
