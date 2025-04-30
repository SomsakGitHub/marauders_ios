import Foundation

typealias LoginInteractorInput = LoginViewControllerOutput

protocol LoginInteractorOutput: AnyObject {
    func loginSuccess(data: LoginRes?)
}

final class LoginInteractor {
    var presenter: LoginPresenterInput?
    var worker: LoginWorkerLogic?
}

extension LoginInteractor: LoginInteractorInput {

    func login(req: LoginReq) {
        worker?.login(req: req, completion: { result in
            switch result {
            case .success(let res):
                self.presenter?.loginSuccess(data: res)
            case .failure:
                break
            }
        })
    }
}
