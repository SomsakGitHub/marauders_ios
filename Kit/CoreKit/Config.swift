//
//  Config.swift
//  CoreKit
//
//  Created by somsak on 21/1/2567 BE.
//

import Foundation

private struct ConfigKey {
    static let appName = "APP_NAME"
    static let appBundleId = "APP_BUNDLE_ID"
    static let environment = "APP_ENVIRONMENT"
}

public class Config {
    public enum Environment {
        case prod, uat, sit
        
        init(named: String) {
            switch named {
            case "PROD": self = .prod
            case "UAT": self = .uat
            case "SIT": self = .sit
            default: self = .prod
            }
        }
    }
    
    public static var serverBaseUrl: String {
        return "http://postman-echo.com"
        //return "https://\(Config.serviceBaseEndpoint)/public/mycar-v1-service"
    }
    
    public static var serviceBaseEndpoint: String {
        switch Config.environment {
        case .prod:
            return "api.tiscoonline.com"
            //return "api.c1-tiscogroup.com"
        case .sit:
            return "api.c1-alpha-tiscogroup.com"
        case .uat:
            return "api.c1-beta-tiscogroup.com"
        }
    }
    
    public static let serverUrlAuth: String = {
        return Config.serverBaseUrl + "/unauth/verify"
    }()
    
    public static let serverUrlUnauth: String = {
        //return Config.serverBaseUrl + "/unauth"
        return Config.serverBaseUrl
    }()
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("info.plist file not found")
        }
        return dict
    }()
    
    private static func string(for key: String) -> String {
        guard let value = infoDictionary[key] as? String else {
            fatalError("Config for \(key) not found")
        }
        return value
    }
    
    public static let environment: Config.Environment = {
        let named =  Config.string(for: ConfigKey.environment)
        return Config.Environment(named: named)
    }()
    
    
}
