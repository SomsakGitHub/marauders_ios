//
//  NetworkKit.swift
//  NetworkKit
//
//  Created by somsak on 21/1/2567 BE.
//

import Alamofire

public class NetworkKit {
    
    private static var session: Session?
    public static var service: Service?
    
    
//    public static func initCertificates() {
//
//        let evaluator = PinnedCertificatesTrustEvaluator(
//            certificates: NMCCertificate.certificates,
//            acceptSelfSignedCertificates: false,
//            performDefaultValidation: true,
//            validateHost: true
//        )
//
//        let serverTrustPolicy = ServerTrustManager(
//            allHostsMustBeEvaluated: true,
//            evaluators: [Config.serviceBaseEndpoint: evaluator]
//        )
//
//        NetworkKit.session = Session(serverTrustManager: serverTrustPolicy)
//    }
    
    public static let error = NSError(
        domain: "NetworkKit",
        code: 0,
        userInfo: [NSLocalizedDescriptionKey: "An error occurred please try again later."]
    )
    
    public static let refreshAccessTokenPath = "/refresh-access-token"
    
    struct ResponseCode {
        static let ok = 200000
        static let construction = 200401
        static let lock = 429000
        static let tooLong = 500004
    }
    
    public static func request<T: Decodable>(
        service: Service,
        type: T.Type,
        completion: @escaping (
            _ success: Bool,
            _ result: T?,
            _ errorString: String?,
            _ statusCode: Int?,
            _ rawError: [String: Any]?
        ) -> ()
    ) {
        NetworkKit.session = Session()
        self.service = service
        
        if
            let fileName = service.mockup,
            let bundle = Bundle(identifier: "mycar.RepositoryKit"),
            let url = bundle.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let decoded = try? JSONDecoder().decode(T.self, from: data) {
            
            completion(true, decoded, nil, 200, nil)
            return
        }
        
//        guard Reachability.isConnectedToNetwork() else {
//            AppNetworkKit.delegate?.networkKitDidInternetConnectionFail()
//            completion(false, nil, "Can't Connect Internet", 500, nil)
//            return
//        }
        //        MOCK no internet
        //        if service.path.contains("get-smart-feed") || service.path.contains("get-inf") {
        //            AppNetworkKit.delegate?.networkKitDidInternetConnectionFail()
        //            completion(false, nil, "Can't Connect Internet", 500, nil)
        //            return
        //        }
        
        guard let url = URL(string: service.baseURL + service.path) else {
            completion(false, nil, "There's no URL Path", 400, nil)
            return
        }
        
        print("\n## Start requesting : \(url.absoluteString) ##somsak\n")
        
        let headers = service.headers
        
        print("service.method=>", service.method)
        print("NetworkKit=>", NetworkKit.session)
        
        
        
        NetworkKit.session?.request(
            url,
            method: service.method,
            //parameters: service.parameters?.toDictionary(),
            //encoding: service.encoding,
            //headers: headers?.toHeader(),
            requestModifier: { $0.timeoutInterval = 300 }
        ).responseString(completionHandler: { response in
            
            print("response=>", response)
            
//            let statusCode = response.response?.statusCode ?? 500
//
//            switch response.result {
//            case .success(let data):
//                printResponse(
//                    service,
//                    response: response,
//                    headers: headers,
//                    data: data,
//                    code: statusCode
//                )
//
//                let dict = data.toDictionary()
//                let responseCode = Int((dict?["response_code"] as? String) ?? "") ?? -1
//                let responseDesc = dict?["response_desc"] as? String
//                let responseData = dict?["response_data"] as? [String: Any]
////                let responseCodeDesc = dict?["response_code_desc"] as? String
//                let responseErrorTitle = responseData?["error_title"] as? String
//                let responseErrorMessage = responseData?["error_message"] as? String
//
//                let body = BodyResponseModel(from: data)
//
//                switch (statusCode, responseCode) {
//                case (200, ResponseCode.ok):
//                    // will continue to `responseDecodable`
//                    break
//                case (200, ResponseCode.tooLong):
//                    AppNetworkKit.delegate?.networkKitDidGetError(
//                        title: responseErrorTitle,
//                        message: responseErrorMessage,
//                        code: nil
//                    )
//
//                case (200, ResponseCode.construction):
//                    let data = UnderConstructionInfoModel(data: responseData)
//                    AppNetworkKit.delegate?.networkKitDidUnderConstruction(data: data)
//
//                case (200, _):
//                    if service.path.contains(NetworkKit.refreshAccessTokenPath) {
//                        // will continue to `responseDecodable`
//                        break
//                    } else {
//                        completion(false, nil, responseDesc, responseCode, responseData)
//                    }
//
//                case (504, _):
//                    AppNetworkKit.delegate?.networkKitDidGetError(
//                        title: responseErrorTitle,
//                        message: responseErrorMessage,
//                        code: nil
//                    )
//                    completion(false, nil, responseDesc, responseCode, responseData)
//
//                case (401, _):
//                    AppNetworkKit.delegate?.networkKitShouldLoginPin()
//                    completion(false, nil, responseDesc, responseCode, responseData)
//
//                case (403, _):
//                    completion(false, nil, responseDesc, responseCode, responseData)
//                    AppNetworkKit.delegate?.networkKitShouldLoginPin()
//
//                default:
//                    AppNetworkKit.delegate?.networkKitDidGetError(title: nil, message: nil, code: statusCode.nmcStatusCode)
//                    completion(false, nil, responseDesc, responseCode, responseData)
//                }
//
//            case .failure(let error):
//                printResponse(
//                    service,
//                    response: response,
//                    headers: headers,
//                    data: error.localizedDescription,
//                    code: statusCode
//                )
//                AppNetworkKit.delegate?.networkKitDidGetError(title: nil, message: nil, code: statusCode.nmcStatusCode)
//                completion(false, nil, error.localizedDescription, 500, nil)
//            }
        }).responseDecodable(of: type, dataPreprocessor: ResponseDataProcessor()) { response in
            switch response.result {
            case .success(let data):
                print("data=>", data)
                let statusCode = response.response?.statusCode ?? 500
                completion(true, data, nil, statusCode, nil)
                
            case .failure(let error):
                print("\n********** Response Error **********\n")
//                print(error)
                completion(false, nil, error.localizedDescription, response.response?.statusCode ?? 500, nil)
            }
        }
        
    }
    
//    public static func requestStream<T: Decodable>(
//        service: Service,
//        type: T.Type,
//        completion: @escaping (
//            _ success: Bool,
//            _ result: T?,
//            _ errorString: String?,
//            _ statusCode: Int?,
//            _ rawError: [String: Any]?
//        ) -> ()
//    ) {
//
//        // Mockup PDF file
//        if service.mockup != nil, let type = service.parameters?["doc_type"] as? String {
//
//            var fileName = ""
//            switch type {
//            case "REQUEST_APP_FORM":
//                fileName = "request_app_form"
//            case "CONTRACT_AGREEMENT":
//                fileName = "contract_agreement"
//            case "SUMMARY_CONTRACT":
//                fileName = "summary_contract"
//            default:
//                break
//            }
//
//            if let bundle = Bundle(identifier: "mycar.RepositoryKit"),
//               let url = bundle.url(forResource: fileName, withExtension: "pdf"),
//               let data = try? Data(contentsOf: url) {
//
//                completion(true, data as? T, nil, 200, nil)
//                return
//            }
//        }
//
//        guard Reachability.isConnectedToNetwork() else {
//            AppNetworkKit.delegate?.networkKitDidInternetConnectionFail()
//            completion(false, nil, "Can't Connect Internet", 500, nil)
//            return
//        }
//
//        guard let url = URL(string: service.baseURL + service.path) else {
//            completion(false, nil, "There's no URL Path", 400, nil)
//            return
//        }
//
//        print("\n## Start requesting : \(url.absoluteString) ##\n")
//
//        let headers = service.headers
//
//        NetworkKit.session?.request(
//            url,
//            method: service.method,
//            parameters: service.parameters?.toDictionary(),
//            encoding: service.encoding,
//            headers: headers?.toHeader(),
//            requestModifier: { $0.timeoutInterval = 40 }
//        )
//        .responseString(completionHandler: { response in
//
//            let statusCode = response.response?.statusCode ?? 500
//
//            switch response.result {
//            case .success(let data):
//
//                printResponse(
//                    service,
//                    response: response,
//                    headers: headers,
//                    data: data,
//                    code: statusCode
//                )
//
//                let dict = data.toDictionary()
//                let responseCode = Int((dict?["response_code"] as? String) ?? "") ?? -1
//                let responseDesc = dict?["response_desc"] as? String
//                let responseData = dict?["response_data"] as? [String: Any]
//                //let responseCodeDesc = dict?["response_code_desc"] as? String
//                let responseErrorTitle = responseData?["error_title"] as? String
//                let responseErrorMessage = responseData?["error_message"] as? String
//
//                switch (statusCode, responseCode) {
//                case (200, ResponseCode.ok):
//                    // will continue to `responseDecodable`
//                    completion(true, response.data as? T, nil, statusCode, nil)
//                case (200, ResponseCode.tooLong):
//                    AppNetworkKit.delegate?.networkKitDidGetError(
//                        title: responseErrorTitle,
//                        message: responseErrorMessage,
//                        code: nil
//                    )
//                    completion(false, nil, responseDesc, responseCode, responseData)
//
//                case (200, -1):
//                    //streamFile
//                    // will continue to `responseData`
//                    completion(true, response.data as? T, nil, statusCode, nil)
//                    // break
//                case (200, _):
//                    if service.path.contains(NetworkKit.refreshAccessTokenPath) {
//                        // will continue to `responseDecodable`
//                        break
//                    } else {
//                        completion(false, nil, responseDesc, responseCode, responseData)
//                    }
//                case (504, _):
//                    AppNetworkKit.delegate?.networkKitDidGetError(
//                        title: responseErrorTitle,
//                        message: responseErrorMessage,
//                        code: nil
//                    )
//                    completion(false, nil, responseDesc, responseCode, responseData)
//
//                case (401, _):
//                    completion(false, nil, responseDesc, responseCode, responseData)
//                    AppNetworkKit.delegate?.networkKitShouldLoginPin()
//
//                case (403, _):
//                    completion(false, nil, responseDesc, responseCode, responseData)
//                    AppNetworkKit.delegate?.networkKitShouldLoginPin()
//
//                default:
//                    AppNetworkKit.delegate?.networkKitDidGetError(title: nil, message: nil, code: statusCode.nmcStatusCode)
//                    completion(false, nil, responseDesc, responseCode, responseData)
//                }
//
//            case .failure(let error):
//                AppNetworkKit.delegate?.networkKitDidGetError(title: nil, message: nil, code: statusCode.nmcStatusCode)
//                printResponse(
//                    service,
//                    response: response,
//                    headers: headers,
//                    data: error.localizedDescription,
//                    code: statusCode
//                )
//                completion(false, nil, error.localizedDescription, 500, nil)
//            }
//        })
//
//    }
    
//    public static func dowload(url: String, completion: @escaping ((_ success: String?, _ errorString: String?) -> Void)) {
//        let destination: DownloadRequest.Destination = { _, _ in
//            let documentsURL = FileManager.default.temporaryDirectory
//            let fileURL = documentsURL.appendingPathComponent("mycar_doc.pdf")
//            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
//        }
//
//        AF.download(url, to: destination).response { response in
//            if response.error == nil, let filePath = response.fileURL?.path {
//                completion(filePath, nil)
//            } else {
//                completion(nil, "Can't download document")
//            }
//        }
//    }
}

class ResponseDataProcessor: DataPreprocessor {
    
    private let key = "response_data"
    
    func preprocess(_ data: Data) throws -> Data {
        
        if let dictionary = String(data: data, encoding: .utf8)?.toDictionary(),
           let responseData = dictionary[key],
           responseData is [String: Any] || responseData is [[String: Any]],
           let newData = try? JSONSerialization.data(withJSONObject: responseData, options: .prettyPrinted) {
            return newData
        }
        
        return data
    }
}

extension String {
    func toDictionary() -> [String: Any]? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
