//
//  Service.swift
//  NetworkKit
//
//  Created by somsak on 21/1/2567 BE.
//

import CoreKit
import Alamofire

public protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any?]? { get }
    var mockup: String? { get }
}

public extension Service {
    var baseURL: String {
        return Config.serverUrlAuth
    }
    
    var headers: [String: String]? {
        return [
            "app-meta": AppMeta().toJsonString() ?? "",
            "Content-Type": "application/json",
            "client_id": "AppVariable.shared.clientId",
            "client_secret": "AppVariable.shared.clientSecret",
            "Authorization": "Bearer (AppVariable.shared.accessToken)"
//            ,"is_mock": "true"
        ]
    }
    
    var mockup: String? {
        return nil
    }
}

public extension Service {
    var encoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding(destination: .queryString)
        default:
            return JSONEncoding.default
        }
    }
}
