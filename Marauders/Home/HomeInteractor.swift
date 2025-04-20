import UIKit

typealias HomeInteractorInput = HomeViewControllerOutput

protocol HomeInteractorOutput: AnyObject {
//    func doSomething(request: Home.Something.Request)
}

final class HomeInteractor {
    var presenter: HomePresenterInput?
    var worker: HomeWorkerLogic?
}

// MARK: Do something (and send response to HomePresenter)

extension HomeInteractor: HomeInteractorInput {

    func doSomething(request: HomeReq) {
//        worker?.doSomeWork()
//
//        presenter?.presentSomething(response: response)
    }
}
