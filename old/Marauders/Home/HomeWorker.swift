import RxSwift

protocol HomeWorkerLogic {
//    func Home(req: HomeReq, completion: @escaping (Result<HomeRes?, Error>) -> Void)
}

class HomeWorker {
//    private let service: HomeService
    private let disposeBag = DisposeBag()
    
//    init(service: HomeService) {
//        self.service = service
//    }
}

extension HomeWorker: HomeWorkerLogic {
//    func Home(req: HomeReq, completion: @escaping (Result<HomeRes?, any Error>) -> Void) {
//        service.Home(req: req)
//            .subscribe { res in
//                completion(.success(res))
//            } onError: { error in
//                completion(.failure(error))
//            }.disposed(by: disposeBag)
//    }
}
