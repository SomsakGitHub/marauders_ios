import Foundation

private struct ConfigKey {
    static let appName = "APP_NAME"
    static let appBundleId = "APP_BUNDLE_ID"
    static let environment = "APP_ENVIRONMENT"
}

public class Config {
    
    public enum Environment {
        case dev, sit, uat, prod
        
        init(named: String) {
            switch named {
            case "DEV": self = .dev
            case "SIT": self = .sit
            case "UAT": self = .uat
            case "PROD": self = .prod
            default: self = .prod
            }
        }
    }
    
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
    
    public static var serverBaseUrl: String {
        var path = ""
        switch Config.environment {
        case .dev:
            path = "v1/mewang"
        case .sit:
            path = "v1/mewang-state2"
        case .uat:
            path = "v1/mewang"
        case .prod:
            path = "v1/mewang"
        }
        return "https://\(Config.serviceBaseEndpoint)/\(path)/api/v1"
    }
    
    public static var serviceBaseEndpoint: String {
        switch Config.environment {
        case .dev:
            return "api.talpha.co"
        case .sit:
            return "api.tbeta.co"
        case .uat:
            return "api.tbeta.co"
        case .prod:
            return "api-mewang.tiscoonline.com"
        }
    }
    
    public static let environment: Config.Environment = {
        let named =  Config.string(for: ConfigKey.environment)
        return Config.Environment(named: named)
    }()
    
}
