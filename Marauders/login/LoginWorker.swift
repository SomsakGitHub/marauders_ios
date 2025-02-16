import RxSwift

protocol LoginWorkerLogic {
    func login(req: LoginReq, completion: @escaping (Result<LoginRes?, Error>) -> Void)
}

class LoginWorker {
    private let service: LoginService
    private let disposeBag = DisposeBag()
    
    init(service: LoginService) {
        self.service = service
    }
}

extension LoginWorker: LoginWorkerLogic {
    func login(req: LoginReq, completion: @escaping (Result<LoginRes?, any Error>) -> Void) {
        service.login(req: req)
            .subscribe { res in
                completion(.success(res))
            } onError: { error in
                completion(.failure(error))
            }.disposed(by: disposeBag)
    }
}
