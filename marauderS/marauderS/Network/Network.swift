import Alamofire
import Foundation

public class Network {
    
    static var session: Session?
    public static var service: Service?
    
    public static func initCertificates() {
        Network.session = Session()
    }
    
    static func request<T: Codable>(service: Service, type: T.Type, completion: @escaping (
        _ result: Results<T>?) -> Void) {
            
            guard let url = URL(string: service.baseURL + service.path) else {
                return
            }
            
            Network.session?.request(
                url,
                method: service.method,
                parameters: service.parameters,
                encoding: service.encoding,
                headers: service.headers,
                requestModifier: { $0.timeoutInterval = 40 }
            ).responseString(completionHandler: { response in
                let parameters = service.parameters
                let method = service.method.rawValue.uppercased()
                let path = service.path
                let headers = service.headers
                let statusCode: Int = response.response?.statusCode ?? 0
                
                print("statusCode=>", statusCode)
                
                switch response.result {
                case .success(let data):
                    printResponse(method: method,
                                  parameters: parameters,
                                  path: path,
                                  response: response,
                                  headers: headers,
                                  data: data
                                    )
                    
                    let dict = data.toDictionary()
                    let meta = dict?["meta"] as? [String: Any]
                    let responseCode = meta?["response_code"] as? String
                    
                    print("responseCode=> \(String(describing: responseCode))")
                    
                case .failure(let fail):
                    print("print=>", fail)
                }
            })
            .responseDecodable(of: BaseResponseModel<T>.self, completionHandler: { response in
                let httpsStatusCode: Int = response.response?.statusCode ?? 0
                switch response.result {
                case .success(let response):
                    //                    let responseStatusCode = ResponseStatusCode(rawValue: response.data.responseCode ?? "")
                    switch httpsStatusCode {
                    case (200):
                        if let responseData = response.data {
                            completion(.success(responseData))
                        } else {
                            completion(.success(response as? T))
                        }
                    case 401:
                        print("401=>")
                    default:
                        print("default=>")
                    }
                case .failure(let fail):
                    print("print=>", fail)
                }
            })
        }
}

func printResponse(
    method: String,
    parameters: [String: Any?]?,
    path: String,
    response: AFDataResponse<String>,
    headers: HTTPHeaders?,
    data: String
) {
    print("method=>", method)
}
