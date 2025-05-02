//
//  ContentView.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI

struct LoginSceneView: View {
//    @Binding var isLoggedIn: Bool
    let viewModel: LoginSceneViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
//                    .keyboardType(.emailAddress)
//                    .autocapitalization(.none)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
//                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                Button(action: handleLogin) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text("Invalid email or password."), dismissButton: .default(Text("OK")))
            }
//            .navigationBarHidden(true)
        }
    }

    func handleLogin() {
        // Dummy validation
//        isLoggedIn = true
//        if email == "test@example.com" && password == "password123" {
//            isLoggedIn = true
//        } else {
//            showAlert = true
//        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = DefaultLoginSceneViewModel()
//        
//        LoginSceneView(viewModel: DefaultLoginSceneConfigurator()
//            .configured(with: viewModel) as! LoginSceneViewModel)
//    }
//}
