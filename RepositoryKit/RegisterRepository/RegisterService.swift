//
//  RegisterService.swift
//  RepositoryKit
//
//  Created by somsak on 21/1/2567 BE.
//

import NetworkKit
import CoreKit
import Alamofire

enum RegisterService: Service {
    
    case testApi
    
    var path: String {
        switch self {
        case .testApi:
            return "/get"
        }
    }
    
    var baseURL: String {
        switch self {
        case .testApi:
            return Config.serverUrlUnauth
//        default:
//            return Config.serverUrlUnauth
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any?]? {
        return nil
    }
}
