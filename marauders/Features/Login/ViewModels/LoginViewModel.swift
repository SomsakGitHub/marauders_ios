//
//  LoginViewModel.swift
//  Marauders
//
//  Created by somsak on 29/10/2567 BE.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""

    func login() {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { _ in
            // Login successful, navigate to the Home screen
        }
    }
}

