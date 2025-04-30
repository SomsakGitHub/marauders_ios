import UIKit

protocol HomeViewControllerInput: AnyObject {
//    func displaySomething(viewModel: Home.Something.ViewModel)
}

protocol HomeViewControllerOutput: AnyObject {
//    func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: BaseViewController {
    
    var interactor: HomeInteractorInput?
    var router: HomeRoutingLogic?

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - request data from HomeInteractor

    func doSomething() {
        let request = HomeReq()
//        interactor?.doSomething(request: request)
    }
}

// MARK: - display view model from HomePresenter

extension HomeViewController: HomeViewControllerInput {
//    func displaySomething() {
//        nameTextField.text = viewModel.name
//    }
}
