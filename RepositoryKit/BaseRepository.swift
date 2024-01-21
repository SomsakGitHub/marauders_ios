//
//  BaseRepository.swift
//  RepositoryKit
//
//  Created by somsak on 21/1/2567 BE.
//

import NetworkKit
import RxSwift
import CoreKit

public class BaseRepository: NSObject {
    
    public static let shared = BaseRepository()
    
    let disposeBag = DisposeBag()
    
    public func sendRequest<T: Codable>(
        service: Service,
        type: T.Type,
        bypassRefreshToken: Bool = false
    ) -> Observable<T> {
        
        return self.makeRequest(service: service, type: type)
    }
    
    private func makeRequest<T: Codable>(
        service: Service,
        type: T.Type
    ) -> Observable<T> {
        return Observable.create { (observer) -> Disposable in
            NetworkKit.request(service: service, type: type) { success, result, responseDesc, responseCode, responseData in
                if let result = result {
                    observer.onNext(result)
                } else if let desc = responseDesc, let code = responseCode {
                    let error = NSError(
                        domain: "RepositoryKit",
                        code: code,
                        userInfo: [
                            NSLocalizedDescriptionKey: desc,
//                            APIError.Key: responseData ?? ""
                        ]
                    )
                    observer.onError(error)
                } else {
                    observer.onError(NetworkKit.error)
                }
            }
            return Disposables.create()
        }
    }
}

