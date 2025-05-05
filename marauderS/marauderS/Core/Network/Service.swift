import Alamofire

public protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

public extension Service {
    var baseURL: String {
        return Config.serverBaseUrl
    }
    
    var headers: HTTPHeaders {
        return [
            "app-meta": "",
            "client_id": ""
        ].toHeader()
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
