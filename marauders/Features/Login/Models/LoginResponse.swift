//
//  LoginResponse.swift
//  Marauders
//
//  Created by somsak on 29/10/2567 BE.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
