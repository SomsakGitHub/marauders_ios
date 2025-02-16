import RxSwift
import Alamofire

enum LoginServiceEnum: Service {
    
    case login(req: LoginReq)
    
    var path: String {
        switch self {
        case .login:
            return ServicePath.login.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let req):
            return [
                "email": req.email,
                "password": req.password
            ]
        }
    }
}

class LoginService: BaseService {
    func login(req: LoginReq) -> Observable<LoginRes?> {
        let service = LoginServiceEnum.login(req: req)
        return execute(service: service, type: LoginRes.self)
    }
}
