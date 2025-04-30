import Foundation

typealias HomePresenterInput = HomeInteractorOutput
typealias HomePresenterOutput = HomeViewControllerInput

class HomePresenter {
    weak var viewController: HomePresenterOutput?
}

extension HomePresenter: HomePresenterInput {
//    func HomeSuccess(data: HomeRes?) {
//        viewController?.HomeSuccess()
//    }
}
