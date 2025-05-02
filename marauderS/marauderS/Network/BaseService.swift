import Foundation
import RxSwift

public class BaseService: NSObject {
    
    public static let shared = BaseService()
    
    let disposeBag = DisposeBag()
    
    public func execute<T: Codable>(
        service: Service,
        type: T.Type
    ) -> Observable<T?> {

        return Observable.create { (observer) -> Disposable in
            Network.request(service: service, type: type) { result in
                switch result {
                case .success(let data):
                    observer.onNext(data)
                case .none:
                    break
                }
            }
            return Disposables.create()
        }
    }
}
